Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNPAR-0007n8-Ui for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 15:55:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QDjtb1003536
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:45:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02847-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:45:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QDjkW4003530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:45:47 +0100
Message-ID: <1335447947.20130.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Apr 2012 14:45:47 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] classes: Add recipe class to overrides
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
X-List-Received-Date: Thu, 26 Apr 2012 13:55:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[This is a tweaked version of one of Khem's patches. The idea here would
be to deprecate and ultimately remove the virtclass-native and
virtclass-nativesdk overrides]

We have currently no override to detect a recipe being build cross, crosssdk
or for target at times we can use virtclass-native and virtclass-nativesdk to
override stuff in recipes but we dont have way to modify a variables
based on recipe type always.

This patch adds in such an override and in particular makes a target override
class available.

With this change now we can say:

EXTRA_OECONF_class-target = "...."
EXTRA_OECONF_class-native = "..."
EXTRA_OECONF_class-nativesdk = "..."
EXTRA_OECONF_class-crosssdk= "..."

Based of an original patch by Khem Raj

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 02e1ff5..a984eae 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -1,4 +1,5 @@
 BB_DEFAULT_TASK ?= "build"
+CLASSOVERRIDE ?= "class-target"
 
 inherit patch
 inherit staging
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index bbf8f16..ed53118 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -8,7 +8,7 @@
 # SDK packages are built either explicitly by the user,
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
-
+CLASSOVERRIDE = "class-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 #
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8da3048..e998307 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -4,6 +4,7 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
+CLASSOVERRIDE = "class-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 PACKAGES_DYNAMIC_virtclass-native = ""
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 67df236..93aba70 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,5 +1,6 @@
 inherit cross
 
+CLASSOVERRIDE = "class-crosssdk"
 PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
 	# set TUNE_PKGARCH to SDK_ARCH
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index ffab971..bca48d4 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -97,6 +97,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
 
 # we dont want libc-uclibc or libc-glibc to kick in for native recipes
 LIBCOVERRIDE = ""
+CLASSOVERRIDE = "class-native"
 
 PATH =. "${COREBASE}/scripts/native-intercept:"
 
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 9e20834..a58fce2 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -8,6 +8,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 
 # we dont want libc-uclibc or libc-glibc to kick in for nativesdk recipes
 LIBCOVERRIDE = ""
+CLASSOVERRIDE = "class-nativesdk"
 
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 91fe070..9f4e4d4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -637,7 +637,8 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 MACHINEOVERRIDES[vardepsexclude] = "MACHINE"




