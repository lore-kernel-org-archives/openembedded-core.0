Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfui-0002zm-1O
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125532"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:43 -0700
Message-Id: <d7bf94647f17c0382caad8af0bdda837b14b22dc.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 32/32] fotowall: Add #include ui_wizard.h to ExportWizard.cpp
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
X-List-Received-Date: Thu, 24 May 2012 21:49:44 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
should be already generated before compiling ExportWizard.cpp.

[YOCTO #2297]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../ExportWizard-depends-on-ui_wizard.patch        |   18 ++++++++++++++++++
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch

diff --git a/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
new file mode 100644
index 0000000..d8b2b23
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
@@ -0,0 +1,18 @@
+App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
+should be already generated before compiling ExportWizard.cpp.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: Fotowall-0.9/App/ExportWizard.cpp
+===================================================================
+--- Fotowall-0.9.orig/App/ExportWizard.cpp	2009-11-30 13:21:31.000000000 +0200
++++ Fotowall-0.9/App/ExportWizard.cpp	2012-05-10 17:12:06.765230830 +0300
+@@ -23,6 +23,7 @@
+ #include "imageloaderqt.h"
+ #include "posterazorcore.h"
+ #include "wizard.h"
++#include "ui_wizard.h"
+ 
+ #include <QDesktopServices>
+ #include <QDesktopWidget>
diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 52dd727..3cb79a3 100644
--- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://GPL_V2;md5=79808397c3355f163c012616125c9e26 \
                     file://main.cpp;beginline=6;endline=11;md5=b569acc2bf8974a3082b58fc53b9d8dc"
 SECTION = "x11/apps"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "qt4-x11-free"
 RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
 
-SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2"
+SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
+           file://ExportWizard-depends-on-ui_wizard.patch \
+           "
 
 SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
 SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
-- 
1.7.9.5



