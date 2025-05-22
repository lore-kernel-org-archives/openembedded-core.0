Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18512C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.29579.1747934030367099630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oZli8eD5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG0OCV016599
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0r6u1FLerGx
	Q29Bxx5ZKI1NIuavcoPmbQE6aN5udYWc=; b=oZli8eD5DCxF6Ukyys4Lx2s/mHA
	4BppIknV6ylwt+ktnZnwv08mPRAxG0bXT6t0q9lrCeNpBdpq5WG4NMBGsCLe1B8r
	BBgjygTwhpLIw95XYccHHdxyKVzdB65rukKsjqwEzVyFhM/rtK6vr/6+Gj+OAfNM
	yOeErCLMwk8hbeKl/t99e4q7mD5y1lreEmehW94f4FgS50ILunFRn0Yb6pidCM6b
	Rjq7mttDlESVGo3q5AjKJqPpEx3fEz0SpXwRwTuiu5RbWmodHJYcdOM6HKRTaCPB
	KevK+QWMBDqiq0pyzzOc8YTgZ5lgh8+5J81+SI3m0A4Nnm1bhbnV4FrBQAQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9y4da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:49 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-404d4a4a2fcso3265414b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934028; x=1748538828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r6u1FLerGxQ29Bxx5ZKI1NIuavcoPmbQE6aN5udYWc=;
        b=RSwywUYHjW3Shxp2CgKvS4z0/2aiTWCO0IPNVh8wEFL+BOC0x1Lvm0Xghh1eeIJQBS
         C4g7HO0IaRx3e8VpFe0JJq5qZ9XAslzYYqDkUTFB/Zd0+aC30DzGhlYx4Jk3DXmn+6h/
         CWRhhChxnmpuUBuOKIfI3HlfkliZJTiLuDf8PYhBlFSQZhYhxIzw8GzcLsVkyV8UttXB
         gHdlQYCgtPmuQFFIv+r3swBVUYAqej2N0bzNg/PR9w/NWt0HksK77h3siroIjfnxW87s
         bNEW3V+ab9ukF7QI0r8RXkjR1JSgfKZ/VPovIakYR4QGNF4XNBfgbboq+TTSzfPnsgF9
         b+9A==
X-Gm-Message-State: AOJu0YxRzQvW0IBw/aJKGuAHKiIO8vanw3Jcpyk4AbfKGDsFrYGg8wni
	tPamz243MEbmw0FuDT0Gj1uQyctbHoQ3DOCwwQ/YDhbiCySpKomVAELk1Nb4drBaBT9HM9OSXko
	v4Xx2osPX4wrab6BeDcUXhl6R9Q7P7TmP9RMobbxd7XToqb81yWv9E2TANjBxqdfDfpv46jCl3P
	DIsSPOV7wvNAexNwo=
X-Gm-Gg: ASbGncuMCzxIAreR7q+j6U0yXrjOuQBBxynIlDzCk9KQhE8jvFWO0ynAt/v+VqCxYpg
	eMPpaOitP3us5SqezmeBgEeXXMFEmIgkf7Jr1fzBDhMC0OjVHriwqjHe3DlidtRQlT+Xh9vDpYz
	SbqnUO55HULzJg+DZZqdmSsYbl4DqJ7IbtENcGiQ/e8EQDk1ysZ0jeBVT0kZL6SEcsYoJYHdfIw
	Gnb+0+Kdx+zaZ+NTYSdBg7hMJ2Sy1HIMo3m/dxC47a1GQTaNpefFcrQLbedSRdxoYYFQk6Q8oHw
	2JTFrZRNXmJ+NsSpGKbksxS4Uk5q/hBS+N1Gr0qIscb2uJrOVR2Oeq927y8yyztWFQE21oZyLpP
	vg0oNWAYid9U9cyuy+yyhQOiZ
X-Received: by 2002:a05:6808:6281:b0:3f8:1df6:400 with SMTP id 5614622812f47-404d8659dc5mr14138570b6e.10.1747934028216;
        Thu, 22 May 2025 10:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5inPUdWBj79qZXUryDupI7B/it9tf3f4ue6QqDm+s+ecrusHK/av1MVad243N2BAVD4Lnkg==
X-Received: by 2002:a05:6808:6281:b0:3f8:1df6:400 with SMTP id 5614622812f47-404d8659dc5mr14138553b6e.10.1747934027803;
        Thu, 22 May 2025 10:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 10/11] mesa: drop .so files for GLVND ICD libraries
Date: Thu, 22 May 2025 20:13:33 +0300
Message-Id: <20250522171334.3040820-10-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f5b4d cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=e0qsWOJ7BfgThjmG3noA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: 8PndnOaJ9fhwpL3LqwmszIvWmqyGgIiy
X-Proofpoint-GUID: 8PndnOaJ9fhwpL3LqwmszIvWmqyGgIiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfXxnXuWByFf8Qx
 fawsh877DC+2Aab5s/7oV4yz4f06kCc5aJUZPc4Tfuf72PIHtuGcsSWuTmtDcuAl8HzYnGtIKtH
 l1NOMvvw9TCcsCHKR1icYUScyRH8TRWs7Eqgo/Tx0SUmMjFj2DfIs1FdCpgOwHR3wEe4Rz/gusy
 21+CLiCtCJrMUQQbHgDgnOVYbbX4e3h8pbnoUG6CXyMdjIPnTlH9VZ6o+gompydsK5GrQ4fPXtK
 mdoW54b7NrnhzWcB5uN/b632cSEcTMtaiZ7xRC9UQY9VFrrI+C9iome1A0xHaUP9jygyHAKfEPW
 ag2iZztbYwkNrEyu3MX1I33e7qn4rfLUBSP2zVxoc657K8x7vt21uPGJCs71nd7u8iUnOfYKEma
 v8Qg85Zx6+FZEn+D5nIsnReRI22gd0QDmWTHS/5E1MjOOplgsVppFHq2TA4jodas5SqbNzMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=893 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217139

If GLVND is enabled, Mesa provides two ICD libaries, libEGL_mesa.so.0
and libGLX_mesa.so.0. During the installation it also creates two extra
symlinks, libEGL_mesa.so and libGLX_mesa.so, however those symliks are
unnecessary and useless as nothing will ever link to those ICD archives.
Remove them from the install dir, which also makes package
libglx-mesa-dev disappear (it contained only this symlink).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ab8c22681fe8..210c7295c05c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -33,6 +33,10 @@ do_install:append() {
   if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
       sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
   fi
+  # These are ICDs, apps are not supposed to link against them
+  if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true', 'false', d)} ; then
+      rm -f ${D}${libdir}/libEGL_mesa.so ${D}${libdir}/libGLX_mesa.so
+  fi
 }
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
@@ -348,7 +352,6 @@ FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdp
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.39.5


