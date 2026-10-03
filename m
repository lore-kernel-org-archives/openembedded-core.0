Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF22CA5FEC
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 15:16:26 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7446.1791040583987695718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 08:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T+ZYFxDV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398a5aad413so223895a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791040583; x=1791645383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcJ5YjU6xhQZGQQm0z5FDwgD6g9b5hGtDdAsIQezpVc=;
        b=T+ZYFxDVnd+04nrE1apCaPglSMO3epjuMnnwEFdvrKvuxE879VaCex5nvtMJD2ap5G
         xi44urKv4WtkETSh969feCmVyaPVc6enq/2OJoK50t+/gogcYAfs0+8ifaLAoZZj0Pll
         d73qJE2aCJABIh40VZHJiHqlWWZzIZftUA0VehiLI3/ivOwRtt+bSIq/QhkmLydERjnr
         bR0WeKnKI+ObTQxU1OrRtwNtu8LhlznPRb+XkxGxrERlSFBN0SWv4dSf+zA2NxrMqC0L
         /Ge0OMowpVcCWxr8g/eRKfu1ZnMPAZoXggRorm2cCvD2nofPvYI5NHurRNbcbh+Jsrvg
         FsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791040583; x=1791645383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcJ5YjU6xhQZGQQm0z5FDwgD6g9b5hGtDdAsIQezpVc=;
        b=Mn3MwSfrgtchrVyNkWrSlCo8rnRO3NopFCQVPFaqzU6XEEORrXMp0y+lHh0sg35QUp
         mtK8sKawebTGhMKhZj4bMfpJVj0HcXOe2O37bG0CJMp0bBXK6MOXVAb4kV7PO830YHgl
         WD6LmWVnKeoJs2OBpWWJIASRBECKczck4Oyb0Bx6I8psWPahONgg7a7z9cbwR4nZIba7
         nVHBgPAJWR09yeuikTlR6eXR8awVatDSQkXYFib6NLGPMXHu/ABi5lU+v2SyG2srR2+1
         MF0+tp8oIT9WUFgWBi/lzN36BrxOXnjUCyTE9/lgFn6Q85kGXRLay/hKFFHA0b6pTAef
         2jFg==
X-Gm-Message-State: AFq9FYIMZhRuKrnpOahUHncSdbx48NizZd+c+ZDpwdHDzfaNU3tOv0G7
	JMFvGz10d0AopxW0qIOCJbkfSdZDMK9uUMRSB3X3vsyelqoZ0HGLvjD0b3DiLu88
X-Gm-Gg: AYBFou1izYN2bkqgRPcMc+rXGNptVVr34a2vediMo+rZ9zoFh4Aajr0ZwjDzqIlhbhS
	cTXW06dnk1OD6nds88y5TnUi70Pv4Fn/2ZY9XY3f5DwUMCda5pqE+IO4Qwbfj62ImCXNzkPdQ3a
	E5q6AXKbmDp6gLkGQQLn2/E8A2VHk2r5pft2uDyEtlrQcBSQp3/awvlrBdwcVG/A/l9C/W92/wV
	ED1tegxbslWv4isNg11o6E30hAPY349kwqW4oBvHKrn3iekOCmsnHUKp/Op+W+1KFgMY5n+QAYL
	9jd83OWzRN6kyRsgOU60/rAokDg+nBjZHkJSYWKZK8E68uNv2JYeqoIUprhwsrw1a3xMqtsgQ9p
	4NucZHV76IodBh0bc4WucNo5b0u8I84V0hw2TLsyMx5lj4vT/aPFKbDj0/YmYVYsaHt9QtKm+uM
	GNKKdx8na/g1C2joGFjDVBYAWLUFOWVYcC8/2cyeQwxHF7XGQ1VjKrDtijgYvU7hHOVLBxdhi/f
	/7SDq47LcBh0Zg=
X-Received: by 2002:a17:90a:ad7:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a78799f049mr1389771a91.49.1791040583181;
        Sat, 03 Oct 2026 08:16:23 -0700 (PDT)
Received: from cfarm422.jing.rocks (cfarm422.jing.rocks. [2600:3c18:e002:2e11::c422])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7355535sm2165950a12.5.2026.10.03.08.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 08:16:22 -0700 (PDT)
From: Jagadeesh K <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH v2 1/2] meta-extsdk-toolchain: Install multilib toolchain files in the eSDK if multilib is enabled
Date: Sat,  3 Oct 2026 15:16:10 +0000
Message-Id: <20261003151611.2218124-2-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261003151611.2218124-1-workjagadeesh@gmail.com>
References: <20261003151611.2218124-1-workjagadeesh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 15:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247161

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

1. Ship multilib virtual/cross-cc, virtual/compilerlibs, and virtual/libc
packages in the eSDK if it is created with multilib configuration. These
packages are required to compile source for multilib using the eSDK.

2. Include multilib tune configuration directory in SPDX_MULTILIB_SSTATE_ARCHS
to search SPDX document as meta-extsdk-toolchain is dependent on multilib recipes.

Changes in v2:
* Replace all_multilib_tune_values() with oe.utils.all_multilib_tune_values()
  as functions from utils.bbclass are moved to utils.py.

[YOCTO #14020]

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 .../recipes-core/meta/meta-extsdk-toolchain.bb | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 16fe185964..22b8cd045d 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -2,7 +2,23 @@ SUMMARY = "Extensible SDK toolchain meta-recipe"
 DESCRIPTION = "Meta-recipe for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
+
+def add_multilib_depends(d):
+    mlpkgs = ""
+    for v in d.getVar('MULTILIB_VARIANTS').split():
+        localdata = bb.data.createCopy(d)
+        override = ":virtclass-multilib-" + v
+        localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+        for p in localdata.getVar('BASEDEPENDS').split():
+            pkg = localdata.getVar("PREFERRED_PROVIDER_%s" % p)
+            if pkg:
+                mlpkgs = mlpkgs + ' ' + v + '-' + pkg
+    return mlpkgs
+
+DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native ${@add_multilib_depends(d)}"
+
+# Search the SPDX document of multilib recipe in multilib tune configuration directory.
+SPDX_MULTILIB_SSTATE_ARCHS = "${@oe.utils.all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
 do_populate_sysroot[deptask] = "do_populate_sysroot"
 
-- 
2.39.5


