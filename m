Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EAD607C3C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 07:46:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Dm6C20lSz4K;
	Wed,  6 Mar 2019 08:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551858371;
	bh=zcc9RrryED/FTLiLeaKQvM6LhwkWHL9SxIaa5/rQfPE=;
	h=From:To:Cc:Subject:Date:From;
	b=C83GRoiC/uXeiMRAoOhpswUlmFq4McsA0srmj0SgPz2EAwzHSXpTNvpsJF+cyYkUf
	qD392ZMf+mgE9Obw/sjEfgR+cE6HbnMIcJ74pLPWuugOwB2C9lZfcp2DU+S6PhM1II
	9Hv7/yKdhr4l95F1aKK2Inij45YMKwlI1QY9+ZCXeelfkg8IgVNWRCBuEcgduMiGrR
	WkgiCIJ7+JMHqEZCW96eaUxxaPI0JpavXaBSuU5yofM94SSdjnP6IefTO6x1/5RKtM
	6+ApIHCFnr/OoakYaK63THqTxkbq88S6fkTodR9SA+uurKu0OEr8KnPAR2DdgMPpx4
	YZ8DlZbjJC3eIvEYaumhJ8rlFmSZJEwUU+dDBxrd7CvF2SAwBNBAtofl5kY7lVwVkO
	OdpsxVuOW0x6WjoaYpigk58G4Rwb1Ho+RXIOiRxIgC2d3+/+omATryTr6FC57dfiH9
	a9Y9bj98ttE4szK8Ufr0apAGCADZ/NoWGIbg7WYVg5mq/GIyFVb6pWjd2HUpiOjait
	lSc4v/VbWu349OIWlaRdNLk8k/l9k6DgC4crQTxxOltsUZmuHB2Ml7d3XUjlkNZRJ8
	ro9m+8WFYP8oFmZ0e+5xametTXu7GcVdrJIF++sWkA/gaMPAWCaLqVw0fn8JvFMGIJ
	Gq/XFZmoShmjOzmEKX7PRdk0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:46:10 +0200
Message-Id: <20190306074610.11691-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH] wpa-supplicant: Remove no longer required hack for libnl
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
X-List-Received-Date: Wed, 06 Mar 2019 07:46:11 -0000

Upstream already fixed this properly by using pkg-config.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
index 6fc5cf5db7..fe5fa2b82e 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
@@ -42,8 +42,6 @@ CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
 	install -m 0755 ${WORKDIR}/defconfig wpa_supplicant/.config
-	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
-	echo "DRV_CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
 	
 	if echo "${PACKAGECONFIG}" | grep -qw "openssl"; then
         	ssl=openssl
-- 
2.17.1


