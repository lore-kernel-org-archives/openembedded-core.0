Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E678C369A4
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25732.1744253702599633605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VSjW46Y3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIqDJ032322
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zt7selowXioo6Gi5XyyneJokuRQ5jdUvxtb+yM5J/aw=; b=VSjW46Y351RhW0SN
	lvYsJjUY9BvDExljFH0lYfzqKR9EmNKM3vlTYQI2peUc2DX2ruduN93PdR6I9wxp
	FTLLt/3B6Qo0WxD/hmzLEhMQT1rs59ikhmMzce3qUUPFyzDNYC9Rzyc6Ln8UffqW
	V+qzw7p6PNF5Lmt3U0u9P21oQ6wGrvIO02k9nZq4mK2EBZZ0L7dLHQsfXQr888ai
	6z93lXXQQd1z/HeswKLvwQbGAgzfbg+7Xknq654J/cHELG001H2tolmvHrRrKrd0
	6Mm9lto5UfUDkbT4ifD3EG9bjWlIPoApaVcMkQlag+XM3sC9o5DDyOyFlYsts4Vp
	srw+sQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedff8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c089909aso4871086d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253700; x=1744858500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt7selowXioo6Gi5XyyneJokuRQ5jdUvxtb+yM5J/aw=;
        b=A7wQvm9EydhM4kPXxtwCSU9I+6tocuWdFynoVmE7N1NyEPXq6UYvXyT9Dka7etBJGe
         El1SCF9yFbLP+w8RjwZNo5NPOBq15I3mgXQHb1Pt9G9o71VEDSXqbNXD3VaYxySK8FKi
         O+kX8l1ZdXGF0GvJUCGFVMjHKqP5Rblg+ehYGomf7HElOUVXDIeKD/XjC2MvOlcHABqJ
         Ed5yw0duy2cpqP8FaZbxyHZ4XvnpKMN1jI5Fo6b1NNYSl89jqfPeoC1Yy9eLF7Q8QD99
         gzBAFKR8E7I4c7YR615gXhTTOpWdeNlNHoZAudIQMeKW0fmcqTQvMgpYLU0x+Eg9cjq9
         390Q==
X-Gm-Message-State: AOJu0YxUOBqa0Y7aDr+J7SKEWz53qYB19fizZP87OxM+vcYJtYEu+Zu/
	cNS2gqNbnSXbp11umix85OZVZy/kR+ATArB5oVkl8PdpLnebfwqGpQHDRzGJk/mTMKYzycyDHM/
	LEhES8MCtZo+fpXgPt5f+/zhQvPsSGD5UOLAt4aC9ua4/kQRTa+NXQyG2Gt/8anvAIT3Y7PHoz2
	7G/iwrA/TNKXE=
X-Gm-Gg: ASbGncsitNNJUGWjcB6kIqtpJmgAbW4EkcdKJp97d8CfUxfrFH1mv67jPWYWG55chny
	katP4N8rHJyh5tyj/+lEaFP7GVUmZhI7QDsYNeRlHLbxg1XrT8TO6aTYboyE9kvgnYwX/Pi8mEv
	770WKM1Tz9t3aX1xboE+dnizgzsW0zOgoOc3FxTfki8+De9oEbAI6GUGs4Mar3tee5ML8Q3fr5W
	K5KPQyD9TgIVTHV2gpSP74Oa4WsfA6h2hWjhqaf164KngH7ViSUDfEmjrmAJ959WQo+abRGcu9p
	p5TReyfmkN+VAUYCbuWCY/RPXroLKI9O13GEhbETEew6F/P29xMpYPQTB5mdYg38GYKRX7LsPyG
	uFL/Q9g969ZzX3hJbdyN1c6hG
X-Received: by 2002:a05:620a:d93:b0:7c7:a543:dcfd with SMTP id af79cd13be357-7c7a7688832mr189772085a.25.1744253700541;
        Wed, 09 Apr 2025 19:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZjsjkHW3mvH5copQxNyzIIV/i3ZRfaBq6+ZcHF55H4s9PDC1wUJTKZ7qUoGeQbtGta2mntg==
X-Received: by 2002:a05:620a:d93:b0:7c7:a543:dcfd with SMTP id af79cd13be357-7c7a7688832mr189770885a.25.1744253700230;
        Wed, 09 Apr 2025 19:55:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:54:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:44 +0300
Subject: [PATCH v7 05/12] llvm: also use llvm-config wrapper for nativesdk
 recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-5-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4cayM6tuJjZmEh9NCkIWzIAK74OirFasFDapnDJu3oQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/p3o48PixS2/FMPsmYIk3BUuF525FqI12SJGfztFjwc4
 T6Z3vc7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCR2jAOhvU//zL7nb12xrvi
 14RFD0UaD0e0psi6+LjLiPsGG4t92ZHJW/Vqy8zCHx+dtj196pTsH2gu77HPpSPnMvPLG0LcU22
 0xDWCxeyVsrKNImZNj/+6Y+HDsoWsuzp9GRIF1id83tDftjLYMC5F1PPUC/GzqRFLO97Jq14xyb
 Nu/Smb6tR+3Xuh9/vM+tWeoUxzm8631rbIqtoq7tmTvkIgyyUwep75o4650czNXTw6hl2fLWwCS
 +eEKsT3/6h1TUnhv7arSs1rrfUziSlvhdT7zqkuWD6vsWF95uwTu5s3sN76mvQu2O9sovbkT3V7
 WVstHpsfmZaaHHrZPaYsujIy6syHnEXr96RXvok+PQ8A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: DCL4Bh_9ztekScV2mwsKXCpiq9MiSM9Z
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f73306 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gB5LcxD2NF1HxfupLLgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: DCL4Bh_9ztekScV2mwsKXCpiq9MiSM9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=743 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214607

The recipes targeting the SDK (e.g. nativesdk-mesa) should also use the
llvm-config wrapper, otherwise they get get a lot of incorrect flags,
the most offensive being the rpath, as it results in TMPDIR being a part
of the resulting binary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 8719faebe38b96d161b557a469c92490fe44f370..1ea94327161a8002453ac1aa79d7661d4da72499 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -138,6 +138,7 @@ do_install:append:class-native() {
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/

-- 
2.39.5


