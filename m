Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4DEC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:14:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.29594.1747934046162129983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oASGeMcc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFTGjM000720
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ip1I2hfJETY
	wmuoFzaoz4Y0mZ3RoR/aZUIxhZX+ulJ4=; b=oASGeMccwLvTmaDJaBXYvIsR39O
	cxCJpomDi9YDPnfA3T/nQQZjmSlX/v+6dBMzItpBGX5CQ/Z+94J3SLRTNqUY/WCi
	wbxMBH29V+kxXKSn0aB6QYU4UC9tipiM/4SIs+fafCNGH1Bc/tTqGN1+LK7L6q9z
	JvVx0VFPDUfVfcNBps2Drq1AEJcg1+shD5TKQUPQC8QmNrBfKsLxCf6vGJ3Wuvi1
	v2S/P4UFD37/9yf7UgLKXDTW3PUuvuwtqPOulyhJBvPzDsyN13VRkMneeZTe8ibQ
	77gtTRfbmUWqREjw2r+/C5D7jgY8ieiN4VSUWw1IYSX53hq3J8+zNzcYzHA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tnfde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:14:05 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72b9d553722so75561a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934044; x=1748538844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip1I2hfJETYwmuoFzaoz4Y0mZ3RoR/aZUIxhZX+ulJ4=;
        b=EXGPR+Qsc0W/RWybvuvIUfDPlv3ifC9s7CnQU+nI47a9ez5jLbnCOLJaOGoI82+Gun
         yWt7qMJsFE4Il+n9wvvkcExi3jpVv3BVIqMC++d2likB471BrULCibY+8c/T6T6J6VlS
         ePIUiAVkkxv1xd6L8JQ82ysqIz/Bgt4ZxJSmGlFtMoDjcL+G39rgU2y7ttFlQGVkaKpS
         be5RCVXHTv9P8GVFaq2ZylR7ArXRo0snzXqrlY0tdJ63Rl0FzHk4lyRVC74sd0jpKtqO
         UaA1Fc8qp01fB17d91ADuBip2js7z8mRqWtGwUctQ+MBQLHh/2dNtakTkDnNsw7hrkN9
         hUWg==
X-Gm-Message-State: AOJu0YzLB1VRTgxq8KXO+K9GZin0CJJ9uS0AE3HMMTgyuiC1V1VRrHil
	fn1rGR6pHls7AadMSpnK1MXXZmZtDzw0nNEtKwG1xPEfaur+4XCzauAl30AvMN1ACHYqZG5rR8b
	wEVMuH/b0ql6YSQQx+qYRce2veSccOfvztcapJ7cX18o1goKWYMebR8wZj9uz4TCkvr6ttIxwxD
	YM5brlP6Cc/mS4BGQ=
X-Gm-Gg: ASbGnctUZduozx4BphHo3iWgDf3IGKswrTp2BBlaP17APSpj8jWczB+dqrVz75qdKrp
	aeyMzLpn3FRUsQLJ86OkvgjoYk8DZmNWVEFKbZCbCUCyF8gt6i6+4WJE++UW7ux/kgGWWew6FzJ
	GF2oilw5lNFyxhuz0f1g1Z17xFX/djWll8V8CkA29IeboTYIIfw4KbsVj+pIRmY9D+iLjz7P2si
	vRD9CqLDuGqXsNEzxoMOg8U8827Vee3s6TMSvmhEz8w7S5BjZUvTGgD+t2dzPbg4nHArNTcac8o
	n+4/J1TyCcRBihZR0qlN7eId8ViuX4wlo4feqTVNrwDwOkABurKGoEwrZ1+UVavIbT+eV6/bYQc
	PVa1f2p0Ch+PNoAfa1bKWso0u
X-Received: by 2002:a05:6102:18cd:b0:4e0:c6ae:4043 with SMTP id ada2fe7eead31-4e2f07607efmr352954137.6.1747934033740;
        Thu, 22 May 2025 10:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYn4PVrqfxlRKeq26Sqo6+8ecYjWqybfnR3iAbGIGXJdWw0aAXAMQjeDf2+KLmkadFZUG1hQ==
X-Received: by 2002:a05:620a:26a3:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7cee225016dmr52535585a.3.1747934022430;
        Thu, 22 May 2025 10:13:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 05/11] mesa: drop the libopencl-mesa-dev package
Date: Thu, 22 May 2025 20:13:28 +0300
Message-Id: <20250522171334.3040820-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f5b5d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=Mg_RanN_8yc205Ew7dQA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: hflt19uyjeCnSPn-cxHWLmKflqKycP45
X-Proofpoint-GUID: hflt19uyjeCnSPn-cxHWLmKflqKycP45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX/YqPaKxwQ9Ta
 XwA1Wte7ogKu+mkcMesDM3ThLcRyCOnkHREGWdjlLeRq0O54BzDRssPN6V3A094tndQJl1qNqTD
 bc2UJK8CXSazN4AIuJqVfVTh4LIihUXGe7fJxFkqZ4kWHhj1+czRXzgQofOKilL7z5YEnKX0pIr
 rQHXuvLfwIe+qWXIjrSyFkgjINWcgQiAsjB/h8W1AZp11bTY+S9A5s8CYa2NSvpyzwoib8dhXCV
 UYfNAHjTmTQHMxKyRFj3yH1w54Fk/uEDSZgx5XSTst8SS+PwnvUio4Uj4a8Ba7MYHjhZNsZNwM0
 R2kYcEuEws9PQ9P1De0N5S1g61XOiVtWpALI4UnRu2OS32FKUCrz5lsL+utSsuRTPwqmJOM6wWh
 El2P9r67HJNZhkazBNa4cqJLQbJILkSuSKghFFlz2Od05a5QfMdfGLGV9/aCxMUNIVX89meq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=774 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217143

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


