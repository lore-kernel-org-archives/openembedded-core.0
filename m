Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw3Po-0005KB-SP
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 04:14:21 +0100
Received: by pbcum15 with SMTP id um15so2351870pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 19:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=V10e/WjvjRncNQoRUjEQqVXHcGZE87k664X6X5Bi+LU=;
	b=MqXJbrGVS2V0J3DVa8WfmXNtHhGxvn1efTE34gPTReiFI+dFicEws86JDHrcxas6Sc
	anTOWxsRJjzBp8K6FKyeNUrHusEUM2VbOq+QdXewqSOC/gqxlS0lOv3OK7dhY3c/Z/BX
	L4+Jon1X8GMYK0Kwsatqen+EX8Gfg8mjeddrU=
Received: by 10.68.217.72 with SMTP id ow8mr22099459pbc.130.1328929573385;
	Fri, 10 Feb 2012 19:06:13 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id e10sm18326261pbv.0.2012.02.10.19.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 19:06:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 19:05:06 -0800
Message-Id: <1328929506-20682-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC] classes: Add recipe class to overrides
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
X-List-Received-Date: Sat, 11 Feb 2012 03:14:21 -0000

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
 meta/classes/base.bbclass                       |    1 +
 meta/classes/cross-canadian.bbclass             |    2 +-
 meta/classes/cross.bbclass                      |    1 +
 meta/classes/crosssdk.bbclass                   |    1 +
 meta/classes/native.bbclass                     |    3 +--
 meta/classes/nativesdk.bbclass                  |    3 +--
 meta/conf/distro/include/default-distrovars.inc |    8 ++++++++
 7 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a26ac94..b39bb0b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -1,4 +1,5 @@
 BB_DEFAULT_TASK ?= "build"
+RECIPECLASSOVERRIDE ?= ":class-target"
 
 inherit patch
 inherit staging
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 499a1fb..439404e 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -8,7 +8,7 @@
 # SDK packages are built either explicitly by the user,
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
-
+RECIPECLASSOVERRIDE = ":virtclass-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 #
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8da3048..421ede6 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -4,6 +4,7 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
+RECIPECLASSOVERRIDE = ":virtclass-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 PACKAGES_DYNAMIC_virtclass-native = ""
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 83753b4..89eaadd 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,5 +1,6 @@
 inherit cross
 
+RECIPECLASSOVERRIDE = ":virtclass-crosssdk"
 PACKAGE_ARCH = "${SDK_ARCH}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 00196ba..dbdb406 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -94,6 +94,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
 
 # we dont want libc-uclibc or libc-glibc to kick in for native recipes
 LIBCOVERRIDE = ""
+RECIPECLASSOVERRIDE = ":virtclass-native"
 
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
index ceec53e..6858604 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -8,6 +8,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 
 # we dont want libc-uclibc or libc-glibc to kick in for nativesdk recipes
 LIBCOVERRIDE = ""
+RECIPECLASSOVERRIDE = ":virtclass-nativesdk"
 
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
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 16b3108..ca7c750 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -41,8 +41,16 @@ NO32LIBS ??= "1"
 
 # Default to emitting logfiles if a build fails.
 BBINCLUDELOGS ??= "yes"
+
+# dummy distro related variables
+# they should be overridden by real distros
+# these fallbacks only serve the purpose of
+# oe-core standalone testability
+
+DISTRO ??= ""
 SDK_VERSION ??= "oe-core.0"
 DISTRO_VERSION ??= "oe-core.0"
 
 # Missing checksums should raise an error
 BB_STRICT_CHECKSUM = "1"
+OVERRIDES .= "${RECIPECLASSOVERRIDE}"
-- 
1.7.5.4



