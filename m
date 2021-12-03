Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6356AC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 04:06:09 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.7511.1638504368141734340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 20:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+yrpf+p;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id p13so1679531pfw.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 20:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I4Gz70qi6zkJpNg2F/XUmihS7IEkZMxMA7T67lOus0A=;
        b=n+yrpf+pGYSlAjVogUZybam3Fk+huDym+lPcRQoec4NP0qbTGPTSFZLFNCHR+AVASz
         mWyfaJcaD3GXSJsAex0CwhHorpjU7IzI/4CRJFtf5W4tRXm9jqWGSLnjFkoKdvWzjS4p
         5mNPP0XB74KfAUEGJzaf4wUGgN6gp+3a5nFzCKufCJsalSDSAzA+brEV+m53LOTpFFbY
         kNPLQ5b9tJEyPsfGCxql8DDqAb8WucjEGxtfKoGsD8SZJyA6e7/KRYT5ZAvIwfvcKnkb
         /Q1wxtqYINMX3HIDxcjk03UFUgX4ztmOHafebw4JTlhzHA4GDlPl58HutkRTESkOXvVZ
         FKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I4Gz70qi6zkJpNg2F/XUmihS7IEkZMxMA7T67lOus0A=;
        b=NbiHT2F7U+W1YIbXr37Otlr4riDdMCp0qCAK9Qm+VCxWM3XZYZJ7NTw63EQ+61DHg1
         H3Jt0VWL6CMt6Bw8o76XD/HaOoU7K+S9U1wradheyxv+LddBOH/evBp77r52lGEXo7sH
         XutwwpfULbHl3VbfKF2Fwts1waSt8DX7a2dZsRAx+8grmlZgs/+BOK0tsGyucD7BwfOR
         elJ5R1QyYNS9ANFFuvDd3FT/58oJ9w1RA+o4zcWl38AL7MUASYFzI3KUtMWTB5Ex/lfS
         b4+/SC4sehUYQZVYS123HzyZ6LTrvCF6kKAq/tAEZA0LDKvQ8Vh113IXS0UUs58Ba+ye
         8kHw==
X-Gm-Message-State: AOAM532waOYmDh2hbKDPxU5d/AtmlBluaqlGjVP4tka7jwWbSK3egyEC
	Nv9OsCB6lTA+cGW0Cv+x52hLANs+8ZpwAw==
X-Google-Smtp-Source: 
 ABdhPJwqzNPoA+qorFtJ+EFYndJTKfKUDs1WfuyyDZTB5+A5o76njK3oaZYcoib4wYAa0/Pfn9phfQ==
X-Received: by 2002:a62:88c3:0:b0:4a2:b2d2:7082 with SMTP id
 l186-20020a6288c3000000b004a2b2d27082mr17007727pfd.48.1638504365510;
        Thu, 02 Dec 2021 20:06:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 l6sm1375156pfc.51.2021.12.02.20.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 20:06:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] mesa: Fix build on ARM systems without Neon
Date: Thu,  2 Dec 2021 20:06:02 -0800
Message-Id: <20211203040602.3503654-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 04:06:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159110

See [1]

[1] https://github.com/YoeDistro/yoe-distro/issues/626

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...ormat-Check-for-NEON-before-using-it.patch | 49 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
new file mode 100644
index 00000000000..80b9af08e8f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
@@ -0,0 +1,49 @@
+From 4febda271c6bb0dc69ebf573446c6922a1ec35fb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Dec 2021 19:57:42 -0800
+Subject: [PATCH] util/format: Check for NEON before using it
+
+This fixes build on rpi0-w and any other machine which does not have
+neon unit and is not used as FPU unit
+
+Fixes errors e.g.
+
+In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
+/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h:32:2: error: "NEON support not enabled"
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/format/u_format.c             | 2 +-
+ src/util/format/u_format_unpack_neon.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
+index 36c5e52008e..f0a00971691 100644
+--- a/src/util/format/u_format.c
++++ b/src/util/format/u_format.c
+@@ -1138,7 +1138,7 @@ static void
+ util_format_unpack_table_init(void)
+ {
+    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
+-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
++#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
+       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
+       if (unpack) {
+          util_format_unpack_table[format] = unpack;
+diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
+index a4a5cb1f723..1e4f794a295 100644
+--- a/src/util/format/u_format_unpack_neon.c
++++ b/src/util/format/u_format_unpack_neon.c
+@@ -23,7 +23,7 @@
+ 
+ #include <u_format.h>
+ 
+-#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
++#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
+ 
+ /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
+  * unless you tell it "no really".
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ed60d982504..30b9e93f630 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
 SRC_URI[sha256sum] = "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
-- 
2.34.1


