Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E84FC54F32
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.29164.1747934023098405546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=bp8DzBrz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFTGjF000720
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UB2pvuuH/OpgDeOjGaS/PfvbG+PXqbZyKZicP6HY34Y=; b=bp8DzBrzeRlwt5+3
	O5bsMZhW5gsI7fou9CQvOVftf4paaZ6w5xOLNRWuDhDGcLJbat4yrMe66jxR1cd8
	HYdDfodHL22KM1eSHfV9BIPpZ2eL1KIZockiTN/nLsIp9Iq3NNC2mSmg4fHZptl3
	5daxfcDYy3qSr3c9x9BFziebFwaoCbtd4lxPhHgBuXyJykKEimvEoAVIQo98+CzU
	+Az8DplSv8gtthvGw5ZULq/8VP/NU6iDqX/xq6Mx9nM/LvY7rnUpLdzc1uC0JYnH
	wHXcgAtbZfBsCzLulSZ5Khm6k1eS++gIBF3cSXORyjrvim6177Fkka4rNsrzjcoK
	Op7vUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tnfb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990715so2229440485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934021; x=1748538821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB2pvuuH/OpgDeOjGaS/PfvbG+PXqbZyKZicP6HY34Y=;
        b=icEt202EpxrIso3YoB5qN3h4rMgtSHeKrVEnhe3gRTQdrkHT1ND1t5+7zO8hFIHt5v
         K4hzNAe//BigOswbV829EcrN6gusor9y8MAY+0b0fdjWRECLcKpAbVHqKgDX/OTglq5C
         Gm4FHous8g8y7GQpuY9xHtZlBLkoGlKGwNlm9i2f1MFdmpOSziiOlcQ+RvbrlH3SVPgu
         lGDUAqKTclMDdv6majRCggFA3F9GaU3t33AVUQMxas/kjo7QV/woSus8wdt06MkAdJcS
         aqDdTP+Jn3HdVW4NA+Z08rcCG7rM0R2czJ2Rs+YMgIPkZypGMnzZ+r+bu59ESO4ewWy1
         Xi5Q==
X-Gm-Message-State: AOJu0Yw6PK8zhsac3jDk9Tk0Oe43sx1KjZD34cxcz/VAVIRs3wyZC4Bz
	3boKndiozBGsmfaLQ+sqfdhTsaAja7/qMgrCrAF/DdXMHUD1Nq4CAswGdxSTiD0suv8IVUNCGXu
	v8BAarBCdIDmTgBMnFEXHPn63SSaTlsPpxTP6wQmAMxGfG2p0+qGNfziBdNYWa2acysPUtLnPgc
	hw4ZnEyIQ1MY4+lXE=
X-Gm-Gg: ASbGnctM4H6DhTeSJlbpkFkw2yLaTccIDBNR4CXs+BhNiZsY7YVnxgXqXVjf3cae6BG
	+PmiNaLSaOgNgyWWYWjZg28j3uCloa814GhoZAuUl+AbN2ov3tbUYFkVmDxGOcwiHhXHGR1lRke
	ekAcIvIOG3qTBTHgDdEbMjMGSNNO6CZegPf05Z6By1gJ28x2/rRpuDat9aWRZ2jx+E3eiW9fjeb
	hSqsByYf8bVbx4kNVO15UQXNNT9MoqJRjQRuVgSTh3czmTTSH8IXr6/7PhjGFa4rsT0WvsUhHa1
	eAXqAZ5EeMMltUkxPJ60L0c3TflrW+TUfFyIBsJLEpeZqJEun0BFq1QXqBXg+wS/bTPt2tA0TFI
	V8OwHB76skygqR0JFpXREkoOu
X-Received: by 2002:a05:620a:2584:b0:7c7:a62f:341b with SMTP id af79cd13be357-7cd46718a72mr4700705785a.8.1747934021047;
        Thu, 22 May 2025 10:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZv1DF1vcuRXRKljn3DaweWoNxNuGCs93lL6QK3SMNBc+VkrX1vyv9kenclmDbFot2e6fjOQ==
X-Received: by 2002:a05:620a:2584:b0:7c7:a62f:341b with SMTP id af79cd13be357-7cd46718a72mr4700702985a.8.1747934020710;
        Thu, 22 May 2025 10:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@gmail.com>
Subject: [PATCH v3 04/11] mesa: fold GL ES 3 packages into GL ES 2 ones
Date: Thu, 22 May 2025 20:13:27 +0300
Message-Id: <20250522171334.3040820-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f5b46 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Wm-pHqCzE9DZxLNbtkMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: m6_KFjg0jMC15GJUmAu8RwJEafU4yOPn
X-Proofpoint-GUID: m6_KFjg0jMC15GJUmAu8RwJEafU4yOPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX0ALRBVN5p2ck
 j4M4swrPek2t3IleEvExd4ghcaub6DfiErs+3u6acm5yHhnLIaoIdjpaS2PbpHLyyflw59Y2px5
 2x9OTOPbtxeQhzyzEm07WtvEf0/zYFb09WxHNgb1qV0cbIjJR8B9koV7KxFjAB2vM+iI9tC4qkR
 zds3mRzQ2owHLA0evfV9KkDkws+gYHTY92P37bcaVqP0I5+ITixH2mZGG9Zd80nTV9Wm7plaPbA
 mJ+Bp/rb2/VXvrqqw9IewjXAr5IbYwn1IEM1U4o03YiyVcXwYM/DAMpUsO0r8AkEkztplYfT0M5
 gQGzvkRVnJdZ2dQTMx4OQ9cQ10hAa297qaniTy3+treed0IpGyTpqrTmnC4aI05JYw681Jem7Xt
 ceb+lN17fbr9IzeCSxZ/dRECSNmpeyrMD5Uf3wPkD0bVYBvYdyEThy3yecuSa3lhseDAb5rt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=727 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220174
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 54MFTGjF000720
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217136

OpenGL ES 3 is closely tied to the OpenGL ES 2: there is no separate
library, one can use GL ES 2 headers for GL ES 3 app, etc. Instead of
having separate packages, merge GL ES 3 packages into GL ES 2 ones.

Suggested-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 89fa19a5668f..a856d11e0734 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -232,17 +232,10 @@ CFLAGS:append:armv6 =3D " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY =3D ""
=20
-# Khronos documentation says that include/GLES2/gl2ext.h can be used for
-# OpenGL ES 3 specification as well as for OpenGL ES 2.
-# There can be applications including GLES2/gl2ext.h instead of GLES3/gl=
3ext.h
-# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
-# development package of libgles3.
-RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
-
 # GLES2 and GLES3 implementations are packaged in a single library in li=
bgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its imple=
mentation.
-RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
-ALLOW_EMPTY:libgles3-mesa =3D "1"
+RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
+RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
=20
 RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
=20
@@ -254,7 +247,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
-             libgles3-mesa libgles3-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
@@ -279,8 +271,7 @@ python __anonymous() {
               ("opengl", "libgl", "libgl1"),
               ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",),
+              ("gles", "libgles2", "libglesv2-2", "libgles3"),
               ("opencl", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
@@ -354,8 +345,7 @@ FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${include=
dir}/GL ${libdir}/pkgconfig/g
 FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
 FILES:libglapi-dev =3D "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES $=
{libdir}/pkgconfig/glesv1*.pc"
-FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
-FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
+FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libopencl-mesa-dev =3D "${libdir}/lib*OpenCL.so"
 FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
--=20
2.39.5


