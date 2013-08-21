Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 081FE6B88C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:14:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Aug 2013 16:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,930,1367996400"; d="scan'208";a="285060183"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2013 16:14:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: kai.kang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:14:32 -0700
Message-Id: <1377126875-9856-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
References: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/4] libx11: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 21 Aug 2013 23:14:43 -0000

From: Kai Kang <kai.kang@windriver.com>

Upgrade libx11 to version 1.6.1.

Update:
* Remove PR and INC_PR.
* File Xcms.txt position changes.
* Drop backport patch keysymdef_include.patch.
* Update disable_tests.patch.

[YOCTO #4973]

Signed-off-by: Kai Kang <kai.kang@windriver.com>

[sgw - Removed PR and INC_PR]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc                 |  3 +--
 meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch |  9 +++++++--
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb            | 13 -------------
 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb            | 10 ++++++++++
 4 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index b4eb7d8..e07d42d 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,6 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r10"
 
 PROVIDES = "virtual/libx11"
 
@@ -33,7 +32,7 @@ CPPFLAGS_FOR_BUILD += "-D_GNU_SOURCE"
 
 PACKAGES =+ "${PN}-xcb"
 
-FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
+FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
 FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
index c570e45..c1b6cde 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -1,6 +1,11 @@
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+Update for 1.6.1
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 diff -Nurd libX11-1.5.0/nls/Makefile.am libX11-1.5.0/nls/Makefile.am
 --- libX11-1.5.0/nls/Makefile.am	2012-06-02 09:37:18.000000000 +0300
 +++ libX11-1.5.0/nls/Makefile.am	2013-01-02 16:10:24.960156131 +0200
@@ -9,8 +14,8 @@ diff -Nurd libX11-1.5.0/nls/Makefile.am libX11-1.5.0/nls/Makefile.am
 	cat locale.dir.l2 locale.dir.l1 > locale.dir
 
 -if HAVE_PERL
--TESTS_ENVIRONMENT = $(PERL)
--TESTS = $(srcdir)/compose-check.pl
+-LOG_COMPILER = $(PERL)
+-TESTS = compose-check.pl
 -endif HAVE_PERL
 -
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
deleted file mode 100644
index 7f18824..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require libx11.inc
-inherit gettext
-
-PR = "${INC_PR}.3"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += "file://keysymdef_include.patch \
-            file://disable_tests.patch \
-           "
-
-SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
-SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
new file mode 100644
index 0000000..b9fb832
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
@@ -0,0 +1,10 @@
+require libx11.inc
+inherit gettext
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += "file://disable_tests.patch \
+           "
+
+SRC_URI[md5sum] = "bc5fc459ec25a50c5a7e27035b89e579"
+SRC_URI[sha256sum] = "10a54fc16b58b4f5a5eed4d080c357a82fd2f42d09af625c1f5df50650701892"
-- 
1.8.3.1


