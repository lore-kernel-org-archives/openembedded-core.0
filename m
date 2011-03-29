Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q4Ujt-0002xq-Ht
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 10:57:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2011 01:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,260,1299484800"; d="scan'208";a="726382926"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2011 01:54:10 -0700
Message-Id: <c9789f2d0873c6b8ff2ae3a7b338b72527cfbf02.1301388474.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1301388474.git.dexuan.cui@intel.com>
References: <cover.1301388474.git.dexuan.cui@intel.com>
Old-Date: Tue, 29 Mar 2011 15:58:17 +0800
Date: Tue, 29 Mar 2011 16:52:23 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 1/1] qt4: remove the option -feliminate-dwarf2-dups to fix the build
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
X-List-Received-Date: Tue, 29 Mar 2011 08:57:26 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #932]

After commit 5ea06dc295b657383fd97545c15255b294cf1a79(bitbake.conf: Prune
global OPTIMIZATION flags) that adds an option -feliminate-dwarf2-dups,
gcc 4.5 reports such an internal compiler error when building Qt4 if the
option is used:

| graphicsview/qgridlayoutengine.cpp:1553:1: internal compiler error: in build_abbrev_table, at dwarf2out.c:9806
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.

This is a gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47361

At present we can remove the option as a workaround.

Thanks Robert Berger for reporting the bug and his investigation in gcc
bugzilla and thanks Khem Raj for the quick suggestion about removing
the option.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 2ed1819..dc5ea96 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1 | GPLv3"
 PRIORITY = "optional"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r26"
+INC_PR = "r27"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 057a129..ec73a3b 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -6,7 +6,7 @@ SECTION = "x11/libs"
 PRIORITY = "optional"
 DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 QT_GLFLAGS ?= "-no-opengl"
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index de8cb69..24b2a82 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -3,6 +3,11 @@ inherit qmake_base
 DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3"
 
 require qt4_arch.inc
+
+# gcc 4.5 is buggy (it reports "internal compiler error") when building Qt4 if
+# -feliminate-dwarf2-dups is used, so we remove the option to workaround it.
+CXXFLAGS := "${@oe_filter_out('-feliminate-dwarf2-dups', '${CXXFLAGS}', d)}"
+
 QT_ARCH := "${@qt_arch(d)}"
 QT_ENDIAN = "${@qt_endian(d)}"
 
-- 
1.7.2



