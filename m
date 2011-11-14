Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFg-00022z-ED
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055114"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:52 -0800
Message-Id: <acc91df6d61da03bbb8ef05238ffde48a656894f.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/21] qt4-x11-free: bring back pkg-config fixups
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:36 -0000

From: Simon Busch <morphis@gravedo.de>

* With b40b9c024be5e1ec81a31961158b3e6b529acfe0 some pkg-config fixups where removed from
  qt4.inc which breaks the pkg-config files for qt4-embedded. Without that the pkg-config
  files for qt4-x11-free are broken. So this patch puts the fixes into the qt4-x11-free.inc
  file to be used by qt4-x11-free and not qt4-embedded.

* Resending because nobody replied on
  http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg10609.html

Signed-off-by: Simon Busch <morphis@gravedo.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index f391028..04b7885 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r32"
+INC_PR = "r33"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
@@ -16,3 +16,17 @@ QT_BASE_LIB  ?= "libqt"
 
 inherit qt4x11
 
+do_install_append() {
+  # fix pkgconfig, libtool and prl files
+  sed -i -e 's#I/usr/include#Iincludedir}#g' \ 
+    -e 's#Iin#I${in#g' \
+    ${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
+
+  # QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so
+  # manually fix it up here:
+  for pc in ${D}${libdir}/pkgconfig/*.pc ; do
+    sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename $pc .pc):prefix}/include:" \
+      -e "s,Cflags: ,Cflags: -IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
+      -e 's:IP{:I${:g' $pc
+  done
+}
-- 
1.7.6.4



