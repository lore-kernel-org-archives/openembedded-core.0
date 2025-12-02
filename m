Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740D5D116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 00:50:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7123.1764636596175862350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 16:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=K7TFeChz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KM0IqYnR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1HdYPG3433199
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Dec 2025 00:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NxVGwityZz1
	jaOSBd4L5DsaXQ+lfl48MU/t0nybjMrE=; b=K7TFeChzYBgOXb/VY5rCXD06f4U
	pvQtPOrSCuycE9AOakmGoSfTKFxQCBG7VCDBefN+1oFaQfsyjqNJxyJiBRW/36NS
	b/SkAVNeFEggRn6sjA5CUaJmWAFt36KpSZigcmYjiXhxAdgRC7H/yHNmHFe5kuuR
	5dCIJSpOCcNBy69KjqxArCSMslLUastSofABK5ug0cRxJhNTXsFC8w80Kn6+pGjy
	NX5c73bxUK0cBV9So/HkzfNo2VDLX8PEfaU2viSCBTXOokwk5jy2DqNmRS01XC9j
	leBupe4xf11bbW7gclf+lc/cFw4zZpZInisScjpDFZ81bW+3fS58f2cS2zA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re2ww4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:49:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e4b78e35so875194585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764636594; x=1765241394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxVGwityZz1jaOSBd4L5DsaXQ+lfl48MU/t0nybjMrE=;
        b=KM0IqYnRcvXW+V9dZ1iKqv3PcPLiNk9DRiMWmQ4B16qFeU59NQlHO7VRbj5m6mP7ja
         prbKJWpXXtY6kLHLf6vTFJx2Vok7AY2KaDu3X0011QsK0Pmd/eKfz2fRFyJFYoifPaQC
         pH8aBPfGM195lnQSb9oVMxMXm5Y8c2e12fzXFZjqjjLjUzdnfjGVIvQFS51Lj8UO+acZ
         n13POpQvfbI6o9fO2o/CT55fW+hySru1vNSRnjvmAybEC7zI++2KvykZHjoBa98YENIe
         mYj6xobnUSA9Ce1JOAZ6bdLrGVQ26JsAKf93SnHO+9/a/HFiyX88GRKNlZISGh16iqSQ
         +9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636594; x=1765241394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NxVGwityZz1jaOSBd4L5DsaXQ+lfl48MU/t0nybjMrE=;
        b=APaRj2GKZmV9auElqr5Zx7z5z+3Ix05aXj6L66ga7s8jKmQEKDzuF1guWca20aXThH
         tWDMV+4T3kGBT1koBWtkV2lw0RW37AxOOVruf+Jbfqr/qfc8HTBO9rYJwGA+OskbwmXn
         TK4IhWrGdFw5K+oFXQ4g4+7vFHl45RPUsdX0s9YF1au/2GjYo/nD9nORlfB08zYZsjSM
         7ZSeMBEDzks8MtXQBouxe81ZS/mEOoQVMkAyJ+acRiqtp1B9o2PCmLbV5phrJJHDd/Zz
         oCcxiYwBAWGglYNSna0idsU9I2ihQ9nNndmKgHQt7MV9m+6lDcVEOy5j8Jjw3zWijIeU
         BOpw==
X-Gm-Message-State: AOJu0Yxk+TlMCa4W46L4DCAM4khtVGe1h4KEZrDEh/3icbUDKkr5fyeW
	Qkw3Ir9UtOtiPQcWwkcD6K7Lib1bi5oXexvU786K0FyMF9PwdyHCl20z1skI6MHit3bJ/Ou3QnU
	HWQ3VQjAEMzaqOOGsvNKkBXarka2OuH5J3BatRCDYkgCz4dA6VQWKYVYIf6+SmTo1Lo0UAn82U3
	jV18959jTtcsSuXKw=
X-Gm-Gg: ASbGncunHGrc+LPmAN99fVN/OKJD/ZQo61PQyvUHUMsZPutYcCIsVlB01tCYmainPFl
	h3HaEcBg84qPNAh91pg0OjDGXoidjuKI0oZO6Isb9uuWJ8gjBifpzBhUcfr6bFPqlmu5R2w6Sqb
	chkQ/+OH0pSPtD1ryWjBSwuCxBWKpShLCQP0IRPUYvQmwu3PoPFqIbErpYJ9WPvfh7bdjDlFyAq
	SslAtiwB9ua4L72jJYoSI4R9uBtBSLWp9FvN/aXKKaYu/rCQL+uEHySjiDDmnNE0W5g3hhTZ4/X
	6bsa1f3MBu8xJ366nd8iP1PCRiCOn6EJePXrtHEgthlX9TgU0EQ1casL6QQbcsIZhOSoefPWcYG
	csgOFjtVgkZllgbp4eqFiWEhOPag7C7a5sMyzLYr1+FE6eEQnjwmJjmV3dtFGaiwksDcfrGR51U
	Rv/rhYawMY8OQ4nPczPWbiy/E=
