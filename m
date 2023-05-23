Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D62C7EE2D
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:19:07 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web10.24953.1684852937274331422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 07:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=BdYPHMMZ;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: stefanb@linux.ibm.com)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NEV0iD016449
	for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 14:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dw9DGHaMSRNjjrhHvdO09E3pzbMhsGFN4WuLvl9WmjY=;
 b=BdYPHMMZSiliQy8+2IrIywMdhrtrXC3RNwBdhjqV/RYSya6ZdD/VX+DyTbfHGoE02BV/
 LPH5r+bKAMBFScxF1+DncBoyWRPL5NHHlm4K3P1QiZS58cjG96NAwTw+qkhT8rFlAxIc
 kAAC43eIA2nu7Xd1HTbs/qwHhcqk6FNKtpOPiWP9J9zNFOQG0kCaZ/f8G/ex+zmSV6gn
 hC5O7AUO6jhcSnTe/c3kkQ9qeribMr6r6uxniPhx8vfBfof9SDh3k64VxZLL0MvvN1h6
 JBTwImwCaFc3mV9LXnF0VTWDXwx6C4t1NJmgNzl6rYFtFDmtrls40S+3EAsLmVhxDDHq Aw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qryan0d09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 14:42:16 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34NEKhWs031369
	for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 14:42:15 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qppdpkeck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 14:42:15 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34NEgDPq64028996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 14:42:13 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7460758055;
	Tue, 23 May 2023 14:42:13 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3280058043;
	Tue, 23 May 2023 14:42:13 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 May 2023 14:42:13 +0000 (GMT)
From: "Stefan Berger" <stefanb@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] attr: Package attr, getfattr, and setfattr into attr-tools
Date: Tue, 23 May 2023 10:42:06 -0400
Message-Id: <20230523144206.3878741-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: agaGIyy9ntQABktDAL-xLrK9gZMNa8Lr
X-Proofpoint-GUID: agaGIyy9ntQABktDAL-xLrK9gZMNa8Lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_10,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=613 clxscore=1015 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230114
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181639

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


