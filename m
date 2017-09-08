Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 20F1778211
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:49:01 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i14so1548416qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ttPP0aRNCuOGK+3FGN7oZtYAbx1BSj7LEl+aIFKu/3s=;
	b=WEq1daWoMWWsXOK1NrEJCXNfv/dOJquUarlZXPSt+elPumv8dPfMlama4aOgEKoh8I
	cmIlx2SKUj1hs05D7C1s9hDu8R2AT39jsw8kqgr6w0T4RfH6Ca++UkyRd+6JuM2kkbXI
	MKlFjnY2VSEwwtrXAJDXtSg7DiTNS3oIjViMI54iG2oWam216hxyJGAeI5ppdUDDOGak
	qtN+IWSYKV0zu/xXdGSAl//Ryy8fGX46+dmK998Gyb78Zv1gfRqxS6f9mBgssLm/6Zx1
	z/63ZSWMJZIvEFBfD/SRgfLsFCEFcW1r8CqUY13GN/DuHrakSQHJ9fymVgbAZunzG/Uw
	JgiQ==
X-Gm-Message-State: AHPjjUjgFVo1FKeCBg6m19wfirXehFhcPN3XHWcWGfV6r2LrHfOT2A/s
	8B4JzHRuVbwPFTrR
X-Google-Smtp-Source: AOwi7QBidkt0ADYKMAoEyiFV1VWNItd8fKrLWT+3uxrUi91DoSfsIw0Yd2fUpFF2ZeGTcC31oGQRbA==
X-Received: by 10.55.209.155 with SMTP id o27mr4131242qkl.145.1504878542212;
	Fri, 08 Sep 2017 06:49:02 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r22sm1273431qtj.94.2017.09.08.06.48.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:49:01 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:48:55 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:54 -0300
Message-Id: <20170908134758.7570-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 07/11] go.bbclass: Enable parallel build
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
X-List-Received-Date: Fri, 08 Sep 2017 13:49:01 -0000

The parallel build is based on PARALLEL_MAKE variable but can be
overriden setting the GO_PARALLEL_BUILD one.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
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


