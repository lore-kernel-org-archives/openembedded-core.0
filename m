Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B937CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:12:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.2131.1759162366975180843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 09:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LXyoYpxl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9xY2R012940
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SNIQZRpf9bWTbjlsK1P+Oi
	OYSKz/q66EOk+wJ7kLGww=; b=LXyoYpxlYjprkfAXELb+UrqkZumwJTif41fMC0
	swh+BusWkdajOolyTs+nS+lAVTxrh6HOWIoyoabRmjYBM+wFekLoLjwhiOYIjLxK
	FRCx/YvEI+gNzyW3Y3H04ekWcDgeoVc5jrZkabOAJUkTvcFWW4+MXu30mGW6QsF+
	ELpbzR7e0mIs42jPixFs4COU2Um1jT/7uEzafZvbJRaMsBMMy2NWV98SVRs4EeZW
	uMDpaj5QamOEcPT37SOu54LPT82fd9Sjty0Lox5uE96V3MacmsGLpJPycyMcT7vQ
	bz1Uo55jyq0u68u/5al82NONYLsTV8v9M9saZlgiM+SVfAvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqwx57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:12:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58TGCj3L004345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:12:45 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 29 Sep 2025 09:12:44 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v3 0/1] Add support for custom compatible string via optional parameter
Date: Mon, 29 Sep 2025 21:42:24 +0530
Message-ID: <20250929161225.1290751-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1xueoGsLjTItntnVnqlqKX8S71PFy2QN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX5uFfmDus3h+p
 juDaTXHl/QxYGbQeLozmg8tFoqKm7apEUIS+Ezsy8pNk5Z+PD87uXTDp8XlDbNiGsWSl5y25MzX
 b1uEfdm6L8IkkngOL7SuxUTimmXhs3OwxSPNr8sP4pfGCsTsRlOotCawSVx8oWKY7jgCskOVq8M
 po6vBuMnjuL9M/8opvy6+RtmSw9S62036S/f1vrxmqoHbNt6ZXBd0AwKQPT/SikwzWelDBJwR5y
 mfvNgPym2xGRbxaxzH5PXtF/o4qTCMPv8pSwf+9dV/kZZ+QsOiCj1sN+C73OqYBKhIOsPKuXK+K
 z8KB1GCXJoPK9C6J6NsmCN92ijcfHKYRsPc8LdJt/zdkDl471McQeTmSM/WYOG7MEyhuLTDRIIn
 sk++auQUoD4zFbfsHGyC2M0nz89H9A==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68daaffe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=jPrQqdRHPBW417H5_hAA:9
X-Proofpoint-ORIG-GUID: 1xueoGsLjTItntnVnqlqKX8S71PFy2QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_05,2025-09-29_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224153

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
FIT_DTB_COMPATIBLE_OVERRIDE:<dtb-filename.dtb> = "custom-compatible-string"

This method avoids using custom ITS files, keeps the build process
consistent, and makes it easy to understand and track changes.

Kavinaya S (1):
  fitimage: Add support for custom compatible string via optional
    parameter

 meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
 meta/conf/image-fitimage.conf                | 6 ++++++
 meta/lib/oe/fitimage.py                      | 9 ++++++---
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.34.1


