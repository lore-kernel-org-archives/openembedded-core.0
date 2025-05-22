Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF26C54EDA
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.25579.1747925178331564657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=URmEWmhT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7IuBO013436
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qGioBWIlzu4
	shvsODepTsbBy2dUbWGvv14mzb+KMyqQ=; b=URmEWmhTiOybPVdh4JsbsIXQCSl
	eC91guMOdxecU9P9lzqB4kbrwgmOutXdL4ymnjXtm+uLDzd4F/kB10kNGXU5pgNg
	IojbI3t5J5JiGjo6DrCYgPM07fqIBtSqF/4oZAV/KvGs3V93wE2Z4lssY62mLdTO
	Y99Q6Tuai72Df4EXJ3kU1EjhkfQYbDX//gsi7HrE9tOzRR63rX8sFmf0MbfrRkN7
	GjK2sVQPWrjoaBRoFE0i3gN+HXVpVx4bPGM4y7V5K6e0dUYT98U6l3IyGuU2LaJ4
	lqTijPcoxUpYksix7LKBl6OxYajuq1OcqBPaIgrXId1CYFECfP/Tm0H/E1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5euw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e7922a1so1716019585a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925176; x=1748529976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGioBWIlzu4shvsODepTsbBy2dUbWGvv14mzb+KMyqQ=;
        b=jhTkOIVoEY3kGZCbWb7t2cqHk9zUIcPPRoNDFpkMYF/a012cQtPdYdxPYYmm/kOCFV
         7/yAZly2iQwe6jELg7X9rfKh/Bdpaw+HqTOHlTQKhItr59hZefvBeMNF5tVe7+NpwURB
         A0kDGabfuqcYPtkKZAJZc7NPiR0tYyvQGA2mYQ5Vm99YdClGAjRpF9nlfX5pJYngKyv0
         1PJNdF3PCalEshUUf2qjr+UI/4rbSMmjdZJi/tOm7n2VQSJ/LfpjA7z8olOdUKgmgdHb
         WLWvhJ6gn+LVm/xG+S7s1PQWgkZjVmbgCOXi80aoe2aPfpQKFDI3xScwowgphFlOHK+T
         ZtPw==
X-Gm-Message-State: AOJu0YzHUshm2Q1axBUi3GQpCz1Xi6x0xALUbBonIw6jwCVDYiW+lzdA
	xKwMYvvchL5yFFuPn90pa+qy1b6f9B7trStocSiq09d/TtYDEFVQHkjAXcAQsVVCKBsGZP7KtPV
	TMyd8ps+d3zSe/oI2f/I13ax5EM/VponIUFtOEaIox8Q42WskfAOc6We68y/V/1pHc4x87nBCQh
	FVGW+Z+JzyTJbqjd8=
X-Gm-Gg: ASbGncurEvbP0Qd43x4fiNqZBvmJKilaFQEDuCQZEHnhapGVlzaTiAf0NDL6lY/oUpO
	sDbmuVFvVY8ZGIG3jdy/AYcZMJ9WpjVMp0YUhoII9fKEefoK1X7NQE6QYqxd4tN0PclVbC40v9R
	Vy70o9gTv9eHat3pQZX1dSNJV9sGA91Nly+qbA/VmW2D+hFQ6Tt1DtRrteyabWAqLCO7wjmflNx
	hblfoYx65m8AlpaHh1W9wXYepM8RCSbdD+TmQv3+6Z4E3OYdHhETEdulnBtJYHrl7j/a3bnyet4
	rfneJogpk/U9FKxPcgKM3daEj9J9jiNYgepyR7u9TE4AXwvc2TMnjMt5eun/hAl9vNzcTjhT/fL
	ohRIMBhbROR33Wck6c4ZfisKY
X-Received: by 2002:a05:620a:4407:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7cd47fd2579mr4160909985a.53.1747925175959;
        Thu, 22 May 2025 07:46:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcQsHBGwKYtBS6l58W3i8wATYlIJOo9XfVqXR2n6CKNPOOVQHLfpCTQqAGCNU2rTl5QgIdpA==
X-Received: by 2002:a05:620a:4407:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7cd47fd2579mr4160905185a.53.1747925175472;
        Thu, 22 May 2025 07:46:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 07/12] mesa: drop gallium-pipe support
Date: Thu, 22 May 2025 17:46:00 +0300
Message-Id: <20250522144605.2876771-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfXw+tR9ZQ1fK6+
 xMMXVzTr8hbOX3GbIWXGpOEOlKxo6E2P0oCAj7IIu9Oj40xGRTt+s6Gn/3z2NL7CZ03YxA5rMJn
 q57OFD3+5K90fGNqzdc1Xzx8HVO0k+oZPdXQvNwU00pG0nYsvlV6Siazw5FU7D3SfF7p4qCkoqH
 Kw12F2TWkU8wp164LWxH0TQm1Y8wlp4MRo8vCj5ExGiuhFK7jQ4Ty+LeHCoqgYgWM5qJXctRqU/
 QYXeTXyL9FyoD7Y77Eec0RqnaSBglEcdYhWbMF4QSvr/fT/YDt/pE1Xu8CrqYUaPLYHx3l/UCMh
 2i8hVSFyS+/o1KtSGevOSqWX0UUwpFuFZaWCypj/Td6IiEuOFfLBjLk/nlTbXYK2BCXxAmbXDxS
 rBz/Ci71yl72dwolamV4rr7mLMxYi5EN3lSc5lcfAMrIVVzCvdaGYU3ev9l9XdIJcejXAJc2
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f38b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=UHK4iJJ_pXMy7vzKq9IA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8Vlx1fWCLMrMLA8vZkRaRkXcepP6Sy83
X-Proofpoint-ORIG-GUID: 8Vlx1fWCLMrMLA8vZkRaRkXcepP6Sy83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217118

With Clover being gone, there are no more separate gallium-pipe
libraries. Drop corresponding parts of the recipe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 98860a0d7d15..c97df9471505 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -317,9 +317,6 @@ python mesa_populate_packages() {
                 d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
                 d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
                 d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
-
-    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
-    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
 PACKAGESPLITFUNCS =+ "mesa_populate_packages"
@@ -337,7 +334,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
-- 
2.39.5


