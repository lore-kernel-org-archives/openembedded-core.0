Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDF8D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 04:37:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7237.1765341456468964773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 20:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GROJHxee;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ub7VSjRa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LKLY878883
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NO5ZedSdYsZ
	DQnlVieWNAYJIfz9KREvMSoqdAQPWL30=; b=GROJHxeep3wJngCpL+GQ8HiqGBl
	AL8S4niEiJ9gTiOO/t6KO4sh2CPDD7qCeo76IFIhUf8hwcUVoaHr/qtw2QYPhh2c
	+pCxD7E2gs7ZvmwQPZ4Evht0aj+Ftq0BFpl7LBAyiD9jBWALjQPZf/xRBGNf0qw9
	Wx5D7Toc90heKTUEqiQ6pG51CZAe8Ieq+2CWEdepWl/KJy8AZLofBzaRyvTuyAkY
	a3JFVdAtrKmQobtmdSExoQw/3T6bXS74EJBRKkubkq91Gbn3IBf4WziEsRyA00DJ
	2vFu4tz8W9LAmQ5WJ/Py66CQ1tuoMrGYBp+W6xomc3hVMqNRtsH8L/rzJbw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vtep7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:36 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55b099d692dso3511224e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 20:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765341455; x=1765946255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NO5ZedSdYsZDQnlVieWNAYJIfz9KREvMSoqdAQPWL30=;
        b=Ub7VSjRamzLXpjkY/oq+21I/Kjq5rvpevBfea72eUYvtQBG1hB7OKafjznvignK7Hw
         yw4ff3nfyjhLK48TURgxuwMYILF4XjXfEsqI/PJIO029InFaZUjiVkDSrJMs/zTCd3Js
         ZLDDIs/eihab8NUtBWZH0VFHoJYSk0PGhfjiMur6qNbQZy6O1Dr+Pk6Jls2/QONmdtqV
         QlvsaXPyEhDhcfOWOJgWEoNTBFqSz30kpcv6El5KwZq+tV8WS47eLue2ikbS/LEFXz21
         +VBDpTNofOqaE2BKaEUkh1PH+PJRrjsJ58OG0yqxfrQ42ZB8zmylU9z4L30RTyG8Huji
         GSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765341455; x=1765946255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NO5ZedSdYsZDQnlVieWNAYJIfz9KREvMSoqdAQPWL30=;
        b=bO1ylvtx769WbXQeZFYEF4kgZzO9ghL9YW++QQwioDVqj4UJ5qFI9yFgQmVDUEwCaT
         vbRB7UacXE/wYYixrqyI7ShiYU+3KAOMtFlzuNcxD3NUM8zpGJX7gbE/8e6qi4XcqHFc
         OvKp3dRuXocufL9/I6o8Fkpx+tapSSy7ZR+9y2+zFsxXmjRhCU4m6Bia0fvcB42O3dw+
         zY4RaI/fXHQ5WSWJ2xabFF8GZIM1fWX9AlS+YmeM+1YdGPVi4VZKhFmO0EH00oRiY4nj
         Je+QpfbYUv03u++CjS18fEGz9PXEoKldMJZw9IjkhXAOhTZswU2z8tMQbTnE+mHrPpDW
         cCYQ==
X-Gm-Message-State: AOJu0Yw9brpb3atOR5r5EMDYk6n7Jgll5Zi+NwG2R9OihpY7cPlxzHjS
	FwNEkUrF3rHBrxeTbmVhkrQACy8A6bXWzAvuWw+SFiDT3R4zgbZ7Ka/is87NZGId+b/8uAUC7b+
	E1MyMcM6eAOCoLOPk4wHpvfnpTohhGK4ZdQgF6Xt/phWlR6qDjO1oQU65umNrf4+VoOP0X4TZwY
	nSgC5bobMoai0+UKE=
X-Gm-Gg: AY/fxX6X+0h3JeFQf3oGnrDVkFRAY8qQ8Cg17IT3QuNaj6NR7TPCpnoALAK84t6YsAS
	EHFXCySlyMCd6w0I5FVslpePgCfeNsx2JSlrv+nmgQv1e/VMe3aUPJvd/KXEmUOlirK1sfwId+i
	xHCYUix/Dw+R/gBLeQVaETokzPOyYoadpZCRriRv2jOFJpt2orwUu6dwDfVfJrdOMngszk2hR3t
	GFWZagprEnAwS/DnCG5AJ2SoQvjgrWCGvFQq4CNJs7Hv3nWNyb/j46B2yDjDP6NJ1IMB6CrvXJg
	s60rrzLZ43AMdtdZYZOGkb1U6WA45Y7Yi+pE7VNkajCrQnb0m3UuPLvDc/gJNjC8sNaK1CwdnGc
	0VEi2adtNuNU4HsWusf0JD+ukdCD70Ab3bsdhXT2jflksIzNgDo/kbFBNnxtbF1C40R5MLhtTfP
	EOKrTL/gpjWO+OPnUA325I7xM=
X-Received: by 2002:a05:6122:1d94:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-55fcfb4b2d9mr396966e0c.6.1765341454661;
        Tue, 09 Dec 2025 20:37:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv3BCU5CByXL+e6QQldC6Qz4wshWjU9GyWcZTQCuYqJ3Av7+NK8VaawBdsfarCcsfXbRF5cw==
X-Received: by 2002:a05:6122:1d94:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-55fcfb4b2d9mr396962e0c.6.1765341454169;
        Tue, 09 Dec 2025 20:37:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fb5442cf7sm1287461fa.37.2025.12.09.20.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:37:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] mesa: enable virtio and gfxstream Vulkan drivers
Date: Wed, 10 Dec 2025 06:37:26 +0200
Message-ID: <20251210043728.847548-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jrAIbhBN3Gm64dd9zU5c33OTpcNLzymr
X-Proofpoint-ORIG-GUID: jrAIbhBN3Gm64dd9zU5c33OTpcNLzymr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzNyBTYWx0ZWRfX4JqfNBP+cirY
 /fqFEs3XVonIGD0PTbxNeHOMakyEuLiNPpWqR1hgjfwS63aMX+o8l629F9eYmgkhQY9HwzmnvuM
 mnw9tr3ZdrADYvS09xLDgGF+ulz9JtZRsNh284fusNDoDXsEDbf69gmfqKEkLjJJF84y+BxO//t
 fHsT48SEOPoPr3mzgDT0TvW4Mm9tWRMpmtllG+s2N5JDg760vf3/GBfSf+QS2EBq78R1nZOTeqa
 Axcq27eX/6jG2UhnxS9FMCshzvBoIXX8ei+JzQF7O+o2bzcbfJfraId34fWIaGpUWVUVNWx3KiA
 wqVQiigfGDZCrJMHbiTb1OLaHNs2LSxTRDwt12fQkQmPbIHbwMFK0kcwbSPYAamVDIr3cyn7HcE
 46tJ3qc3BoYIK6zJkuhAvZXK4cjTgA==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=6938f910 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=zd088w1_HNpux7-JQMAA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227455

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
index 9b25bc0301f0..3a2bb2e57917 100644
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
@@ -178,7 +181,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


