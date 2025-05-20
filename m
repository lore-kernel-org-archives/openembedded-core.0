Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C3AC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:45:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.27224.1747763146802904543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 10:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AGu+LxMh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeETU007695
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lBUpChlxmXZ
	RgkNGA/HoXqKsbpiQZi4oNKvCV+PxEX4=; b=AGu+LxMhY1ToOvh7DVPtTFnkUN8
	0/IMA7ge92dVJEiRcOZSiAbZRjuR2sCUPawC11b9pnidaRu2Ry9fU8FP6yxFYfjm
	WIsv1Td538pjVRtMTc45oRnDw+9vvx5jtJixOr2ZjYp04nf0ifznfnqFfCeGLTJi
	Leg0TEBE9raKRky7M8EgSVQBYq7DyFcVfGDAKpYFWTY6npWSEDYuqaglYI/J2eF8
	t5M2GzqxZYv5wUjDGRCEPz9AhZ0Fi8LwpbR2rGAuNxrZqhBXFyxvFTNj7FnvAdky
	NZDQXKjjZe7BXR5WadkHsuJTADzvD1LlZ1i8DtN540kWYKJnQg3DOowMzLQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6g67g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72bc266dc24so8688128a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763144; x=1748367944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBUpChlxmXZRgkNGA/HoXqKsbpiQZi4oNKvCV+PxEX4=;
        b=WJm6YJZPXpQcAVnMrE7VBFrojgaXKYcGGdEGqOjcqI9fjowZCI6K3/5pCvZOOGFpbY
         hPVpAb9AeEg71Jph+/BqB6hkPgNVu90zdYBUohbLhF4WQVOsM24lruvJhEIVvYf1ldhu
         y+cT6y+hWCHBuJWZegOZxGQu9njWXvQhKKJi4Ap4881yGdHYIIIhJq8OzI4JRVog1GUY
         Vauqi+R6qlYEpwaYYHb9J2G1b5ZC8bYa89LziQOXMw11NEVPE/JmMKIci94CQ8uI+m9Z
         df6DPqxN4RI5Iu0d9O5IOYR33O0xSHiLEGnfsjQs1wH+PvdqXOlDrdYa4a38qeBTEPBZ
         kxuQ==
X-Gm-Message-State: AOJu0YzufIq5n76jeEI/kVOMu3pmMvNDi1lJA8t9LDC4HFGPGRd1xiph
	tU2eTbLJae9gkvAG+M6k3+ctTdaHrBrE5K/n8l6V4k713TAvCUx2rmhe/6zS4JaaMOKCiDQ0WUc
	tQeXfaY7UG5UUb+Epj6U7s/kFAG37Abi5RR7ya1aK6JNOhzAs/J1TTW3Syskkna7QfBlxsvqJFl
	DAjz2pCh8gnQwZ5JNAww==
X-Gm-Gg: ASbGncuAwiWmXa0f/YsmSk3cfnV7mPIVPnVVQ771ZbVkrUXzd1X+ElGkDosbdZXRpzK
	KguqSU4/pkFjP+8VieW5gb66nyAA1iPlDfbG2ITTuyL6NI83C+wpQJzT2bW+OCoznAesO6heAsI
	m5/Vd8HmexBVvECGkbvW/fYCO2jgHcbVaAGoxM4Hm8TXvihUhrsJi4zZOZtZV7LS7J3wPln57Zp
	rAZjaMnohavi4OfbMwxPU9tCaG3jyi1MamdTrQ0giJNMArbPa8NfEwHAKY4UaT2iyqnTswtjii7
	fTPPbnmGtsS8OBa76NOIdN0akLHuyTBAeVYmlbbilQmIiIbkQ4otOQI2zE0k1ubd85L7Q1i4cP/
	sA3SN7VXzR1V5+vbfRAxqL2mD
X-Received: by 2002:a05:6830:6105:b0:72a:47ec:12da with SMTP id 46e09a7af769-734f6ae93b1mr12803844a34.10.1747763144649;
        Tue, 20 May 2025 10:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3AWJ9uAeCfw9sar35d33Ek9MAdyx896ipM5BBAfGt/Pzfhale/EDKFdfP05r9NlGFw+T6hw==
X-Received: by 2002:a05:6214:1c8a:b0:6f8:997d:fc70 with SMTP id 6a1803df08f44-6f8b088f5efmr279993176d6.27.1747763133101;
        Tue, 20 May 2025 10:45:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2437225e87.86.2025.05.20.10.45.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] mesa: drop the libopencl-mesa-dev package
Date: Tue, 20 May 2025 20:45:26 +0300
Message-Id: <20250520174529.1173460-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VL/dn8PX c=1 sm=1 tr=0 ts=682cbfc9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ens0q7-39xlkVPUaklMA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 4e1BeG8eoFCVPvhxuu2i-3ccv-og6sCw
X-Proofpoint-ORIG-GUID: 4e1BeG8eoFCVPvhxuu2i-3ccv-og6sCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OCBTYWx0ZWRfX5uklVl1p4pCq
 3m02VudLYgP8QI1vT9UAR8SK09ehxFkRTAkp0Im7TFs8BIQjkZlwFdDsL2PKkvtMmswDXhMvCC0
 7Yz+3jdlHZwOfkWeVSn9B9fa3DphCuB5KGNEVaD8RY0X2joCjD7d7h11w+SW8u/aPueqRRj1fUl
 pmbs6pptomj4yfv9wEBGmRejhfk6T5kVXaWn+8Qts/PJL5v2Ij0C/aH0z51sHLnkl3Q9QGpohle
 YnwWgv5U7tmX2+GgUTwkVex5dDKfex4AoERdIWjs2I5JuFQO31B+yp1UkqUG6Pe2W41zQ8J7R98
 o+Jd7kbldtUvkfGgujHM92/baQpjW/BRSEz2pRKsgIzePTO9G15q7SdhNFAUsi7DaLCMFBNd4Fg
 3Ho4mVM8agwmXF9q2MAxqJihQouvVcFw+V/fYq93HvVnwnnarlJMrxZx8GMbcp5UJoxto8CX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=774 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216928

Thre is no "development" package for libopencl-mesa. The main package
contains Installable Client Drivers, for which there are no headers and
the extra .so file isn't supposed to be linked with anything.

Drop the useless and confusing libopencl-mesa-dev package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 89ae71595991..02e502e58737 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -261,7 +261,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
-             libopencl-mesa libopencl-mesa-dev \
+             libopencl-mesa \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-tools \
@@ -349,7 +349,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
@@ -363,7 +363,6 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
-FILES:libopencl-mesa-dev = "${libdir}/lib*OpenCL.so"
 FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
@@ -375,6 +374,9 @@ ALLOW_EMPTY:${PN}-tools = "1"
 # All DRI drivers are symlinks to libdril_dri.so
 INSANE_SKIP:${PN}-megadriver += "dev-so"
 
+# OpenCL ICDs package also ship correspondig .so files, there is no -dev package
+INSANE_SKIP:libopencl-mesa += "dev-so"
+
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver = "mesa"
 RCONFLICTS:mesa-megadriver = "mesa"
-- 
2.39.5


