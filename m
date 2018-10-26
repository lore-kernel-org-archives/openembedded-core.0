Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6CC79C6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 11:39:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9QBdYgp003669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Oct 2018 04:39:34 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 26 Oct 2018 04:39:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 26 Oct 2018 19:49:59 +0800
Message-ID: <1540554599-37191-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540546971-36870-1-git-send-email-hongxu.jia@windriver.com>
References: <1540546971-36870-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] go 1.9/1.11: fix textrel qa warning for non mips arch
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
X-List-Received-Date: Fri, 26 Oct 2018 11:39:34 -0000
Content-Type: text/plain

While building go itself, the go build system does not support
to set `-buildmode=pie' from environment.

Add GOBUILDMODE to support it which make PIE executables the default
build mode, as PIE executables are required as of Yocto

But mips doesn't support -buildmode=pie, so skip the QA checking for
mips and its variants

Issue: LIN1018-2738
(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core 20181026

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/go/go-1.11.inc               |  1 +
 .../0008-use-GOBUILDMODE-to-set-buildmode.patch    | 40 ++++++++++++++++++++++
 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 .../0011-use-GOBUILDMODE-to-set-buildmode.patch    | 40 ++++++++++++++++++++++
 meta/recipes-devtools/go/go_1.11.bb                | 12 +++++++
 meta/recipes-devtools/go/go_1.9.bb                 | 16 +++++----
 6 files changed, 104 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index c02e468..d626514 100644
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
index 0000000..b6ab504
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
index 329cee0..ba1eaa0 100644
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
index 0000000..da93dc5
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
index c67e2cb..ce3b905 100644
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
+        d.appendVar('GOBUILDMODE', 'pie')
+}
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
index 7da7897..c5cdfb6 100644
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
+        d.appendVar('GOBUILDMODE', 'pie')
+}
-- 
2.7.4


