Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1R7oTf-0007cu-1O
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 15:10:39 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 7C822799048; Sun, 25 Sep 2011 14:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-092-076-167-122.pools.arcor-ip.net
	[92.76.167.122]) by gravedo.de (Postfix) with ESMTPSA id A08BD799043;
	Sun, 25 Sep 2011 14:57:49 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 14:57:44 +0200
Message-Id: <1316955464-19997-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1316955464-19997-1-git-send-email-morphis@gravedo.de>
References: <1316955464-19997-1-git-send-email-morphis@gravedo.de>
Subject: [PATCH 2/2] qt4-embedded: move qte.sh profile script into own package
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
X-List-Received-Date: Sun, 25 Sep 2011 13:10:39 -0000

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
1.7.4.1



