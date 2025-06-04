Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0081C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 22:29:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.29932.1749076142783003748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 15:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=N2QZ3oMT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554L1rqL015518
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 22:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F1Iccu7Uk9a
	uZCAC0bM160BogTE7TdG5A7kbeu+4BWg=; b=N2QZ3oMTRyxR1Eb1oCXk1Ff5Eb8
	vKJRWH8JwBzP4Uvdl3b3vouQ3/5RyuO3Thy7mMubm//nt9h+KJU3hCA4dL0xLQQW
	gj+JkRfTQcfz+Hm1jnxJZz0oJ6IJFdsN/FMZvDBjZ73t1Srxi+wagTi6yF5mRwkH
	p6GJJq6MbMjIth8sWI0gUt0xygQ8XU7Bp0I/MFt2kiaN4ZfNThFFEnmwKYGth/GD
	/wOjXmTJBwnCRWqWvoe+ozg80+4GI5AJvAnKdw9K49aSFgIYbdyn6xJUlH8FxqMK
	e7EwfP24LFmhp//eC09SU9taoo/OqJUEISLsqfw8MS1kovfPrNZl0FdP+EA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be835ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:29:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso74232685a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749076140; x=1749680940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1Iccu7Uk9auZCAC0bM160BogTE7TdG5A7kbeu+4BWg=;
        b=ZeSYuFVTxd6MKTTu+awsDs/VAMiW2E8PyPrbFIegKwBy/pTxPtkZXM4Wt4YGkwCi85
         ZJSguK6sCF713/rMRqB9dbwUiEY5L4J7Imbd/9Kns4We+DgbF5vKnMOa++8ElTwjP0Ox
         GLSNK7bnBRFwm8j47hy2+VP7EliPM1Wr6028PFb2bwgYWWZclJDFJX2SEn2UCcNPllD8
         MTHJCsWjFsWQGkOyVPNFCQL0D0Nfg6b3wD9nSfJ2Wub4JbdMBEZV6HC1YVCa61GoCBu1
         albSQ8Wh4Ex3dMpNiZ3FyEir5A4lDJxvKui6ZZRvhk7q0jubuDdwaJ8AphtMQvMu771G
         RPaA==
X-Gm-Message-State: AOJu0Ywhxa4MOp+/Z6HPkd9ZSF7FiWTp4EegJEikuPv0/yJtkO9JnD1D
	yoDcpmdNXVADQZf6KHiP1eU3P7U6U4l+lppwfQr2anLOxUcyUHU2wSdnI1pYUKGq5yXsyY6V9CF
	5z8DYYxk1Uo4n4U35XKvQuOsxlNTaZND2r2cmlfbMKwjbX3EAd/sAQ4KDfEUsgvg9fSfcJdypWF
	ZdpIotC2fIkrv3dxyl1g==
X-Gm-Gg: ASbGnctpECUzccAe3dRIw0cGYKlaUxfgDhf1unOweA6ZTV18h5+69s4G8Dwex9ycz7g
	ygZk533WlY5dpCbMW6Do/9IZFwIIcIun2/iV/UbrC9cSItUUIMB03gwYi9+ECVxgLbYoQ1dBNDg
	deqpHadC8IzpQYGh2ltlHu23PFV+U/9+VV9Wa4vjm8etHhJywsaAZeVYXr4ZPdKBtRGI+yaa800
	WsAlTE1inRAfmpDMlH7e9ay77Y8Z6QHb5K9s7I47WauIlus7FXhFL+ZyDm44QoNq4udHqNoYRFW
	xFR0tPHkGFBNmUOdWCb2plkmMki0QlgMAglSLrMwvEvbaq0XHUIqu+7xnGkflI7k67drkrLT+0N
	JchC3MjvrByYo+zDevKzpEo/Y
X-Received: by 2002:a05:620a:179f:b0:7ce:d04a:83c2 with SMTP id af79cd13be357-7d21990a646mr700035785a.50.1749076140377;
        Wed, 04 Jun 2025 15:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvw2nI3B0B57j/jyCjYJIcYVVN3rFvfvXWOYdC3xsBaNAT3IcSZqTJzzg9d9MB7EBYGB/N1A==
X-Received: by 2002:a05:620a:179f:b0:7ce:d04a:83c2 with SMTP id af79cd13be357-7d21990a646mr700034185a.50.1749076140041;
        Wed, 04 Jun 2025 15:29:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910e38sm2430327e87.131.2025.06.04.15.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 15:28:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mesa-demos: drop osmesa PACKAGECONFIG
Date: Thu,  5 Jun 2025 01:28:57 +0300
Message-Id: <20250604222857.689289-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604222857.689289-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250604222857.689289-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6840c8ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=zMOb2nn20GyaTNwLAMQA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SACKPGk0UAUnfm2cqXtGJW5ciOXwgb3I
X-Proofpoint-ORIG-GUID: SACKPGk0UAUnfm2cqXtGJW5ciOXwgb3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE4NSBTYWx0ZWRfXxUH2ORmneXYF
 FAMuugbT9jz7FoAoZb4g1iEZeIZ/p7JRBtCW+MniZCq7PjOIt9knxzJULtWne/ZDgVu9uFg/VWY
 Itgl0UUMdw3PdssnQjZEls6/9+TIjWtBqXYkSvCGOs8LxLsnhC2f6IaahFLx5ALQtFDiZraUeIM
 sdbvxYycHKJNqEbZpUDIWH5ip0Lb1duwXRSMfXBWVx9L0D4DHXN3t6fJWqc3exuRZl4mhGkHwJ5
 EcN4M7keG62U/VXmzOVjdQRRRbAueY0vGl5sU+ONCAuW6y7177eMQBELMiAxU/hPWv0cp9SqAk6
 nnG+dyytfPA2Oar+kLwPRlzjc9iElsbQVdzZ1uPN5ASXOqGiQswkIlITM9NL0gi3ko8fJqLJn2i
 pqzZaokD1eko0wpUCjX9iFCVRpdN9ke/18wYIj38KaylSVI4yiXyAzgVMQcfacwop/ps30bI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=859 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217969

Support for OSMesa has been removed in the latest Mesa versions, drop
corresponding PACKAGECONFIG option from mesa-demos. Note, there is no
need to pass -Dosmesa=disabled, meson will detect that the library is
not available.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index d92f1ddc5baa..a9e84039d2c9 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -30,7 +30,6 @@ PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
 PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
 PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
 PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
-PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
 PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
 PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
 PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
-- 
2.39.5


