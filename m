Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 128DA77BBE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 22:14:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6QMEO0F011952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 15:14:24 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Jul 2017 15:14:23 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jul 2017 15:14:23 -0700
Message-ID: <1501107263-14093-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [RESEND][PATCH 1/1] go: centralize definition of COMPATIBLE_HOST
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
X-List-Received-Date: Wed, 26 Jul 2017 22:14:24 -0000
Content-Type: text/plain

Put it in goarch.bbclass which all go related recipes inherit.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/go.bbclass               | 5 -----
 meta/classes/goarch.bbclass           | 6 ++++++
 meta/recipes-devtools/go/go-cross.inc | 4 ----
 meta/recipes-devtools/go/go.inc       | 6 ------
 4 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 85f71a2..cedda68 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,10 +1,5 @@
 inherit goarch
 
-# x32 ABI is not supported on go compiler so far
-COMPATIBLE_HOST_linux-gnux32 = "null"
-# ppc32 is not supported in go compilers
-COMPATIBLE_HOST_powerpc = "null"
-
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 4a5b2ec..57537fb 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -11,6 +11,12 @@ TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEAT
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
 
+# define here because everybody inherits this class
+#
+COMPATIBLE_HOST_linux-gnux32 = "null"
+COMPATIBLE_HOST_powerpc = "null"
+COMPATIBLE_HOST_powerpc64 = "null"
+
 def go_map_arch(a, d):
     import re
     if re.match('i.86', a):
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 71e4611..1c2d9e3 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -13,7 +13,3 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
 GOROOT_FINAL = "${libdir}/go"
 export GOROOT_FINAL
 
-# x32 ABI is not supported on go compiler so far
-COMPATIBLE_HOST_linux-gnux32 = "null"
-# ppc32 is not supported in go compilers
-COMPATIBLE_HOST_powerpc = "null"
diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 91d040d..52abbeb 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -12,12 +12,6 @@ DEPENDS += "${@ 'libgcc' if not oe.utils.inherits(d, 'cross') else ''}"
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 
-# x32 ABI is not supported on go compiler so far
-COMPATIBLE_HOST_linux-gnux32 = "null"
-# ppc is not supported in go compilers
-COMPATIBLE_HOST_powerpc = "null"
-COMPATIBLE_HOST_powerpc64 = "null"
-
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
-- 
2.7.4


