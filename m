Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B51B677FF5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:07:07 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o77so972714qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=AVvxACig7yExUvaEltWwgLkJ6Z+ags7W8rB0YLtUTLI=;
	b=gUIREkaQb9qrzgQdP59zAvXeorErGzm42I636CdD7QZYK+Zxo3AebRg00STABYhcQ6
	sIXjAY3PjEDu9VPUtxlx3RFiTn7a/PDcJXRZOTGqDRuC542Vzx70n+vYz/m/SZB3WNbl
	Gp3KbcXzEyLNvVj0gKrPtyuc3bVxlpOnFOiDoHPLcHYjGGDw/zUbUK4kfFL+Cv7iP5eq
	D0XMbn+CzqY6n7g9QBo5ndE8zalEjuUutQGmmwh5Bvn5n2znJl8og21INK6sEtEhBtdh
	pGy0OgK9Do/ggk0Kw8K4qx+dLH8D66jxjDR9joZ1iytfZu5pljjFgg+ZxSITMn3rHHWj
	rhjw==
X-Gm-Message-State: AHPjjUgcmnnjzhK8rB/VPY96LbZPZaTT1C50NZimcEOOoY4wEcDMYJ8z
	R2cctVRciXFt4i6J
X-Google-Smtp-Source: ADKCNb5ZMBmlvzr6cfy9e9OACWQkxf9rUelgTJPb6S+0ohtGCj8TsvkW/LUgc6sWUNSHzKubpSLl6Q==
X-Received: by 10.55.25.29 with SMTP id k29mr2437245qkh.229.1504559228180;
	Mon, 04 Sep 2017 14:07:08 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id j4sm5634890qtk.3.2017.09.04.14.07.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:07:07 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:07:01 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:07 -0300
Message-Id: <20170904210608.23764-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 6/7] go.bbclass: Enable parallel build
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
X-List-Received-Date: Mon, 04 Sep 2017 21:07:07 -0000

The parallel build is based on PARALLEL_MAKE variable but can be
overriden setting the GO_PARALLEL_BUILD one.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/go.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 45f2add810..f80134bf8e 100644
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
 
 export GOBUILDFLAGS ?= "-x -v ${GO_EXTLDFLAGS}"
+GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
-- 
2.14.1


