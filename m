Received: from exprod5og117.obsmtp.com ([64.18.0.149])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1UAkNq-0008QN-Pw
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 18:01:39 +0100
Received: from cinmlip11.e2k.ad.ge.com ([12.71.149.1]) (using TLSv1) by
	exprod5ob117.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUS44Grs9sTZ60dwPfNdEXxpjgqH6/8jZ@postini.com;
	Wed, 27 Feb 2013 08:45:16 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by cinmlip11.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	27 Feb 2013 07:58:59 -0500
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 27 Feb 2013 07:58:57 -0500
Received: from edna.edi.geip.ge.com (edna.edi.geip.ge.com [3.26.68.71])
	by selma.edi.geip.ge.com (Postfix) with ESMTP id D5A19E0DE8;
	Wed, 27 Feb 2013 12:58:56 +0000 (GMT)
From: Martin Donnelly <martin.donnelly@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 12:58:54 +0000
Message-Id: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 1/2] shadow: add build dependency on shadow-native
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
X-List-Received-Date: Wed, 27 Feb 2013 17:01:51 -0000

The postinst requires patched pwconv and grpconv from shadow-native,
without these the rootfs creation uses the host binaries and fails.

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 4a0dbd9..8226a6e 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -7,7 +7,8 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;beginline=8;endline=30;md5=d83888ea14ae61951982d77125947661"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
+           shadow-native"
 RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)} \
                   base-passwd"
 PR = "r13"
-- 
1.7.1



