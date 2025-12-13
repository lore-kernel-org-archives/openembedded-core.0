Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B713D59F68
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 03:12:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1953.1765595531099531249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 19:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ASC4DGuY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OJWRDsgC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCDO2kK753324
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eW7Vdf+Jpiz
	x+XZY3q/E58enmZ8UmrsuUsHFW4Yr84Q=; b=ASC4DGuY4QDfFnR6bSvXi3Wo9gv
	RVeRC4gMlPEzvUM44yOT8Earsixa0ZjJMZg1vUpywi0ohqHiCH7TL4CVncSzsyRE
	RwcecML2mQcsT2OX87g1Qxn0PdS70sjxs1ZJuPFL9B9ozwewEGvaibf79GXrnkv0
	IfV8LUgxKgMHpzuysiEe9GgEpe0oQmV4R4LrcnksQBSwrvA/zX4fCmTF2kt1CaB0
	Sj8Szl2a5wnGQuC6ed83LWQefV3qrEy8vMABbTSczjrVtsOrLQkpGhaS5X9l/P++
	JOUwC6PTzfK2KZ4SAvWZMySPMzATU5L0QK92cFpTJbPy9F6jywC4SlczUxg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0kw7sarn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559836d04dfso2627805e0c.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 19:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765595529; x=1766200329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eW7Vdf+Jpizx+XZY3q/E58enmZ8UmrsuUsHFW4Yr84Q=;
        b=OJWRDsgCT6rMu9tQvOQMUBMuTvfdHfnPsURRxyjaK7yxi1PPf1NbpJSSxWOAIt4IDL
         Qmw4IUFZ5P4DoW8PMlUO8Sf45Fj/lGcgZHX+EY9eDtkP0BfX90hzV26AF59X5DPxtfZo
         dDbvkfJpmzJ4Sr/ls2ozzXjyekqVkXQxCJdv/VJElKMsIRVcuWW1TI4rFJ/V7jxxUTtW
         XB6t2PQyzE1kD5h03lDENg1iVxxxEM4Fcikvzy3jU5qXnQQuRR8fdtQagJwZVbEchWiK
         FrAkWYUgOkdA2OTAw39qeOzZT7imbSUeue5NqxCSncqK4x6QestBklhaC+r6nAEg8R+F
         YDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765595529; x=1766200329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eW7Vdf+Jpizx+XZY3q/E58enmZ8UmrsuUsHFW4Yr84Q=;
        b=qhbyxbHRhl1vDynq1UKfOrA1zFJWP6c2NtHlBgEsQFY5Zrg9pBmDb8IH0yW2qlozV7
         ywwlqp44i3MB0t4MzbzyQly3ZgcTeXUNmAxJ4V4LXgGeGvL2hQq5rxK1YfuMFpErJo5Z
         ufQrBAjfOF74sQ4tBIU2cfYWzbMgfjxClLIs2qfWhAvwtjxzyWt39sc4yHjpYK6iXj63
         2APnrgpvILsVkgwhTMNLYqFxi6jEie28yAyLklDlrSMxDUfxaHanOR8h6uHhwMcB1qef
         g//+5Z44Plu/yg1+veVMh2bsMzVMG8kydf9pX20aWVQ+aBYHI4GO2kZktv4jH1NZ8EaN
         JmTQ==
X-Gm-Message-State: AOJu0YwSSnjxJ1vrgfZCRHiKG/YU41rGJwEdOv9czxHtiI4Zh2Geto1D
	4oU3lS1OyWkdUd7o0MRRgR7tcVIhfOhqWdVgZsYtQLFiXy1XkfiqduVAllgFvkYbx4kZzcWtyZA
	2FHMWhaJsPnNHDlIs8f8/fQqE9MAmtmLiY6eijp5CGGwVwtKLu6qH6mRmDIs9Uo9R4apE71LQOM
	ClRAuYN045WUk5mKw=
X-Gm-Gg: AY/fxX5eEW46yq0DgsIC96Owe9oijdF6JfDlXG/dcrj8UCcrLCAoxg+J9c+o1YQxMl1
	IY1uNjY5xP60vHMYLecfJjmLFH6LjFa2MqGTJD7GchypDspQIYps+atSMb1o1Z3O8R37qqg1fhp
	j2L8bvjLD3G9XRUMt6A+xYTPUoIrJ4ff/cz2f7gbovwaMGnOeaxLRiZ9uiDuOJ98ViIsqNQvMd3
	iyi0RJTyovtZGE2c2sxhMKQxZ0NqAfo46i7TvBnoTJ6xJKTWEPB3iytKmjLCS7d0F7E9HPGtL9z
	M1hyWTng6vwPUSzEoVySJQblBGLUdDQ+/BwmGqbkxmXM7LfeTXhMaU1rPahXUx0k4NInkqrMqD6
	0DMQgJ22DOsOmLTQB0XwWObEDs2A8yLmrJ3gvIveO/msbDaIjRle46NT8vvr1lmgfOjQCSVMsc2
	XPpoLX8tSCacSYp4fgxtuJwaY=
