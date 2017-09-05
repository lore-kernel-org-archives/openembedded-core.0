Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 718E377E9A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:56:42 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 7so2334050qtz.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=WJwI14eNshN+C2RHYqJae9V4w3PqPeBNSRWPIoPMbz4=;
	b=j5Eqy6H4wO5CGxty8NtAuivwUN3AwLjYopVAcwzvk7GcG41olc1QFLYxSawJdTSV/b
	PF/HW7FcToABX9G47Rrjk+hPerPKRtxHV5/HB97lDt9/tTrSoXgFSzxxSFVv72MVUN4B
	3ULxM9AoWNYdT/rWsUUgxD41EYDAd7bcBgdBReFHsfDTKwgAWCejfyPlqZvcRXYcfkG+
	ZPjnBG9Hf4q5JhreNneyVc0gNTNRlFrtkNsmOyKrpTm3Ni0ZhGEDp5HqZz1sUzsOOqE0
	+hgU1EZwsG7EcrRthq2mHuzh0zkPRdDWq/nClDEw7OaXAlaV0V9XulTFRLJmlaD2LQtF
	X5RA==
X-Gm-Message-State: AHPjjUgvuF2WPuy/R4GOsBIyxWOpWnQqc8IzN4XYtW+bMOCrtmvCl4lZ
	SLS2U3bnMLhFMLEi
X-Google-Smtp-Source: ADKCNb510L4qBgI0NWoQ83+AJ+gKq3TID0lRuUx1CVzEzzZt85XkWQyn/7qYz7vCV/yCJ1pJx3AWbw==
X-Received: by 10.200.6.202 with SMTP id j10mr5616740qth.32.1504623403543;
	Tue, 05 Sep 2017 07:56:43 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id p57sm484292qtc.97.2017.09.05.07.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:56:42 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:56:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:35 -0300
Message-Id: <20170905145536.21149-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905145536.21149-1-otavio@ossystems.com.br>
References: <20170905145536.21149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 7/8] go.bbclass: Enable parallel build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2017 14:56:42 -0000

The parallel build is based on PARALLEL_MAKE variable but can be
overriden setting the GO_PARALLEL_BUILD one.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/classes/go.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 720a504cd8..f64b07fd82 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,11 +1,31 @@
 inherit goarch
 
+def get_go_parallel_make(d):
+    pm = (d.getVar('PARALLEL_MAKE') or '').split()
+    # look for '-j' and throw other options (e.g. '-l') away
+    # because they might have a different meaning in golang
+    while pm:
+        opt = pm.pop(0)
+        if opt == '-j':
+            v = pm.pop(0)
+        elif opt.startswith('-j'):
+            v = opt[2:].strip()
+        else:
+            continue
+
+        return '-p %d' % int(v)
+
+    return ""
+
+GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
+
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
 export GOBUILDFLAGS ?= "-v"
+GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
-- 
2.14.1


