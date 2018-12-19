Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A01006C42C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:42:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t6so19595006wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o0YrfSzbngbCvbyherYIU/4q04ACSDRmgmNpjTzXxNU=;
	b=Cm71x0MoeEdZi3p3+u+U650FaqUSTktVgNqURtlq7Zeax7zwDCWHnrRyDBEoZoenqh
	QknFPhH+JkTODOs0MwFYK6sv24Jx15p5PMSLSrEshIceVbx+KiDzTVfKABmvxC4zhb8A
	6RZTmt0JCZeyj1embqDY6AAts64E0pF4mSS7PfJcHAUNKhRTXs7kbwaH1vvcjVWQlCy4
	RrasweCB9nzOYsguyiHNgcfnUdzQJ0XBTzRqZIdz0YYKH1YhjpDEwPoN8n7I1LUZz+zq
	79GARGFLUVFT/OY4HT+tCvdnY5WVnlcEqyrqFbwNbZt/z4/Q8fqwUI7nFUgpXy4cwqty
	iJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o0YrfSzbngbCvbyherYIU/4q04ACSDRmgmNpjTzXxNU=;
	b=Rjnv/Ef/EjV/oGAPz3affF90LZ0URn1Kjm8xJygOZHkWl+8qEJW6E/8ub7IKALXCpa
	c1VVUlrv+JHmHLKm2znAIZrqigu0q6JI7tV8/Zi9ZVb8o6WTuxf75E1LZuwWYwLw3A2J
	w35C+oyWQK8iOrJ++zjQ5jA0f4/vXenjvatX/Dje/xAd7hMsnpJ49nzlXouC1xdID4A9
	c7U5CyVx+g/lU56JnNrm+W6JL7seJhlBC5tPmqmJJ5yFOButScR7sjj1+Eqw8/Ujgjv7
	58rXDBKnz7fXxZWqXbnZVA/uvXYEj1DqYazuZcs/RnQNAUzsOhTxpUhaOPpQWN40j2sS
	mFGg==
X-Gm-Message-State: AA+aEWYggY8ZaR6GFnf4YwCQTh26U3ivh3TH60klUm7VdGQzF127/Kvr
	qkTrEigE3NLN+Trp0NeS6lXYN/30
X-Google-Smtp-Source: AFSGD/V+8LYRL5NuKnECJmL42gt3GhfgnSDMuwfpTb7Qv/v63zLeyGillcWrBeYakja4bIXVZbDpjg==
X-Received: by 2002:adf:bb8d:: with SMTP id q13mr18737381wrg.183.1545230550063;
	Wed, 19 Dec 2018 06:42:30 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s81sm5839863wmf.14.2018.12.19.06.42.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:42:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:42:31 +0000
Message-Id: <20181219144231.31391-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH] go 1.9/1.11: fix textrel qa warning for non mips arch
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
X-List-Received-Date: Wed, 19 Dec 2018 14:42:30 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

