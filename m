Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069D5D4662D
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:26:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1241.1768512409064826864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 13:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TGlTLDfS;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HZxv56ng;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGNs2866207
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mx0nBtraikH0QZx3DqIBhYoK52tVXq45050
	RYCsaTbM=; b=TGlTLDfSK8Yg75DZJL5MNBNx3XaAt3ZWBg/qX8cWNoOjo2DHmWX
	5l4nfGTQf8SShVZS65AJv1G+OfLf4yZeSiKAiMnGnDAbbJzv6T2VxkXG7zhOC8Bi
	zmxYZjuFWLpPWpFRNwBerawEXUWxiieLE2fknFioDBztb27z79z6sOPrgrKJoNwT
	TkKyE2pk5zDkXpmiqQbdT2nD8wFG+xQ9KRNmWmEspJvF5Z9doT0GLFYitS6D5lNo
	HZVIy57yD60W3M98t81dVJeIB3uKDpc/hXoxJccLvvnhcB9CXb4NNxhehJhhmr1D
	IPSQxt2rVX5NKqaoES/uHOHuxtRt2e1OSew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2jhb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:26:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d3be24cso183706685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768512407; x=1769117207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mx0nBtraikH0QZx3DqIBhYoK52tVXq45050RYCsaTbM=;
        b=HZxv56ngGtbNauFH5roNObMG1kaoUA16Uy0BXUGplV8FUeYV5mEzLQ67s8iNnPPCOV
         rY1NPZtWHOQRkrRdTv+r4o9c5bs7ZfOP1mB/xiGDW5reGC/Ehy+sldKZ30SpkLCcpse6
         B59/42GSJYdSUDzlJgUcgw+NF7aYbNp90DM/GWXLzfDUguxPLao6K1Rrzr0KlZ02Aggq
         C5FO0xb9QaJjPxsCinOXfQJ8a6q3VhigV9MYyYlttuhY+31l0bO7Jb3tEHxwiOZ43EFG
         SYLHhd4FvGBuLNSqVYkRfEcSMUq5726BvzcfJ7HJl2nBmhiSJSX74niRm2nijsqQSzoX
         bbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768512407; x=1769117207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mx0nBtraikH0QZx3DqIBhYoK52tVXq45050RYCsaTbM=;
        b=psbdf4RUfQ7XUQ6T1JwhOj2J2Atk5agtWfk2Rj5YDVEMM/OkybAm/vp0vnVmnMDsUB
         /wuiTpbVRuoZICwPeKF5LFPajusCUagEWSwpj3TK9BNl44kBsqwMOsFVvW1tO5awXg7C
         5yiOZ56nt423hHxvwMenLIPYv+CM4spz8lzcnC6JAXu2tH7MxXOqiKXSNxuy9Z9jXDPM
         d/mhuidx9Q69JUPGh4jpqJiQD4cEsl6iEhlChlUrqq+Zy/33uxl/lbED+s42XyqquVKk
         nVVA8r2N+rMYixqXQk4dEKsf0iAis9xs5ENVpYggzPp0lO7j4WawOuKoF/GN1V5lvEN6
         XYFw==
X-Gm-Message-State: AOJu0Yz39lrxhyFTVTWJQiWunWeish6ublMKytMDql/mDX/xmh8n4Vae
	4hW8LnzQSBhZl5zoHXV5wE09E6FgxG8ZhdUFzIL9e8zChRlLC7YQZGLC22gnN2ddkCpY9YVdcXm
	ylyFEUyLgOHJ9ErGd7DPHyn/om4yCim1+VtOC2HgI42JWUv2BWQ9WoDRwfGuuwzBqPV/TS16jCa
	RH5AnLcNVO7m5ZVEY=
