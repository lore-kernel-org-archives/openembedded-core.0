Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0B5C54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29161.1747934018526169297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=j+TAksjF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFfxic032698
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0A4qlLMrDFf7AjHzA3rBpt3YWH2K67rsxc1
	GJyvgZrQ=; b=j+TAksjFFEuEFxCmRZuF5QavWpNmFuKv68DMVQfw15Wy8L3+nQa
	T5F6goBAvtEeIHlrHGE3iIUcabKPr3vZhs7lYryxbFqGXL66MxjWwi08MUnSs4Qi
	M+4SdkAsMuvzaGEiwEBrjb+Eh0CdXusvuX5G9ZZLXhQuwwg46UG78ky+jN9FzeIw
	ruJZO3XnWALgmE06PI770X/4ozOvnMcH6ERcVRavmUJns6BHM8vY5xqFHMIF3txx
	FvD6UN+hzmAi0/wwAc0qmS7KxA5ct+mgFtF/KLqbX3QHn9jkB+/325eIHDtuHzUB
	dsY3AxmmJggjRf57+szaYe+boAW0AA7JHqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c25s8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so1494252985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934016; x=1748538816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0A4qlLMrDFf7AjHzA3rBpt3YWH2K67rsxc1GJyvgZrQ=;
        b=K+MCsR4JgtGvSrRLm96br+Fqe9rItVIlyLs4bhcmVBNeb/d2/+0rii6MElaQHPHmaj
         op10FgvFm5j4ypCbAESWDg9/Q2hX8ajQfVZIeM9prQFbtoTjIA9imUaE/FB+HdC/AoVD
         hssyyxLXBomJVDHXAD0UsEg789Ok6Jy7iWj7ga+ojcmAhki+Kvxcz7mVE/fzCHG0mC6i
         Q04Mw+l/bCUw6i5lzbCzBV7Yf2o9JftCqoqIU/9qacv/XEoueBD8nPf5NuMtqgAT9wRU
         hEHMTmXlkSZkkWC98W37yB4FJE2vcCkTbfClT910PEYtwknMmwYyHU+Tu6gOp35PBa5q
         pQPA==
X-Gm-Message-State: AOJu0YyJ58lVf81gRRA7Ee9vdJaTWxqYdUO8U1z2qKFld3Hw7/CFfJLL
	OOaTSkaefDKUUAcLFwhhFS4e9u3nbK8VKKbB639u07/Ih2tzQJqm3y1Hoi9KPh/1ELLKhEJGtwL
	qecWl/Ws9+IxBeM70ss3ieTf9JEnjRT72Owfo6x7T6g0Py+wKHuijl+ATldiTve8iMXUt2Orpzu
	96K7vwBmt/aQHkMlc=
X-Gm-Gg: ASbGnctaMZN5iLOTSN3ZpTnCIK8V9NW6bzAnDSxTCCsS3YLSg6IpW7eCcjHxmKCLRv+
	bikG6dlPjY/3qnxQLShR31a2E3IvWJi+KyWVtOVj4OUuC5GmvM0j2q3Wr/Le+0ULwfW/Yh10Ipl
	OLlJuSdnc2kY6uG+4F3tmJ2/1PeqJKalRR4gj+nQAykHSKJ2chcaDG38l5LjdJG0EdkPyCtFJs7
	d7sttL22QHf51Jwah9+nps82agzYhthWBnC6XSf0eVMcAsV+5rSrcNWPA5cOTU4Yg3lyxFNH2pH
	B01iLyRTCpts8Mpz+rLmH2baH8MId0MpfkfBvbMEKsUH0U+s64jgh/xszUutaGPZM7Lr4vkG8Pe
	4O4oMXy0kxwcJTmEC8FtJm77X
X-Received: by 2002:a05:620a:24cb:b0:7ca:c584:7beb with SMTP id af79cd13be357-7cd4671fdfamr3835830885a.16.1747934016503;
        Thu, 22 May 2025 10:13:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwj5yIHiU9q2VV80hPdhtweMr0A2ZP965IEf/zWQgN8TMVmEK5KLPVePECksWWOfd33Q/gKw==
X-Received: by 2002:a05:620a:24cb:b0:7ca:c584:7beb with SMTP id af79cd13be357-7cd4671fdfamr3835826785a.16.1747934015990;
        Thu, 22 May 2025 10:13:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 01/11] mesa: remove OSMesa support
Date: Thu, 22 May 2025 20:13:24 +0300
Message-Id: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX0UwcZeJpjGSr
 El5nBo5eVKGbC7AxlB4hK7vrg/2GkPEbFpcyNq0Lzl7eXPsKAkZKA9cFIB4fpJI1KZ4TZqSLOBw
 LTRl01Xn3mzhcKVKekLgBMMDfoVD1U/mwIyzKSrkhzWVlxqNlHr0s1Af9DAJMFkK93sju70hjus
 jRqX4ovgipQw6aI5CLnPrfx6/dzKUtqHlVMPJb8BZYT9YTVV3ntMFZmFZCpQkw1MbZHOrbI6q4S
 glwyb38jhJq3lj/euZdfylFdPPr7DhkQ3Lqjwft8U5OegIyyYYQPX2+L0VzRC8Wz0hcdWdJfori
 tIsHVQD9ICQz6Qqx+ug7l22xeU4QyyF/oL+JWAXIOy8foyTOw56eXdB37WpHOsE2SO91lxc1i80
 iEe7xqqwiAsTPtqdv/dUlJQGZrqAhSczkWf0fD8beuj/WvBExS6DmF7zwnInE21VljakM73A
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f5b42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ZSQEBjlZUM_vgJQqOsUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eBQw_1yS6woFJRODwGqyK-5QN_OZfMd-
X-Proofpoint-GUID: eBQw_1yS6woFJRODwGqyK-5QN_OZfMd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=990 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217133

Mesa 25.1 has dropped OSMesa support. Remove corresponding bits from the
recipe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 07a57b11c80b..2ff69c3ace2c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -219,8 +219,6 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,
 
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
-PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
-
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
@@ -254,7 +252,6 @@ ALLOW_EMPTY:libgles3-mesa = "1"
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-             libosmesa libosmesa-dev \
              libgallium \
              libgl-mesa libgl-mesa-dev \
              libglx-mesa libglx-mesa-dev \
@@ -353,7 +350,6 @@ FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
@@ -366,7 +362,6 @@ FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/p
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
 FILES:libopencl-mesa-dev = "${libdir}/lib*OpenCL.so"
-FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
-- 
2.39.5


