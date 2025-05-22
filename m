Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB11C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25726.1747925185398060227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZSi+jo7v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M81xdY029164
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kvJVZM23pgL
	63mpkWl7LFhIGTGbepwmDpcYxuN393cQ=; b=ZSi+jo7voDFnkOTcfsWgOD0d0Nd
	v7Izr0ew2AJRTb8uI/yP0FPBcZCNdPssMu7ZolAAxllM37eYAV2hHYyadT8JJWzx
	+re+vZx7CMudfMyvL7EHb9XCaVzVaXU8U4yDVP8ACI/t1Pm2eZCcFpDMMeNhXvQY
	QtS9uDZFxh+heePkQv7p7q1UZWxX2jEdsTXOf94eKYetm4Sw07EdHH8PJPkdQ5rO
	DKfooEz2088XARR/D9ZpCZTcUTzZmx/2FpbqpzGML6EEp43Z0iIIFCqykJOiD/Nu
	uEL+4k18tD/AGL22hC0ZsKHU9Cr27hb1HrOi6KI6GZ1bceHaiBVnMzFWYLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf46sqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95e424b62so1661530385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925183; x=1748529983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvJVZM23pgL63mpkWl7LFhIGTGbepwmDpcYxuN393cQ=;
        b=g3WELHp3bPASzToJj0niPYUJpTl6gr6DEARq2cQetLTUyNsB8NJDt9oL3pkQ4wTAKy
         uoga3fr5wGQb6NBNhfL4bwv/eKL6h5EYnqyaZTuB3Plr8piarNZEcoUhwL9/3m8712hc
         6rxTxju96f5fcYOAVPYGAjXMaqxp54SRQAR2rV/cnT0QGC3/TNp3SIBq+C+nqAuOyAs2
         +0Vr+yW2XGk8NHDPT4u/Pz80xVSCANWy77RcqEYnJbwLrW8UdeOfoZmW717wSryR0pQl
         pmsH5Ew3gXiCioGRQ1eFcKmtJi4sXsnJgv2+8pXtPo4Yn44g/Z+zJMG0DGQhG4BXdDQl
         43uA==
X-Gm-Message-State: AOJu0YxAW4fHp63b0tbYgfVf/+Tb4xj1RmhLkN87guGHZ1a/ZQuiZfUP
	A4RZh/k1UkdoVXg8nB9D94cC3/78fl7aiqfYvckg8TIKosmNM1s5WeG4GabPVNaTJdf2txzDhB+
	7Th10qED7NuHOADfK+Tbgby4EVHT+xFoc7hCf8tz9ONQ0knNBRcei6k/OlRirMmtcVAwfO+tiIS
	2dW+XeetsUcw0q/FA=
X-Gm-Gg: ASbGncuWsZA4+RRepTWFFxiUb4bB5q3dL9YkbphJYI5/hEjv6m3x+g/vefzS5NHsfW6
	MjcaIUq2Ucph6tBNfDJHkkdewWGm4hrEB2TEjIIjpYc3bQFHeqOzMsuUIhkByW25qr/HKByjgZy
	lIFU+dBVJbev8GPk2c2AAYzNgPruhCCgeTBFfpTI2C0n4PY7EOvtI+kamnIf6bO3FYHQSwPoVJn
	ZrXBlVB9aHlwTmjAuPn6uruSAf8zdwEHgYyWr2SMrPthmQn7cATUx/4M6f4xwmBopgd9rd8rWqO
	kw+XX8p0Yh4KCznEM/dAdHjKab1+n4GMyu/80EotqCqGNM/8L5giQDTmTd2Hncr8z0D71ieydmF
	8o+PMfPR54zLaKp4H/wqs4B7B
X-Received: by 2002:a05:620a:6082:b0:7c3:c9e5:e4ba with SMTP id af79cd13be357-7cd39e3717emr4977058285a.29.1747925183206;
        Thu, 22 May 2025 07:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjHjEakDl9rlcUznTtyCaQo7XqXIDP0swjyV1URvdnmnccRFiQ65CLFqJKA2wDOmaxE+Ni1Q==
X-Received: by 2002:a05:620a:6082:b0:7c3:c9e5:e4ba with SMTP id af79cd13be357-7cd39e3717emr4977053485a.29.1747925182732;
        Thu, 22 May 2025 07:46:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 12/12] mesa: remove XA tracker support
Date: Thu, 22 May 2025 17:46:05 +0300
Message-Id: <20250522144605.2876771-12-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX4xn6e9L5T6aN
 LlNDe/C3q6qgerdIv6BqTqdkd+iR2oonUpG7CyMi80KaEP2Dbj5NNoNSQyga9AuspwRGNRfocgV
 lUoU4h0jJaPdzHhaF5lJYfu1FGqLKJa9+B6qSLTYXmtZ2yHjuz61/k5CGRuBCJl3zQ9AgQOo0MK
 iF0HwQ2LgKQ/dlUy/kfuv833P/yg0qcOBuf73SK+jLx5ivx9H/5BBxAPJP59pHwKXoqbqfhmQle
 sV7Q8DRsXJ54lwWMqjWW6MO0bnm29ChS1PTTNruNqRwWrys0ArZW9KktklnK9nE5LHgWBX6u7HQ
 5MA0rhKc5Qmc0VGiEkVU0W+xt8eG0tJUorl6v8X5euQH1Fz/OPqmHeWtWD1aa8DZC4SKJ8wYZV9
 KFW5jC/KG13Y0yUxZTFGuQ8Tw6ka6lD8ZRpig/e+SstaKOs2fjxDS8nUdj2yevlSYTx3MnVq
X-Proofpoint-GUID: BB6qlTKCkNF_bLF5HkF2LhMYDjyeprA5
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f38c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=TiM0kDGdWyhykQ6Ep7wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BB6qlTKCkNF_bLF5HkF2LhMYDjyeprA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217123

XA tracker is unmaintained and dedprecated. It is scheduled for removal
in Mesa 25.2. Be slightly more proactive and disable it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7bc7c2faf7f0..7e658679f5bc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -198,7 +198,6 @@ MESA_NATIVE:class-native = ""
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
-PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
@@ -254,7 +253,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libopencl-mesa \
-             libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-tools \
             "
@@ -346,7 +344,6 @@ FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
@@ -355,9 +352,6 @@ FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconf
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
-                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-                          ${libdir}/pkgconfig/xatracker.pc"
 # catch all to get all the tools and data
 FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
-- 
2.39.5


