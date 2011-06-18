Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0lE-0006oO-2F
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 21:00:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jun 2011 11:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="15140031"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2011 11:57:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:56:51 +0100
Message-Id: <74ac55527ebb1b16e74ab4e56e1f23360dc3ff87.1308423290.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] qt4-tools-nativesdk: fix compile failure in src/dbus
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
X-List-Received-Date: Sat, 18 Jun 2011 19:00:48 -0000

[Qt #17962]   -- http://bugreports.qt.nokia.com/browse/QTBUG-17962
[YOCTO #1168] -- http://bugzilla.pokylinux.org/show_bug.cgi?id=1168

Fix "invalid conversion from 'const void*' to 'void*'" error compiling
src/dbus/qdbusintegrator.cpp. It is assumed that the use of "const" here
is incorrect as no other usage of Q_GLOBAL_STATIC_WITH_ARGS uses const
prefix on the first (TYPE) argument.

Patch was imported from the Qt bug tracker (see above reference); the
patch was rejected but for procedural rather than validity reasons.

Fixes [YOCTO #1168]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/qt-dbus-const.patch |   21 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc   |    1 +
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/qt-dbus-const.patch

diff --git a/meta/recipes-qt/qt4/files/qt-dbus-const.patch b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
new file mode 100644
index 0000000..a856912
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
@@ -0,0 +1,21 @@
+Remove "const" usage that causes compile failure building qt4-tools-nativesdk
+
+Patch has apparently been rejected upstream, not because it is invalid
+but because the submitter did not submit a merge request for it, so the
+validity of the patch upstream is uncertain. For further details see:
+http://bugreports.qt.nokia.com/browse/QTBUG-17962
+
+Original Author: Pavel Heimlich <tropikhajma at gmail.com>
+Upstream-Status: Rejected
+
+--- qt-everywhere-opensource-src-4.7.3/src/dbus/qdbusintegrator.cpp.orig	2011-03-12 02:11:32.313467991 +0100
++++ qt-everywhere-opensource-src-4.7.3/src/dbus/qdbusintegrator.cpp	2011-03-12 02:11:03.795809176 +0100
+@@ -71,7 +71,7 @@
+ static bool isDebugging;
+ #define qDBusDebug              if (!::isDebugging); else qDebug
+ 
+-Q_GLOBAL_STATIC_WITH_ARGS(const QString, orgFreedesktopDBusString, (QLatin1String(DBUS_SERVICE_DBUS)))
++Q_GLOBAL_STATIC_WITH_ARGS(QString, orgFreedesktopDBusString, (QLatin1String(DBUS_SERVICE_DBUS)))
+ 
+ static inline QString dbusServiceString()
+ { return *orgFreedesktopDBusString(); }
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 114f998..19da0ce 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://qt-config.patch \
            file://qmake-exists-check.patch \
            file://configure-paths.patch \
+           file://qt-dbus-const.patch \
            file://g++.conf \
            file://linux.conf"
 
-- 
1.7.4.1



