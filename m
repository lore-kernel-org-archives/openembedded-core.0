Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 717816A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:35:00 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so1243888wib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/QI2DDaKFA9ukoT22lmZ246q4igZ/VcG286lwAf9fBE=;
	b=K4RkkWM/pL/i3qNm4/pCmKwm2GIJYqAYChHtLD+LPiukR/z58tMF+5kF57dFMH1A/r
	2HmCJntqI/95TtfUI8cuHoGSEz/+DqI57CmYhw7oeGRpiCs4GadxfyUT4NWexNV7qha9
	QS2VQUK0hDsF7PibHlmgTDzVRF1DmvXIwSoGopiGmOPUW2CVRtGKEg9PVh+2kcHAF03A
	puKGsqinjEMBT/s53oDlmhiP7yKEB8VvI/51QmjY7y4LXxHKr5zGg3chBpxm/yKSF67Z
	o4zwa2CuBymNFNKGzPdX2IDfqzhaZJMYIh9srLXLr5QASJkQ4o84SqonulSqCj9SBJtm
	wRlw==
X-Gm-Message-State: ALoCoQkIiyixOCJ+Fb/bKzA7lI1YIntd0TXVL/+HPkCjk/HmwZi2QUqFw6FtNMeODzFxtLX6Nyw7
X-Received: by 10.194.219.1 with SMTP id pk1mr2642010wjc.36.1386783299383;
	Wed, 11 Dec 2013 09:34:59 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id w20sm16840525wia.5.2013.12.11.09.34.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2013 09:34:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 17:34:54 +0000
Message-Id: <1386783294-816-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] sato-icon-theme: simplify icon-name-mapping lookup
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
X-List-Received-Date: Wed, 11 Dec 2013 17:35:00 -0000

Patching an option into configure.ac and then running sed over path variables is
fragile as the definition of $libexecdir can and has changed.

Instead, tell configure to use our pkg-config-native wrapper when it uses
pkg-config, and it will find the right binaries without any further munging.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../sato-icon-theme/iconpath-option.patch          |   53 --------------------
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    7 +--
 2 files changed, 4 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch
deleted file mode 100644
index b392a93..0000000
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-pkg-config will only search the target sysroot and we want the native script. This 
-patch adds an option to allow the path to the tool to be specified.
-
-RP - 12/8/10
-
-Upstream-Status: Pending
-
-Index: sato-icon-theme-0.4.1/configure.ac
-===================================================================
---- sato-icon-theme-0.4.1.orig/configure.ac	2010-08-12 12:23:25.000000000 +0100
-+++ sato-icon-theme-0.4.1/configure.ac	2010-08-12 12:48:14.000000000 +0100
-@@ -11,20 +11,29 @@
- 
- UTILS_REQUIRED=0.8.2
- 
--AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
--PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
--                 have_utils=yes, have_utils=no)
--if test "x$have_utils" = "xyes"; then
--   UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
--   ICONMAP="$UTILS_PATH/icon-name-mapping"
--   AC_SUBST(ICONMAP)
--   AC_MSG_RESULT([yes])
--else
--   AC_MSG_RESULT([no])
--   AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
--                 and install sato-icon-theme])
-+PKG_PROG_PKG_CONFIG()
-+
-+AC_ARG_WITH(iconmap,
-+            AC_HELP_STRING([--with-iconmap=<dir>], [The location of the icon-name-mapping script to use]),
-+            ICONMAP=$withval, ICONMAP="")
-+
-+if test "x$ICONMAP" = "x"; then
-+   AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
-+   PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
-+                    have_utils=yes, have_utils=no)
-+   if test "x$have_utils" = "xyes"; then
-+      UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
-+      ICONMAP="$UTILS_PATH/icon-name-mapping"
-+
-+      AC_MSG_RESULT([yes])
-+   else
-+      AC_MSG_RESULT([no])
-+      AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
-+                    and install sato-icon-theme])
-+   fi
- fi
- 
-+AC_SUBST(ICONMAP)
- 
- AC_CONFIG_FILES([
- Makefile
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index cf23aeb..a32e1a9 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -11,7 +11,6 @@ PR = "r6"
 DEPENDS = "icon-naming-utils-native libxml-simple-perl-native"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
-           file://iconpath-option.patch \
            file://0001-Inherit-the-GNOME-icon-theme.patch"
 
 SRC_URI[md5sum] = "86a847f3128a43a9cf23b7029a656f50"
@@ -19,9 +18,11 @@ SRC_URI[sha256sum] = "0b0a2807a6a96918ac799a86094ec3e8e2c892be0fd679a4232c2a77f2
 
 inherit autotools pkgconfig allarch gtk-icon-cache perlnative
 
-FILES_${PN} += "${datadir}"
+# The configure script uses pkg-config to find native binaries to execute, so
+# tell it to use our pkg-config-native wrapper.
+export PKG_CONFIG = "pkg-config-native"
 
-EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('sato-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
+FILES_${PN} += "${datadir}/icons/Sato"
 
 do_install_append() {
 	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s preferences-system.png {}/apps/preferences-desktop.png \;
-- 
1.7.10.4


