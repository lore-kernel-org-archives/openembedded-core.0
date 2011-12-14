Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RakwP-0000ci-84
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 10:15:57 +0100
Received: by yenm12 with SMTP id m12so474202yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 01:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=h43Dg8eZNMSUdQsjIm/XZSINMacUmm04RstMFd+f+y8=;
	b=TyMldnHXeWa/Hftx4v1idv+LPSsl4xXh4/kbbKgC14k2HqcOzOMMa1fpGMMDLWAe19
	/LqZpWPIW08gWfbEWf+W2kSDyqPSiZOZgoPoFZQx/gcQUaPO0z3N32Jjr6iMZf5BHe6b
	iRRU8iUWkLuzEy0aVI3rcW438BKio/rndc02Y=
Received: by 10.236.186.2 with SMTP id v2mr10246274yhm.83.1323853735641;
	Wed, 14 Dec 2011 01:08:55 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id i22sm2945403yhm.10.2011.12.14.01.08.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 01:08:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:08:45 -0800
Message-Id: <1323853725-7979-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] cross-recipes: Disable nls in gettext bbclass
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
X-List-Received-Date: Wed, 14 Dec 2011 09:15:57 -0000

Right now for cross recipes e.g. gcc-cross and binutils-cross
we specify --disable-nls .... --enable-nls on configure cmdline
the --enable-nls coming from gettext bbclass.

So we disable nls for all cross inheriting recipes in gettext
bbclass and then we remove the extra --disable-nls in gcc-cross
and binutils-cross

This patch needs testing. Please help

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass                       |    6 +++---
 meta/recipes-devtools/binutils/binutils-cross.inc  |    1 -
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    1 -
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 -
 .../gcc/gcc-cross-intermediate.inc                 |    1 -
 5 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 1793748..89faa30 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -3,15 +3,15 @@ def gettext_dependencies(d):
         return ""
     if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
         return ""
-    if oe.utils.inherits(d, 'native'):
+    if oe.utils.inherits(d, 'native', 'cross'):
         return "gettext-minimal-native"
     return d.getVar('DEPENDS_GETTEXT', False)
 
 def gettext_oeconf(d):
-    if oe.utils.inherits(d, 'native'):
+    if oe.utils.inherits(d, 'native', 'cross'):
         return '--disable-nls'
     # Remove the NLS bits if USE_NLS is no.
-    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'cross-canadian'):
+    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'nativesdk', 'cross-canadian'):
         return '--disable-nls'
     return "--enable-nls"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index f07907e..80152a9 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -8,7 +8,6 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-install-libbfd \
                 --disable-werror \
-                --disable-nls \
                 --enable-poison-system-directories \
                 ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 5816768..774dadb 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -4,7 +4,6 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 
 EXTRA_OECONF += " --enable-poison-system-directories \
 		  --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
-                  --disable-nls \
 		"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index d58bf70..f0e7810 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -14,7 +14,6 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--without-headers \
 		--disable-shared \
 		--disable-threads \
-		--disable-nls \
 		--disable-multilib \
 		--disable-__cxa_atexit \
 		--enable-languages=c \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index f368ae9..ea105e6 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -16,7 +16,6 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
 # preferred linker.
 EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--enable-shared \
-		--disable-nls \
 		--disable-multilib \
 		--disable-threads \
 		--enable-languages=c \
-- 
1.7.5.4



