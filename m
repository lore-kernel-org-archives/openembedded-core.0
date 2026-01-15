Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE0FD3CCA8
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 03:25:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28031.1768447505353177967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 19:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mp0ggcNK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VOJcHjHm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EMgdkS759925
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AVAE8aH7iPVGl+0XqxL6f1vxYkXefvdp68I
	UnnsMw1A=; b=mp0ggcNKRG3JClLsfrgyyleywBXNAuE0Ypscbu91pvCvZmdo/t0
	GEGFvxANoNP4ZHDU83LlvvuIWx1H9FUQIkBX7l/JqPJy6GKFYhcUhUkS+jYIK6/N
	sJ3n6GK/yDkBiskz2TLTgoZ1BL373COVI3zI9MJ5cVfN3wNfvtUxz/Dzd0hQr8tN
	9ujvt9sEmc4PTdWnv1VfdINNENDCa1IDtA1pyNQF16bpY5lGc8kxABJ9Y/9YQKh3
	aZ+W5+3Lq7PtlFNqdT6HdJALqiMAiz1rGLnUue5ysjtDeN8R5bQ0MhUdUzCFqsdn
	T4niVLJRPtrwt/EvElgIoh3H7ioVS6O/SUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2u4q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:25:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53919fbfcso135207185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 19:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768447503; x=1769052303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVAE8aH7iPVGl+0XqxL6f1vxYkXefvdp68IUnnsMw1A=;
        b=VOJcHjHmjA1i2ZyEoS5Bk/iNEmiEyOVebDwcXKjuF3LJPOWd2QmK4rd/DaUq4v5MzJ
         VmyWjr+msquM1uj0bupi1S4nqp0OL3VPAVlnVWvXAAEAsYUcfIb2XOtdySf0/MqNjEah
         cRzbB3eQvm/z/b5SBR/RMVNOvSw7MJJWAzjNsXRwiwRikxrSOfe5v26Vmgl2Iz4pBZuf
         5KuJNNyLECIc8PFVPCfzNepf437uU2fh+lRA+cpE/k5pM1iYP4tjMxOv+US2ycnnOgtU
         AVXPbyglM1TS0Moq4+5SSyIBnlaIfZSex2F+qHrWzfW5q8A/NzF4d+/c/wvAtH9sos88
         afVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768447503; x=1769052303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVAE8aH7iPVGl+0XqxL6f1vxYkXefvdp68IUnnsMw1A=;
        b=SctGAthdb2wOypU6mm09kLLQHc00KZkm8tXeJg7EN+q3sLInm2Ybk+DaGjzeXQD7h7
         +ekXrOJKSWekDYrRMAB2e3HzW1Hv/4MnbD3hKCgAwx87OJEZfHAHLoRpCPfHICXGMTT3
         rUHnXb+SdrKi4kByX9R+33X0gvJADMUw0WS7Ku5Iq47xWA3qZ0jDe/1mb6TcIkbea70r
         KCCDZrqKSbirTi28LAhNp3RA4X9nJB6W0bRY0ZP+6/9JdAfr/YZT0jDYU6+PoMqr7YAN
         v+xHQ7gFabAqyppDZUvjvx4w1gvpu6cerSf9O644eE45Dkn6OrXjNLkhGDaxUqmHEOtv
         0MqQ==
X-Gm-Message-State: AOJu0Yyowzp9rXGkkYFHBgcvlahgH+k5EGavRTQfKGBHkd2SDw06FjIA
	m7fKT6R0LoHySxmF88y5vAzEQDHB8b7HIiMfj/xaYqNmolYoxXx4A4R6fpCAqkQ4I5lRqAvNnwi
	HUXSNGeBBP1gGQgaVT7u/kFBQhKnBFEd0G+Z10TKHWfsY1CgkXQ0T4E6LOjvVL2TCttNSXHYeNd
	0Rw0zbbLNpIVj7BM4=
