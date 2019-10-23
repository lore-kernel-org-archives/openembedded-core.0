Return-Path: <prvs=192f23395=Richard.Leitner@skidata.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Oct 2019 06:16:13 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 908157F78F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1571811375; x=1603347375;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=harTTLfnDVmCfHTja4jZ02GTUDZz5FQB4FUih9OtEvo=;
	b=JAUdugUbuxIw9Ves2al/2W735Dh8a9cDjhOpnmqVxKOedJw2Io7mvhBY
	1gAEZg88h+TswRvG4IhNUGwtuxTH83rBQvPOAZkPddkcejm/ZGhV2EQ+q
	LWJxl4OZmET1XNeuYdmkOKkssmJImB14LgxUpffThM7RRVxdeqK3dtqbz
	6CowF76zaQhnDlhUhL/dbPDZuIlM20nqz+41p0SiOOgELtJYfbxhqjwsn
	ZOeyV6VTvCvmwwNb/ijJEz3S0ZWtS03mCg0r5cfKbFytbhibnC+l/ouRt
	NNkO6PwFIBhpI8pfFmNyXMIU77ufLarKzt+GHJaemIjsfZ5DI7FBkKM1q A==;
IronPort-SDR: b4sNqrfAxEh86cSXmfgGHikkmr8q7F+OnyNDMNJuEQaQLsSpfamXJouYze1O1mdz53/bWdY1vO
	Cha4lBT0fc2mZWuS0VIaTyfPJkBxfh2KmaovkYWFRVySPUCGPCVsfspbRgPo6yE12PozAb3N7F
	RzGVe5wp8rYHuCKd8X2prikFMZq3UZ7kCrJAtktGspG506DmmV9EBRmtaScd2CPOr1q13xD3Bc
	CtO9PUjsb1EWurIqQ/o560LtTkj8fSWA+/bflR8e8qeM/f9ogjEY0FI8ZVdfpfO+gsoYOJkMzP
	jXg=
X-IronPort-AV: E=Sophos;i="5.68,219,1569276000"; d="scan'208";a="20434964"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2019 08:08:49 +0200
Message-ID: <20191023060849.7428-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [PATCH] kernel-fitimage: introduce FIT_SIGN_ALG
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
X-List-Received-Date: Wed, 23 Oct 2019 06:16:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

make fitImage configuration signature algorithm selectable with
FIT_SIGN_ALG.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 1bcb09c598..6cd1b76fde 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -53,6 +53,9 @@ UBOOT_MKIMAGE_DTCOPTS ??= ""
 # fitImage Hash Algo
 FIT_HASH_ALG ?= "sha256"
 
+# fitImage Signature Algo
+FIT_SIGN_ALG ?= "rsa2048"
+
 #
 # Emit the fitImage ITS header
 #
@@ -246,6 +249,7 @@ EOF
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
+	conf_sign_algo="${FIT_SIGN_ALG}"
 	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -327,7 +331,7 @@ EOF
 
 		cat << EOF >> ${1}
                         signature@1 {
-                                algo = "${conf_csum},rsa2048";
+                                algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
                         };
-- 
2.21.0


