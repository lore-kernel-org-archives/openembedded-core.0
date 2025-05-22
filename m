Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B37FC54EDA
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25723.1747925182342822913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PNLlMl/C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7MKNb031754
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zo+IAkII/q1
	bjeeyvHXEaa8fCwFyPboI6oeN/Rg6sp0=; b=PNLlMl/C+sSg6nbbanpZLxyBSgK
	Xr55JJbUt4glc4s1L249Q5C/NhWmPKROj4zWc/P5y/m1WE7LsWYIRTrQB0hzZAwO
	4+yMxbpULBIRf0Bsqxp3niND1UaHkG1n4alLAUNVBmrwzHm3U9L/GjEfp2j73EP9
	J1UWWa+aHQk2aDExTiJXZaBoXzgEd6gYeOXoYMw8nq3sMDSjXZzaak2PGHo/mOAH
	J/pOuxbIQk8mkS1Fu9M7RqsWKU1F4Frv1JLDsujol/+AaXOqqdEl1s9cOd+n0eZh
	oyR2/XXaVKy6j9C2cbxKxEAF4Jd1Ic9g61zsEt1a5fBX23uAbBaoMN/q6eQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c25an9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so1330963385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925180; x=1748529980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zo+IAkII/q1bjeeyvHXEaa8fCwFyPboI6oeN/Rg6sp0=;
        b=Sa2WeZ2B8ye6VKNvAdM4bcz8QCksO7wiFN7dy4JFu67Zv3dBYWjfUPeIS+yFDwoPjI
         04vKU8ugmJg88efpUopa9wUJrr8ufGqSPdInT1CSpbPVj/inqsiZQ7W+WsfWHXAVnMF5
         hQrrrJMydpXxkDAAAHq3kIRBv1+w/zdvuQqzZl9CnJy0W9///PIXetljtQQdlXa2LdqS
         92CZ7UM5o4AC2lVlHayjAoRnshECp5s8AQF/A/W7rBSLbgJ6mcsCD3BSjyLviotPPw6q
         CLiNk9JMOtoxRPbL4ZZGP/ReYFQTvXv977MSfMcUtTam951Vxs06RHxAlX2NURJTUf4b
         J5RQ==
X-Gm-Message-State: AOJu0YzKA11qiboS2pkrDlOiK9JpjzmqF+kNbD/CVxG1DzcnUCZ8Sp/B
	hYfbyMMamt5PpfMEhfRft/LATE4t6ty0IitzsunrGI/sY+3gqWp+FPmg28vW4MhsbTx/XcSfkdu
	URpfioJ0hGwVovrRVVV22azzJ/FqbSiItExMVI5V3WYORdqd/+wt+xgUP1XFOAQyeGmywjQLZG1
	H3D3JYeUHXSsLxRuU=
X-Gm-Gg: ASbGnctZWXZyI090MaV8K9kREHj3PAkwNczxiqjPn9a5r8LMtLrwEpBkGRo3nxwOyuQ
	L99sYF1Etsw+Hc7KBc/6O7dBucGrKmjlJ0Ch1S7MtAOSSVB8RCU/crIAcHJfW2Gc5p2szuXNknZ
	Pso/LKi0jiA6ZATTSvUVKD4Apw52DDRWBPpzqAbp9eMC5aTW+0ebHV7JpGVKq+Bk3qtNR4DP7iC
	vfPZXwv0kvjNIINkDR2b5gFYHPRWIX7MjqTUi6LSdC8RTxW/IGwEAGdi1PHKimWiuM14WeM5YUD
	EVLHzDBGKjE/yQCP8YL06eqnfC4uzrHKql325Y3lCvHxGflSCCwsJBYLxZtLfEooiC6UXPQthjd
	qJIcY6uqdW8Wy2KrOztexA8Oa
X-Received: by 2002:a05:620a:1984:b0:7c7:70dc:e921 with SMTP id af79cd13be357-7cd4677d645mr3910834685a.36.1747925180295;
        Thu, 22 May 2025 07:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw2X3SjGw5nPxjU+25HIL17QILQK+E/mmlwKB/zIIr4mfnUv+3Ky96fdedmRawavFn9ryoqg==
X-Received: by 2002:a05:620a:1984:b0:7c7:70dc:e921 with SMTP id af79cd13be357-7cd4677d645mr3910830685a.36.1747925179885;
        Thu, 22 May 2025 07:46:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 10/12] mesa: drop .so files for GLVND ICD libraries
Date: Thu, 22 May 2025 17:46:03 +0300
Message-Id: <20250522144605.2876771-10-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX+JYbIL05HDm3
 fADR1pEEMXd5adLCT3XDV0Rhuj+/bDLPND12OixXIQa80nyL/kmYrei6UNH/FS1ytoBk+QLcEL7
 bW6TYTzibnEp0mT1CHYBkHe18+KgcinBy81h4ywlTkpczY/wFJSfSbsXwIJCDU3f4iNnHdw0gr/
 2EV6KyIAs0plh7VZxtBg1FWRRCpOf+njAfy4tik2IApqNWZ/41d9Y7v1kpAk4n6xQNEVNbJ3E6Z
 6x25cfF0hH6JkdGWUlDxoxJ5zUK1O65pjP217IxmtxED8/YXNY0ETYOkRM/gu+QLHqt743/SDIY
 Xgmb4C0XCjiYV6UrQjkyNrjcOh9pzJZftLOJMHlzmeP36u22bRbBfeGdXMcCIsIoEwo4k839J6a
 kNPmIj6Vz62YKCZCH2NK5ijUedQsoZdibuNZs8mGOCMobR9Z/8gYtxaz6peR3/mHuppb1tpR
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f38bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=e0qsWOJ7BfgThjmG3noA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: n64qE0UdXuL9PpmgzMTB-Nxj2wL2brtY
X-Proofpoint-GUID: n64qE0UdXuL9PpmgzMTB-Nxj2wL2brtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=931 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217121

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
index 2d3846ff8f0f..0ed6b8a38d8c 100644
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


