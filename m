Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6213BC54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25581.1747925183710423453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fC6lkVhE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7RnHn000716
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7byshJKm+hY
	1PNV4t8aDe741l1o5C1Z7Xrxhqh64KVs=; b=fC6lkVhEmCpfjNyOVEF+qa9nzka
	W4qfW1DezH1Cqj9PLp+3aatOEk6cEnJJKQ6wj+HNKvAU5UN1Q4WPsZBkf/dFWUS8
	2W95FXGX+dLQKoNMu10FDIBudtlel+rjfWZE2HYKqff3Myp0bnLHcnIkJBf0OsjE
	IbvjkdPwVvHKLYltnJC3XIPmmznZbUkLSacWGZhKhwOD4LUpwZeerDqkZ3PGTW3I
	4BBrWXHJIlSI2XsEFsep3x/fsOs5SPH9SvUBZFHZNl6tlDImgZO0IlGMTO7n8xck
	CND7Cs+7nf8D/CNk0bJW3qvF7E/h5mLNkZcV1zHj2whgSrj9/cZhPDIZ1hA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tn1u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caef20a528so2087001185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925182; x=1748529982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7byshJKm+hY1PNV4t8aDe741l1o5C1Z7Xrxhqh64KVs=;
        b=MaX0M+kyBEwTvyLj1x5yD5jH/fS9/6w6XFfNxaYf6W60QDaRAa4oxSZmJBik9qDIph
         pf0fJniOreMiF0sUmAdYEvwZBx0eHqoOXEFQyv2C5eI/Jusr7RZl2TkDQb3k/6dCyDiC
         +BbbtVR6LuIS83QBraLRkgl0JHiiblqiUHk6q8xqX7FiL1ois0a6XGyQ7g20963qllbn
         N0j6mSHG6SGV6CL590pqR2So6F89OGNeZ3PPRAL3l6tZPy4Cn4V/1HoPIIFNn2xKtfe6
         mcgHelJPcd4helROKZkv528FA1AqNwzuYtfo7f2lfaU27dGAs5bZbwm0VDHhtfD5lfB8
         C34w==
X-Gm-Message-State: AOJu0Yz4KKwwwobkHLINB5pssHKV9o0IDxJ4mUfzx241Hq53lt8f4doA
	ahaw59vCjKIiOs7iqu6DTIkHJap99EOpGWLcKw+UM9Md3ya8VtNhK7fMEkVEb0v8FB2q4M+J5+s
	MvKUjSQ45j6u55aKWrhbIa+f3LluKRzr7sf8GJ0NQB1r1u0Glk4JGCjjMfru3gz3+CJmml8KzC0
	vC02GJywfY9uqBAo0=
X-Gm-Gg: ASbGncsjoulteFzRHzN3IWpXloYf5xc0eFWY+q4e9byvfE+YGo6xhbx/y9LnnI8AGAx
	8jgCdjlPQ3Tz3CMDfBjiywTiSbP9kC7Nm5vi2OlKcalfqbnOXo77+YBz6kzNwWk+hNs6Vo+2BXQ
	0/0NxCkYn1sIlOsKOQP7KmEOxVWUMSytRRjCp0r2Oy+6hB0smSKDjzj+aJ8y8nytBhBPa+/P+Ik
	3Bl8p+fcqxMaJ9o33gygBOXxtY//Slifv3AaYmpvxbCzMrvStqu/QCfcYNCj3qo3v7xeX0xNwgt
	FqHm/gl4gr/ZB7C57T3ySFKBFc08BxhQ+NZT2b5Z+Qsc+GPl+/meU3uzxoo52ZSGcmSviKRDgcA
	EIxjGLOHKu86T77g3Baiz1ip5
X-Received: by 2002:a05:620a:471e:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7cd47f4f1damr2854554985a.34.1747925181537;
        Thu, 22 May 2025 07:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEVNJoVqIk+zJMaOLExPpwzHOK7fI4mDg4zfn6uG23eqOL/Qc1Y32ghbz0utaBddUyyM3bBQ==
X-Received: by 2002:a05:620a:471e:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7cd47f4f1damr2854552385a.34.1747925181166;
        Thu, 22 May 2025 07:46:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 11/12] mesa: move dri_internal header to mesa-dev
Date: Thu, 22 May 2025 17:46:04 +0300
Message-Id: <20250522144605.2876771-11-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f38be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=xIXOYJDBqi0fscj7eiwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4dYoWv852TZDE2ZMC1mCzApGBzKivO-M
X-Proofpoint-GUID: 4dYoWv852TZDE2ZMC1mCzApGBzKivO-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX4nEfuX9Cba4j
 M9NPy/gxsaRmowlCYUi5QssGSsuOZ7qXcdR9/njJgrrSq64YqWdbLmCzZgovaAMoHZzNItzxjw9
 P+o03cvFkIOBT+if01fuYHJqkJmsN+MSn0g9ZvDGqDaKQrLUcshZ1LNrAwYCdKP1ixxKYFigJxE
 fHR+bftOxQhd74lPOrZDta2yiCHFhIKiLmLAr+62VwKZiJNhZRN3WNXDCMf9ZVdgEKxonPkkwYf
 SJaMHC/t6EAl+EY82nDpS803KOmB/VKiN+BR1hOY1K7MXbcKYhQ7BzGKCV0yvuF8TNiLng+1bE3
 2UFKNx2v6O+hICIdh5pTXcKvNCmnWCjxocKhS/7+365UNZaoJH+SFjiVeG6ZIkSlSza6Rgd8fUk
 nVFseTxJOfIZdJPAhQyugaUvW16qX7QmWIKh93+bNaoyhd0wsmD6Vudjtvz6enToddwMP0xw
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
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217122

The GL/internal/dri_internal.h header is not a part of the OpenGL API.
Instead it defines Mesa interface with DRI drivers. Move it to mesa-dev
package to reside next to dri.pc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0ed6b8a38d8c..7bc7c2faf7f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -348,10 +348,10 @@ FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.39.5


