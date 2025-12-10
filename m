Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9017D3E768
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:59:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2290.1765389535990154541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eED/t4P8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OD1w+ag2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAHZWQG2669395
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eW7Vdf+Jpiz
	x+XZY3q/E58enmZ8UmrsuUsHFW4Yr84Q=; b=eED/t4P8awMIqKQhhbhUG7yAMCq
	Sc2u0hgWvGReOFTWWlqfWjoAgXxgkxfGlmDpgoLlVJMyva7GuOAEHzFSHIe17erR
	aEpX9KzpI3qAwxGWxh5hTifSo7dzvaMGuoCrUDkQ5DtniVWt8JXqoALmCfI2zL44
	RHWehNDIc7qT75m7WBTUuzpYxqBLmZhyP3MWLhmX/Xx9nKvpJJYJAk2YCy3TPoZE
	Lvia6NEJTVuOIlDbroi3/Ds0kZRwwBmdPm9uuOROjMDxHgMFualomQvkWDNWHTE9
	gHxCuEIRSMG703Yji/PWfN5Z47yNAZK7FmGVfywNhM/+DDJJfstORL1IFuw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay4ykhuga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55a10cb19b5so221182e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389534; x=1765994334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eW7Vdf+Jpizx+XZY3q/E58enmZ8UmrsuUsHFW4Yr84Q=;
        b=OD1w+ag2J3S7QCaiu+RgwawFvHQxQCarebzmYevpX2BRlluvG+uvKX3PJNk5yNKUpd
         d1M1r0RuWTXlgoSQUyR1bhYeRA+B28Y/5GMn8rGKYmBF7PHi2WRuYj2U5MgHDTdjhccP
         NyQCKb1aJZmwORbev2JdUrVpH3vUyS9tTPmSz0wYM5B3+wMW64ZasdVJoPSwPTxpAW11
         wZz1rrJEbRbX2qtHBRMwNRr63rcGWh3jnM0fLj2dEOHxNoe0dtXWOUpDib2kneNVra42
         rn6CMzXjqtiR7VOIb7v1VmcRX46tz6DIJCxb1I5KezTqPC/j/bjmBjSWf02hzZ6zKZVa
         fpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389534; x=1765994334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eW7Vdf+Jpizx+XZY3q/E58enmZ8UmrsuUsHFW4Yr84Q=;
        b=IJaYfNbWJLTKsOhth7BYVnjC2NcFYlADKAledae0FUd9VjPfzAqWCX0ekeLieKRYdj
         Zl+HF8mMJ+VD7g7yNr0E2ApBGsKNKrjgPGTXrERfgjFFMAzQu3CylYx1YUyn8hXc0bHE
         FgHXoBqJcA1F0NER2VhAnC0/vALP0P5zXKmsV7dUMSPz6zRx3wmToKliGz5aSk0TOjZB
         ENVu23s4eJiCoVAHyiF/5aJ8GHeOW5WEgWZjIuOemcq+ePqaQkEzi8hlJskyIVTZD5kh
         XuD5z1nWyH7wut0jDYHg45UELf6QM5PY7j46qZG3qcZlqWENxHEA+S+fRHNMC4lilnS2
         YG6A==
X-Gm-Message-State: AOJu0Yy3MonYekHY/oe4tAR3W6MpFsdnhK7Kdqmrf7Iu/xST1J7offwQ
	6bH3LX4dUEzoRg3y4jPBUNmwoOC7N4bIfY+2/TEq0BzC9m6kEmr01nxNDWPgqe9Pnl7h5mWuITe
	E27OEJvnPOaF0r83hy8udyp1CDf1a///5eq+qiKsuEAfvd9L9u490WP+D2u7hDNxPUyugdtpefg
	rD+RVab3iP9j9DmQ0=
X-Gm-Gg: AY/fxX6qfwphMYKmhO6SC7tU7Ykx+fXUUPGudho5XTbKRGp6EZOwXtZi5xS407/U3T3
	Cw45YaBevlOPH2Qok7oXN+Uzg+GwbNh8CfKWaS6MsA7/iEQ8GEauHEcSfqRguAKPyxLiQeoXt6N
	iVspLsdpxTMs9Kapj/qj3jlA+hUepoyXneNnZh5xih/7hrEe+NndZpbAvODI+S/rx/Ss8tAAcMu
	XQ8mZBZA5D4fnfc+xwlWZZUy8wypuUITphREfWVTq2m/4vyJZNxO7q6ItcY2LxSkYP4kptJCBE8
	5wRoXpYhFVJednXhi/kjY58Ms9gyzr8aEafpSxa4pEE2EZlCEb7O3pDRuDMYXg7hEa/KJ0NEw65
	IDayeP3mFzj1psYVKREOVFpdVcAtJOK9KZXv7EuiQeGIVXA+MbENzT4uXBINOG9V9SzHkyyNofD
	g5xUUZaRKmqpUJA8cHwuHrLHQ=
X-Received: by 2002:a05:6122:d1c:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-55fcfc0d353mr1209691e0c.10.1765389533794;
        Wed, 10 Dec 2025 09:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXhGJEuUxI3IihSDhPbOhxSghbQO/sDfJJSflP5eAJe/EHPgb75p0qLibROk2awgkXdPCm2Q==
X-Received: by 2002:a05:6122:d1c:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-55fcfc0d353mr1209682e0c.10.1765389533329;
        Wed, 10 Dec 2025 09:58:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca98bccsm221771fa.50.2025.12.10.09.58.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:58:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/4] mesa: enable virtio and gfxstream Vulkan drivers
Date: Wed, 10 Dec 2025 19:58:47 +0200
Message-ID: <20251210175849.1989610-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eo8tMaTcveU-hcSeX39DUBvf3wd7VGUG
X-Authority-Analysis: v=2.4 cv=Mfthep/f c=1 sm=1 tr=0 ts=6939b4de cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=XfbUc3fep2JGt7505ZwA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: eo8tMaTcveU-hcSeX39DUBvf3wd7VGUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX5VYStLax1geJ
 9cc9Z6vG56/n2Hn1t9L2Zy2CjXU7ADYz48jsyRoo7CoOvq1i5XXLkFKVl+67wmhjaRV3LfF/pPp
 3I6If/Al1wRI/rgH1qOOkFBOUyRzZBzXxmPydIuY4gdqGjxutBd/OabsD0XieIEBSfT+5KS10Nv
 d7wBidLgHupHwFDg8UZsDYOWxSCy4iVyHvMr84XAoTX8ytKoAwPhuyEceGddXKmr3v2n1+0xuzO
 mxUNDtWV0foAde1zWzsgtvkhJy6VtbeN+7IcR7wrMpfchC3O1+CvkqJ2cTR1OQttGdgeyWpxMSc
 /H9LHklFO03LrZoGzEbPYn9ca49Fds9nMTVsU4+NzLuSYFyOBm7k2JTFgGfNExpycZ986Ml+4wE
 tOM1w+jKmgvb0eMvfmd1bOZYGzY3MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227490

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


