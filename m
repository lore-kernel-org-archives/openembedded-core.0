Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhS-0008QA-Ex
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197469"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:20 -0800
Message-Id: <ea5d1042a1f1306846a511617cbe38a3f825dc48.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/36] classes: Add recipe class to overrides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 05:34:10 -0000

From: Khem Raj <raj.khem@gmail.com>

We have currently no override to detect a recipe
being build cross, crosssdk or for target
at times we can use virtclass-native and virtclass-nativesdk to
override stuff in recipes but we dont have way to modify a variables
based on recipe type always.

With this patch we attempt to have recipe class override always
so we can use it in recipes which use BBCLASSEXTEND as well as
others which inherit the classes directly.

I am not too fond of names that I have used so any suggestions are
welcome I would have liked to drop virtclass- from the existing
overrides but that would mean a lot of changes so I left them
alone.

With this change now we can say

EXTRA_OECONF_class-target = "...."
EXTRA_OECONF_virtclass-native = "..."
EXTRA_OECONF_virtclass-nativesdk = "..."
EXTRA_OECONF_virtclass-crosssdk= "..."

....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/base.bbclass           |    1 +
 meta/classes/cross-canadian.bbclass |    2 +-
 meta/classes/cross.bbclass          |    1 +
 meta/classes/crosssdk.bbclass       |    1 +
 meta/classes/native.bbclass         |    3 +--
 meta/classes/nativesdk.bbclass      |    3 +--
 meta/conf/bitbake.conf              |    3 ++-
 7 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e80e874..e977485 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -1,4 +1,5 @@
 BB_DEFAULT_TASK ?= "build"
+CLASSOVERRIDE ?= "class-target"
 
 inherit patch
 inherit staging
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index e187b88..a1577ba 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -8,7 +8,7 @@
 # SDK packages are built either explicitly by the user,
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
-
+CLASSOVERRIDE = "virtclass-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 #
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8da3048..63eb91e 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -4,6 +4,7 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
+CLASSOVERRIDE = "virtclass-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 PACKAGES_DYNAMIC_virtclass-native = ""
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 83753b4..5abc950 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,5 +1,6 @@
 inherit cross
 
+CLASSOVERRIDE = "virtclass-crosssdk"
 PACKAGE_ARCH = "${SDK_ARCH}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 00196ba..9fcb31f 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -94,6 +94,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
 
 # we dont want libc-uclibc or libc-glibc to kick in for native recipes
 LIBCOVERRIDE = ""
+CLASSOVERRIDE = "virtclass-native"
 
 PATH =. "${COREBASE}/scripts/native-intercept:"
 
@@ -141,8 +142,6 @@ python native_virtclass_handler () {
         if not prov.endswith("-native"):
             provides = provides.replace(prov, prov + "-native")
     e.data.setVar("PROVIDES", provides)
-
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
 }
 
 addhandler native_virtclass_handler
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ceec53e..084f5d9 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -8,6 +8,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 
 # we dont want libc-uclibc or libc-glibc to kick in for nativesdk recipes
 LIBCOVERRIDE = ""
+CLASSOVERRIDE = "virtclass-nativesdk"
 
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
@@ -63,8 +64,6 @@ python nativesdk_virtclass_handler () {
     pn = e.data.getVar("PN", True)
     if not pn.endswith("-nativesdk"):
         return
-
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
 }
 
 python () {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 91aa756..9ed4b6c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -635,7 +635,8 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${DISTRO}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
-- 
1.7.7.6



