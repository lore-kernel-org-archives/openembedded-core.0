Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4361EC4167E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:18 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.1212.1649196225043975572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 15:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=b4V8aL5t;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=10940439f0=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 235KA2Mt025405
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Apr 2022 17:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=PPS11062020;
 bh=8rCvhqtEml1y36W0DaNJa8x4ZztwEUiH5rSB1mSyjYk=;
 b=b4V8aL5tnwVeEHnRIJhr1jiJpjdOmfe7WWTXd31JPzojpysdqAfwwslpgl6X9vR3v74W
 NGclOuIsf4f7kgUO8odFe8YXuAMi7/CtD0bH5kXM/9DaPE61p6Su2uzDoYI5Fv486eFL
 tVFiuOFzX3bwr/O+i8ijIc4AYyAfz4DFpq9YZHObQrFCuo80QeYbxijKZ2RQi/XnWc55
 fA86TWJIFeQXzEEVpolFMMqhN/8EJ62mhHeslOZq/8xl7uMOyaOhFGpsIIFwnz9R+WJV
 nkBysxibSI2nWsvVHX85/lth+//qPDiNDtr+CMRFlWDChakUZLgqxbSMOpSFZONoQn9c yg==
Received: from ni.com ([130.164.80.23])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3f6jjd7w83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 17:03:43 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
 (us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 235M3gV5004647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Apr 2022 17:03:42 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 5 Apr 2022 17:03:42 -0500
Received: from cvadrevu-linux.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1497.28 via Frontend Transport; Tue, 5 Apr 2022 17:03:42 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [PATCH] pseudo: Update to latest to fix link handling
Date: Tue, 5 Apr 2022 17:03:28 -0500
Message-ID: <20220405220328.4040-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: GUoczLTCCaV5BgBwOVsIQNAqp8wmWgro
X-Proofpoint-ORIG-GUID: GUoczLTCCaV5BgBwOVsIQNAqp8wmWgro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-05_08,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164053

Update to latest version of pseudo which includes a fix to handle
absolute links correctly. This fixes ldconfig failures in OE builds
when rootfs contains absolute links.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d20136aef9..e7ef6a730c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "df1d1321fb093283485c387e3c933d2d264e509c"
+SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.1


