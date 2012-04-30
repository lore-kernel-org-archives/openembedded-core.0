Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SOyA6-00072N-FJ
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:29:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2012 14:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94763616"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Apr 2012 14:19:55 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 14:19:54 -0700
Message-Id: <0e2e8fa091ec3948da068be675a717390c8bab1d.1335820630.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1335820630.git.nitin.a.kamble@intel.com>
References: <cover.1335820630.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] qt4: fix compilation issue
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
X-List-Received-Date: Mon, 30 Apr 2012 21:29:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

gcc 4.7 uncovers a type mismatch in the code. And this commit fixes the issue:

| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
| In file included from ./wtf/Platform.h:1217:0,
|                  from ./config.h:30,
|                  from wtf/gobject/GOwnPtr.cpp:19:
| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously declared here
NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
 .../qt4/qt-4.8.1/fix_conflicting_types.patch       |   29 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 3 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch

diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
index 8c38cae..2fc4228 100644
--- a/meta/recipes-qt/qt4/qt-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
@@ -23,6 +23,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://gcc47-fix.patch \
            file://gcc47-fix2.patch \
            file://disable-fuse-gold-flag.patch \
+           file://fix_conflicting_types.patch \
            "
 
 SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch b/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
new file mode 100644
index 0000000..8124505
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+This patch fixes the type mismatch fixing this compile issue:
+
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
+| In file included from ./wtf/Platform.h:1217:0,
+|                  from ./config.h:30,
+|                  from wtf/gobject/GOwnPtr.cpp:19:
+| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously declared here
+NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed
+
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/30
+
+
+Index:  qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
+===================================================================
+--- qt-everywhere-opensource-src-4.8.1/src/3rdparty.orig/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
+@@ -52,7 +52,7 @@ typedef struct _GFile GFile;
+ typedef struct _GHashTable GHashTable;
+ typedef struct _GInputStream GInputStream;
+ typedef struct _GList GList;
+-typedef struct _GMutex GMutex;
++typedef union _GMutex GMutex;
+ typedef struct _GPatternSpec GPatternSpec;
+ typedef struct _GPollableOutputStream GPollableOutputStream;
+ typedef struct _GSocketClient GSocketClient;
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index a59198d..720b1bf 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r41"
+INC_PR = "r42"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.7



