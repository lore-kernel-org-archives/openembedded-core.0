Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21DBC7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3424.1750239963774687619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UmzJIt9V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I615XT002276
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSiHvpORtK5
	4MleIl50UTzsfquyGBx/8lZqOz+FElG4=; b=UmzJIt9Vu/8NsLCW3WH4xhDst0n
	hIqw9ry1scKcrQZHssjg39fMCc00whRJ5veoBxW/D8opx4xtykeMl/PzQGRMzNAd
	XHiJxKMgsxx05NpMN6iUY/XNmb9BSuihp3GyXkh/pv6Ig3IR8mgj/zmvyLBWZXfI
	8NFWFACJtAEW5zrCXSnHdAqkM890TLoOTYoj51NzsSh7uF5HBH+4mUP3voQpaMZ1
	XL0btCShBT7EG1b/W+EHzEM5/4HLAOvbP1g1RycjFwA8mMvc6Qk7kSQ8yVzGfAFk
	x1ewWpGL40SqpN/e6BCsGR9hG8s403zB01V6WnsR+rAAcfMaUo/oSSvSIwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwf2g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso545933485a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239962; x=1750844762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSiHvpORtK54MleIl50UTzsfquyGBx/8lZqOz+FElG4=;
        b=nPbSO+zHCXOYF71NvrUtxNGeWjdw3d5z4l+mYdsne/f9WuaK36IZ8TeUrH9JbQtYo6
         W/zhSzD8uHp96Y6tzODxonPIXs0JzsXkKTgLIX0BePnyXEVPF7pJHvtB+1ji6j38e9wE
         +5PLvQbBd1Vi1eHaOg6Ex4WOGHLSAaIuHEzEXDvU3EE8DTYW60rOP6RNNKtWgsvuVEOY
         VO/Wce96hVCwuZBCI5VA3Ljz/xHIuxaijU+tGNVLDYjBsDAoWh1EAmeMCmK/jLO7EAf0
         d9dC4P33LvJWOW3M2oF0akrsDphCfiIPRyFP8nITmfd+9WV3WbGhZwFev4w55zX7Rv/R
         cq3A==
X-Gm-Message-State: AOJu0YyONtZ6vLxMGLHwkAndu8m4nQVwVcYRzId4jL55SwV1G+TEKOd/
	4Dvh/DwA6zYyclquujsMC5odpAi6xJQka0j8c1p7FLd8hfNZ03pBmYs0yixB2Vaz5ccvRSOPszz
	MXe3X8tu4e/9EBod9eS7MVh53rYHlw/cWc7tcO/hPi+TtSlj9YvGdQLJQhEUXfF+mt01NWVSRhw
	nUSxDQ+/WQMgTbq/YWcQp4
X-Gm-Gg: ASbGnctyapwnbBf/a3z2y3UDSP6FDSbz/kvBJLBrOQr/tAkj4JYVadLQDcNNmlNwKcm
	PydpmU8Z9sPQTTq8/NTLltXL8JS87kvrrJTMWTQEJ6Eq87mGFlHKX+pCYG8c9mC/qI0uNgGk6Sc
	3rKoiE9pEG9IP9+xkaQY36x3gc8qRS+VFXWty9E+SRe2k4VUkyrt1Zxk9t+RXIkwK0sQj+JcJns
	JxmuTvQKkylZM4qshROamWji9i891tSta6uD1cUKmfHZSq2wgbgPz3+5EgkesNUUCNZsyktTYcH
	te4j2ZSBdL6U136yC8eqD+OAWacFML8UteBGYuRRcU1LtUQc8izCrthvyxb2nbzFTw3jmiBP3T5
	H1Y0cduXpLecHjanqklZ1ngv+3C4BqDFETv8=
X-Received: by 2002:a05:620a:839a:b0:7d3:e83c:9512 with SMTP id af79cd13be357-7d3e83c98cemr324554785a.15.1750239961905;
        Wed, 18 Jun 2025 02:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEbJ46I9K81ntAJ0kSBJ45CA/pTsqqVW+WJT/nsp14gfcMqR3+tG4SD3AwkFgcqo5K2auu5g==
X-Received: by 2002:a05:620a:839a:b0:7d3:e83c:9512 with SMTP id af79cd13be357-7d3e83c98cemr324553085a.15.1750239961430;
        Wed, 18 Jun 2025 02:46:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.46.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:46:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 8/8] default-providers: handle GLVND-related providers
Date: Wed, 18 Jun 2025 12:45:50 +0300
Message-Id: <20250618094550.1335521-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dI6UUXhiz7EKwMo_G_blS5a1YUUodDqL
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=68528adb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=K_Wat8gt5nRy7bLjIfAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dI6UUXhiz7EKwMo_G_blS5a1YUUodDqL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX+P7WPk4ETU9b
 t/1ZTZiHqtjP9X+tZX0YnnBjAaudtYYx0KScTGLNHGMYqvduU0Y1eOIDREHnoR/5DGOIi+MRbxI
 PX96LRSgYdEGNa3sWg8rqr9RbKTSiwxJ3rL+bbCy+4+uDNb9K348gUusyCKuxPyI0MdMFQGG5w4
 SgkRU6kUDjWj46F5LE85n2zYNfUhsbmgG4YHLIosCwU1yBSKszDP5msX6RMHGvwn3sK4W3sZtMR
 MWLsvbE2mUHNafXnrj/JFByKYt16TahD9Y1DlOdPtg0urDMXFHfWQ9qmKwYHOHwVvPk2EWNUdAS
 C7JzNgthJhrmWgOUflEgze+GLEBdZ0hRTTlcPC5TWW1pWwpa3TMqPbq8l68+i4fj5hW2iZhRbkI
 F/VlOsd1LKV5MRwNgqi53u+iazJROD1NaePRqp5bZZXCsxokLyLkH7N6VN4lh5vg4eWV/Tyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218996

If GLVND is enabled, then libglvnd is providing all OpenGL / ES
libraries. Tune default-providers.inc to select a correct package in
this case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 274ad0c4f630..3f113543cd9c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -6,13 +6,13 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
-PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
+PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl-native ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd-native', 'mesa-native',d)}"
+PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'nativesdk-libglvnd', 'nativesdk-mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
-- 
2.39.5


