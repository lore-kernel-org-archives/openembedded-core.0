Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBE3C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.7225.1750281671464121349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H2IGxoum;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IKV3pZ028698
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vygAld4ZBQs
	dQKRuo92zHi5eIEoQ3G0RQAYlYSWVipk=; b=H2IGxoum1DaNTGs/rzzT3ISMnyY
	XkBpba8HngVKNjuZ2U2x2hYn1p7KYYGhKHIj9t5FJudPcfg2AbXGBcMfpHpc/8Ru
	GOv6FTChfA68fIpAuYu4I2qO/jLCALUSLFCuEOxz0ZOW/UhSejZFo62zlUJ4nWTn
	JeJvmK4fMPlxahlsUYVifi58bmX1szzSpY5IgcKAeFIWICjis+G5ElAS8/9Gv5U0
	KS+w6785rHinvtZnaCoKeDT7NoGLBiuKhun6Mc2Irikll8ysq/cvPoPszpnCsj0s
	Zvp2YI2BMPisnitMpbPw1h5CDY4NM78EFOiXRrE9mh9+LWmx3L6NlYoUdlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mnkej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09bc05b77so22986085a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281669; x=1750886469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vygAld4ZBQsdQKRuo92zHi5eIEoQ3G0RQAYlYSWVipk=;
        b=bOUrtpGf9JEHzZ0M+y7168KY/weGMtRcR0nLCQDZc+4fjy2Bd3i6X2eh83TAxda8uz
         ALZAABJxR9NSWgI16Lv5K1lMZbMjPBL6TMZy6nirEAwqfAO8zWEo748vTJX/n9fBii3R
         XN+tKLY0yOf+6cJYSK1ekmOashn1hHFgL1wa7DYOuhPAEXIjHRvLMPgY+GwSe+pQM0ca
         6G7HScnNpotf+BCKakVlpioUI/IuioqU1AR1X++Ovhk0o3XzY/ZYYzCWPe+7OWJDrryP
         y6L98TtzdHplDqRTGIGW1iWQt6aqHFfOfT+qbt3k0qehMQhMlz3MIiBDo8jsReAzbN/p
         ExJw==
X-Gm-Message-State: AOJu0YwF8oJRvqEN8jvrKxx64PqctxvLr4zxIKFtNOjoko39hBFgRzAh
	jty9F2NV1HtIVo8q4s8XboAMOn42QMl4nf1xF5Q4994St2ZjK24KYhXODoUF6BZDxq5GzWhKz7m
	hA+/auYGZIHGhct27RUJUAnNtiuq+0OMTKxjKkN2wlzIFsRwGE3apOXC2VKr6swqhjevVNFRRkw
	R3d9JePWjLoYaz4zulCTQ2
X-Gm-Gg: ASbGnctRPYghvhxK95CZ9HQLFSIHdqdT7pZa0ByRjEhK9Dh+Z2ijS8yFD792yHBy0de
	155gOY4zG2LGyQ+lDGliJ1L0pJJta0dQUvYmFl9/MqkVCL25AjrUVcHY7X/aDtsVUoQrjR9n767
	UtGumGJcjT0bP84Afno8SUC+h9G0ZNglfwBvSW3TombEUfkO2rooG6iekP2iCVDjUkCs0wFJZvR
	dzrFP4Xqs0Iy6SZnsncwi2eKh2bSYh1wOyqyLIrRLBuJWC0f3Ex6B/AM9+LgodFUJ39JaGjfYsL
	yWoYXqqFva77gAxZId9Gvn+KZdP2ijUVfnQX0xXRDF6cYJC07Sq1uM6O0xzbBGYPA5LHMK69qRa
	9tR1OZHMXJBQeGK4au3oD0pDkLY6Sw28lseU=
X-Received: by 2002:a05:620a:2a0a:b0:7d0:97d6:e94b with SMTP id af79cd13be357-7d3c6ce1445mr2994286685a.31.1750281669421;
        Wed, 18 Jun 2025 14:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZjos1FsNBVPiI+6+7Twdvr8RbFhk86n6sbExG7IMAWaudOxggQpMa46+vC5EOrRUDyXXvWA==
X-Received: by 2002:a05:620a:2a0a:b0:7d0:97d6:e94b with SMTP id af79cd13be357-7d3c6ce1445mr2994282785a.31.1750281668910;
        Wed, 18 Jun 2025 14:21:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.21.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 4/8] qemux86-64: drop duplicates with default-providers.inc
Date: Thu, 19 Jun 2025 00:20:51 +0300
Message-Id: <20250618212055.1529969-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfX4aXYXSyCF7ak
 llbf0i/mdgeUrRyRgSUVwGECzRcCbhhAdKdj0sOAEyw3S7Sj+qAfi/yfLBDpCHXX55ZChPUp+7H
 gwiD5/1SNq/leA37tFlyYG5XdDcSTByDM2jvDy6XYd4+VPb924v0fE8QAhB1REzOD0bm9KWdkos
 3U0QC0ejbSz3OfdTw4vtABr/IX4Yz8tXXfvxNOghQciMJos7P5VycGWu2s/cZ1Vvi83yvV7pqnh
 UVR0IO793Jw+fl5ZCULVGwHGE+E8iM7iWT1VwimoaUA+ZFIgbI3GKRGCOUXw+2Oz26kF61z3VeE
 TWJWm3hgz/rdsQPX15JZRFIt5mRXlZtIHj/EfCUVPQ5Lx+1WrSTR19+onyquA+PyV1dLpz0DsCb
 LMQINuz6aEgLnpvuNXsfNqO4up6NPR+OHweVf7PT4D8F6wYaJeOs3GqtYt1Sdj+5Y0v7U6jC
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68532dc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=_kTybgIiMiGBH06O6-8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uQS2lNS-P9MlKTDtlxawLR_dG6rk6ZwW
X-Proofpoint-ORIG-GUID: uQS2lNS-P9MlKTDtlxawLR_dG6rk6ZwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219040

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/qemux86-64.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4a9c6d364bea..62108b703b69 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -2,12 +2,6 @@
 #@NAME: QEMU x86-64 machine
 #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/x86/tune-x86-64-v3.inc
-- 
2.39.5


