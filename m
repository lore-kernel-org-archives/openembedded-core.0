Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAD6C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.25580.1747925181170575007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=j64l0T2D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7IPcA013417
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YkKaOkKmq7e
	r3ZblHaxH7uQS1imbKEW7NGUW3VwdgoY=; b=j64l0T2DIi5GAa9hMHjaa3jUp0D
	UnZbZGjCz+0uewiCf5yy94On8nhKWw1odx3og2np9yco8juf5SrRt2aWuqXe4Lfr
	XAtF0Hyl6TVy+Ar2BkHeKeq0XI/485kZA8Qe9IP/dGeRGe3c+IRRVhd0/DzV0mfq
	9FkfyCLOspvNy4LFQGqhlS5/t8qOdn/cFlymYpJxfCEvlVYhZGZU262LDuD8Rnhx
	eYv/CJVlMH5pcwu3X7bBREyvJ2vmkFU+DrxEIQgsoaS2CzQgcIeUzzB2XKTvUnQE
	TZbRlrAw24F8bpyRHilqG3OoaO3NFMYER/KeHAgY9RAewO7mT3xp4L1bvdQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5euw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72bbb1899b4so3574726a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925179; x=1748529979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkKaOkKmq7er3ZblHaxH7uQS1imbKEW7NGUW3VwdgoY=;
        b=YEfQ7tjZWyes2/NHha1F0e1AHkHtj1iLzloCFK7rdHy6glSD7pAnjnuDpdAx1limoR
         wufymOnYAYzqRjgBpnigyyYdshIB5yl/2vePiz/TI/1aEG9kAu0habjZqpfKOLt60bdb
         /NoBvx1zr7CoornrRG2keCJ+X+LSR7k8PoDyqvhEJqXrHVA28xzahUmVmBuSFf7mugo/
         x1co2Nb5oKbPkSwe7J0WUiNfi3RbGR83g/Pa76WBJHiAjZXcFwvGgBmamNNhxi70sPDg
         8UmcI0QXDH9mAIsvZp18IK/qcdOlPynL8T0InUPENIxfaZzb9ghgAI4jByUFUpgEuoJZ
         eiew==
X-Gm-Message-State: AOJu0YxA3iZfooZu0rpm0Kc57xVkLCs5lhD7ej8bp6oyIKSY2LP8MsW2
	uamk5IpRn9QatKCHndRHGLhggydqZgXZI55MdpK+NXlgu8M5cWYap/e3kjdYHutgTUTIb4jKwdU
	J0dpXYr2/e5F9C8ievt8EiCRS+yhzLyzv6yT7wmmmUW6mwrcIcKea7xPCwlV4kKmEm++/KbhYsO
	seumGAoG9RHjv6lKw=
X-Gm-Gg: ASbGncs4CaJ8SQhIwXVKAC9rDteZvu08h9mHhSy7bAu/jAouONwVuZqFB1itjIHEhBL
	kxCU4dMLY00SjQ0KK5EQJnjn02UHD3WEZV/o3okXe98WpCAKu8kJs87uf5YA9hSNqRG2oGubQ+b
	yxUuga9NpQrIBi0rbXyd/MARwzLTLwj4dvBfOeRaV9tc6GFQmrpzJHwloPeL7vW0+FoMeqZWx/P
	nNJ9xvGNWhWnNjOsZDn2R2UkKlCxOPSbtq/fFtO/F9RVSb1E0nW2gIz2vwxuoMUIG5x9EgX2Pvn
	Frw/L5GUy0D1aSepf1TDjr0PPYKdSJefRXNRbbxE7FXyAop/Qks43L1VLK0lam2gbJgYqOtK3P3
	XwShGGfbqb2fCkwTnNDYFip8n
X-Received: by 2002:a05:6808:4490:b0:403:3660:4130 with SMTP id 5614622812f47-404d87b89fbmr16498264b6e.27.1747925179104;
        Thu, 22 May 2025 07:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1kux06NLqNRUyTt21JlUdOVG/PSuZ0y064dN+VbEb6cSvNPCk6KoiWSU5ZxqB5Ri+1XNKUA==
X-Received: by 2002:a05:6808:4490:b0:403:3660:4130 with SMTP id 5614622812f47-404d87b89fbmr16498243b6e.27.1747925178581;
        Thu, 22 May 2025 07:46:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 09/12] mesa: sort out PROVIDES for the glvnd case
Date: Thu, 22 May 2025 17:46:02 +0300
Message-Id: <20250522144605.2876771-9-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfXzkECWquakBem
 cfIBFTrPmTKVGJhjn8yv73ihMlqxBbydfHiJspRa72saBuWDAtjJYRQ9VdfG2KzcxL+lVGWFXH1
 lN2jpcRJbfDhUqI3il99gREdh4aetCQe2LDdB1Oo8OrFxx3J92nBtepRtw6Is4pHPwxSv2a9xTu
 KXRRAOMUmzHSWOybJGSidWN7FNIeLePOBtwkstWcB9/9ZfHev2FEHq8cmbeVVLs7ZfxSgA5JpeL
 x8s2p1lC9gzBtvgCbSsl+FtAt1NMPhFyLaB7oxjg3xIVUdrbx9UxQaQUB1HDSoNF3ibP8kwQ8a3
 ZuM5i7cgJVy47C5ppun4gqD3Iz3+z1Q5hLHMPPX/tJDVJE98cIB1ZUGbWTk7z38P+vtLQyQttFr
 pugiqcx37kfEUexMpAisdtc53EpoKmexRWrZ0t1jIjkUz9taGdxJ2dUBMfV/Sb5Wng1LIZHJ
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f38bc cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ukfi0iLRH52kbOtYnoMA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: BVjhaqGPf56LfFPcMm_g4X703nEvxq9h
X-Proofpoint-ORIG-GUID: BVjhaqGPf56LfFPcMm_g4X703nEvxq9h
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
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217120

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
index f5d5539a1f99..2d3846ff8f0f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -37,11 +37,13 @@ do_install:append() {
 
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
@@ -275,7 +277,11 @@ python __anonymous() {
 
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