While building go itself, the go build system does not support
to set `-buildmode=pie' from environment.

Add GOBUILDMODE to support it which make PIE executables the default
build mode, as PIE executables are required as of Yocto

But mips doesn't support -buildmode=pie, so skip the QA checking for
mips and its variants

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.11.inc          |  1 +
 ...008-use-GOBUILDMODE-to-set-buildmode.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/go/go-1.9.inc           |  1 +
 ...011-use-GOBUILDMODE-to-set-buildmode.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/go/go_1.11.bb           | 12 ++++++
 meta/recipes-devtools/go/go_1.9.bb            | 16 +++++---
 6 files changed, 104 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index c02e4683b3..d626514ae6 100644
--- a/meta/recipes-devtools/go/go-1.11.inc
+++ b/meta/recipes-devtools/go/go-1.11.inc
@@ -15,6 +15,7 @@ SRC_URI += "\
     file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
new file mode 100644
index 0000000000..b6ab504335
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -0,0 +1,40 @@
+From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 Oct 2018 15:02:32 +0800
+Subject: [PATCH] use GOBUILDMODE to set buildmode
+
+While building go itself, the go build system does not support
+to set `-buildmode=pie' from environment.
+
+Add GOBUILDMODE to support it which make PIE executables the default
+build mode, as PIE executables are required as of Yocto
+
+Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
+Upstream-Status: Denied [upstream choose antoher solution: `17a256b
+cmd/go: -buildmode=pie for android/arm']
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/cmd/go/internal/work/build.go | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 145b875..595d703 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -218,7 +218,11 @@ func AddBuildFlags(cmd *base.Command) {
+ 
+ 	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
+ 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
+-	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
++	if bm := os.Getenv("GOBUILDMODE"); bm != "" {
++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
++	} else {
++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
++	}
+ 	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
+ 	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
+ 	cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 329cee061c..ba1eaa051a 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
         file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+        file://0011-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://set-external-linker.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
new file mode 100644
index 0000000000..da93dc5c14
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
@@ -0,0 +1,40 @@
+From b928fafab1d9425aae9341806bd2f6178ba1da1f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 Oct 2018 16:32:50 +0800
+Subject: [PATCH] use GOBUILDMODE to set buildmode
+
+While building go itself, the go build system does not support
+to set `-buildmode=pie' from environment.
+
+Add GOBUILDMODE to support it which make PIE executables the default
+build mode, as PIE executables are required as of Yocto
+
+Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
+Upstream-Status: Denied [upstream choose antoher solution: `17a256b
+cmd/go: -buildmode=pie for android/arm']
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/cmd/go/internal/work/build.go | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index b276de5..1683e7e 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -211,7 +211,11 @@ func AddBuildFlags(cmd *base.Command) {
+ 
+ 	cmd.Flag.Var((*base.StringsFlag)(&buildAsmflags), "asmflags", "")
+ 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
+-	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
++	if bm := os.Getenv("GOBUILDMODE"); bm != "" {
++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
++	} else {
++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
++	}
+ 	cmd.Flag.Var((*base.StringsFlag)(&buildGcflags), "gcflags", "")
+ 	cmd.Flag.Var((*base.StringsFlag)(&buildGccgoflags), "gccgoflags", "")
+ 	cmd.Flag.StringVar(&cfg.BuildContext.InstallSuffix, "installsuffix", "", "")
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go_1.11.bb b/meta/recipes-devtools/go/go_1.11.bb
index c67e2cb050..42cdb0430a 100644
--- a/meta/recipes-devtools/go/go_1.11.bb
+++ b/meta/recipes-devtools/go/go_1.11.bb
@@ -1,2 +1,14 @@
 require go-${PV}.inc
 require go-target.inc
+
+export GOBUILDMODE=""
+
+# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
+# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# variants.
+python() {
+    if 'mips' in d.getVar('TARGET_ARCH'):
+        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
+    else:
+        d.setVar('GOBUILDMODE', 'pie')
+}
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
index 7da7897cf5..c23ea0c1ae 100644
--- a/meta/recipes-devtools/go/go_1.9.bb
+++ b/meta/recipes-devtools/go/go_1.9.bb
@@ -5,6 +5,7 @@ export GO_TARGET_INSTALL = "cmd"
 export GO_FLAGS = "-a"
 export CC_FOR_TARGET = "${CC}"
 export CXX_FOR_TARGET = "${CXX}"
+export GOBUILDMODE=""
 
 do_compile() {
 	export GOBIN="${B}/bin"
@@ -16,9 +17,12 @@ do_compile() {
 	cd ${B}
 }
 
-# for aarch64 ends with textrel in ${PN}
-# http://errors.yoctoproject.org/Errors/Details/185634/
-# ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text [textrel]
-INSANE_SKIP_${PN} += "textrel"
+# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
+# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# variants.
+python() {
+    if 'mips' in d.getVar('TARGET_ARCH'):
+        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
+    else:
+        d.setVar('GOBUILDMODE', 'pie')
+}
-- 
2.17.1


