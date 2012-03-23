Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SB7dW-0008Bj-K4
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:46:46 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 17:37:39 +0100
Message-Id: <1332520659-12233-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/4] ppp: drop unneeded pkg-postinst
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
X-List-Received-Date: Fri, 23 Mar 2012 16:46:46 -0000

* pkg-postinst was used to make pppd setuid root, which
  can now be done in do_install() instead.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 9232e6f..6af0d42 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
@@ -49,6 +49,7 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/08setupdns ${D}${sysconfdir}/ppp/ip-up.d/
 	install -m 0755 ${WORKDIR}/92removedns ${D}${sysconfdir}/ppp/ip-down.d/
 	rm -rf ${D}/${mandir}/man8/man8
+	chmod u+s ${D}${sbindir}/pppd
 }
 
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
@@ -72,11 +73,3 @@ DESCRIPTION_${PN}-minconn  = "Plugin for PPP to specify a minimum connect time b
 DESCRIPTION_${PN}-password = "Plugin for PPP to get passwords via a pipe"
 DESCRIPTION_${PN}-l2tp     = "Plugin for PPP for l2tp support"
 DESCRIPTION_${PN}-tools    = "The pppdump and pppstats utitilities"
-
-pkg_postinst_${PN}() {
-if test "x$D" != "x"; then
-	exit 1
-else
-	chmod u+s ${sbindir}/pppd
-fi
-}
-- 
1.7.5.4



