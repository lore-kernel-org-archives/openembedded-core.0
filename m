Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B649BCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 14:47:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.55817.1759157262876199251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 07:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HVOY9lQb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TAKKwf021204
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1FulzoaGIw1UsQuJyFf8Cs
	/qXmyOQrPreGwIIIyMZ4M=; b=HVOY9lQbBWTgARrSV2UxoGxah7bgHMyc5UIfb3
	GH6N2loR03tDlLfjvHbZXKuk/BPaMpIfT6AAdVJeCfhgWa1IGjM+4lnsahP1miH6
	H3lZgjFtq6ITzmGmnHMP7iSaSaPkffNkwPJeFtFv1he/3ZSpc7uz2xrg9WI7TNZj
	emd7bcjB1n8Q2mo37dEVWs0KEuGtKOFPGv2ShaTKakqdL+285sCFfIKwS6xBGCIV
	omj3KLRhTYIuugZw22b8McJGXEERYei4EZq1RB6EaGvP4GIKNmEASEwKAQ849hKh
	ynWlhL8H5t5y0CJJzC3maU5saQuW3vJP0J90ZdC5lKQcYs/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5wnmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58TElebb007330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:40 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 29 Sep 2025 07:47:39 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v2 0/1] Add support for custom compatible string via optional parameter
Date: Mon, 29 Sep 2025 20:17:20 +0530
Message-ID: <20250929144721.1001156-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68da9c0d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=W_rC6kvHAqJi0TaMlnUA:9
X-Proofpoint-GUID: n3NQUXKK39FFJvr3LJvaIvqBi2fzpys3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXyEe2srqQV3vG
 PkhkDpG9HKKh01dwkuiOg0QdjmP+F1WjWXts1XuCbk1SVCP0FkbFJyXe44UY9yb+cBd5HBRdZl8
 wMJuYIfOpi24EYkLFeNkMSgvOJExLUiJp5jHPV9BVmMVcC38ShshBL/EyoYGt8y5ymrNUzUmVyP
 ctDPlilQy9Ui71ItJdwDiknYlKCNQQsM31ylyZBa+/JnnZsSgCDuDt5/XlVl5xyG5r/C+4D2gde
 rrsjSWc5mZyGogLCHFNyj/XRlIeMQOvtt1WK6ixrIqxvDY/zEhlF+F7x9Kf6MIKrflIdOuF6g5z
 UHAKN869a5V881oMKp5xGg6ZIlv9wv9zP9iGJ5PodcJsYuwuwGcG8Ws5gX7hG670f/sJHkq6Cu/
 gEWEYPZJUl57w7pLP1UT5w2Fnw1zKg==
X-Proofpoint-ORIG-GUID: n3NQUXKK39FFJvr3LJvaIvqBi2fzpys3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 14:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224145

This update adds flexibility to FIT image generation by introducing 
an optional mechanism to override the DTB compatible string. 
Instead of always extracting the value from the DTB, the generator 
can now use a custom string defined in build metadata. This is 
particularly useful when the FIT configuration requires a different 
compatible value than what is embedded in the DTB.

Key changes:
Adds a custom_compatible parameter to fitimage_emit_section_dtb().
Preserves existing behavior when no override is specified.

Usage:
To override the default behavior, define in machine configuration 
or local.conf:
COMPATIBLE:<dtb-filename.dtb> = "custom-compatible-string"

This method avoids using custom ITS files, keeps the build process 
consistent, and makes it easy to understand and track changes.

Kavinaya S (1):
  fitimage: Add support for custom compatible string via optional
    parameter

 meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
 meta/conf/image-fitimage.conf                |  6 ++++++
 meta/lib/oe/fitimage.py                      | 12 ++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.34.1


