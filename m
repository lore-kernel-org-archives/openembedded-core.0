Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYLa5-0004X3-8X
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:46:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2011 09:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93564365"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.2])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2011 09:39:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 17:39:46 +0000
Message-Id: <1bfcc1c3ccddbd07700079609b5bcb95b0f7dc0c.1323279373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323279373.git.paul.eggleton@linux.intel.com>
References: <cover.1323279373.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323279373.git.paul.eggleton@linux.intel.com>
References: <cover.1323279373.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] qt4: fix debug symbol stripping
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
X-List-Received-Date: Wed, 07 Dec 2011 17:46:57 -0000

Adds a patch imported from Debian to not strip the executables as part
of the Qt build process. This fixes the warnings shown at packaging
stage as well as the content of the debug symbol packages.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../qt4/files/add_nostrip_for_debug_packages.diff  |   23 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    1 +
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 4 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff

diff --git a/meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff b/meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff
new file mode 100644
index 0000000..774cb99
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff
@@ -0,0 +1,23 @@
+author: Fathi Boudra <fabo@debian.org>
+
+Qt is built in release mode and strip files by default.
+Set CONFIG+=nostrip to avoid the stripping and
+let dh_strip do it to generate debug packages.
+
+Upstream-Status: Inappropriate [Configuration]
+
+---
+ configure |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/configure
++++ b/configure
+@@ -627,6 +627,8 @@ mkdir -p "$outpath/config.tests"
+ rm -f "$outpath/config.tests/.qmake.cache"
+ cp "$QMAKE_VARS_FILE" "$outpath/config.tests/.qmake.cache"
+ 
++QMakeVar add CONFIG nostrip
++
+ QMakeVar add styles "cde mac motif plastique cleanlooks windows"
+ QMakeVar add decorations "default windows styled"
+ QMakeVar add mouse-drivers "pc"
diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index bc33b6b..7a3ba54 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://0001-Added-Openembedded-crossarch-option.patch \
            file://blacklist-diginotar-certs.diff \
            file://fix-translations.patch \
+           file://add_nostrip_for_debug_packages.diff \
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index e34ec8d..6b9f97a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 8c48936..0db090f 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
-- 
1.7.5.4



