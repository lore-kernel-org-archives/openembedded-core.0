Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D747BC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:34:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.239.1647884065159911307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 10:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aeWFn8KP;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id t5so16094988pfg.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzU1hALxE9pzgsdEJLIzWg/jxgUoz7IWTAKHdlMZYgs=;
        b=aeWFn8KP8M3c4PN1V7x4hOdhF/u/U2qpjjs13Sybc+6G/6+RqxbGgsnWdWIJHOQxsh
         oX6EUrJfQ22SpjX4DX6YA/W5fC2zh0vXP/0mgrfFflC/spQCyxZcPXXd12W3TmArtM46
         I+KkXnXyRsvn7o/S6hZmGgrK5Xp5NJEVz17zsZNjrT49hnYr9WTcuXSWwhWCKw5taysA
         beo6ULWLu3UFNnR7jjIy/I5L4ReievJVYz9HEgNz8hvRlcxfNLn9M/JEZV5XrsF54k/j
         Id7Dl1jcY7ANdoexH0laozM/G0NNDRAs0kQedRTYAHdcVWzRQE92vM8UoV9AwQ+4u0eG
         UlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzU1hALxE9pzgsdEJLIzWg/jxgUoz7IWTAKHdlMZYgs=;
        b=jD54dAvmiH6aYQm6+LDeiD/N6EEx8BIPLFDvsQi4AgBHma1I5yyzAx8qST260BXH+p
         YDHlDQhtlWuQaImS97zRBnC3EFFhiGnHRqbhelvDGYOtn+botXYo1Jy0VoTyuH3tumhm
         paCQfszk0JJNK1ZHT2o+EfByIQNdnkt7H4Ac41+d98nfwKWfwFIK7+rLWDoNtNZ6NdV/
         bw1NcIpUGNoYjSrTuhA9Uh1dcsJvflc7skFxbF99IhHtUnMYoZaoi5aQ8JvNq+M2S45Y
         UDX3Zp9zb2J1qI3HZXgNbP8Le1Zvb3nfVHn3Bys8s5hTpM1b7Xu1qSDnKpSzPcgkfxzN
         1ZMA==
X-Gm-Message-State: AOAM533lb0oOMTGpWxqPl5p4A1OX77RDvUWBt2+d76ZE2bosPXOab505
	+QxntCPETWQL+Hbn7wsZpbxRb1EiPUpsRg==
X-Google-Smtp-Source: 
 ABdhPJwk1wPkKxI9GVwbO2SkMN9DOIULYQeu4ofbh5v3Iyx1SP/Jz5r2eRur3KwBsKKplo5l67Mu6A==
X-Received: by 2002:a05:6a00:10cb:b0:4f7:942:6a22 with SMTP id
 d11-20020a056a0010cb00b004f709426a22mr25539360pfu.84.1647884064293;
        Mon, 21 Mar 2022 10:34:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 ip13-20020a17090b314d00b001bfaa1f060bsm116823pjb.5.2022.03.21.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 10:34:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix build on systems without MAP_SYNC
Date: Mon, 21 Mar 2022 10:34:21 -0700
Message-Id: <20220321173421.3429009-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 17:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163512

some architectures like ppc/mips do not wire this in kernel since
linux/mman.h for these architectures do not use asm-generic/mman.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 216af037a66..021a41c1dd1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch \
            file://0001-acpi-tpm-Add-missing-device-identification-objects.patch \
            file://0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch \
+           file://0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
new file mode 100644
index 00000000000..4691a3672a4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -0,0 +1,48 @@
+From 444e80e63d35006f41e7d658e2bf6d7c9f7641df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 21 Mar 2022 10:09:38 -0700
+Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
+ systems
+
+linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
+which include asm-generic/mman.h and mips/powerpc are not including this
+file in linux/mman.h, therefore these should be defined for such
+architectures on Linux as well. This fixes build on mips/musl/linux
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05298.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
+Cc: Michael S. Tsirkin <mst@redhat.com>
+---
+ util/mmap-alloc.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
+index 893d864354..86d3cda248 100644
+--- a/util/mmap-alloc.c
++++ b/util/mmap-alloc.c
+@@ -10,14 +10,18 @@
+  * later.  See the COPYING file in the top-level directory.
+  */
+ 
++#include "qemu/osdep.h"
+ #ifdef CONFIG_LINUX
+ #include <linux/mman.h>
+-#else  /* !CONFIG_LINUX */
++#endif  /* CONFIG_LINUX */
++
++#ifndef MAP_SYNC
+ #define MAP_SYNC              0x0
++#endif /* MAP_SYNC */
++#ifndef MAP_SHARED_VALIDATE
+ #define MAP_SHARED_VALIDATE   0x0
+-#endif /* CONFIG_LINUX */
++#endif /* MAP_SHARED_VALIDATE */
+ 
+-#include "qemu/osdep.h"
+ #include "qemu/mmap-alloc.h"
+ #include "qemu/host-utils.h"
+ #include "qemu/cutils.h"
+-- 
+2.35.1
+
-- 
2.35.1


