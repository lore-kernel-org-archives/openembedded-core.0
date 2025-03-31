Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C06C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50713.1743423712469910611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mLEsQsFi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kghC003656
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIhSfy/SDR/jkHbaHlF49+XBVFaur1v4uEyKSY8Df5A=; b=mLEsQsFiSFnXmhoC
	u1PMYn7mbpNW9VG8hMMp9wJ1oE9B7UBJsJFOq750jlpwQw5L5jihQene+pH9LZYi
	noEENkV6bbgWE1iBagwYaWZ5NQpPULpe5163/tQPalEbtZHWGtmNfiMJXLeU6mnF
	oAauZ0UpmcnIRJLERBEJ8rIOh+hBkUjbq/Bg+ITqbBHEmCL8U77Ikvl4Tv4XhHsd
	9kcCgcoO6vuNqoTw5XBQ6iTJfD4NcrlxMNctH3YLcBoSd2GHayAwcV5zNUtB/orR
	dxCIN/jGunp+2CJWH8py4JAcFfIc7Z37ui3xCwBsZ+iF+p1ZK7JbWPKorASUUpHT
	aq7idw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935vdnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so492579985a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423710; x=1744028510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIhSfy/SDR/jkHbaHlF49+XBVFaur1v4uEyKSY8Df5A=;
        b=d/WQTNF2gNdFS6qchmGuhUnuR+pNGLAvWO3ucKzbRgIyBgEe0mgfEM6i9NOszAXonj
         gOOIE1ybZaQyPXrBFH2QuCzcdUfGtKfImd7GoN08kdvW45QleWXQmimDZji7fc1LnzYf
         UbgiwQGXFkNc8UnD34NWhLo/3vKnleruWZ7ALf06G2qy2aLYaINb+3mbJuedHoZm2h50
         hju2K5d3PxkHCTTROoBb9VEGkIHtDnC7TriwTdcetZwbghLGFhaKBXqU8Xyu7HVGcsSr
         i8rR2At+IirOE1w/oZA0XXhixmQ6QqRV05vF/W99RzGEYjfjKahdd/X7aU1Z60wB23+j
         pafA==
X-Gm-Message-State: AOJu0YwtDLBLAcV/XWj4lkm6/cHogqQHj5LQHzLzsQWGtAwmCwSN7dnJ
	uY/ek5VmPosnLU9Ac7lWI2+2uFNUIPstaf/m6/fG52iwl3G/TR31DY46yv+8RN/1eTtwjRZv/t3
	o966febAjK954d7NVMjqVrFd7whGuYF1QG8Sa9XHvnv2Z3nWZZlgg/vcIAsTKzGBAPZlNdqp6OI
	51AwfgzIAtZLTRuFdO
X-Gm-Gg: ASbGncuoT7bzK5nrpvUDi7ucQLRbqbt/V4GxrD0R6a0+rgjudxCp7dAQbNp276PGay3
	jWl1x+TmcHlwkVuNGKGxgcdUZDwKX0rE3w3EYIw2BxQ32bwTgJQS2W0bmWu60xKqN84v18KVX4V
	B7xvnAwlE3eF1UNq+bFDDXlC3clEi7pSZp+SfHT79sDRfIPBtWlsMpKcvLLR+Rj/TDB8k+5QvRM
	THC9/UlFhLKo9Ch6XTHiFIGW+hnzplXX7mZHLDJJtI91zE+WftGWFzVoDQ8b/xggWWS7rScC142
	BXSVFnoenPbmu06EEfG1EJUU11LWTu8tc/liumXttrnuzccIKi3rtGttN+MB+rh9hyfqyWtWzfJ
	YvgssPWJ1gkhaiW0hXd4zSa3WwWVE
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr1070147385a.0.1743423710405;
        Mon, 31 Mar 2025 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZVMZoQiXE6+kyh11EpNR2eZWolx1bDzUlbfez1tG9ES1HUpADZIWE4C4cZ+u2xB2bHp9vlQ==
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr1070144485a.0.1743423710024;
        Mon, 31 Mar 2025 05:21:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:21:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:34 +0300
Subject: [PATCH v4 1/9] llvm: move libLLVM.so.N.M to llvm-libllvm package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mesa-25-v4-1-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eGTibRIRqDUKSL6bHzN2H6rb0V+z74KRWUYbtuHsbiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojW1GysHdS6yHw65fJrNhQrldfAMoWhMTaKE
 2vDX6U70JSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1gAKCRCLPIo+Aiko
 1f4BB/9TwGWs9pRcwQL/rBVa3MAyhzYySLpYMaTPVtjshNPsJZKoC9uk0pEaD6gIPbhqW7lXoeI
 iS+vNyOJUoDsuOGRbkz09GY4e/zxb+Xa+HYiY0x7KaKevn9rDt97WiRtnfAwroao/xI6PLf7NNY
 +LcGLUf9ULAZeETERFaYS+fhj9bAt95auzPVHyUki+dd6nBvNKZdB+4FNyDfCHj11nVimlIP+RR
 VqsyHyKlIPu2I8IsZUeAjiGj8AQaPn/Cle9X4N4Lim+55obYZZ3hx0NNf1z6jBs9MxeHIwNZshl
 qje/rt7wWTxTHS9ikDso6oPgqUsyOyIoVnTEM68pdkWbfoTJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fnMRS71-XZHW6JpKaRVWILhO2d_9xM5e
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67ea88e0 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=sEhaxK_mCjGFFgskTosA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fnMRS71-XZHW6JpKaRVWILhO2d_9xM5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=778 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213970

Neither MAJOR_VER nor MINOR_VER are defined, so libLLVM.so.N.M ends up
in the main libllvm package rather than the llvm-libllvm package, as
expected. Fix this by properly using two-component version.

Fixes: db3bf550a372 ("llvm: Update to 18.1.0 RC4")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 7ffc6ec1cb8a041f3ce1c3ac75fad30f1d793916..296a164cdd7ffb45f056c879cc5fc4fbc459caba 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -19,6 +19,7 @@ VER_SUFFIX = ""
 PV .= "${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
+MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
 LLVM_RELEASE = "${PV}"
 
@@ -152,7 +153,7 @@ FILES:${PN}-bugpointpasses = "\
 
 FILES:${PN}-libllvm = "\
     ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
+    ${libdir}/libLLVM.so.${MAJ_MIN_VERSION} \
 "
 
 FILES:${PN}-liblto += "\

-- 
2.39.5


