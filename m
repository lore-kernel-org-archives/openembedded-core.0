Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14115C54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.29167.1747934029580601589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LnNn9Mdx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGjVL8024810
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=stlsmVwydXu
	gHvLLsuRb0qCzrwWHYOWG7LeZ5vjEoKk=; b=LnNn9MdxX++tv9OeU/2fozum03q
	cyB4N1I8HTheboi5nMdKEtX3SgM1DdIubaxObJicIgIiNJn02ksefNUBnbRl3I3O
	LXqio5Olo6M2gfaVP5JkhOjigB7LOwHfZinUlVwtNUaS8Ayxt7KP61pT265Ig9qn
	KfHctucqFKCyU4DOR02p0/QnutiPn1nH0ltCVLFjhK2pFbUaNy5xCcFe2YuZa/Yu
	XIPuE7WnEDFRzh0kblfce5Ilzt62hMYeBLF6M+0lZAOmhydXV+FRigUGvpvy79Jg
	jKQQlS1IxFhyy3yrFy67+gOSuw4OwzkIdPQ2FL3PYwd3rkxx+3Fz1uMyZzw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4y242-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:48 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4049dfd823aso3551359b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934027; x=1748538827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stlsmVwydXugHvLLsuRb0qCzrwWHYOWG7LeZ5vjEoKk=;
        b=X8uLNneinXhoQWkR5JTwowPqHbDwTqv3KNLOD+tXi2sZTG5QtbMqFkyiTHj0syFhdW
         nTnMugekeazeVIcEr4VWmp36Z5dG60HmrkvahW+SFZ0l/s2zJUEu4mrel6vM5ymnw7Hj
         Ec51s0KDt1hS/SgEIRGWY4fLptzz82zhsXIbYvLWPTBt3gHW92c6+CxtdEjjQ4PVsBBW
         Tr7OkRKf0lVGFeB/z2ay+2Z30UPwEyvkZu2RuHHb9iE/oGzkBFyAeIbNLhtofdXxal8s
         JkPLfIE8rbPRlHryOuE+PDligMPeYiBE30PMgAmI9+Z9+tnuKIsknsK1mtHM/ho4LXtS
         NE+g==
X-Gm-Message-State: AOJu0YyE7yRJzAs1regg0dLNWV3kipz1UFInmila5bw/+am74WUlDPx9
	R3O3ICJT2/v/8FNBGjzmXN4J5JJ+siRoH6psEvrHVRM1PuGN39pHLQZRD8nXQx5FqA0NxktL8TH
	6OWN55tAXbdyBtBz+HOWOo2/TRl12eAk7qt7cbqZrXdnmSSHW9Gi5BZvl7xXqLB9IVLjR/Fwy48
	/WKKN1WwMLZvTMs1g=
X-Gm-Gg: ASbGnctkthnWVeUR/H+xt3hC0m6PSYibEIDtNSJbdrtH+MJTMHKp/YsNZA8IXegb3Zs
	XnhpIA+S9MV6yegZESD12PBxbczKi0M7eRH802IPqWyVfbdQJx+tivcIoVEgSc+SeLIQwLsyWih
	WvOaPZXHUssz3efRKJhq+XvvMdGfYgHo/bvx6Xm/hCEQoJwljPTp2ny+Vu7xyXzHULBsScPxA14
	/VFOO3Zyf/LEy/KuAjXbLe7fiuHUBR28WIjaODhfAlmWVwus0Qwyk7t16rul6xCE0HKFQiPCE7X
	Q0NT82mYgZ3FEZb703yBAkHlScRUFIs8uDwvGo+14kfBh6DsqYriLSFbl1ARmFIEiBz/onzuExt
	Q31PwptElE9gcP9zoEfncBt1u
X-Received: by 2002:a05:6808:1b9a:b0:401:e933:5dd9 with SMTP id 5614622812f47-404d86db192mr20086409b6e.20.1747934027282;
        Thu, 22 May 2025 10:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLCKUlmgXpC/rDEfZYt7hVCFlWn8W2VaO93CYCjRF5UZdf9PRaewpuFEVf9DDYxC0RZdQPvg==
X-Received: by 2002:a05:6808:1b9a:b0:401:e933:5dd9 with SMTP id 5614622812f47-404d86db192mr20086375b6e.20.1747934026752;
        Thu, 22 May 2025 10:13:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 09/11] mesa: sort out PROVIDES for the glvnd case
Date: Thu, 22 May 2025 20:13:32 +0300
Message-Id: <20250522171334.3040820-9-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tmY4HntrBL5nfBjRGi06EFET54TCyqJB
X-Proofpoint-ORIG-GUID: tmY4HntrBL5nfBjRGi06EFET54TCyqJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX3V3nahL6jceb
 E8KjUPqGT9xlUsiq+SUtWv7PACuSPolCPfnL4xmV1xClM7IBuFYYBbt+xzgF5GPBykVzoAHUdsJ
 4IvyMrj8H/yahVNyC8MVtVcE65BYCl7RdIz1jfOapoBv09aeg0vI7ixDri2eq1vyEW4ud2zZyf0
 Ki4QUHKHujsgY2DAOaJc01cXUrV7AP6ZQo8veQoFq5CaU2OXx0cPsz5MTMKbNpbmRDFvEdsA4+r
 RnasMgx1JKPKPchV2Ybwf74Cg5m4UwOuvp7MB7GNwjoK7N6tNmozwScN240tvHZHpFD/2WXhS5V
 9xe36d/JASSW1e8CsyBjSkpncy9lP02WuZR8BLCq093jZzHgzEHKxv5JvveS3Ua/cQa5fPb+sDh
 h+aTmPKo0bCk3TnTw59fbZ4/6AhN27VAIC7u6Fcb/WeiCK3y/tCaXfoXw6TD66OFaD2wFvIw
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f5b4c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ukfi0iLRH52kbOtYnoMA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217138

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
index 4c61447031e3..ab8c22681fe8 100644
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


