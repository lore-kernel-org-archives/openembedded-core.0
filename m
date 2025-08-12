Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8964ECA0EE9
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 19:05:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.70251.1754993243383523433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 03:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mkm4xS0e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5jXPL023153
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fe6BYyIQap8g3Tnjo96zaW
	ZiIyoTPSqZ1gil/r3QhPQ=; b=mkm4xS0e6tSBgRGqHkhvEk70R+Pls0wqIh8E+4
	+iUbVibfWYxhQMcNTKmg5ZNwy3OwjlejSSsLnLu1ss+qUHM1ickulw4XrktZD8Ls
	jh/HOS4+wOewOuyCW3TNgWdxFcQsSAQA/5+3cLwQuPEYnmJsxN8vpbsftlqyGeKg
	ImAsww+q4bZzDV6mmMIbu7+823lUKgD+lNqwCLfmr+HoqLDgw9A/cRh1yXd9tjzn
	EXvg5gaJXjc19BjoM0lzf9kZo4ceFMYmGpyL7MXv+8Ag/8LZIWZKQ01tRik+lX0y
	Q4U9sfphnT9ChYMB8BZQGpcRSF4b0Zja7eKZiiFF7B33MpSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bj2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:15:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C9FE9X027718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:15:14 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 02:15:12 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [meta][PATCH 0/1] kernel-fit-image: support UKI boot with independent DTB handling
Date: Tue, 12 Aug 2025 14:44:52 +0530
Message-ID: <20250812091453.1760880-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1c35JBoQTZhWWWoG9LDjAbfasVjvWxXo
X-Proofpoint-ORIG-GUID: 1c35JBoQTZhWWWoG9LDjAbfasVjvWxXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX4TrBJXAA724u
 tBbiTDok1dWUNr3g/LOb9irXUIQPWZZ6+T5M5dVuuf4X6Fhzcwi3fUQFh+aTaKD4z4I39V6YRTJ
 IZuz86WTMuNGdQYz9C/oXY1iAqDYtBGk14v0MflhfNTRH1bRd05q8WR7lHE2b7V35rIgskngf5x
 WuU61JkrgNVKMKerXXZA4BUPcZABjbh6niCp3iQdg679Uqo4w9fQgUMqQioDHHaHBViI73BL3po
 MHNgPsDSABqhyZWKqb0V2iwjMFZNxkyqYScTNkjCJqJF3iiXK/aB6bs2Iwj4V54Mszyu3CHU+SV
 Bpv5Tz2JAOTTxIG2sXLqXAr0YjgFSi0k37rh2aOg68ONBuuD248ycxgincYBV51E8fv9/MRdEDd
 Ap3TS3md
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689b062a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=mPbh-xJCAGMaXFByQTkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 19:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221867

This change is intended for the meta layer.

It enhances support for systemd-boot when used with a Unified 
Kernel Image (UKI), which includes the kernel and initramfs. 
This change is driven by our requirement to handle firmware 
artifacts (specifically DTBs) independently of the HLOS.

We generate a separate FIT image containing only DTBs, which is 
then packed as a VFAT image (dtb.bin) and used during boot. This 
aligns with a multi-DTB setup, where the appropriate DTB is 
selected dynamically at boot time based on the platform.

Kavinaya S (1):
  kernel-fit-image: skip kernel section if linux.bin is missing

 meta/classes-recipe/kernel-fit-image.bbclass | 22 ++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.34.1


