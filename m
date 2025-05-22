Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A62BC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.25716.1747925169734409063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dG0GYivi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7xxIO001325
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0A4qlLMrDFf7AjHzA3rBpt3YWH2K67rsxc1
	GJyvgZrQ=; b=dG0GYivixNOelRDWYYulyjptq74HpEX1f5QPJczlhVBQMu2dOju
	xmcu9Mbh7K1J1pYSQOqjnNhwg597uKyT2qtXC4HvYN+wEIvEw33fGhslAj+KetYW
	mgLxqYSV3ayZW7iZHD30rFL2nshFj1wQVmek+DSKEpY5DiFhI649HEZ/Ru41z1xx
	McqpQ3qbfzXmUrqnT5AmijIVXjuWraT2d283oN/DMFVcKcDA7fQcZGB5hTkB7LiE
	tcmiUyxYG9WGdUUzFMXQrCqYQHH2UReSIJ4ahmhARAGyADHjA5Db718EYfCRoKoB
	ScQWeTjfHZTVFFjqwOGuc7JU2h/45pEvlyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tn1t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so819179685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925168; x=1748529968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0A4qlLMrDFf7AjHzA3rBpt3YWH2K67rsxc1GJyvgZrQ=;
        b=VRM+BnCimiPsa7Bl5U7tQ9cbo+PEL0YjiIxAVAoVOfoxWu60Uftrn/77cuOI9eWH91
         5HzMTkOtCJMLLVAi500trV8PrkK7t5jzApKeuGN/H8kWm0cRXRoyBqIQqBtAC9740pKD
         3pLZBDVoGhEGUUXD3NJDc0VaSXc8RpO+dAm2n7ZLnGf2G22hLpCz9xJX1/yIMFkFX5AI
         MxeqmnC3Q0sr5ghCg4USiClkHLpdVg/gnofLITpdNAgki1wp+fnSlwRzCoVTxSXqW/fY
         ja44F0bgBFPjEXYBTFcyg9oJcsfMhWECfznyE6ljDWkH8pOy8le+UuvAnyZSphkHd4ax
         oNgQ==
X-Gm-Message-State: AOJu0YzPOJx1s6ug4WH0EWbF056q2/ezZD1avELpzT7TgGv34VS2XA+P
	wzS+jMQCg2YMHImrWnuYL8DQzC6vrfosWA5fFPqlgfBdF3rdwKLsTxrXOa/yO5mUmLWn6sV1ViF
	2ixSZ/SG2b8h4JDkimqEOtDCQhHF2cVuooC6/yDNZkOFY+aWPVkBEcHDK1FW64WUWpMFobzxc4+
	hlurMdhT5SH8vLdu4=
X-Gm-Gg: ASbGncsqmunMlmAHTw5gm7fcMgdpndt99x96S+zYgmS3KLFtb7XhT1Rwj0PkUKOECIi
	SlmOFzZsyMzDUhZ5lEEDTjp8g9mjrNDZQZhExNVYqnWu3CbNuru46C1rO4ac9/XEZUznGwwnWys
	53pu9KvzjfNAnl7WALPrk9/seiIkR3YB8MEiiB4MRugcbDulG8bFlC+MfpjxFcocFzT7Y2R0My5
	WWoR8imY4t+WEo4p9/ETff8Sbu29wN/mZsAa8a75MeZY7AWNRhoqFhict8bvunIYbD7RzRyvceP
	fYPogaJAKQrN0/RRnXrP1RuKzFoPKwvBapGzwwBf973BRN7Fj8zrPvM+eCiokNCqxX3mm0wNWJK
	Hwn6Vky1EPRxUABRQOh24xVy1
X-Received: by 2002:a05:620a:4091:b0:7c5:55f9:4bb2 with SMTP id af79cd13be357-7cd467241efmr3138536385a.22.1747925167712;
        Thu, 22 May 2025 07:46:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCpY7oKjFYzNKDbwwtxtEw7rJDQvvvKwx+yH/uhv75Wqy+5NC+S1Nplw8afKGP1Pp962RmNg==
X-Received: by 2002:a05:620a:4091:b0:7c5:55f9:4bb2 with SMTP id af79cd13be357-7cd467241efmr3138531785a.22.1747925167138;
        Thu, 22 May 2025 07:46:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 01/12] mesa: remove OSMesa support
Date: Thu, 22 May 2025 17:45:54 +0300
Message-Id: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f38b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ZSQEBjlZUM_vgJQqOsUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: e2jymtS3NH5HyD8P-kw9NIiOVL922_6a
X-Proofpoint-GUID: e2jymtS3NH5HyD8P-kw9NIiOVL922_6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX7FOS0/ZeQunA
 UaQAcU24NRVm1xO6KrHLlknOZYuSSvheRe38oEpVzZtHrAYhbiAau2O72Fh9pWPYMQ6YYOCEkUY
 0wE+roaC6RrDY4w0+Vt0WgOr1YMZsDHwTSnK4uq4s8/4gUEssNBlI9F5YUPmFxhlGvD0uHrFa78
 gbdqvmYbaTxjM439Y3T6nYVr/u8iFq1m1WNqzd4MFCQhID49lokqMtxumw+8BwhpgwER5Cj32vU
 Cg5R0ggzQrs2+TEKEpGUv9V4GN3/kZq5tJQMP7FsyndsYycvZAI7k+B5JlC0GOQLsX7/4SM2HDM
 AY781jx/9QC1i0dT2QKGTwDVkBodIScH+6vS2s3qvje2SA+Li1E3eF26tzOXxCBEe1Yl8pFU7K/
 U3Wuj+0L6zywDg+2+J9thJCVB3EWGO3d5zH02TnVFeqkD6AX4fd00FkhfNiZdO7S1kWrO/KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217112

Mesa 25.1 has dropped OSMesa support. Remove corresponding bits from the
recipe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 07a57b11c80b..2ff69c3ace2c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -219,8 +219,6 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,
 
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
-PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
-
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
@@ -254,7 +252,6 @@ ALLOW_EMPTY:libgles3-mesa = "1"
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-             libosmesa libosmesa-dev \
              libgallium \
              libgl-mesa libgl-mesa-dev \
              libglx-mesa libglx-mesa-dev \
@@ -353,7 +350,6 @@ FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
@@ -366,7 +362,6 @@ FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/p
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
 FILES:libopencl-mesa-dev = "${libdir}/lib*OpenCL.so"
-FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
-- 
2.39.5