X-Gm-Gg: AY/fxX6YgmV3XXV2V+o/2Ufr+KYKYw1EZrdGonpJcFhdYol0qSTdoF2CSoa2zEP37Pq
	51taCxFEnzAyhm+25aGgtZGOV2uaR9xBERO5fa75OfYG1trqDSyaJbRs9AT3GNGQYs4VnHtzHZM
	wnWkQBQhsv6VgiMnjECpX+LPG/KeN/w9AKlHhyPr5AAZFrNfXWQBPcX9DNTaJvZD5SoEfwanRX3
	TO0ODQAAz+hp8Oz/eDVIvZY/UNrhyBton3X+LssDQ0LKN+VJKCRsWVyyxV4ma+xfYXXGCJZmfiO
	ZO5Hdr4dv+Dg+SZVjGcCi2GyfqsDfQWjOkPopF34IKpbi31YcyJ1GaY3fQAjWbFLxHg03u/RITr
	fOrLVveOU/d6t19lBLHiYxidMWXL+M81TiFzou7vi9iM62moIKZgEToed2Nzw06gMi5ZoTsCw4E
	l6k7A9mCJ+LBN0OW4rCxNHp/A=
X-Received: by 2002:a05:620a:bcd:b0:88e:1671:2e4f with SMTP id af79cd13be357-8c6a67c464cmr126817285a.78.1768512406695;
        Thu, 15 Jan 2026 13:26:46 -0800 (PST)
X-Received: by 2002:a05:620a:bcd:b0:88e:1671:2e4f with SMTP id af79cd13be357-8c6a67c464cmr126813585a.78.1768512406063;
        Thu, 15 Jan 2026 13:26:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8ff0sm1676591fa.45.2026.01.15.13.26.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] mesa: drop VDPAU remnants
Date: Thu, 15 Jan 2026 23:26:40 +0200
Message-ID: <20260115212642.932690-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NyBTYWx0ZWRfX9qeMQ8BpnYF+
 oFXAa3LEdMehEPAD1CN0oqX4oCx2W9InYHTUnPepOeMUEoN+IyqLS4+nR/M/tF2zw/22yqCSajW
 X7tXt3a23nORojGIXVcQgshlopvHM7dkNKZ+mb2HTqss2pHSm2a2487+h7AJ5NPAmmqvuKSPh9X
 m1gGdCbhj6PX8OjdMf3EMNfhX5CrwxK1wmVLH/BWtmeXT+BHn+iEBGyC4IO813XkP7Ft/swvx85
 q6Zcv/SQOMyhqSi5asKaoVySW2gandHojmHInVBby+ivdejgVSCEjOtzqkyZ5UfN5pK8HfA/sUQ
 54fmjexFh9wx9pEzPa8NcsBZrLBpB48khCu6QhIfqbq4hjgwSCzTEYLjnfBCi0WqMCZE1YbguLb
 vqeThq+lY7I0dAlcoRMNEJh+yNfKuBYrYLzeJ7qJrdt3W/jS7g0XBPKl78PyTYA4U//ptmQ2Raf
 +rtmdPI8XuH2Be7rRyg==
X-Proofpoint-ORIG-GUID: CJ_ScpHaHYR8BgPadVKOHeFA6a5_BRd-
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=69695b97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4i8Wih8DhwBXQvXYEdwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CJ_ScpHaHYR8BgPadVKOHeFA6a5_BRd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229439

Mesa 25.3.x dropped support for VDPAU. Commit 88e26a937549 ("mesa:
upgrade 25.2.5 -> 25.3.1") has dropped most of VDPAU-related items,
but it didn't drop mesa-vdpau-drivers package (nor did it drop VDPAU
bits from mesa-dev). Drop those remnants.

Fixes: 88e26a937549 ("mesa: upgrade 25.2.5 -> 25.3.1")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 835e4d46ead6..a82bfb613549 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -251,7 +251,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa \
              libteflon \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers mesa-tools \
+             mesa-tools \
             "
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
@@ -325,7 +325,6 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
 
 FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
-FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
 FILES:libgbm = "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
 FILES:libgallium = "${libdir}/libgallium-*.so"
@@ -336,7 +335,7 @@ FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h ${includedir}/gbm_backend_abi.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
-- 
2.47.3