X-Received: by 2002:a05:6122:50b:b0:55b:305b:4e35 with SMTP id 71dfb90a1353d-55fed667b95mr1547147e0c.21.1765595528899;
        Fri, 12 Dec 2025 19:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7wtQ7pwSUwEXd6uGW+ERdY6qcx5sPYxeUCSRMLbL04B1V6jfvJ0ppDv1JAYLwX5naUaZSzw==
X-Received: by 2002:a05:6122:50b:b0:55b:305b:4e35 with SMTP id 71dfb90a1353d-55fed667b95mr1547145e0c.21.1765595528308;
        Fri, 12 Dec 2025 19:12:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe5401sm2814921fa.4.2025.12.12.19.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:12:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 2/4] mesa: enable virtio and gfxstream Vulkan drivers
Date: Sat, 13 Dec 2025 05:11:57 +0200
Message-ID: <20251213031200.2619204-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JY2xbEKV c=1 sm=1 tr=0 ts=693cd989 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=XfbUc3fep2JGt7505ZwA:9 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyNSBTYWx0ZWRfX9Oq6W7CNWE26
 /Kt+D9cScnq0Vqird3EfS2beh0ppRxtGnDzuLYZV/m45fr8x4fWy9Q/C9sY4vXGv61jX9na6HSi
 61WjaqBmM06FNbLifpjqpLIkdU4kC9pKmTyn59KRBjAJ8nLrSSvePSF3whkLwX3vH/047QEPxKf
 Q6IA40CT/PisUqG+nXEPb714Ht3XUlBJ1ZyiFswt5bXmY8Pw1qCFY8ziEpz+Na5ZxiNWOuxKIgf
 v5icqB0hILdz8g18GBAaUt82VaSOLCffvN/79wPa89lsPYHhFtZkwnHgXz0fCOjJRM2SaA5L2p4
 X5qk5O4QngrfS9glhJrbzPDUPgJ0611vUVnSV3eeCDkfRMn0dqyDDzkmoRj2abyJUlXolSmttbI
 A9TcWv6o6IJel2A/wgP4JoKR4N8XYg==
X-Proofpoint-GUID: EOFmmcpGXp8wwXvMmrFy-5t4A0sG8V6E
X-Proofpoint-ORIG-GUID: EOFmmcpGXp8wwXvMmrFy-5t4A0sG8V6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227612

Enable two more virtual drivers: gfxstream and virtio. Replace the
'virgl' PACKAGECONFIG with 'virtio' which now governs all virtual
drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...dump-genvk.py-args-to-generated-file.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.bb            |  3 +-
 meta/recipes-graphics/mesa/mesa.inc           | 12 +++++--
 3 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
new file mode 100644
index 000000000000..097ca84e3b3e
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38875]
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
index 9b25bc0301f0..ac6038873a72 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch \
 "
 
 SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
@@ -113,7 +114,7 @@ PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[tegra] = ""
 PACKAGECONFIG[v3d] = ""
 PACKAGECONFIG[vc4] = ""
-PACKAGECONFIG[virgl] = ""
+PACKAGECONFIG[virtio] = ""
 PACKAGECONFIG[zink] = ""
 
 
@@ -121,16 +122,23 @@ VULKAN_DRIVERS_SWRAST = ",swrast"
 # Crashes on x32
 VULKAN_DRIVERS_SWRAST:x86-x32 = ""
 
+VULKAN_DRIVERS_VIRTIO = ",virtio"
+# No atomic_uint on ARMv4 / v5
+VULKAN_DRIVERS_VIRTIO:armv4 = ""
+VULKAN_DRIVERS_VIRTIO:armv5 = ""
+
 # keep sorted by the driver name (rather than PKGCONFIG)
 VULKAN_DRIVERS = ""
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',amd', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', '${VULKAN_DRIVERS_VIRTIO}', '', d)}"
 
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
@@ -178,7 +186,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


