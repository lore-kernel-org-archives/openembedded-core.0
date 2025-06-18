Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B47C7115E
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7228.1750281676136452722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h10ajZC3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IG2ftc000891
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSiHvpORtK5
	4MleIl50UTzsfquyGBx/8lZqOz+FElG4=; b=h10ajZC3DrVvXaAruBt6Ew+FVad
	uCP0W8xW/PVn1uEYPxBgDPcUacjh1nn4a0AjNHL8bfUiN1N8zZ+4jzLxu1MBvoKS
	XcB9QSJdCIVQOacA/uA2y9vCsdlIg5NLivRVN1xSCOFbUIrn+k6glX4vQTjP+az2
	CkKWnQlmCw6Q4+eevWzYbgYQHYUKNowrKP9K9Cs6XK9WsnK2BgI9gt2QmiQb2gzq
	lUygRXrYkWIHc0nBWo1rFr5as3WwlNfzuNsyUw81VIThiyaug2HZ/F1l4l+pgubG
	Oy4Rld9RTIkgePFL8woHVoJFgaTNXeaGKllwui1Y9sjn4EQvZYk5rEjuCBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9dkfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f6471cso21929885a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281674; x=1750886474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSiHvpORtK54MleIl50UTzsfquyGBx/8lZqOz+FElG4=;
        b=FvHpBXV9yWNA5eVvgKnIUy0y+33TIi3j5ZebvuAOjstqXSMRwqXfzJE8yunjwAW3+M
         Ux58NXfAJnGOyjZjw1XVMRNGponTVP5cjkKmyyH/hjjP3/OrQkX7Ky9SW1Ti8FL09x+q
         +k0r6ZZcyyWfRN6DgX8DwMNme36w7DR9YPh3plWBvM78jTbAGxMI8SEXTNe7B1NLRPfM
         i+xqW54h5iUT5b4LyJciJ4EKp4e6ATeRFUWuBMBn6fRmlu4Idt/G7Jam/SbXxpmic7YT
         jo7WiCkqfVkw7oi3JMRCv1mAzUQ55enIG5+tlP5bS+CtR1zdoqE9tKpkmEu7hp/XY1vc
         cXmQ==
X-Gm-Message-State: AOJu0YyiXVVXl0dIlWymbWhVlbXl5rW6nPkv0hlg5K27O4OZh4c16EST
	kK3Sjijmi3OOQJRauXLw7XcOgE2QAa8hgwOmG3yuA43z1qiPD+3TqGhIb7+h0A/nsBSjnf1L1Ck
	/M9pjernEjGDEt76wyQGJc5qFSyEYOn/CZgQy3OSoivC3UxvJasNh3BL3NbqkrkrVFe0DQV8J7K
	Dls3gmRCHsLGPFX3TTcgPS
X-Gm-Gg: ASbGnctieLYB0jxCY7DH+Y535Zd71fT7duuXnTDvjmR+I8D+ILHuROUUmYGdlzcegoS
	fw5Omlu9FtkPrWI62h3HnDwP+chpzq/zXgN8U46naj9rkuztPKMXyRrcvKEUCFkvWmNgpDCVZM5
	WpaRjilEsX6EsXIVDiQ8EXJHjIWRFyFNDOMHR3tfE4eqqo/uuRvgr26KJ37CYEqaTy7+OqVdxkO
	A5LWJcJJx5JGLdTE50iDR3ov8w0iq2Mk7uyFsUd6MX5fYwQkz7jnByIRHuccMIS3a9YIlvHtWen
	w/UpUNPi3Gv1ou9YO48pB8ZMz5cQ3r2rYcTEAl74JV23MZdOPqbPfLSkOFqjkztg9kjQkGDdLmf
	v/agzYpc00QU1yZ7D18e+TNB+6gY7yhlFMBc=
X-Received: by 2002:a05:620a:24cd:b0:7d3:90f2:c19f with SMTP id af79cd13be357-7d3c6cdf674mr2960051985a.31.1750281674158;
        Wed, 18 Jun 2025 14:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/sR6vNzvlRGHnuf/Hrmb/vzhBYSXW5kR0JbP3Yu91xM1ryAcTbfRfKXTDAF+W8lnUUJ1yXQ==
X-Received: by 2002:a05:620a:24cd:b0:7d3:90f2:c19f with SMTP id af79cd13be357-7d3c6cdf674mr2960048385a.31.1750281673741;
        Wed, 18 Jun 2025 14:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.21.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 7/8] default-providers: handle GLVND-related providers
Date: Thu, 19 Jun 2025 00:20:54 +0300
Message-Id: <20250618212055.1529969-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s2WuU0Xw_B4B3kk4V-nWqSdnZ_-mxLXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfX7k3s2w7OKJAG
 z3JwEkR/71m1+6MbpQ2MIPbbmPmcGIUVSWJvwXrL//a2l5mfCVVDi9WReNGVDNBfRyooiPuilN2
 FFntXBCHixI1EtnZHTV0J80cqapAKdQAv0QEEMN/e3+LoXFkavKqHuO+8SHRdIKHba8pV6RXqr/
 O4XlEcUOCUwEE6v1/1eLytl/VonRO3/i+61LirAnY7pBiReYnHBONvqVd+9+TzEeIMdyzXfLb25
 A24JyRfS0butJxtuiW/oOHcC9xLcPA7U7iPDA3kSBsFc9I0mVVvUoGS6UMfjti0bfogPF8/MVea
 XFyD1h93IDlxxIcTVhE1U07N1HDbAKt1svUUQKECp2WinlmasD4FsT9TIBCsOhHbSbCtbAF/+GX
 oHH1FUS4TqFBIXhz3VcoIMcWjxPIRQLcsLDEC299beG/REQRW+6amSWqHCpbDWoLckvaoxp8
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68532dcb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=K_Wat8gt5nRy7bLjIfAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: s2WuU0Xw_B4B3kk4V-nWqSdnZ_-mxLXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219043

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


