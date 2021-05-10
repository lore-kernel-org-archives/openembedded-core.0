Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.32425.1620657058013936948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BgDQItPV;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so3511497ool.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pANVVbtk/djYfsFPRUAJESga1ZlTY3Fcp5mDhx1Kl5s=;
        b=BgDQItPVUONi3vZg4G7k3x7d9HzHwxfX1kinVlmqmWM0BcqlanzyGi2HXDCUYlAmrx
         8zVGoe81xdLiXFCLZ3vde0gOf83FPbCXJePLEzfjcKsidh1FQEEwDoTPRFikymBMAXfP
         hNsT0PrMD6HVimFtZrG2TCQmCF4WFsi56Aciwj7Ho6umklzW+SL4DJwH9ZLpfjuYPWg/
         JP65XfTsCH0C+O3IKZ/RgDEAB8Mw3bOstbL5DpstvxdrjFIiDMPZcF+OCaabB+yb0pVp
         N1l4jdO0t71WSb+WH0xydPAd+k8jD9/Cd9dfp7aXVYgIsb9mR1NQJU53AHquJ/5K/03F
         eKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pANVVbtk/djYfsFPRUAJESga1ZlTY3Fcp5mDhx1Kl5s=;
        b=TiVxn2fW8zMWeUUU8f57x52tmzlO5eBmGy5fciw53McS5KDRhYIiLViDjnweVEUBIK
         dJL5Xmiz/sS63k7e2Q0/uGR9eOyzZOAWCbi03NKU1lt8xcksdLBW6d38mZ8x+wPpA1k2
         thYTtUvb66tQqW+KaC0Z9yS78SEYxBqQa0nu2J3OkrQDnByzNngxoxKh60dO/L/1UPOT
         9veBi+W8RbknvNzWsC0ACO7xEZ3Hf6m5rRnBsiaVf0lX7RvfZ1O8BYeaSw84PQZlUC6l
         F02giNh1g3RJrmRl9Ne9NoAiVJEC9uSQinqhp67u6d31CwXBCHfw6xQuJFEwCYyqSjQb
         KwtQ==
X-Gm-Message-State: AOAM532qFB/VJ7Q6AVFOpt+jvG4zCCGBm7D739za3hNgKQ0FbSabdINa
	O1q4GM6rVs80BFMOhBk5SAcN0Vcg0uPP5pbz3ek=
X-Google-Smtp-Source: ABdhPJw4oDlNZW2n/oTZ6f9QgiY4vvQs4bQ5X1ZKIqccpPGioTVI/C95rZDShKhRfBAfvYkrlBT4Ng==
X-Received: by 2002:a4a:e385:: with SMTP id l5mr19169283oov.48.1620657056889;
        Mon, 10 May 2021 07:30:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/25] make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
Date: Mon, 10 May 2021 04:28:56 -1000
Message-Id: <51a09f99127a90716b22a48a221838e6af1a617f.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb055446e0fe4771c8bd6122e79d43ef8db2e45b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 87b7d240f5..b58fa9a603 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -16,8 +16,10 @@ do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 RDEPENDS_${PN}-dev = ""
 
 DEPENDS += "bc-native bison-native"
+DEPENDS += "gmp-native"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
-- 
2.25.1

