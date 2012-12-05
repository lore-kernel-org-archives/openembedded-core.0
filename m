Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgFFm-0003VD-An
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:43:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 05:28:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="257623920"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 05:28:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 13:28:31 +0000
Message-Id: <a5082fe0fa17b228c2a8486edffa04c2e4dfe89b.1354713989.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354713989.git.paul.eggleton@linux.intel.com>
References: <cover.1354713989.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354713989.git.paul.eggleton@linux.intel.com>
References: <cover.1354713989.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] fotowall: tidy up
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
X-List-Received-Date: Wed, 05 Dec 2012 13:43:10 -0000

* inherit qt4x11 which inherits qmake2 and sets DEPENDS already
* Remove pkgconfig from inherit since quicky doesn't actually use
  pkg-config nor does it produce a .pc file
* Move packaging definitions to the end

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt-apps/fotowall_0.9.bb |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 3cb79a3..2e1fbaa 100644
--- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
@@ -7,10 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL_V2;md5=79808397c3355f163c012616125c9e26 \
                     file://main.cpp;beginline=6;endline=11;md5=b569acc2bf8974a3082b58fc53b9d8dc"
 SECTION = "x11/apps"
 
-PR = "r3"
-
-DEPENDS = "qt4-x11-free"
-RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
+PR = "r4"
 
 SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
            file://ExportWizard-depends-on-ui_wizard.patch \
@@ -21,10 +18,13 @@ SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046d
 
 S = "${WORKDIR}/Fotowall-${PV}"
 
-inherit qmake2 pkgconfig
+inherit qt4x11
 
 EXTRA_QMAKEVARS_PRE = "CONFIG+=no-webcam"
 
 do_install() {
 	oe_runmake INSTALL_ROOT=${D} install
 }
+
+# Ensure we have some plugins for some useful image formats
+RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
-- 
1.7.10.4



