Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.19247.1597251826728673226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UJpAntzv;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id a19so1359325qvy.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOVOhPIVkIp/f+erPs0NlUI5jzp3oiHUARqQA5LzyvI=;
        b=UJpAntzv6frc/g3J0O3WkO3MBiAPja8BLzii3oD41ZL34F9eav+fLGVht1nvGgUqr9
         dlqRMJmeQHDKLw4zLbGpmXYpLyNiO07qKL4iTFwyTEdR63yZe+s+t0cFgFbrEfURvqv7
         7OIgv1HiS5dZhGxdfkKsUkg8ER+y+AgKCYaY9Zzh695SlXdpv23Ub4BcvxUqdJvAtxEK
         J4w4l5HNR6tvdmfDpi8KpzndA+1HdsLyYcUcvFaQfoNOkNBQLm9V8r+t/wi6HLuTRfbj
         jA6tALkLcLNfN1Q67GzlWYADdGEq/g3Hdm4JFZAM244uTxTc9xHnfeV7cdORAi4q/53j
         EVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOVOhPIVkIp/f+erPs0NlUI5jzp3oiHUARqQA5LzyvI=;
        b=Spk9pHlvuQZ/tj4ZWn3FO/q+6r1zIkFP58L1cFN2G1o0Mu2x1sMCnlzKUKyMx3YCKB
         G2WQ1Cdk/t46CPNg2aXfZEKAK5oek7tX875/GnHEsWc8a6bp2dUqs0drXh2Cemd6D1l/
         LBNNBEmdKF8VehRkAcvGHUI1OjgneT/2UrAjehR56G0dNwrPCdl6UZCuFgPv39E8IgHo
         oYNWea38TUix+48ZTCZA2aflHR3YfQXCaOP7qx7bN9hkuJH4OGPoyUmYhZvmIvX9vifU
         PSqZ1CDyyrNLBEExoN4JpLOpkfT+gkvkf3DgX/q2KW7JbVpMr2sqn2wA/D2R728XDJ9l
         69Kw==
X-Gm-Message-State: AOAM531FkT2syjLsK0yKaPkGfsdLBqC97OegvTxZIn9Yy2DgKKPeYtsG
	l0B0zWSEHaxYZNUKt3/4YQ0=
X-Google-Smtp-Source: ABdhPJwZ7V2souFaFS47Rhr7X/XlfFupPc7T9qG6YVAm+d9sHifv+ooklNxF5gZGc7EJ9Uzgc42U0g==
X-Received: by 2002:a0c:b524:: with SMTP id d36mr582020qve.12.1597251825367;
        Wed, 12 Aug 2020 10:03:45 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
Date: Wed, 12 Aug 2020 13:03:29 -0400
Message-Id: <2ccb927ab304e390e4db8f738450c381045e9f96.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

With kernel v5.8+ and gcc10 plugins, we can run into the following build error:

      HOSTCXX -fPIC scripts/gcc-plugins/arm_ssp_per_task_plugin.o
    In file included from
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.1.0/plugin/include/gcc-plugin.h:28,
                     from
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work-shared/qemuarm/kernel-source/scripts/gcc-plugins/gcc-common.h:7,
                     from
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work-shared/qemuarm/kernel-source/scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.1.0/plugin/include/system.h:687:10:
    fatal error: gmp.h: No such file or directory
      687 | #include <gmp.h>
          |          ^~~~~~~

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index c7edb20ee4..1ab248fed5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -15,8 +15,10 @@ do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 RDEPENDS_${PN}-dev = ""
 
 DEPENDS += "bc-native bison-native"
+DEPENDS += "gmp-native"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
-- 
2.19.1

