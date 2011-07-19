Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3U-0001do-GE
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396933"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:56 -0700
Message-Id: <af9469d5996fb5713d4911c46adf7106ddb6d69e.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/22] classes: remove classes that don't belong in oe-core
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:50 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

These classes are not used within oe-core and really belong in an upper
layer that makes use of them, if they are still useful:

* mozilla.bbclass
* openmoko*.bbclass
* srec.bbclass
* xfce.bbclass

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/mozilla.bbclass               |   53 ----------------------------
 meta/classes/openmoko-base.bbclass         |   19 ----------
 meta/classes/openmoko-panel-plugin.bbclass |    6 ---
 meta/classes/openmoko.bbclass              |    3 --
 meta/classes/openmoko2.bbclass             |   31 ----------------
 meta/classes/srec.bbclass                  |   28 ---------------
 meta/classes/xfce.bbclass                  |   25 -------------
 7 files changed, 0 insertions(+), 165 deletions(-)
 delete mode 100644 meta/classes/mozilla.bbclass
 delete mode 100644 meta/classes/openmoko-base.bbclass
 delete mode 100644 meta/classes/openmoko-panel-plugin.bbclass
 delete mode 100644 meta/classes/openmoko.bbclass
 delete mode 100644 meta/classes/openmoko2.bbclass
 delete mode 100644 meta/classes/srec.bbclass
 delete mode 100644 meta/classes/xfce.bbclass

