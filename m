Return-Path: <ninad@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97089E80AB5
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:34:53 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web11.19086.1695825288930118270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=ReIf8rSz;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: ninad@linux.ibm.com)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38REC7A1011337;
	Wed, 27 Sep 2023 14:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bjXoAnvt7oKKWjqBW0dhzVOUr2db5XqB+NaIQ2hTQig=;
 b=ReIf8rSzco8BgqzqtlOVXQKAwmDnRKOOsVjj+CGd5/S2iQw1WhEh+MBLB7Ddv96C7PO1
 wIyJxkdaVjpsE7fmtZmdI4R8aBkHc8P7iawBe6UncRFXpTbbmdvlZvZuHMYMAC2A5DB6
 tCqC7C3AfrQZxMrVAFSbe4kITVjliB1HJ9OK1j3QtZJqpKFo0/UVBIrBANlqRB+QvOvi
 urJFJ2EKhLhSD0vewu1g4K4diOFzdFjnvXp5EE6bziq5+1Mq+1TF1eJar6Yu23S9NV53
 Z6wGXNOmElb+7U+Ym26FUZVnd0WsyKovZfEcFDCcx3gUxxYnm6DcfnUGt0mzYp4GL1jK cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcn771w53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 14:34:44 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38RECHQe012060;
	Wed, 27 Sep 2023 14:34:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcn771w4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 14:34:44 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38RC7sGa030736;
	Wed, 27 Sep 2023 14:34:43 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tacjk3ssw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 14:34:43 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38REYgXT6161094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 14:34:42 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F6A758050;
	Wed, 27 Sep 2023 14:34:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DFD458045;
	Wed, 27 Sep 2023 14:34:42 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Sep 2023 14:34:42 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openembedded-core@lists.openembedded.org, joel@jms.id.au
Cc: ninad@linux.ibm.com, geissonator@yahoo.com
Subject: [PATCH] kernel-fitImage: Strip path component from dtb
Date: Wed, 27 Sep 2023 09:34:22 -0500
Message-Id: <20230927143422.2042673-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l6fLxUUn9Br_e60Ra_U2qm8T8Qvv6BUR
X-Proofpoint-ORIG-GUID: 1_PaNDqURq0-dKvIKrLQWCIxiCPIQ2DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_08,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188329

Machines that have added subdirectires to the KERNEL_DEVICETREE
recently, such as arm32 boards that were moved under subdirectories in
Linux 6.5, will have that subdirectory in the node name of the FIT. This
breaks existing systems that select a configuration in u-boot by it's
name.

Strip off the directory component from the device tree to preserve
compatibility.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 13e8947f09..7e30a5d47e 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -599,6 +599,11 @@ fitimage_assemble() {
 				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
 
+		        # Strip off the path component from the filename
+			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
+			    DTB=`basename $DTB`
+			fi
+
 			# Set the default dtb image if it exists in the devicetree.
 			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
 				default_dtb_image=$(echo "$DTB" | tr '/' '_')
-- 
2.39.2


