Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E2AC7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:19:07 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web11.2415.1684549567463948344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 19:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=bNQMf5+r;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: stefanb@linux.ibm.com)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34K29RRu031097
	for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 02:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dw9DGHaMSRNjjrhHvdO09E3pzbMhsGFN4WuLvl9WmjY=;
 b=bNQMf5+ru7+XW8mdf7ju/t0a6SwjgHXnPodLheXadn7cteiPFaskjdMLO7bdmZhuebg5
 JeLVPxdocW1MW9GkBOzP/92rNKhS75xUX+AOYJrqRm3YU6DydELl8FeP1lcNhflsSCy3
 l617Y21wXsE4rRbGQ1861Qc/JU0qaXzkp+/3dOURCuQ05WvGfIfSCU2aRtijzgJhsIfL
 71oE56o1PYT2a+dwYX1G2MQ5uJ/e2Qz4OKAfVx/HcXUTtJdGQZUebip/q2QhmyMmMSX+
 0TQZhXzWHTmoOPyMOuNgOdhiWYPqqM3pGEweisrt9s6IowAl4kGENGI23ZZdlK55e7PW Qg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qpmn38vry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 02:26:06 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34K00Si1005262
	for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 02:26:06 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3qj266sxe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 02:26:05 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34K2Q4ux63897922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 20 May 2023 02:26:04 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D8535805D;
	Sat, 20 May 2023 02:26:04 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEAAD58055;
	Sat, 20 May 2023 02:26:03 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 20 May 2023 02:26:03 +0000 (GMT)
From: "Stefan Berger" <stefanb@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] attr: Package attr, getfattr, and setfattr into attr-tools
Date: Fri, 19 May 2023 22:25:53 -0400
Message-Id: <20230520022553.3768155-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M4Z97VpIHLcKToraa9vX8Tia8_hHqimN
X-Proofpoint-GUID: M4Z97VpIHLcKToraa9vX8Tia8_hHqimN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_18,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=614 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305200013
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181638

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 meta/recipes-support/attr/attr.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 8ba865a74a..2d2ff0912e 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -20,9 +20,10 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
 
 inherit ptest update-alternatives autotools gettext
 
-PACKAGES =+ "lib${BPN}"
+PACKAGES =+ "lib${BPN} ${BPN}-tools"
 
 FILES:lib${BPN} = "${libdir}/lib*${SOLIBS}"
+FILES:${BPN}-tools = "${bindir}/*attr*"
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = "setfattr"
-- 
2.34.1


