Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4MTD-0002BR-0h
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 03:44:27 +0200
Received: by pbcwy7 with SMTP id wy7so361398pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 18:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=OkqLEJLZtlYO+4xxqzWyGn6uv8a/tejWOeABzoVD4gs=;
	b=rPDJyIzfejpqllWLbHTF4aSkcSz+IT+8JphBqL8x+P5F5JspfBpBwC3zm911hpXznB
	kAHDGE1iIs1Gjsmtz7IY5g8llw+3dCe4+b14k/UU8F7G4/K6Fo4MlwX4d7NJwAbgsOu5
	WWEm6EZlVGqDdZTODuE2gPi7xWt0POFKsyByP4BxBfKMMt0y0D2jXKIq5+lH2UyP47jC
	aa5btclvx6VObhn7FrU+6m0zp8ZPdzusEe2RYQ69rZdug1Y0ppjNFxVY128AnCfU6fAd
	O1EImFIKFEmI8u4ecbvnhAXskTnwgpX+NSoFVHPTnrIOhLBd8TeMZkz3LFEFasoglcXr
	23Rw==
Received: by 10.68.239.103 with SMTP id vr7mr602258pbc.0.1345685540640;
	Wed, 22 Aug 2012 18:32:20 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pj8sm4817634pbb.60.2012.08.22.18.32.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 18:32:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 18:31:46 -0700
Message-Id: <1345685506-27178-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] iputils: Fix postinst to run on cross rootfs generation
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
X-List-Received-Date: Thu, 23 Aug 2012 01:44:27 -0000

rpm shows error messages like /bin/traceroute6 not found
when building cross rootfs

Yocto # 2894

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20101006.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index 62e2b5e..856bde4 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -59,15 +59,15 @@ ALTERNATIVE_${PN}-ping6 = "ping6"
 ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
 
 pkg_postinst_${PN}-ping () {
-       chmod 4555 ${base_bindir}/ping
+       chmod 4555 $D${base_bindir}/ping
 }
 
 pkg_postinst_${PN}-ping6 () {
-       chmod 4555 ${base_bindir}/ping6
+       chmod 4555 $D${base_bindir}/ping6
 }
 
 pkg_postinst_${PN}-traceroute6 () {
-	chmod 4555 ${base_bindir}/traceroute6
+	chmod 4555 $D${base_bindir}/traceroute6
 }
 
 PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
-- 
1.7.9.5