X-Gm-Gg: AY/fxX7+BEOrj4eL+Vcbug+rydwoZ1Z1zAJRdD2ncteg37DbxElhDXWdkjg+dlN+7T4
	1nAlFn6Y8GyzLouy5pnlxewKkkcnYq1RKMc3Xp4Rh/AE0yQJzJruh7Q4v0NsyoQXclDS5C9bP7F
	dqsmjnj4OhZO+hJQpsILWcxIq5otUgEVo8DSNwIph2OLFPhd2SKUMl8kw4kUZnfBUC51dwE6y8/
	f37zBiVzbF/6VcNkZ2OGnGZQ+fBudmBoqmARgVNI46h+tiHA4l1EJ3WeAFPDA97ck1p6CFhWf09
	yFhatEoGtRuzuCJp9rIU3Tz5vxMBZsHeJjPUBH9uq6u2LgebTvT9Btl+mzIytfoAFJy/3ZmaSjR
	g5PkQ9Apfxu6i4Kjn5FiX3hQ+CpcfDmvQ2UIxC3/lFS2PwyAuwdHVV336KoGdGLkPPrhXA71EUI
	WnwkttcvMgdjwVqjf9pVIWOk4=
X-Received: by 2002:a05:620a:4725:b0:8c5:310d:3b15 with SMTP id af79cd13be357-8c5316a2d90mr549721985a.19.1768447502790;
        Wed, 14 Jan 2026 19:25:02 -0800 (PST)
X-Received: by 2002:a05:620a:4725:b0:8c5:310d:3b15 with SMTP id af79cd13be357-8c5316a2d90mr549720585a.19.1768447502280;
        Wed, 14 Jan 2026 19:25:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382f494946dsm48277491fa.45.2026.01.14.19.24.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 19:25:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: drop VDPAU remnants
Date: Thu, 15 Jan 2026 05:24:57 +0200
Message-ID: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=69685e10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4i8Wih8DhwBXQvXYEdwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAyMCBTYWx0ZWRfX8QHSYUo85o12
 5iocSSmBdOh5KZrIuTiICgwPncYpozG7cJ5CFncNnqjL3Q5W+Ti8LaUQXqAhINxE82rSE+NdMGL
 Lp/0xGjRfR3peATkN67u8rDpDFzKgKeBkoZ3iVi8bMY8g4HE0ASIQD07gp06bahcmG9XwlVO/4e
 q/KkewiIfyK6ZTh/GxmoPNKtRoTF/dwDAtDQJQnEr5d/cYVZeoqDdrtNCmjLhCKjxEfJqqhIvcs
 LQz5uuk8fRxq0ja71OQP/HRr5MQX9m4p18Sot0FfEgEJc/sBrI7QvelDbdzeJP2m7At5Hxd8pG4
 8ZCLLzsGj4JR2S46edD/SuwMHSbqDIYatk9OwGeLiG5RiVaWEviPyh30D2zRQAyZDRxDgKdFHRu
 xYuDpIu6GhIa0dhT6ZcjUAzF6wpOyb17HiL6lOQgmnbpghlHwBUP9eY/AlEqjpQbaT2VcYcxy34
 FpgnPph1j16Zhul7Szw==
X-Proofpoint-GUID: cyFrXeu0lwimq_cofI0BVwI6lnewr-a8
X-Proofpoint-ORIG-GUID: cyFrXeu0lwimq_cofI0BVwI6lnewr-a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229383

Mesa 25.3.x dropped support for VDPAU. Commit 88e26a937549 ("mesa:
upgrade 25.2.5 -> 25.3.1") has dropped most of VDPAU-related items,
but it didn't drop mesa-vdpau-drivers package (nor did it drop VDPAU
bits from mesa-dev). Drop those remnants.

Fixes: 88e26a937549 ("mesa: upgrade 25.2.5 -> 25.3.1")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2547f8a68f02..a82bfb613549 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -251,7 +251,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa \
              libteflon \
              mesa-megadriver mesa-vulkan-drivers \
-             ${PN}-vdpau-drivers mesa-tools \
+             mesa-tools \
             "
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
@@ -325,7 +325,6 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
 
 FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
-FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
 FILES:libgbm = "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
 FILES:libgallium = "${libdir}/libgallium-*.so"
@@ -336,7 +335,7 @@ FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h ${includedir}/gbm_backend_abi.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
-- 
2.47.3


