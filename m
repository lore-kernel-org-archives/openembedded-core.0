Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0F56E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CH34022767
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:17 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:11:56 -0800
Message-ID: <3a46a59aca121d0dda59e37148d752c3edb1c9f1.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/21] matchbox-wm 1.2: remove it
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:17 -0000
Content-Type: text/plain

It doesn't work:
ERROR: matchbox-wm: Recipe file does not have license file information (LIC_FILES_CHKSUM)
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix

And there is a matchbox-wm_git.bb, they have the same GPLv2+ license.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../matchbox-wm/matchbox-wm/configure_fix.patch    |   15 --------
 .../matchbox-wm/matchbox-wm/gconf-2.m4             |   39 --------------------
 .../matchbox-wm/matchbox-wm_1.2.bb                 |   39 --------------------
 3 files changed, 93 deletions(-)
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/gconf-2.m4
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
deleted file mode 100644
index 800bf3b..0000000
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: matchbox-window-manager/configure.ac
-===================================================================
---- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
-+++ matchbox-window-manager/configure.ac	2007-11-14 12:18:55.000000000 +0000
-@@ -283,7 +283,7 @@
-     yes)
- 
- 	case "$expat" in
--	  yes)
-+	  yes|"")
- 		EXPAT_LIBS="-lexpat"
- 		;;
- 	    *)
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/gconf-2.m4 b/meta/recipes-graphics/matchbox-wm/matchbox-wm/gconf-2.m4
deleted file mode 100644
index aca7c7d..0000000
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm/gconf-2.m4
+++ /dev/null
@@ -1,39 +0,0 @@
-dnl AM_GCONF_SOURCE_2
-dnl Defines GCONF_SCHEMA_CONFIG_SOURCE which is where you should install schemas
-dnl  (i.e. pass to gconftool-2
-dnl Defines GCONF_SCHEMA_FILE_DIR which is a filesystem directory where
-dnl  you should install foo.schemas files
-dnl
-
-AC_DEFUN([AM_GCONF_SOURCE_2],
-[
-  if test "x$GCONF_SCHEMA_INSTALL_SOURCE" = "x"; then
-    GCONF_SCHEMA_CONFIG_SOURCE=`gconftool-2 --get-default-source`
-  else
-    GCONF_SCHEMA_CONFIG_SOURCE=$GCONF_SCHEMA_INSTALL_SOURCE
-  fi
-
-  AC_ARG_WITH(gconf-source, 
-  [  --with-gconf-source=sourceaddress      Config database for installing schema files.],GCONF_SCHEMA_CONFIG_SOURCE="$withval",)
-
-  AC_SUBST(GCONF_SCHEMA_CONFIG_SOURCE)
-  AC_MSG_RESULT([Using config source $GCONF_SCHEMA_CONFIG_SOURCE for schema installation])
-
-  if test "x$GCONF_SCHEMA_FILE_DIR" = "x"; then
-    GCONF_SCHEMA_FILE_DIR='$(sysconfdir)/gconf/schemas'
-  fi
-
-  AC_ARG_WITH(gconf-schema-file-dir, 
-  [  --with-gconf-schema-file-dir=dir        Directory for installing schema files.],GCONF_SCHEMA_FILE_DIR="$withval",)
-
-  AC_SUBST(GCONF_SCHEMA_FILE_DIR)
-  AC_MSG_RESULT([Using $GCONF_SCHEMA_FILE_DIR as install directory for schema files])
-
-  AC_ARG_ENABLE(schemas-install,
-     [  --disable-schemas-install	Disable the schemas installation],
-     [case ${enableval} in
-       yes|no) ;;
-       *) AC_MSG_ERROR(bad value ${enableval} for --enable-schemas-install) ;;
-      esac])
-  AM_CONDITIONAL([GCONF_SCHEMAS_INSTALL], [test "$enable_schemas_install" != no])
-])
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
deleted file mode 100644
index 8ee42c3..0000000
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Matchbox lightweight window manager"
-SECTION = "x11/wm"
-LICENSE = "GPLv2.0+"
-DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxcursor xdamage libxrender startup-notification expat"
-PR = "r5"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/${PV}/matchbox-window-manager-${PV}.tar.bz2 \
-           file://configure_fix.patch \
-           file://kbdconfig \
-           file://gconf-2.m4"
-
-SRC_URI[md5sum] = "3e158dcf57823b55c926d95b245500fb"
-SRC_URI[sha256sum] = "81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506c1ceff"
-
-S = "${WORKDIR}/matchbox-window-manager-${PV}"
-
-inherit autotools pkgconfig
-
-FILES_${PN} = "${bindir}/* \
-	       ${datadir}/matchbox \
-	       ${sysconfdir}/matchbox \
-	       ${datadir}/themes/blondie/matchbox \
-	       ${datadir}/themes/Default/matchbox \
-	       ${datadir}/themes/MBOpus/matchbox"
-
-EXTRA_OECONF = " --enable-startup-notification \
-                 --disable-xrm \
-                 --enable-expat \
-                 --with-expat-lib=${STAGING_LIBDIR} \
-                 --with-expat-includes=${STAGING_INCDIR}"
-
-
-do_configure_prepend () {
-        cp ${WORKDIR}/gconf-2.m4 ${S}/
-}
-
-do_install_prepend() {
-	install ${WORKDIR}/kbdconfig ${S}/data/kbdconfig
-}
-- 
1.7.9.5


