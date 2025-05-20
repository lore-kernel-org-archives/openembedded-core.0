Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B21CC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:45:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.27414.1747763139643504457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 10:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HwX1kIwI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0W3000728
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/veDyPtBGR1
	2hmWz6bhfehHfpVuyRP9U5v4cD2cbHjg=; b=HwX1kIwI3ll+RyNXlpul72tHkok
	hUdIcntOCM+D0eKhtb7SPTNTwCrEpiXVStdeVLeIHT6bBS4u/hnTDv1ob+1XYLFv
	4gYO/T0szdwpQYuBuM9lIKpiVwdSduFpukbP33hyghnKOB4mLCims3bNgb9z2L81
	sKt7R4upIolBG40BQni42+dmaoJYk4IyRp9vjDjnVVqRHQ3QHNKMZlhFE22OLJcD
	9zxZEJZtmyhb67e++7eB0cnsQH1qk6GYN1Zwrtbf//ZafSbhFJ6gg5XgkZzMrZly
	ChqG+9XSgtS2oh+sDDAwgzMmOdgXYC/lYskCE9jbpvUxwHQdDKUA7RQcuVQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4r5wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8ae3c3d80so98537176d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763137; x=1748367937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/veDyPtBGR12hmWz6bhfehHfpVuyRP9U5v4cD2cbHjg=;
        b=oxgCdkMwax0iuNmWdYLUSBCzAxciSg5FByDMPTD3w6CCDrl5UMUmvvB4xB7f5JsGUU
         x+EqOCNyn9o3GJGFXQLqdPb93kcfXwFFZGKStq1x/J7CWzhaGz9BdWsKyXT+onwkhARB
         XzD2EmDoMd6gBre2sNnJmciJKs+qSMABO9z6gfP92+8h8/61hTg2RmN5RG8bvyRRjAFw
         QAbEGesjB8n201KQkIo7adF8uDTqxaPQqQ/n6HNKgLMxmxAt6PrTnU+lidj3YO9BH+ec
         g5/YPlS2YS/nupnzio52YTnTTt8PtEb2tqcyMu5b82FwDRNruTi9XObKcM/0C90Uu22O
         HhVg==
X-Gm-Message-State: AOJu0Yxsi32dHRcXV/W7YlFUFlOJx3+TSghnFBXQ9rUOFwrE12RHxH4F
	8SK4AyGvSgUqzcqt6mpZ5O8eh9SyOqJNcraqDJV/lIeObQxxcETp7zBrOF9L77KtQzcKD1DWlD6
	jDvPVdJAIu6K40AnYRFAWhders+QmPvon7eaZC7lwccqm1yciIbo0eQuvPCzlZ+Lns+DK7ETMPR
	axCoXSl0HHAQ3ma035Xw==
X-Gm-Gg: ASbGncttrsYo4GYqs/5R1rJUd3YobOR6Nn5C/jxeqeFMmjJIveVeT1EX31I9VGxarKv
	LAHTpTEKAfCNXqP/QMtD8tDkjSMiIhfN5rC98YEIfntSNJKABlQsUmXnKfdtXXQvmJ//CPBP41E
	k2UQM+fidUy3o147nT5220G6jkSIVtJOPqJ4CVLxxuGUwfv4O37l8L08mhCRSbnL27JfbdmAeNs
	J9O3ADiCQPq86ouefqrL55dYLYGAxii1Wra64q1Nz3pYIafzTO20G9IAN8Yz5IYYBAg2jxRlRI2
	m+3UJ5ZtlAsV9Sf5Y8UUcAZ4eTqtsfu1xhNdKaj7gfV1+/NdpI7iZy1Hq4OzcpcWJLWQ9YBZq8A
	nfSN01etHAhYb60vI0tMTZZI+
X-Received: by 2002:ad4:576c:0:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6f8b07f6601mr247615336d6.14.1747763137314;
        Tue, 20 May 2025 10:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCbOJb7E2Kdi6DU5228Nhs6Kwv0rE18GeaSvRhFxGCyBLnB9jYNrZ0jS1qLydAtJhuzKk2eQ==
X-Received: by 2002:ad4:576c:0:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6f8b07f6601mr247614736d6.14.1747763136707;
        Tue, 20 May 2025 10:45:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2437225e87.86.2025.05.20.10.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] mesa: sort out PROVIDES for the glvnd case
Date: Tue, 20 May 2025 20:45:29 +0300
Message-Id: <20250520174529.1173460-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRvE2Ynuu4FyyPy5gwH_Je-rEXTKF4AW
X-Proofpoint-ORIG-GUID: JRvE2Ynuu4FyyPy5gwH_Je-rEXTKF4AW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OCBTYWx0ZWRfX5x1SSSpLoC7N
 WmM6E6hoVsffl7nbQA4yVQnfkHP3WcH7AxfcDl9QKP2Gnfd+upaGveYl3Ak7PAfkEd4UQlYmbrh
 udLOY/niERvGWrSnvTZD8nMukpBZuVMkSH9NZaIEFg1wwByJs46YxPvUawUB5Aji2kHSCVNRbAi
 EFP6SZ1YEATup5nZ/93TGh+RilQx5KLWUUc068HVBKiJdGdhp7mtP4j0p9rC3qA08UIpQoB2jz7
 ZrC80+f692DaxAcZz2UFDhiSH6Oe1yQPcs3UU8aYZbOIT5pIxg6EchlBtkqik8dlpYPhTNX23AO
 untVzWAJJIS6+9zxcm5/va97QYvBZ9Fm7h8Ls9sNxL/2vFnuKekDJwzocZzyE7DIcSKDiuCPyTK
 GKXVT2QCDQ6S35iOBdUd/I2SBqHothGjTfOasYqozzlrUQwJKHkk8ptKuA48LxOoSdPDNreJ
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682cbfc2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=IT-0aZdPkTPXSIIZNVoA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216927

If mesa is built with GLVND enabled, it doesn't provide GL / GL ES / EGL
libraries directly. Instead it provides two ICD libraries: libEGL_mesa.0
and libGLX_mesa.so.0. Remove virtual provides from the glvnd case
(dropping incorrect virtual/libglx provider while we are at it) and
replace those with runtime providers (to be used by libglvnd in order to
pull corresponding ICDs).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc |  3 ++-
 meta/recipes-graphics/mesa/mesa.inc            | 12 +++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ee91af87968f..4f094163546c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -7,8 +7,9 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libegl-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
+PREFERRED_PROVIDER_virtual/libglx-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 53f77b98c898..dca706efec68 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -39,11 +39,13 @@ do_install:append() {
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
-PROVIDES = " \
+GLPROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDES'), d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
     virtual/mesa \
     "
@@ -289,7 +291,11 @@ python __anonymous() {
 
     d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
 
-    if 'glvnd' not in pkgconfig:
+    if 'glvnd' in pkgconfig:
+        for p in ("libegl", "libglx"):
+            fullp = mlprefix + p + "-mesa" + suffix
+            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
+    else:
         for p in (("egl", "libegl", "libegl1"),
                   ("opengl", "libgl", "libgl1"),
                   ("gles", "libgles1", "libglesv1-cm1"),
-- 
2.39.5


