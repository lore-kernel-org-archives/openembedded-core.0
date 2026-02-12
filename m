Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5348FEE36B4
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 17:53:26 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51310.1770918802233973636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 09:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=HuLUwOpq;
 spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fBjZl6DL3z2mP;
	Thu, 12 Feb 2026 18:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1770918799;
	bh=k1c/YWvgdDv4pAm+EVBbgEUyM07TXSdmN5gKLCLnU04=;
	h=From:Date:Subject:To:Cc:From;
	b=HuLUwOpqqp4+2yWYjkeZKcu2toOwQoaFRBY80FJ9yJrDDRD1K2mkZblK+slr5yJRQ
	 6HOHM94VInuV8Ym4jQXgodH66J+dwn7Ln16xP6ISoYReVaDg+fRNm9kujkUotzDbKY
	 j2xRyga63BW0oPMvOSsti2qzmpv38FzhGjj7Inh4FPs4iYSq08O8UfxNiuL+DdQKzk
	 Kz87c3OOhIsoQKM2wmwZKQOaF2b7pzx2s86p4LxCIshh5ZZsxK+oofLDH+5ODqq6z3
	 lHJ6dHKe393yNC+hG9pXXsEU1g8hxcpyULuStevbFlOgMO7c0DqWq53PFXqw4w+tPU
	 ZdfXr3pwT35YQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fBjZl24yMzfrq;
	Thu, 12 Feb 2026 18:53:19 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 12 Feb 2026 18:53:04 +0100
Subject: [PATCH] classes/meson: fix bindgen_clang_args when default
 toolchain is not clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-mesa-opencl-big-little-v1-1-7f328328d149@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTsJTIwVr2JcQPnBMbWQTjEmh
 Ltbdfkt3tvIkBRGl2qjhJeazrGgOVTk712cwDoUk9RyqqURfsI6nhdEH7jXiYPmHMDn1js3YHT
 SHqnES8Ko79/4evvb1v4Bn7832vcPNm/hNXoAAAA=
X-Change-ID: 20260212-mesa-opencl-big-little-89c77def7294
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 17:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231053

From: Quentin Schulz <quentin.schulz@cherry.de>

We generate a wrapper for bindgen arguments when building with clang but
we don't actually use clang variants of variables when generating the
wrapper.

The default toolchain may not be clang, therefore TCOVERRIDE will be set
to that toolchain instead and if variables have variants per toolchain,
the one for the default toolchain will be used instead of the one for
clang.

This is an issue that can be highlighted by trying to build rusticl
OpenCL mesa driver while the default toolchain is GCC and for an ARM
big.LITTLE architecture (e.g. cortex-a76.cortex-a55). Most mesa drivers
can be built with either GCC or clang but rusticl OpenCL driver must be
built with clang for now.
clang toolchain doesn't actually support the big.LITTLE architecture at
all and must build for the LITTLE part of it (cortex-a55). This is
currently handled by the CPU_TUNE_ARG variable in the impacted CPU
include configuration files. Until now, the GCC variant would be used
and the flags would contain -mcpu=cortexa-76.cortex-a55, failing the
build.

After this patch, clang-specific variables can be used and this will
result in the bindgen flags having e.g. -mcpu=cortex-a55 instead.

This fixes mesa's rusticl build on Rockchip RK3399 and RK3588 big.LITTLE
SoCs.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This was tested on top of a local branch with mesa-26.0.0 recipe. Only
tested with mesa (and any of its dependencies using meson I guess). I
can now have clpeak running on my RK3588 boards and mostly working on my
RK3399 (the GPU scheduler times out for float16 Global memory bandwidth
(GBPS) benchmark but all the other tests seem to be working fine). Note
you must set RUSTICL_ENABLE environment variable to panfrost otherwise
it won't work.
---
 meta/classes-recipe/meson.bbclass | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 2c098771fe..ce607703e3 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -58,11 +58,30 @@ def rust_tool(d, target_var):
     return "rust = %s" % repr(cmd)
 
 def bindgen_args(d):
+    # Variables may have clang-specific values and this function is only called
+    # for bindgen_clang_args, meaning the args must be the ones used by clang.
+    # The default toolchain may not be clang and some recipes may use two
+    # toolchains (e.g. mesa rusticl/gallium-llvm requires clang but not the
+    # other drivers in the recipe).
+    # This is necessary for example for ARM big.LITTLE CPU architecture where
+    # -mcpu will be set to e.g. cortex-a76.cortex-a55 for GCC but clang doesn't
+    # support big.LITTLE so we need to have cortex-a55 only, see CPU_TUNE_ARG
+    # variable.
+    # Therefore, to know which parameters bindgen must use with clang, we
+    # simulate using clang by setting the TCOVERRIDE to toolchain-clang
+    # temporarily.
+    # This is of course unnecessary if the default toolchain is already clang.
+    if d.getVar('TCOVERRIDE') != 'toolchain-clang':
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('TCOVERRIDE', 'toolchain-clang')
+    else:
+        localdata = d
+
     args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
     # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
-    if bb.data.inherits_class("nativesdk", d):
+    if bb.data.inherits_class("nativesdk", localdata):
         args += ' --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}${prefix_nativesdk}'
-    items = d.expand(args).split()
+    items = localdata.expand(args).split()
     return repr(items[0] if len(items) == 1 else items)
 
 addtask write_config before do_configure

---
base-commit: 3a8f0075d52cb653118774baa03aa8d5231f943c
change-id: 20260212-mesa-opencl-big-little-89c77def7294

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


