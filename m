Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-01.prod.phx3.secureserver.net
	(p3plsmtpa11-01.prod.phx3.secureserver.net [68.178.252.102])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7C16BD80
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 23:40:08 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa11-01.prod.phx3.secureserver.net with 
	id Kbg51m00L1mTNtu01bg6fm; Sat, 31 Aug 2013 16:40:09 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2013 18:40:03 -0500
Message-Id: <1377992403-11165-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] chkconfig: remove linuxstdbase symlinks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Aug 2013 23:40:09 -0000

In cffd1a933fese the links were moved to the lsb package because lsbsetup
was to be removed.  Subsequently an earlier patch 5283be2305b that moved
them to chkconfig was also merged.  This results in duplicate installations
that generate a warning when building core-image-lsb under DISTRO=poky-lsb
which enables the linuxstdbase feature.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index c6f8b1d..4560298 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -48,12 +48,6 @@ do_install() {
 	install -d ${D}${sysconfdir}/chkconfig.d
 }
 
-do_install_append_linuxstdbase() {
-	install -d ${D}${libdir}/lsb/
-	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
-	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
-}
-
 PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
 SUMMARY_${PN}-alternatives = "Maintain symbolic links determining default commands"
 DESCRIPTION_${PN}-alternatives = "alternatives creates, removes, maintains and displays \
@@ -67,5 +61,3 @@ FILES_${PN}-alternatives = "${sbindir}/alternatives ${sbindir}/update-alternativ
 			    ${sysconfdir}/alternatives ${localstatedir}/lib/alternatives"
 FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \
                                 ${mandir}/man8/update-alternatives.8"
-
-FILES_${PN}_append_linuxstdbase += "${libdir}/lsb"
-- 
1.8.4


