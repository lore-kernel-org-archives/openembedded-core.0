Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.2182.1604358187145113447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 15:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S5GyxxDi;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id za3so21200105ejb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 15:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbprt+v5xnrgNKv0rI9Q9MIfpBjDGuVWil9IVXHOoqM=;
        b=S5GyxxDizjXyckZgoVM/Zyw+tyC3fIqyqkgQacK4L9fd11gqFd49CSxJdDZaBdOkjR
         PQPP/RDtPjCPre/qbLnG6ICQlO1wlGin+PXH+2XWkl/sBm8IjynZ89AmMocVZZ2fW+Nw
         UbDifKpw0evhyKWb1o5JqlbsKwgD1A2E/t601FtFRpJdEWpZ2bGOzKloZyFKh81fq9tI
         3hr7H4QfraT12cD+7nmgU9AvhsXRt/k9glsDPeD7B1WPGYmZdqAPCJZgc/iOfoF3jB7p
         AlSIXk2Su/Av/yk9w2mEOzmGpy7J+LZoqHC5S/+qrh6s10hG8wc9IZQPp15C7phAuw7S
         3kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbprt+v5xnrgNKv0rI9Q9MIfpBjDGuVWil9IVXHOoqM=;
        b=X+Ahm526d8aFgdoDunrGhTi1yX9WhDhesyJqLsJR0fEIc38gYMQPmT4F6QwO56/2uy
         EL5BjDYtNRQtziOVF0KmsvNIXFm+0YF/o3D/dN1QB3yfR9n2LPsa155VBtDPVzeTpiGC
         XBu6lyWPnP4dF/QjbbT/VXup3p87P6RNlcjeovfxDme+TO+BGtyGWFV3keoMDEqAmRjT
         nRGane1uHWi49Jq255awBd5WHKEPhC7Ismbral+PcxQTqAa2qaORgxvuXszpsRdMqeai
         13DIMru8fxFw3jgXQDe3z7TOZLCR6hUlZRhqKrvOHMSLwMWrCUpFYnTbqPfnxMpOn9vj
         TaeQ==
X-Gm-Message-State: AOAM532msheH7zmt9FiFfY8NH4kmgXBuyBTGaMVs+I+s/KNlKFjbQRSC
	zB5IpVo0lYNPqfEBySbUbRc32swKmtMwow==
X-Google-Smtp-Source: ABdhPJyl83ahG2nxqfvqZrk/FWa1VipOz8609DCA/rYaly2chztKGnEKXVZ1TWOSyQd0NeAdcfDQJQ==
X-Received: by 2002:a17:906:af57:: with SMTP id ly23mr8240627ejb.445.1604358185362;
        Mon, 02 Nov 2020 15:03:05 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id s25sm9770875ejc.29.2020.11.02.15.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 15:03:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] mesa: fix a build race
Date: Tue,  3 Nov 2020 00:02:58 +0100
Message-Id: <20201102230258.23894-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...race-between-generating-a-header-and.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch b/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
new file mode 100644
index 0000000000..a61e7b2160
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
@@ -0,0 +1,31 @@
+From f148d4f1b5b13288b254ead07f1d008d997e2342 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 2 Nov 2020 23:23:53 +0100
+Subject: [PATCH] anv: fix a build race between generating a header and using
+ it
+
+anv_batch_chain.c includes genX_bits.h but doesn't ensure it gets
+generated first. This causes build failures, as observed here:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1501/steps/8/logs/step2d
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7412]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/intel/vulkan/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/intel/vulkan/meson.build b/src/intel/vulkan/meson.build
+index 36e1689314e..b713d8eade3 100644
+--- a/src/intel/vulkan/meson.build
++++ b/src/intel/vulkan/meson.build
+@@ -131,6 +131,7 @@ libanv_files = files(
+ anv_deps = [
+   dep_libdrm,
+   dep_valgrind,
++  idep_genxml,
+   idep_nir_headers,
+   idep_vulkan_util_headers,
+ ]
+-- 
+2.29.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15f54c5acd..5a6caf2662 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
            "
 
 SRC_URI[sha256sum] = "d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a"
-- 
2.29.0

