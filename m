Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F4FC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.38520.1744409375496295826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XdoLNERL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BCQP9Q006864
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6baqfH4hB2fsqNWTiO7enFJKMWOlC3MHwOiGmQHdXg=; b=XdoLNERLsYtV8c3e
	bAfB9xN7AzjIDLy7tJ759kcV55ZGcLCqlI0gRKURVcpBAf7EmfEWAbXB76xvSkLG
	75TRHxSHZ2MZ3lmkK2J3EUJ1tkoMZ6JawyR7JrZNNb1uiU3thH5frAMlnNmewEOB
	10BtdTEoDI5YO1lk+HsFCg1FKhyqEykSQfofd7pP8UZlLvl+Rxci92GMPzGYLUmB
	PA30XKGjbe64hN2ry5QQqGSNkhWUPC+8rBuLNID2q8YvTAod87F9Q3ZHZjKGOaok
	C2WgqfJxONZXM/ROZGeuLbDRT3XQXfDZsCJz4R9mJ5OsthAkw/rn97Tnzy5i/pJo
	4UU3tg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3mqfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so404079485a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409373; x=1745014173;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6baqfH4hB2fsqNWTiO7enFJKMWOlC3MHwOiGmQHdXg=;
        b=gEBdJnh3ibCWrk26/7XvkhbX6LgEKHLRwArsacVVmAPSmniznW82cH9BOqEfGgv3F8
         UwaWb1cApQ4U+StkvuGw8+cYjl+GkHzDWYfi2fRZIURsg35wd3REH2exVfKRtj6QY6Te
         faGgaE4oS7YtB77+KDIwelOwgoFoKu+cJ4hg2dgp2HyKeiUWGhfD9U+mC+hdmkCH7UvB
         52OUsY8SKo7JDKMYD/GjtPLPS2IGmeHLt249crBvGvn1vcNqvvAgOw9wEXgyaC+EigGQ
         +Qur2k7OwOmtMfn2e5lSGy2PdHHUBkXqqqYGp80oGhvXOTAK48t/m03j1kIl/j1sOLm1
         HYuQ==
X-Gm-Message-State: AOJu0Yyjj5q5IlbUYG5Y/SFJWQ2XGXr6RU7Ap34YnBxb99iO/FsVCGLc
	Maq5O3NKMMvCab5nZzWGZlfB+YXkUqWqQst7jDnpvDgOTJhovI9qNsF//4IVgixZ66ZgEAC+VkA
	CYNm9mbWZvISMCo+VPpBu4kZX+an4ScbGjYC45Sepjm1fHlVE1JphDVrRl1lrXIhfbvMnKf8+AX
	/e74TR8pKfIx0=
X-Gm-Gg: ASbGnct3r94JmunmSIkoemIWdmNQI/KQRDZmlYLU+pBRantbhBalB0oFyI1x73kgd8x
	+wF47crLdXpuaDGvoeD6idodvRu9c7jeEosCUpTw/QH6FYMaiz1qV2wuM2WRHw0f6qRfWO1+kGO
	Ug9nBUyDD8kzv5lX4cSOnSIkyYRWKA3qwYbTnMlnN0rI6cvQ8qTCs0Uwzn7ZAqHzjuQ8mdofjq/
	mUi3k6/w+EGK+5216jcTo2rGlUxhk5XJmlN9Gg1sptBicFWkqvKWewSGOWLxTWF7xZheHp7QaWF
	v55LN4xxzYU1PF5G8GLuPWub0t3yMll/R+d/98qx28qZgZClI48azp3XVzs4s8npdIRSn+fEy/f
	GEiGBcwJCeuNXuo2sk4xerr8v
X-Received: by 2002:a05:620a:414b:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c7a76b96dbmr1167922885a.22.1744409373477;
        Fri, 11 Apr 2025 15:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+BRpwOhFuw/D/is2x7lGbRZukL5EWLsDL4wUYArHnUBJwyX8WUsiDwe7/F+peebkvNe0+pA==
X-Received: by 2002:a05:620a:414b:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c7a76b96dbmr1167920385a.22.1744409373112;
        Fri, 11 Apr 2025 15:09:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:16 +0300
Subject: [PATCH 7/7] mesa: hanlde svga Gallium driver through PACKAGECONFIG
 too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-7-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=trwvbbQ/zgt3gjU1gEPIHD3rgn9NoNArbThYBv8PNoI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMHsbhylXkTjEvELYfJRjVGCESPMY0q2G/Y/
 4vTbFlOex6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBwAKCRCLPIo+Aiko
 1a8TB/9zF8LWO/MPF/etbdtm/q0HTKrW5twhkxhUeEkMZLunnvf4OZsC0rLYHrnX/fl6tX+JGgI
 6mAT4HxxjtNYAZM8RRq2s3vzJgwHBO5mFhHc0urHfz1AD8StcLKus56jN8RzH9xX3tOdASO4qXq
 zizPTwNNuV0ySPrFC0DmrbTUj/fy+svbHHd9Ts5ZZ2fQ1KUhi7Mnr+DwLyiuRFN51iN6WyddfI4
 I2/3yOvQXVrgoaFyGzyPlLH1FP59HIicSAhaHyJEjkER7kEjxqmULWaFNJoWuDhAmWa/3vEnqt4
 FyiUrvGfi9lp9RjFNkSBXOsUgcbw8Wh/bhM9S29gxnINEvNQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f9931e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=OHXMhqJX0b9lEWDjoBoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wIEPuVnj5uUvqxU7ZG2bmKnyvPEdFQ2S
X-Proofpoint-ORIG-GUID: wIEPuVnj5uUvqxU7ZG2bmKnyvPEdFQ2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=769 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214769

For the sake of uniformity add the svga PACKAGECONFIG and use it to
guard inclusion of the svga Gallium driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8ab9af9887ef567925563247b88d96aca3fcfb1c..c191e68b5841118d94574c243b74561484f39370 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -88,10 +88,10 @@ PACKAGECONFIG = " \
 # skip all Rust dependencies if we are not building OpenCL"
 INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd"
+PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd svga"
+PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd svga"
+PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd svga"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd svga"
 
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
@@ -173,13 +173,11 @@ GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',radeon
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 # llvmpipe crashes on x32
 GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
-GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}"
-GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
-GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
-# i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
+GALLIUMDRIVERS_SVGA = "${@bb.utils.contains('PACKAGECONFIG', 'svga', ',svga', '', d)}"
+GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
 
 PACKAGECONFIG[amd] = ""
+PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[virgl] = ""
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"

-- 
2.39.5