X-Received: by 2002:a05:620a:190c:b0:89f:4306:2a50 with SMTP id af79cd13be357-8b4ebdb09c9mr4072593185a.42.1764636594278;
        Mon, 01 Dec 2025 16:49:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrSbo5aXcz4KCuZ+uGivqvuz283XWqybJmPiMkH/ASvYwfo4ktO/DkCBAplubE5h6kQY7wRQ==
X-Received: by 2002:a05:620a:190c:b0:89f:4306:2a50 with SMTP id af79cd13be357-8b4ebdb09c9mr4072589385a.42.1764636593706;
        Mon, 01 Dec 2025 16:49:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm4058173e87.74.2025.12.01.16.49.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 16:49:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] mesa: enable virtio and gfxstream Vulkan drivers
Date: Tue,  2 Dec 2025 02:49:49 +0200
Message-ID: <20251202004951.2358784-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8fnuemFE4nj13waKsXj0JW_-ldkVWpzB
X-Proofpoint-ORIG-GUID: 8fnuemFE4nj13waKsXj0JW_-ldkVWpzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAwMyBTYWx0ZWRfX//0HKZS/d6O3
 QfD1N4AxPU9m0lCtKIJ3SdebxPtEdr0F5DOT5jucqjzZhTrAZQoRsSPoJ6X4Oxawje4THQEDqSm
 /UI6knEye69ShI8Ehg+LeEUQKygDqmJsb6sEgd27621xbgF1Pgg726ES3j5vbPnKKC74zvTFEnl
 2KBhlFJohO/kUGKhm/lZwi2BU3KjWYwTSiTZoEiLX7/btnkzVX+Tnkmwcm5xzQR76dTbDrUBpXK
 6CFymNG65U08IBv0C5Wyg/98aGPnRGsdGZOdGVukoL5QM5Svz4+s4EoTwiayskAyjVSYueCk+vQ
 UOLStAILlKd8HchatRpkWbMcksQurEWHceTK42FVgmMKwA8q8VFlUfnxWW6fKqNJt318u59qw8b
 2Cq8kB7wtgDtgd5/Fxd0A6buriEpHw==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692e37b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8
 a=zd088w1_HNpux7-JQMAA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227142

Enable two more virtual drivers: gfxstream and virtio. Replace the
'virgl' PACKAGECONFIG with 'virtio' which now governs all virtual
drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...dump-genvk.py-args-to-generated-file.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.bb            |  3 +-
 meta/recipes-graphics/mesa/mesa.inc           |  7 ++--
 3 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
new file mode 100644
index 000000000000..fa97fdd3e922
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
@@ -0,0 +1,34 @@
+From c0f067e86bc9f7fbc60c2539dc612a050ee2569f Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 19 Nov 2025 11:36:42 +0200
+Subject: [PATCH] gfxstream: don't dump genvk.py args to generated files
+
+Full command lines include full path to the output file, which triggers
+the 'buildpath' QA warning. Drop the args and print only a basename of
+the script used to generate the file.
+
+Upstream-Status: Inappropriate [OE-Specific QA fix]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ src/gfxstream/codegen/scripts/cerealgenerator.py | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/src/gfxstream/codegen/scripts/cerealgenerator.py b/src/gfxstream/codegen/scripts/cerealgenerator.py
+index 077571e9eda5..217c3e1d0e94 100644
+--- a/src/gfxstream/codegen/scripts/cerealgenerator.py
++++ b/src/gfxstream/codegen/scripts/cerealgenerator.py
+@@ -254,13 +254,7 @@ def banner_command(argv):
+        Return a string corresponding to the command, with platform-specific
+        paths removed."""
+ 
+-    def makePosixRelative(someArg):
+-        # Do not use relative for /tmp/ to avoid effects of checkout location
+-        if os.path.exists(someArg) and someArg != "/tmp/":
+-            return str(PurePosixPath(Path(os.path.relpath(someArg))))
+-        return someArg
+-
+-    return ' '.join(map(makePosixRelative, argv))
++    return os.path.basename(argv[0])
+ 
+ def envGetOrDefault(key, default=None):
+     if key in os.environ:
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index cfa5d0f40f0a..2c9a38cf658a 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -4,9 +4,10 @@ PACKAGECONFIG = " \
 	gallium \
 	video-codecs \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl libclc gallium-llvm', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+	${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl vulkan', 'virtio', '', d)} \
 	xmlconfig \
 "
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0cb7b504f485..07be1fa12a3a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch \
 "
 
 SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
@@ -113,7 +114,7 @@ PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[tegra] = ""
 PACKAGECONFIG[v3d] = ""
 PACKAGECONFIG[vc4] = ""
-PACKAGECONFIG[virgl] = ""
+PACKAGECONFIG[virtio] = ""
 PACKAGECONFIG[zink] = ""
 
 
@@ -127,10 +128,12 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',a
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',virtio', '', d)}"
 
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
@@ -182,7 +185,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


