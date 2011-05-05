Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtRg-0002nm-UP
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 09:58:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2011 00:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="918292294"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2011 00:55:11 -0700
Message-Id: <02e5e8ce9adb2778da496002ce2d20fd01223d33.1304581769.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 21:54:27 +0800
Date: Thu, 05 May 2011  0:55:10 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 07/26] lttng-viewer: explicitly add linkage to lttvwindow
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
X-List-Received-Date: Thu, 05 May 2011 07:58:01 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fixes [YOCTO #412]

Also update FILES_${PN}.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   |   42 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |   10 +++--
 2 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch

diff --git a/meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch b/meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
new file mode 100644
index 0000000..4a135df
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Inappropriate [configuration]
+
+Explicitly add linkage to lttvwindow.
+
+Without the fix, lttv-gui inside target can't run, complaining
+"undefined symbol: LTTV_VIEWER_CONSTRUCTORS".
+
+Tue May  3 21:39:37 CST 2011
+
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+
+diff --git a/lttv/modules/gui/common.am b/lttv/modules/gui/common.am
+index ce50113..89083aa 100644
+--- a/lttv/modules/gui/common.am
++++ b/lttv/modules/gui/common.am
+@@ -21,3 +21,4 @@ AM_LDFLAGS = $(MODULE_LDFLAGS)
+ 
+ libdir = ${lttvplugindir}
+ 
++LIBS += $(GTK_LIBS) -L${top_builddir}/lttv/modules/gui/lttvwindow/lttvwindow -llttvwindow
+diff --git a/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am b/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am
+index c953fc9..489d640 100644
+--- a/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am
++++ b/lttv/modules/gui/lttvwindow/lttvwindow/Makefile.am
+@@ -1,13 +1,14 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-include ../../common.am
+-
+ INCLUDES = \
+ 	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
+ 	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
+ 	$(DEFAULT_INCLUDES)
+ 
+-#libdir = ${lttvplugindir}
++AM_CFLAGS = $(MODULE_CFLAGS)
++AM_LDFLAGS = $(MODULE_LDFLAGS)
++
++libdir = ${lttvplugindir}
+ 
+ lib_LTLIBRARIES = liblttvwindow.la
+ 
diff --git a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
index b8f2f2c..5e7bd4c 100644
--- a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
+++ b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
@@ -9,14 +9,16 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f650d5f5af1e9648fe0b40e290d3adbb \
                     file://ltt/ltt.h;beginline=2;endline=18;md5=8b7da9190028c50396d97fc85bad0da9 \
                     file://lttv/lttv/traceset.c;beginline=2;endline=17;md5=bcab42863b64b41d153bf81bbe2490a6"
-PR = "r0"
+PR = "r1"
+
 DEPENDS = "gtk+ pango popt"
 
 SECTION = "devel"
 
 ALTNAME = "lttv-${PV}-21032011"
 
-SRC_URI = "http://lttng.org/files/packages/${ALTNAME}.tar.gz"
+SRC_URI = "http://lttng.org/files/packages/${ALTNAME}.tar.gz \
+           file://add_linkage_to_lttvwindow.patch"
 
 SRC_URI[md5sum] = "071bf3dd13e7562c08ee8f8971cfc76d"
 SRC_URI[sha256sum] = "cf87ffcf5d266b18979418e610a180a0b4214de41677f0be867885e15b2f7647"
@@ -29,7 +31,7 @@ LEAD_SONAME = "liblttvtraceread*"
 FILES_${PN} += "\
     ${libdir}/liblttvtraceread*.so \
     ${libdir}/lttv/plugins/*.so \
-    ${datadir}/LinuxTraceToolkitViewer/facilities/* \
-    ${datadir}/LinuxTraceToolkitViewer/pixmaps/* "
+    ${datadir}/lttv/facilities/* \
+    ${datadir}/lttv/pixmaps/* "
 FILES_${PN}-dbg += "${libdir}/lttv/plugins/.debug/"
 
-- 
1.7.1.1



