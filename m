Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4cSF-00024u-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 20:48:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2012 11:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,301,1344236400"; d="scan'208";a="137166593"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.21])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2012 11:36:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 11:36:23 -0700
Message-Id: <1345746983-15845-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] iputils: chmod in pkg_postinst are redundant
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
X-List-Received-Date: Thu, 23 Aug 2012 18:48:31 -0000

With pseudo the cmod in pkg_postinst is actaully redundant since
the do_install uses install -m 4555 and pseudo is able to track that
between the install time and the rootfs package installation, so the
perms are correct.

[YOCTO #2894]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/iputils/iputils_s20101006.bb |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index 62e2b5e..2c2766c 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
 
 DEPENDS = "openssl docbook-utils-native sgmlspl-native"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/fix-dead-host-ping-stats.diff \
@@ -58,18 +58,6 @@ ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 ALTERNATIVE_${PN}-ping6 = "ping6"
 ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
 
-pkg_postinst_${PN}-ping () {
-       chmod 4555 ${base_bindir}/ping
-}
-
-pkg_postinst_${PN}-ping6 () {
-       chmod 4555 ${base_bindir}/ping6
-}
-
-pkg_postinst_${PN}-traceroute6 () {
-	chmod 4555 ${base_bindir}/traceroute6
-}
-
 PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.7.7.6



