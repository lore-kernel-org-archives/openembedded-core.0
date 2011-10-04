Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBDE9-0007pA-JM
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:12:41 +0200
Received: from mail98-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 22:07:07 +0000
Received: from mail98-tx2 (localhost.localdomain [127.0.0.1])	by
	mail98-tx2-R.bigfish.com (Postfix) with ESMTP id 6BA7C530106	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:07:07 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail98-tx2 (localhost.localdomain [127.0.0.1]) by mail98-tx2
	(MessageSwitch) id 1317765942686346_8260;
	Tue,  4 Oct 2011 22:05:42 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.247])	by
	mail98-tx2.bigfish.com (Postfix) with ESMTP id C30D1100D4	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 22:03:09 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Tue, 4 Oct 2011 17:03:09 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p94M38JF010861	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 17:03:08 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2011 17:03:02 -0500
Message-ID: <1317765787-19127-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/6] Fix mdadm for powerpc64
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
X-List-Received-Date: Tue, 04 Oct 2011 22:12:41 -0000
Content-Type: text/plain

This fixes build failures from build warnings on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Replied to feedback on messsage about compilation errors seen.
Not sure why x86_64 is not seeing this currently

 meta/recipes-extended/mdadm/mdadm_3.2.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
index 5d29ae7..1c83f89 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
 
@@ -16,6 +16,7 @@ SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
 SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
 
 CFLAGS += "-fno-strict-aliasing"
+EXTRA_OEMAKE_append_powerpc64 = "CXFLAGS=-Wno-error=format"
 
 inherit autotools
 
-- 
1.7.6.1




