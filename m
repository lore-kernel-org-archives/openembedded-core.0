Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0FAC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25719.1747925175554882477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dGQGBZZ4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7L6Si029063
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ip1I2hfJETY
	wmuoFzaoz4Y0mZ3RoR/aZUIxhZX+ulJ4=; b=dGQGBZZ4yBhvzBqYAI6LGtJ8R/L
	Wuvz0N8zRqs6SJQkeLOeThv3QRqJI83h8SYeNp7Ge0WLutreJWtiMxyJ/ToOLV68
	WBzU9YetQQmltEjsP0hiPW9K7hxCasCnTXdQ2F1phRKRcQ8N7TWjGopGpkC5WahA
	SBneFDqLYvR/BNlie49FZWoVeqAgxd3GBFP4wBBqnm8bivxlQohphuPtrpRXBo3X
	gIawdCN6yASRjXC1Aiug8MYW5HFaB7Q1F/a8W6RyENGHLUM+/HIsF9cjoBYUijT2
	sA8Pt7Ci9Ky5HQX8NFW+X3EjK9ndlcH+2g5Zs+uYzmSf7FUmuo4OjBJXUVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf46spw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so982059685a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925173; x=1748529973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip1I2hfJETYwmuoFzaoz4Y0mZ3RoR/aZUIxhZX+ulJ4=;
        b=eLR4ZB+Z/f36KfuoB70v+JyzOOZxqO/+BiFslTfpLlZmaZgty1YLa1J7R7VLeN6qAH
         ddeNlyAU5Fj0tRgxEwY6JG0Bc1GhQDe9JhiVRwRKONfv5vuenuIkelwg0XZ23qy/9MLO
         p2YcG0Ir6Wk4jrOvmzBCGA8ys5klVfVwCXh6b/QwgEsT7BSR5Y/tBbWMI/+veRDItzJt
         siy0hpe+9tLrZmGpao3qADXSIise8SWul+020KSJ7lm13jfjy3qV3NOIRhWB3U76Fyct
         6L4ZQPEyw5OzP6tCb2Blbu9BAMAtH7Z4fhyxIA7IGA4BNgKfv2ObmZi+X8jyIWgpcuFh
         kpUQ==
X-Gm-Message-State: AOJu0YxJ8E08x52UcQwORnJdt+JqAGONVeDD0xsGURITSzfgfxLSQX6Y
	aC1AJDjjAHuYX7roDRVWd2NQnpWULUX9bjAF0gtPB2VNu/uLFB4aotFcka8JhntLV2u+ZE+hUFR
	fsGoyQMK9hKl90L8RfISfruNrQl3gbtzw88AVeRAIVXe6wOJzHr16ATUOu0cMWuhboTbZ0XzbqM
	5+FtmMwo3CDNSQa10=
X-Gm-Gg: ASbGncvT9Ie8NwkMbvxEUPhJ9I073GfO1fQtUc+k9c8tYEZteik8ttGUe0Wz0iBfdF0
	TVEwB52ADVkLAuoVfMKfHs4TR5SvM5hP3bR/mdls+G++fTc/MjOPYYawPsowMa7OK7W1hJdl64z
	dUo7Bpfp66dqhbRvaP5aYCeBP0zkFAKbjPeZvtzWwcRX9FY0tbUP6y1b+B1HfVLOH1eyU87Q0A9
	qMCXzEdVCY/4l98xevKus09aIrRRS1Mb+dwGrxGVg+svGYCTbDcl5S9H45gChpPJzyvbvBV7xtC
	4GildPYQzaaHTlBtFQytq7PVneJS+UeVWSEzuV++uQhy7HAOES/MtaPCkHnDjunFZHRNG3hw6iW
	B+VhC6S/90KAwVi6z6v/+ehxj
X-Received: by 2002:a05:620a:9176:b0:7cd:53d7:4f8e with SMTP id af79cd13be357-7cd53d750demr3584008085a.8.1747925173311;
        Thu, 22 May 2025 07:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXB58C1LJ3QdmxU6nNCn7onm//4emgW6g/7Np7t0rZY2aXgiiiKzyMhnqAUxMHM3MlL2UasA==
X-Received: by 2002:a05:620a:9176:b0:7cd:53d7:4f8e with SMTP id af79cd13be357-7cd53d750demr3584004185a.8.1747925172887;
        Thu, 22 May 2025 07:46:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 05/12] mesa: drop the libopencl-mesa-dev package
Date: Thu, 22 May 2025 17:45:58 +0300
Message-Id: <20250522144605.2876771-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX9VmIsUlMNOUu
 BzSfdzTRC4udygS8uJTTP6fk3tRooInY/ZshYHu8huemZOHTVd9025ccOHsBOgtlB7tUhdkMOq0
 Vaso+oKYDcZhwtkKbyfTy2rS6yy/voaAVQy/8YkV7Sej8VGvTTtI7K3F3jQaRPtIfp9D2o9wrwo
 TtlEp/lV7Yy05AwKq2fVjH+fut3/csePJw+IckOlRboKwQ83Dn5VVs2qHdmP989Q5JkR2p/VeU9
 pwrq72ds7gJzJbnVGzpSQSU4TywEtSL+1lK6QAsi8xbHZiKP/mU9SndjJJx4mLTJFSSDCQpehhI
 1X2rd5MY5AYALD/e303H4a6Rq5AEmeg2oa5CnOyGMv+qNxtS9vO5MGNdKskv2FhNkWnU4Cwm5Oy
 fAl63ZHFJtee2jTdgcZSk8sYjrpxLGBwKODdGvnfXGgAebxVVpK51NH54cMn/KIKa7NYN5SC
X-Proofpoint-GUID: n5Tby2j1cnPI1duTBKu2DdDjq3zJh0B4
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f38b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=Mg_RanN_8yc205Ew7dQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: n5Tby2j1cnPI1duTBKu2DdDjq3zJh0B4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=812 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217116

Thre is no "development" package for libopencl-mesa. The main package
contains Installable Client Drivers, for which there are no headers and
the extra .so file isn't supposed to be linked with anything.

Drop the useless and confusing libopencl-mesa-dev package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a856d11e0734..a309c8023bd2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -247,7 +247,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
-             libopencl-mesa libopencl-mesa-dev \
+             libopencl-mesa \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-tools \
@@ -334,7 +334,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
@@ -346,7 +346,6 @@ FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libopencl-mesa-dev = "${libdir}/lib*OpenCL.so"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
@@ -357,6 +356,9 @@ ALLOW_EMPTY:${PN}-tools = "1"
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


