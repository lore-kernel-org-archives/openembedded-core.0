Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D84CA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 14:29:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.18815.1757070135159272242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 04:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oVQisYHg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858hG8A015017
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 11:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aGA5VIbIbfH/e7OJWjbCDF
	3jO0j6GWEyZSxEGW6CvjQ=; b=oVQisYHgDTTzqb/v7bsILJDFRkODH6RH+nUYQY
	6zDx3neAnMGmW+kM/ZJFSFQx+s2PnqRuJhk2xBhzeu4p1gyhpnR2Pz8oi4SDelHF
	exaPKybeUZ+AYGtmC9b8MeFeDon4UbOZgbA7t+Te0nqjOOE6UiGSXgcqldsVIuBv
	F5Pf2ht6xXyAfgj4QbhQ+iDH76az3tzZPayYeAzJa4W3zJB5bAYjtgCYBwOkA08S
	8jAV0mEygQVpOb7Mf2HREW0FRJtGqHhbpC5iIGCq3lkmZCqgly39uOuUgwmI5MuF
	Ext7k2eDRhXc/cSq2BCbvgzHCo06/ud99cw+kFdj+VVKJXBw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpk11g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:02:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 585B2DMH024640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 11:02:13 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 5 Sep 2025 04:02:11 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v3 0/2] kernel-fit-image: support UKI boot with independent DTB handling
Date: Fri, 5 Sep 2025 16:31:50 +0530
Message-ID: <20250905110152.552108-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z9gzaqlcTyErTGAA7Jce7oCDWSorZ6Xx
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bac336 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=mPbh-xJCAGMaXFByQTkA:9
X-Proofpoint-ORIG-GUID: z9gzaqlcTyErTGAA7Jce7oCDWSorZ6Xx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX7xInRurIO4pf
 MYMWKMwgAkcgt3TK3DILgzKTFJm/+6y4e0nZkGoaYKbchiy0DLmDwO+xcjk0UNJpTbxcUU9Em4b
 0STVtcUJh6YFNHWehTKqEq9ngUH9gIaW5QH47klxmIhV1VqPAqJXyRB3bQghqxq8t+f2F6OKff5
 N57VTZd4+xKA5NPghdns+AF3Mr9rFKmXtH9B39G1Bk5n8kpZeA0V2G4eXA3lM71R3xiv1lLQT7+
 bNNDhqhdpVCgQn8BK8GnxW+2ETKymB0wpqbhzxEr9Q23yCM6bMiQBAUGwJPj3Z35U5snI6tjDTX
 v/wK+H8T1DzXb7Qrql8IqwZoPkqAo5EVtIkIGXpaJadHtvIs66xnKxm1xHDZHSE3AIbo5K5TS6e
 OlB0Bh6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 14:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223005

This change is intended for the meta layer.

It enhances support for systemd-boot when used with a Unified 
Kernel Image (UKI), which includes the kernel and initramfs. 
This change is driven by our requirement to handle firmware 
artifacts (specifically DTBs) independently of the HLOS.

We generate a separate FIT image containing only DTBs, which is 
then packed as a VFAT image (dtb.bin) and used during boot. This 
aligns with a multi-DTB setup, where the appropriate DTB is 
selected dynamically at boot time based on the platform

Kavinaya S (2):
  kernel-fit-image: control kernel section with FIT_LINUX_BIN
  image-fitimage: add FIT_LINUX_BIN variable

 meta/classes-recipe/kernel-fit-image.bbclass | 14 ++++++++------
 meta/conf/image-fitimage.conf                |  7 +++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.34.1


