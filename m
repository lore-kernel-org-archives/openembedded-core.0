Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TtkOK-0005nE-EK
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 20:35:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2013 11:20:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,453,1355126400"; d="scan'208";a="275947579"
Received: from unknown (HELO localhost) ([10.255.14.242])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2013 11:20:30 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 13:20:25 -0600
Message-Id: <88b78152fff010082e07b57992977e0b9d65fdde.1357930527.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1357930527.git.tom.zanussi@intel.com>
References: <cover.1357930527.git.tom.zanussi@intel.com>
Subject: [PATCH 1/5] lttng: remove 'legacy' lttng
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 19:36:03 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This removes 'legacy' lttng - it hasn't actually worked for awhile
now, and has been replaced by equivalent functionality in
recipes-kernel/lttng-2.0 (which will be renamed to lttng in a
follow-up patch).

Fixes [YOCTO #3303].

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/lttng/lttng-control_0.89.bb    | 23 ------------
 meta/recipes-kernel/lttng/lttng-ust_0.16.bb        | 32 -----------------
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   | 42 ----------------------
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  | 40 ---------------------
 4 files changed, 137 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-control_0.89.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.16.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb

diff --git a/meta/recipes-kernel/lttng/lttng-control_0.89.bb b/meta/recipes-kernel/lttng/lttng-control_0.89.bb
deleted file mode 100644
index 77314c8..0000000
--- a/meta/recipes-kernel/lttng/lttng-control_0.89.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit Control"
-DESCRIPTION = "The Linux trace toolkit is a suite of tools designed to \
-extract program execution details from the Linux operating system and  \
-interpret them."
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-PR = "r0"
-
-LTTDATE = "05122011"
-
-SRC_URI = "http://lttng.org/files/lttng/ltt-control-${PV}-${LTTDATE}.tar.gz"
-
-SRC_URI[md5sum] = "2e5a531bf5cab88eef5282b45271789f"
-SRC_URI[sha256sum] = "feb120e0bedd9ef8917dd14ee96cc94941f517826a4c2035d1c4aa33e4e808ab"
-
-S = "${WORKDIR}/ltt-control-${PV}-${LTTDATE}"
-
-inherit autotools
-
-export KERNELDIR="${STAGING_KERNEL_DIR}"
-
-FILES_${PN} += "${datadir}/ltt-control/facilities/*"	    
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.16.bb b/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
deleted file mode 100644
index 3618a2d..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer"
-DESCRIPTION = "The LTTng Userspace Tracer (UST) is a library accompanied by a set of tools to trace userspace code"
-HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "http://lttng.org/project/issues"
-
-LICENSE = "LGPLv2.1+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
-                    file://ustctl/ustctl.c;endline=16;md5=b50c6fa0307175bb1ce0db49d752c03b \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
-
-DEPENDS = "liburcu"
-
-PR = "r1"
-PE = "1"
-
-SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8e5d5de47bfff29f50439d192ad1e478"
-SRC_URI[sha256sum] = "88167741b1fbf335e006f0208d8c41784705e28adac84df71d3d9f6c58191dab"
-
-
-S = "${WORKDIR}/ust-${PV}"
-
-inherit autotools
-
-#EXTRA_OECONF = "ac_cv_lib_urcu_bp_synchronize_rcu_bp=no"
-
-# Due to liburcu not building on MIPS currently this recipe needs to
-# be limited also.
-# So here let us first suppport x86/arm/powerpc platforms now.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
-
diff --git a/meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch b/meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
deleted file mode 100644
index 4a135df..0000000
--- a/meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Explicitly add linkage to lttvwindow.
-
-Without the fix, lttv-gui inside target can't run, complaining
-"undefined symbol: LTTV_VIEWER_CONSTRUCTORS".
-
-Tue May  3 21:39:37 CST 2011
-
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-
-diff --git a/lttv/modules/gui/common.am b/lttv/modules/gui/common.am
-index ce50113..89083aa 100644
---- a/lttv/modules/gui/common.am
-+++ b/lttv/modules/gui/common.am
-@@ -21,3 +21,4 @@ AM_LDFLAGS = $(MODULE_LDFLAGS)
- 
- libdir = ${lttvplugindir}
- 
-+LIBS += $(GTK_LIBS) -L${top_builddir}/lttv/modules/gui/lttvwindow/lttvwindow -llttvwindow
-diff --git a/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am b/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am
-index c953fc9..489d640 100644
---- a/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am
-+++ b/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am
-@@ -1,13 +1,14 @@
- ## Process this file with automake to produce Makefile.in
- 
--include ../../common.am
--
- INCLUDES = \
- 	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
- 	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
- 	$(DEFAULT_INCLUDES)
- 
--#libdir = ${lttvplugindir}
-+AM_CFLAGS = $(MODULE_CFLAGS)
-+AM_LDFLAGS = $(MODULE_LDFLAGS)
-+
-+libdir = ${lttvplugindir}
- 
- lib_LTLIBRARIES = liblttvwindow.la
- 
diff --git a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
deleted file mode 100644
index 9d94903..0000000
--- a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Viewer"
-DESCRIPTION = "The Linux trace toolkit is a suite of tools designed to \
-extract program execution details from the Linux operating system and  \
-interpret them."
-HOMEPAGE = "http://lttng.org/content/download"
-BUGTRACKER = "n/a"
-
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f650d5f5af1e9648fe0b40e290d3adbb \
-                    file://ltt/ltt.h;beginline=2;endline=18;md5=8b7da9190028c50396d97fc85bad0da9 \
-                    file://lttv/lttv/traceset.c;beginline=2;endline=17;md5=bcab42863b64b41d153bf81bbe2490a6"
-PR = "r3"
-
-DEPENDS = "gtk+ pango popt"
-
-SECTION = "devel"
-
-ALTNAME = "lttv-${PV}-21032011"
-
-SRC_URI = "http://lttng.org/files/packages/${ALTNAME}.tar.gz \
-           file://add_linkage_to_lttvwindow.patch"
-
-SRC_URI[md5sum] = "071bf3dd13e7562c08ee8f8971cfc76d"
-SRC_URI[sha256sum] = "cf87ffcf5d266b18979418e610a180a0b4214de41677f0be867885e15b2f7647"
-S = "${WORKDIR}/${ALTNAME}"
-
-inherit autotools
-
-LEAD_SONAME = "liblttvtraceread*"
-
-FILES_SOLIBSDEV = ""
-FILES_${PN} += "\
-    ${libdir}/liblttvtraceread*.so \
-    ${libdir}/lttv/plugins/*.so \
-    ${datadir}/lttv/facilities/* \
-    ${datadir}/lttv/pixmaps/* "
-FILES_${PN}-dbg += "${libdir}/lttv/plugins/.debug/"
-FILES_${PN}-dev += "${libdir}/lttv/plugins/*.la"
-FILES_${PN}-staticdev += "${libdir}/lttv/plugins/*.a"
-INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.11.4



