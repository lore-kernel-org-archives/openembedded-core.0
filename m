Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D04C71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1059.1750090248365788454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Po/1Uu61;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8eV34010256
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSiHvpORtK5
	4MleIl50UTzsfquyGBx/8lZqOz+FElG4=; b=Po/1Uu61iiiLhi0Lv5qlciRuT2O
	xjXsXyfRGeiE0kdA6dzDUSCq75/lgF1ZP7J1zWfsn9gplZLrauPGuyi61ewHGQHV
	ra3S/BOK/oHBrSRDs1DW/U6Q1QH+gefy15kA0xOl9yqOLhJIfYfylCkXbtbBkBF+
	xSWAcDQ85AyTJW3tUFDVZzgLpzWitGPwijZd+4Ve9usrwXK8D92+TU2PfU24/LjR
	TI33SS4YjoM91eU6LJ6t8aLDanzmvWQL7EK0842g6OkH0zlLfSeBjctacz833od8
	eT8KGtK+7XJOqKjdfGYvCyGcGwVLyVJPM/icnvg88fWdfd8oMuruRO04U2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7561a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so1570458185a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090246; x=1750695046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSiHvpORtK54MleIl50UTzsfquyGBx/8lZqOz+FElG4=;
        b=YIpW10dHZan3yRhUB+NZkSIwRftvoWT1HZzReuKebgpe2iHPZg0EzdHUDJq5B7wIpf
         mkcl4U9sHthDeLDspdZqk9g8cTklHYJ691CvRim/kpHFJRi7h/dGq2qy0lorClZmYzF+
         r0DfWu1BZf3McuxWoY40fCG/UW1pCP9OZkaU7VUGPZUb3rLEwEb5P7JjZOc9DC4rM9sD
         dshl4FkAn5+sXpcOBCjdA59EAtNjuxHydrTPxciJZNF/PGkoRiBqDJCQikHoGegCpmPv
         S+i1EyWCm4vAt6mcdc14xbN9TDPSiN2JUFbQ81pafh5cdZ/RSG6iEK8TnA3ty6KhP/pp
         hGhg==
X-Gm-Message-State: AOJu0Yy0EFA1V/odb5HnVjm7zHZ1PSOsf4EzD59QsV9tcobf2hHBEkhE
	HYkgbc+QOlnu8le/gCdVNnndSHeQDVARYVjchu3FXCVUnl5yvh/r6ILipop4i8M8ssvNDH2zHFu
	hdHddREFwpdmLn5QFDFnV18aTc3sO9AHpFTZJqsPluw6ReHCdKLTXNiV9+CXSju0dyY9kvP9i4z
	l9OaANJyqB/ZETMcNw/A==
X-Gm-Gg: ASbGncvn2SsScRCZ08tx78fYsjrwiJZi/TcfPMzgLISzxu4TH03SF86QPZylivsGdES
	pxjcYoCzxUGk5f+gQtd/BoxSHovXPtbylVb6e9d3rGfYmmgRMiRpTNbQ5KkInwEQUWZ+05SBscu
	mykYE6sD65jk2nT1KyKUl0XkTJY6g6AIIzmhqzUqVwPhQ9FRB8mbtcxmv3ZYGZcdmNFqhni97HM
	C26D7U2xtHnDAeh3+fNdVGxVxX45gDheO16ic3Zx4BqJ+W1FFX/dZuW7Ivh0WeeUCjpFsE+jnVl
	0dw6VUWfkctg77qapF3dpqMABwOJ1FR8K4j0CSusiT9X4BN31k36upt2rl+EBdwzcPV2aDasq6M
	YJUyp+z0CoGOyLEh676gWSYwt97VjaujLL+8=
X-Received: by 2002:a05:620a:454b:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7d3c6c04bfamr1376795785a.1.1750090246427;
        Mon, 16 Jun 2025 09:10:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtS4QSHMRW8HUiaj0JeJVAxeLbX8eBWkWFxqM/wZuhjdu7q+/V9Yk9p+6Xv+KrC0s7/bpsgQ==
X-Received: by 2002:a05:620a:454b:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7d3c6c04bfamr1376791085a.1.1750090245957;
        Mon, 16 Jun 2025 09:10:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 7/8] default-providers: handle GLVND-related providers
Date: Mon, 16 Jun 2025 19:10:36 +0300
Message-Id: <20250616161037.1518306-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfX2cXwQlf0Hq1V
 r/dzS/tIDLUF0+MmeMCt7TF+Pw78UJLDF76ZKFq/QY0D3YrDNhyo9CtL7WNOnBKN/YAaB4g/TX7
 dAdsp7QMuDL3eVqE77ED4e2mE3fldlFSG/bQR4qDNOOVmwhqu2gqm9Yhz8BhgO2HrcovZzLcQy5
 uySJ9mmuYyWLkUHgN2snSWsSVWwWYu9r0CIUG3a9mhiu5lANpVEtZ+Ra2Oj2ZKfOgXhkaITefIh
 LYj97sInPtD8gLStBksrfBa1prELqWLpNrkOLuWd7fckSn4Sj5+4DTTDvcZhEZne8H8ltASPVLt
 TaobDdbDjXF9m5MvMeTUah9SNLkDmM/6Wi/ckd+8Gnf4y/v+4svfaCq2uC35D36sEIGIZhb8P0D
 qlB630D1tIvzssV0w7bua3731+G/o6+JG+e6X0evMc/O0R3ETVDV9mRO7nFVjtqUqqBA+66r
X-Proofpoint-GUID: SFcO9TW3iogKBBEVm70NDW0gb9yuBP5k
X-Proofpoint-ORIG-GUID: SFcO9TW3iogKBBEVm70NDW0gb9yuBP5k
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68504207 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=K_Wat8gt5nRy7bLjIfAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218841

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


