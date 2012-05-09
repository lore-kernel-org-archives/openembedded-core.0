Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzcz-0005zp-Fl
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:39:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721016"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:29:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:48 -0700
Message-Id: <47928d1621b59e26da6b9906276378aef8e950ee.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/12] qt4-graphics-system: set graphic system in profile instead of X11 session
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
X-List-Received-Date: Wed, 09 May 2012 05:39:57 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

To allow the use of Qt applications started manually to use the
configured graphics system the setting needs to be available in user
environment. This moves the setting to /etc/profile.d ensuring it is
set and available. This allow the removal of x11-common as dependency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
index bae0340..e816a90 100644
--- a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -3,10 +3,9 @@ SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-QT_GRAPHICS_SYSTEM ?= "raster"
+PR = "r1"
 
-# xserver-common, x11-common
-VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+QT_GRAPHICS_SYSTEM ?= "raster"
 
 def _get_extra_rdepends(d):
     gs = d.getVar('QT_GRAPHICS_SYSTEM', True)
@@ -16,12 +15,11 @@ def _get_extra_rdepends(d):
     return ""
 
 do_install () {
-	install -d ${D}/${sysconfdir}/X11/Xsession.d/
-	cfg_file=${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
+	install -d ${D}/${sysconfdir}/profile.d/
+	cfg_file=${D}/${sysconfdir}/profile.d/qt-graphicssystem
 	echo "export QT_GRAPHICSSYSTEM=${QT_GRAPHICS_SYSTEM}" > $cfg_file
-	chmod +x $cfg_file
 }
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_xserver_common} ${@_get_extra_rdepends(d)}"
+RDEPENDS_${PN} = "${@_get_extra_rdepends(d)}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.7.6



