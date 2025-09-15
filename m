Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE66CAC599
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 23:26:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.6893.1757978763525798133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 16:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ben5xuLG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FGJDKa018287
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tENRv08YIHoeXPte5zvElt7pxIhftoIZ5eD
	S/g/hUuI=; b=Ben5xuLG732eK1m7QRPP+PwH4W+8Mj7ZqvyTteni3qs26c+ABvC
	DTtAxJ1+rbgjpMaw2bnHzqOZEJ8K8656hm/QwOSmjj77J6Rk6Wwh2yf4tNee0xC4
	jbsEJQg3FheS4BUczDe5FxV9prMkvLrqJNxCXnt6h3EWcqGqZPICyVCwGKP6JTgH
	2439cJ6Zex88lE9v+FIKiCI/aC/ZoHZ82djLgCh32qLSUqoHVAgs3Vy4HcyNj+6T
	hBZo95VJfqjQREOcfzpVBMBwOPmbYRKggkROq7CSMCLwfr1+bcwjFnG1D6fnxlVj
	t5ddWRXZniX0jpHmbQV+fZltqN1ZWJB7w/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sj4bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:26:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b62de0167aso126304821cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 16:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978761; x=1758583561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tENRv08YIHoeXPte5zvElt7pxIhftoIZ5eDS/g/hUuI=;
        b=TJZ/HjkgSMRuX5a38Co4FS7A/cWFNw89hYrB/tSXNIIcXJ1QlN/qcFQi43pUiCXKck
         xafTkFG4ddvJgmRjU8LTGyyrroZ8cz/2eyzkuZ5Vn4Kl/ARkO4cQC7tQyXHDlA6DKyyQ
         TvhQNq1H6VcPNybqPenLbnlhDYPAt1nZcueV3MJ0SswApVDI8GSEgKQN9Jr3ZU+hm1cK
         zgTcGiLUB5GzyA889hIznKgEHQcYY9FnTA2W4R8nqBepvJ0QNUDV5XcGzr0dhwGqHrHP
         mO6db/VjYD4xhq6lpY7j0SxWQdlN8wc7aq/nDs5xiB4u5S5nveRFz6bhdJKC42a3+Wo+
         3d0Q==
X-Gm-Message-State: AOJu0YygR+VWKOgU7McNxA1PXDa6nRFRlSlnPX6ocolsPcVslFk1zCwi
	b6WwGoGIaW9LzIreABskKtiG4VjL/+j2tdze53kelZU3k+4RtVCfXl6/AjqWSmkpVUBbMg8Oz2O
	FGYI0pwyUZGdQwgBZH9excRFxMTFefJfGOLwjinr8D+TZ9oQVrSiTpQgDKzcfylUlNyoJX6YEpx
	DUbsHV/O/gBOyBqtg=
X-Gm-Gg: ASbGncsbUoEEvTPgp7hl73tDEdn3AG+FvJMJ0RB7ZmLzok+j+zNNVhtzFkhEfVenZDz
	woT1zSGtZfDW13VpBivrC0490Zi+D181VvAgm83HlC5UdYPdTjK/DIQIn/me7omsXTkcrmTDRN+
	kN0hRX3BJqmTS6RC2g+9e5RrlfXRSMTJFX6traYcHp/HIuVuF3ER8/O1Erkzfzw6DeKEVeEDPcO
	KsXos1fiOD8U5TiURGhDUqwdfjOxWSu25Kdgl9DGkH6nwQWOsaiGm2OZtayb/TTY5XxUaNOYWF2
	7DWiZPDuZP1btOTxO4hNxCqbPKbF80HxhEKtLyzsir73U9BzR3+HIIc92W7r1oIemj/oVdTlk72
	9msKiyPPi0kpBIbJVAzOK5BvxkyGKro6H5jY1ximhDRjz0PsnlLXH
X-Received: by 2002:a05:622a:1b28:b0:4b7:999a:2866 with SMTP id d75a77b69052e-4b7999a2a80mr93396811cf.72.1757978761171;
        Mon, 15 Sep 2025 16:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWGXN4bYU0v7UKpDv8+dl+b87gjH2Y7c+4887pt3MqwcTo66g5g0NdiKiW3Rjw560BSZX/Bg==
X-Received: by 2002:a05:622a:1b28:b0:4b7:999a:2866 with SMTP id d75a77b69052e-4b7999a2a80mr93396521cf.72.1757978760425;
        Mon, 15 Sep 2025 16:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-356cf10d013sm14137961fa.29.2025.09.15.16.25.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:25:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] mesa: add opencl DISTRO_FEATURE
Date: Tue, 16 Sep 2025 02:25:56 +0300
Message-ID: <20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qM4BtvCqq6AHBWE6-hiNPrW_D_QKJydi
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c8a08a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=cvsoQk2v-VXHdjpCrXAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qM4BtvCqq6AHBWE6-hiNPrW_D_QKJydi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX05edB2mpsk3Z
 lcJKsJqiOSN1Enwh9YJTDuEwb6AA+4YS7DoFJp89og+T9Pk0FWymSMw87rOuL7rOxO7eY0DrVYS
 YaWoyHR1wpuFDX91WBhDef8Lan+jYYZVRhU49oSC2BC9XV6YV9vGCfmNAeoKHXlCmnJttXo/6FL
 j7ULqpS+z6hF2CnKR7r3Cx0sVnWfdeGQvszbsekPYmEO9zaxsXasHintMtxkcCo5KgIaJmeSbJC
 YTjaWHNqK8pTMX51kCGFljBxESp/9Xe2pjzpiqUjbTE8FtnNhcTIxkcOTVSkjpcX7SzXLaDccjP
 XQtZysNTY7R3NZ9GcNCCX5yL49HP27l2yrIawqkH2wrxVQ6eRPpLA/x2KgJBNoBNhz9S8vivTlu
 3il/dLOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_09,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223509

OpenCL is an important part of the GPU-related world. It makes sense to
be able to provide headless environment (without OpenGL and Vulkan), but
having just OpenCL as a GPU user. Currently it is not possible since
mesa requires either of those to be enabled for the DISTRO.

Add new 'opencl' DISTRO_FEATURE, controlling enablement of OpenCL.

Note: Mesa, if built with the libclc packageconfig (which is required
for OpenCL driver) depends on the mesa-clc tool from the mesa-native
package. It is required to propagate opencl DISTRO_FEATURE to the native
set in order to be able to fulfill mesa -> mesa-native dependency as
otherwise mesa-native package will be skipped.

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
index 8e90c7bbc85c..eebefc484062 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -915,8 +915,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
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


