Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIt-00041r-Pp
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360946"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:46 -0700
Message-Id: <bed68b561056e0f454c0bf527997f82b63122773.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/29] qt4-embedded: move qte.sh profile script into own package
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:40 -0000

From: Simon Busch <morphis@gravedo.de>

We don't want to pull the whole qt suite in our images when only installing a tiny setup
which needs the profile script for several configuration issues. This moves the qte.sh
profile script into a qt4-embedded-conf package which is automatically installed when an
image depends on qt4-embedded.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 1ede922..ed872b0 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r31"
+INC_PR = "r32"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
@@ -27,7 +27,11 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/qte.sh ${D}${sysconfdir}/profile.d/
 }
 
-FILES_${PN} += " ${sysconfdir}/profile.d/qte.sh"
+# We put the qte profile into it's own package as we don't want to install all qt stuff
+# with depending on the global package qt4-embedded
+PACKAGES += " ${PN}-conf"
+FILES_${PN}-conf += " ${sysconfdir}/profile.d/qte.sh"
+RDEPENDS_${PN} += " ${PN}-conf"
 
 inherit qt4e
 
-- 
1.7.6