diff --git a/meta/classes/mozilla.bbclass b/meta/classes/mozilla.bbclass
deleted file mode 100644
index d7ec747..0000000
--- a/meta/classes/mozilla.bbclass
+++ /dev/null
@@ -1,53 +0,0 @@
-SECTION = "x11/utils"
-DEPENDS += "gnu-config-native virtual/libintl xt libxi \
-	    zip-native gtk+"
-LICENSE = "MPL NPL"
-SRC_URI += "file://mozconfig"
-
-inherit gettext pkgconfig
-
-EXTRA_OECONF = "--target=${TARGET_SYS} --host=${BUILD_SYS} \
-		--build=${BUILD_SYS} --prefix=${prefix}"
-EXTRA_OEMAKE = "'HOST_LIBIDL_LIBS=${HOST_LIBIDL_LIBS}' \
-		'HOST_LIBIDL_CFLAGS=${HOST_LIBIDL_CFLAGS}'"
-SELECTED_OPTIMIZATION = "-Os -fsigned-char -fno-strict-aliasing"
-
-export CROSS_COMPILE = "1"
-export MOZCONFIG = "${WORKDIR}/mozconfig"
-export MOZ_OBJDIR = "${S}"
-
-export CONFIGURE_ARGS = "${EXTRA_OECONF}"
-export HOST_LIBIDL_CFLAGS = "`${HOST_LIBIDL_CONFIG} --cflags`"
-export HOST_LIBIDL_LIBS = "`${HOST_LIBIDL_CONFIG} --libs`"
-export HOST_LIBIDL_CONFIG = "PKG_CONFIG_SYSROOT_DIR="" PKG_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
-export HOST_CC = "${BUILD_CC}"
-export HOST_CXX = "${BUILD_CXX}"
-export HOST_CFLAGS = "${BUILD_CFLAGS}"
-export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
-export HOST_LDFLAGS = "${BUILD_LDFLAGS}"
-export HOST_RANLIB = "${BUILD_RANLIB}"
-export HOST_AR = "${BUILD_AR}"
-
-mozilla_do_configure() {
-	(
-		set -e
-		for cg in `find ${S} -name config.guess`; do
-			install -m 0755 \
-			${STAGING_DATADIR_NATIVE}/gnu-config/config.guess \
-			${STAGING_DATADIR_NATIVE}/gnu-config/config.sub \
-			`dirname $cg`/
-		done
-	)
-	oe_runmake -f client.mk ${MOZ_OBJDIR}/Makefile \
-				${MOZ_OBJDIR}/config.status
-}
-
-mozilla_do_compile() {
-	oe_runmake -f client.mk build_all
-}
-
-mozilla_do_install() {
-	oe_runmake DESTDIR="${D}" destdir="${D}" install
-}
-
-EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes/openmoko-base.bbclass b/meta/classes/openmoko-base.bbclass
deleted file mode 100644
index b8b4119..0000000
--- a/meta/classes/openmoko-base.bbclass
+++ /dev/null
@@ -1,19 +0,0 @@
-HOMEPAGE = "http://www.openmoko.org"
-LICENSE ?= "GPL"
-OPENMOKO_RELEASE ?= "OM-2007"
-OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
-
-def openmoko_base_get_subdir(d):
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
-    if section == 'base' or section == 'libs': return ""
-    elif section in 'apps tools pim'.split(): return "applications"
-    elif section == "panel-plugin": return "panel-plugins"
-    elif section == "inputmethods": return "inputmethods"
-    else: return section
-
-SUBDIR = "${@openmoko_base_get_subdir(d)}"
-
-SRC_URI := "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${BPN};proto=http"
-S = "${WORKDIR}/${PN}"
-
-FILES_${PN} += "${datadir}/icons"
diff --git a/meta/classes/openmoko-panel-plugin.bbclass b/meta/classes/openmoko-panel-plugin.bbclass
deleted file mode 100644
index 6a22a92..0000000
--- a/meta/classes/openmoko-panel-plugin.bbclass
+++ /dev/null
@@ -1,6 +0,0 @@
-SECTION = "openmoko/panel-plugin"
-DEPENDS += "matchbox-panel-2 libmokopanelui2"
-
-inherit openmoko2
-
-FILES_${PN} = "${libdir}/matchbox-panel/lib*.so* ${datadir}"
diff --git a/meta/classes/openmoko.bbclass b/meta/classes/openmoko.bbclass
deleted file mode 100644
index 808ab8f..0000000
--- a/meta/classes/openmoko.bbclass
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit openmoko-base autotools pkgconfig
-
-DEPENDS_prepend = "${@["openmoko-libs ", ""][(bb.data.getVar('PN', d, 1) == 'openmoko-libs')]}"
diff --git a/meta/classes/openmoko2.bbclass b/meta/classes/openmoko2.bbclass
deleted file mode 100644
index 2d9f71a..0000000
--- a/meta/classes/openmoko2.bbclass
+++ /dev/null
@@ -1,31 +0,0 @@
-inherit autotools pkgconfig
-
-HOMEPAGE = "http://www.openmoko.org"
-OPENMOKO_RELEASE ?= "OM-2007.2"
-OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
-
-def openmoko_two_get_license(d):
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
-    return "LGPL GPL".split()[section != "libs"]
-
-def openmoko_two_get_subdir(d):
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
-    if section == 'base': return ""
-    elif section == 'libs': return "libraries"
-    elif section in 'apps tools pim'.split(): return "applications"
-    elif section == "panel-plugin": return "panel-plugins"
-    elif section == "inputmethods": return "inputmethods"
-    elif section == "daemons": return "daemons"
-    elif section == "misc": return "misc"
-    else: return section
-
-LICENSE = "${@openmoko_two_get_license(d)}"
-SUBDIR = "${@openmoko_two_get_subdir(d)}"
-
-SRC_URI := "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${BPN};proto=http"
-S = "${WORKDIR}/${PN}"
-
-FILES_${PN} += "${datadir}/icons"
-
-SVNREV = "r${SRCREV}"
-#SVNREV = "${SRCDATE}"
diff --git a/meta/classes/srec.bbclass b/meta/classes/srec.bbclass
deleted file mode 100644
index 390d5ab..0000000
--- a/meta/classes/srec.bbclass
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# Creates .srec files from images.
-#
-# Useful for loading with Yamon.
-
-# Define SREC_VMAADDR in your machine.conf.
-
-SREC_CMD = "${TARGET_PREFIX}objcopy -O srec -I binary --adjust-vma ${SREC_VMAADDR} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.${type}.srec"
-
-# Do not build srec files for these types of images:
-SREC_SKIP = "tar"
-
-do_srec[nostamp] = "1"
-
-do_srec () {
-    if [ ${SREC_VMAADDR} = "" ] ; then
-       bbfatal Cannot do_srec without SREC_VMAADDR defined.
-    fi
-    for type in ${IMAGE_FSTYPES}; do
-        for skiptype in ${SREC_SKIP}; do
-            if [ $type = $skiptype ] ; then continue 2 ; fi
-        done
-        ${SREC_CMD}
-    done
-    return 0
-}
-
-addtask srec after do_rootfs before do_build
diff --git a/meta/classes/xfce.bbclass b/meta/classes/xfce.bbclass
deleted file mode 100644
index d21bb42..0000000
--- a/meta/classes/xfce.bbclass
+++ /dev/null
@@ -1,25 +0,0 @@
-# xfce.oeclass
-# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-# Global class to make it easier to maintain XFCE packages
-
-HOMEPAGE = "http://www.xfce.org"
-LICENSE = "LGPLv2"
-DEPENDS += "startup-notification"
-
-XFCE_VERSION = ${PV}
-SRC_URI = "http://www.us.xfce.org/archive/xfce/${XFCE_VERSION}/src/${BPN}-${PV}.tar.bz2"
-
-inherit autotools
-
-EXTRA_OECONF += "--with-pluginsdir=${libdir}/xfce4/panel-plugins/"
-
-# FIXME:  Put icons in their own package too?
-
-FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/modules/*.so*"
-FILES_${PN}-doc += "${datadir}/xfce4/doc"
-
-FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
-FILES_${PN}-dbg += "${libdir}/xfce4/*/.debug"
-
-- 
1.7.3.4



