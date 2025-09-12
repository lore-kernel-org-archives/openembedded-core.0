Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AEBCA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:25:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.19796.1757690755546414773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GeS+uqXJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fM8F019885
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bKIV/qNUPMB
	/W8V1mL2N2+ug0dqniIYGYC1G7CJfWpY=; b=GeS+uqXJhqNUocWZkGGD72ndYkt
	1OxQeQIcegPu9fjB2ahhQNcF82NDBuezbPonNPKbGZr0QphOxZKSIMZ2ZO0LCocC
	MVHPITsnR+pKI2y8xmRdHG2x1b+41k4nF3uKHj0msMYG0D0wjtfyd4wO3kmqcZfY
	og4RI0r5ialjS30pPjl1Nn9G1CNTW5jUyO8deSgnUI5+pzr9TBulbJVrWGOUP/Rz
	wkESNfw/comX+fopAJE984VZzTbd7AWtn2JrvVxKh+h9AcaC+AVj06V62/+JBBVI
	81Qev7AwjtBysSUnTvT38BBpzNRH+NqDNXhGQb88U9DLulwZvsUnzxw4YRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t388f58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-726a649957dso44799556d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 08:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757690753; x=1758295553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKIV/qNUPMB/W8V1mL2N2+ug0dqniIYGYC1G7CJfWpY=;
        b=Hv+T2jZZrIycIfAyDobTnflgJ30Q2TQGlMfYAUvQqjN8Rmw4Xvyuc1HpoF+4tITWBX
         q+BH07sSzECXA6U6T/GuaLmwmivNHhdVYCWOKszXTfB37mSVrLpCP46tLJBz6n0A5F6x
         IOhEdBmygSK/N6RJGEP1eOAXlIulyt+r0BgipRRbHWONgj/KxAi9k7w2G5zo+hS7de41
         cLIkkPwNfzKtpUn3GznOryVfnIoj+QZIwAD++sCQPNdIU8g8qWu+1AgtzZ0tltpqU8gZ
         3SRs/8T2Equt49KUHNk4Z56Zd7i5MnhsAj9Oa+5La3vWxtIMPXGB6rDuhAm7NgA4BKDA
         Kwsg==
X-Gm-Message-State: AOJu0YzPfKjD4D3OiVWRXSyYqoBif6YhBwDKRsNxP8FvqoW9fmkwMzPP
	hV8z+qcJHWur8+KUmlZbWhtIjBlQtHf4nZ6L+sDY1v/QgqRJ2p3nuGfp8FUfxfufSaztoDTleCj
	H9kYypNQ5OmTWzLnVO4gtVqOX63Xwh8kdPKCO0nIJO8f6XmmC0JHCk/NQtrCXsoGRhsPc7Ip/Ho
	smP7xK7Sef2OZ24Gg=
X-Gm-Gg: ASbGnctQPEMJJ53njoH90aDWC1GjZEw8lnUv7URNDORwONRhPJZ/qrEZ2veCBzIC1db
	KgoaLkeWld1fOdcgYeoNfQqM8GIVOswFIX/fR2gmNjgKYkq9/zagKa/cYabd0Q8MWc64NhO2agc
	vK6uTAh5bN+QK4Yh4FQVxn8mbV10I5xshx2UrAhdYWZfI5sIt0uzBCqDlkEvueK2PceC6/+QsBy
	hhtEiNoL7y47/d7n6bhCYum0Bmr3912XdP0D/80x37kqtr0buihN4wxy5Tpq1Nl+gYwnDHZrJ/s
	hW1mx5sGOqUlNq776eahSbwjKeroAlq0v+NKoPi7JcyTKHdmIG3+r8jKdMpqSfI8+GbX0pR+b1m
	SRP1DZBXmFD9PgeW2axOCZlgkYtmKaj5HVwXuHFeqm3UzmcKIXX5M
X-Received: by 2002:a05:6214:21a7:b0:74b:5d86:7539 with SMTP id 6a1803df08f44-767c215b83cmr42984546d6.42.1757690753225;
        Fri, 12 Sep 2025 08:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwNHmbkuCc7NG7p0nJC7TUpllHUUVy2MC98gtT/iDLLFGP6esqu7beqFvC0miBS4XCc3YEdQ==
X-Received: by 2002:a05:6214:21a7:b0:74b:5d86:7539 with SMTP id 6a1803df08f44-767c215b83cmr42983756d6.42.1757690752318;
        Fri, 12 Sep 2025 08:25:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62c9sm1223465e87.27.2025.09.12.08.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] mesa: add opencl DISTRO_FEATURE
Date: Fri, 12 Sep 2025 18:25:47 +0300
Message-ID: <20250912152548.730100-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jprvQcf_9-KUwDwZ3Lx82S61ee3LxuS2
X-Proofpoint-GUID: jprvQcf_9-KUwDwZ3Lx82S61ee3LxuS2
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c43b83 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=XjBBfq-VUFICpCEJn_4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXxJc6A4hJ3KEU
 gXz6AUUyULP9zbw+1HT3wzVp4dPnGuoCiVjO37IlwzyEgXkCGEbkVUki6kBFWFn4A4NTYQrS3tq
 4e5OIPRAa68n6SM7F7v5KKOKTNhk2bfkP8+AAfQ+sUP+P7zjceyK/7sUC9D3KgoHQ4FfpGAGSxX
 irswL97LXlaeV6IM/3KkCB1nK1QAD43kVQc04d7SYtxnJXYGk/OGInjs+5ToSx69ruJu4vuv+wG
 yCyWjg/DHPBlfjxBCIYBeF/QyQuY1maZNd9vMdSDpO7FZ4NPeHtc4yG8fzcl/75y0/y0zdY/ZSE
 jqRLCA3/l6R4JoxLhsquDElldkdQrsH6c4ndOcbBKySSGm+jHd0JSlcENM+a1STC1xim5I8fhX4
 iOD/ExPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223321

OpenCL is an important part of the GPU-related world. It makes sense to
be able to provide headless environment (without OpenGL and Vulkan), but
having just OpenCL as a GPU user. Currently it is not possible since
mesa requires either of those to be enabled for the DISTRO.

Add new 'opencl' DISTRO_FEATURE, controlling enablement of OpenCL.
Note: it's required to propagate this feature to the native set in order
to be able to fulfill mesa -> mesa-native dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

A patch to disable OpenCL ICD Loader (which is a part of meta-oe) will
be submitted separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/bitbake.conf              | 4 ++--
 meta/recipes-graphics/mesa/mesa.bb  | 1 +
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6ed8128b101a..5f28037a57e3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -915,8 +915,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland vulkan"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland vulkan"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland vulkan"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland vulkan"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 49e077b20cd2..cfa5d0f40f0a 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -5,6 +5,7 @@ PACKAGECONFIG = " \
 	video-codecs \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl libclc gallium-llvm', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 	xmlconfig \
 "
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3f09cfd4df21..a58de5ebc3da 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -46,7 +46,7 @@ EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
 
-ANY_OF_DISTRO_FEATURES = "opengl vulkan"
+ANY_OF_DISTRO_FEATURES = "opencl opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-- 
2.47.3


