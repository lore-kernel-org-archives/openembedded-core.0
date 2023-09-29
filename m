Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE197E743F0
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:20:58 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.29418.1696022454382262231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BYO9ud4F;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-564af0ac494so10012213a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696022454; x=1696627254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAsW6bXR1UzMSxBiBC/YL4MEsSZQoSPoTjOr8Yh7GVI=;
        b=BYO9ud4FsiuGzSMHQBd6ejq8YrC1CRRl/53IkfwtJlEsLicFsLPsU4+LOxQpBWvn7P
         GlDtSQAwomu447eSguqPLjrWhm+U26ArT2at1Iy0kAvLaYSymeXsH8TnIbd2lAui2D13
         tnLTaBU+S1ZnR0ScxYLlckR0bhHJOWBIZevkhX5asdGxbiELt5ppEwIprj2VreRDXe6Z
         S15hn0CSHBYkqQ+jHamHRf/TJpErLeBYVJn8KYXrf3YhQAZfZi1WSKBG/6gTVg5ta+Vn
         U3tANvD3j8Mw5K0DAuW4IR1oFXRlD+0P1th9FAq/x8+pixYe4p/rh4lJvC8904eDy0Bs
         cR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696022454; x=1696627254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAsW6bXR1UzMSxBiBC/YL4MEsSZQoSPoTjOr8Yh7GVI=;
        b=tSw2w8U1d2NYYnyD6F88NbBJ2gkFA5OFiCFWjkMGG5nhIq0gXKw+fPlyX2tU7W9L6i
         ir3SrUSfVKq+JjuQ41zcabHYllbGRAObpptfyouuRZo7Sul7IV9SI428OwVTdsZNGDTg
         WrV43KLZz/+gIyORQsl+FOiQwpNGFn9drSNTP69NllE00UorIP9E/qxDicuH+MQF7GLT
         wd5tdq2kLeojabGRkGbt7HV2elwuNB/TzUeUeW1iK/2y87Qi8q/jYbjnS7DLgL9LCcz5
         RlHGLM57zt3bJP0YV3VbCtkN7xNDzHtoGW59j/NTF8W9FWLYHDc/7rgJvdOPMNCxtk07
         mo1w==
X-Gm-Message-State: AOJu0YxRid308lt1z4IkslAzXm6dlkvWPqbdTdpKPAiUlHNZSy4u4Wmp
	FU1BoGf969dRKJCP3MnEB4OUIZnd8C7esA==
X-Google-Smtp-Source: AGHT+IHloG6jimsTBqMxotbR3mBzAW4O2Z0nlyEOTDj8jWvsh82t9P5X6t3CSngQwFymC30dMHD18w==
X-Received: by 2002:a17:903:32c7:b0:1c3:f764:8428 with SMTP id i7-20020a17090332c700b001c3f7648428mr6584332plr.0.1696022453588;
        Fri, 29 Sep 2023 14:20:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id ju4-20020a170903428400b001c73eace0fesm2905080plb.157.2023.09.29.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:20:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] mesa: Fix native build on hosts with llvm-dev installed
Date: Fri, 29 Sep 2023 14:20:49 -0700
Message-ID: <20230929212049.1431308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 21:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188446

This issue is always there, it just shows up with newer LLVM since
symbol mismatches are being found otherwise it was happily linking with
host libLLVM.so silently.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Apply the upstream proposed fix

 ...e-cmake-dependency-detector-for-llvm.patch | 42 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
new file mode 100644
index 00000000000..4cded0546dc
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
@@ -0,0 +1,42 @@
+From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Sep 2023 15:34:22 -0700
+Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking errors with meson 1.2.1
+
+meson dependency auto dependency detection uses cmake and then
+config-tool to process dependencies, in mesa the logic to detect llvm is
+using auto detection which means if it finds cmake then it will try to
+use cmake method. Cmake method works ok except a case when llvm-dev
+package is installed on the build host then it generates its own
+native.meson file and ignores OE supplied meson.native file which has
+correct llvm-config tool specified which is pointing to llvm-config from
+native sysroot. The generated meson.native file points to one found in
+/usr/bin and there onwards detector finds native install of llvm and
+configures that into building native mesa package.
+
+Since cmake detector does not always work, disable it by default and use
+config-tool which works in all cases. This is suggested in below issues
+too
+
+A similar issue is open in meson upstream [1] and mesa [2]
+
+[1] https://github.com/mesonbuild/meson/issues/10483
+[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/meson.build
++++ b/meson.build
+@@ -1659,6 +1659,7 @@ with_llvm = false
+ if _llvm.allowed()
+   dep_llvm = dependency(
+     'llvm',
++    method : host_machine.system() == 'windows' ? 'auto' : 'config-tool',
+     version : _llvm_version,
+     modules : llvm_modules,
+     optional_modules : llvm_optional_modules,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e897ce65c89..95c408dbf68 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
            file://0001-intel-Allow-using-intel_clc-from-the-system.patch \
+           file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
            "
 
 SRC_URI[sha256sum] = "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad"
-- 
2.42.0


