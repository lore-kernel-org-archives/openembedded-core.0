Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F57C4708E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web12.11062.1649262744463262387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 09:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=113h7Hij;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=10957865b5=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 236E1EOh025405;
	Wed, 6 Apr 2022 11:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=PPS11062020;
 bh=3IpPvPMydWQnbAS6ugIxyWBvpBBrlqNicXFOsestasM=;
 b=113h7Hij3OCZb3YA6IOeOCLzK5BDEjLPlNi8dnK3CBBLofWLIub6k9q5zgkYtz87Anku
 0TNw35bsii3ciRVJ4A2V9BkRaKEjQEXpL2woCp9ve9KJrcBBIpghbBINuPeGxXZ3gpXW
 ASZTmvzaEQsp+TMYOMo+Umtwy8wT8dsqjvQbt5ZaFFm+MH+fkSmWtRUq91icDFQPBy05
 XNheuAgH5zM4PsnWOocL3sCtUn/ZKq5DvdU4MEqjPdYykjKpUgRudsnI0MUwoHwxsa61
 4n/9V5rkJN3m2tvr6K78DAFC0Iyzm0Pg5+jox2ylp+7woV4OvQrGwrvMeB5lyoL3KigQ PQ==
Received: from ni.com ([130.164.80.23])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3f6jjd9syu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Apr 2022 11:32:17 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
 (us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 236GWGTp001381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 6 Apr 2022 11:32:16 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 6 Apr 2022 11:32:15 -0500
Received: from cvadrevu-linux.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1497.28 via Frontend Transport; Wed, 6 Apr 2022 11:32:15 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anuj.mittal@intel.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] pseudo: Fix handling of absolute links
Date: Wed, 6 Apr 2022 11:31:10 -0500
Message-ID: <20220406163110.2895-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: uzWZOUaMm91ws0r3c7eaS9eroHKFp1qB
X-Proofpoint-ORIG-GUID: uzWZOUaMm91ws0r3c7eaS9eroHKFp1qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_09,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164090

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Update to a version of pseudo which has a fix for absolute links,
evaluating them from the chroot path.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33147b89bc3c9e9bdd53a942a5551d8a1d06130c)
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1a5d230c69..b5da3f0e29 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "d34f2f6cedccf8488730001bcbde6bb7499f8814"
+SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.1


