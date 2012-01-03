Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ri4jd-0007dr-So
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 14:49:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 05:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92470650"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.79])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 05:41:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 13:41:32 +0000
Message-Id: <beca2b0418594f6c3de685b0f90ee43bc7338561.1325597850.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325597850.git.paul.eggleton@linux.intel.com>
References: <cover.1325597850.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325597850.git.paul.eggleton@linux.intel.com>
References: <cover.1325597850.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] qt4: fix incorrect architecture for qt4 tools
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
X-List-Received-Date: Tue, 03 Jan 2012 13:49:02 -0000

Don't install the native staging versions of the qt4 tools in the bin
directory; we have been doing this for a very long time but it is no
longer necessary since we specify them via the QMAKE_UIC, QMAKE_MOC etc.
variables. Doing so was sometimes resulting in those executables being
the ones that end up being packaged (probably only sometimes due to
different date/time values on the staging files and the interaction
with make).

Fixes [YOCTO #1856].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.7.4.inc          |    4 ----
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb |    2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index 8fda9ce..9ddb055 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -50,10 +50,6 @@ do_compile() {
     fi
 
     unset CFLAGS CXXFLAGS
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
 
     oe_runmake ${EXTRA_ENV}
 }
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index 1d7104c..9b66d03 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 3263c93..6dedf00 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.5.4



