Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38FAEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 18:45:51 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.48117.1689014750044182744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 11:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PSouGjtf;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: festevam@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1a2dd615ddcso1114765fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689014749; x=1691606749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TM9CwkqSHIYeiAiw1NCwXskZp/o2BhEY8yIGxgl4QU4=;
        b=PSouGjtfkFMALkq1xoRpcbqrWIxR23K59ydwi8aoKuKrDAP5hLIDvr7nfd+odbkFHO
         r6fSPrEfd2k2pdWLgPIOZItAOfqnu+99GppB3nguggGkVHsml4BeW+6YzRa2tN0+Nka3
         0oobCDRVYG60pFa+i05wWzs5XH051MwuYErx1qXIddiK53akTDSTFvHmAzeZFFxD5L9B
         SLVudvASUsS6K8kQqK7VHgdwOhv7UpLg9Tw4V26SL+ofv+DXF1b/HThzkY8E6PR2B1/O
         F2mjxkWLUFik1HomjI2cIK8Ard6yDxxImwGXotuYPTcWJ9knRJHNCOw/3Br7/LTQmR+9
         jmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014749; x=1691606749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM9CwkqSHIYeiAiw1NCwXskZp/o2BhEY8yIGxgl4QU4=;
        b=hRq/p+lxdj3tb1343Yz6c884cxWomeQjfxQD1HtQO8aaBZWxWKfrEq/2hQc3BehIAk
         guSaS0pElxWin9ojzH//MqmrzmMHgG39NbkocHkBlaupcuLk+McotfapueX1hUlMWEmy
         ArAPA1uF21rEOpAH8wAGiCC63I4W3hOads4jjKPu38Pq+XWD3LGrq7oGtN09xbGb9iou
         Hc3ipwWYG8CXFZdbAZWpWME6LgWuZNiaxXSTpi2rT1iP4Doeaw57co6bVbXURM4bS3ap
         8Lw6aK7vpSCGJHMqw5KhXkUS38h0jHkv+LoUGzJTpmkQe+mzPQXaaUaXdpWIHF3PkCny
         tneA==
X-Gm-Message-State: ABy/qLaodszB35U/EFMRSmCtR1kt09juDHF2xZoOK98eqVblhe9ClIVI
	TfEdktYp4efpilzRflzK3b10otpIPdxK8g==
X-Google-Smtp-Source: APBJJlEE3vPvqth05+xMXxaOGXrfsa8ukRbdp3g+XZtyzsxfLKuLLDFu/ajfd3W975+SjDmBQiJwmw==
X-Received: by 2002:a05:6870:428c:b0:192:7328:d with SMTP id y12-20020a056870428c00b001927328000dmr9366993oah.4.1689014748867;
        Mon, 10 Jul 2023 11:45:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9595:141a:b4c0:32cc])
        by smtp.gmail.com with ESMTPSA id w4-20020a056871060400b001b04277bbb3sm219250oan.47.2023.07.10.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 11:45:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Upgrade to 2023.07
Date: Mon, 10 Jul 2023 15:45:41 -0300
Message-Id: <20230710184541.278317-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 18:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184093

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2023.07.

Remove the patch that is now upstream.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...mkimage-Use-PATH_MAX-for-path-length.patch | 40 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../u-boot/u-boot-tools_2023.04.bb            |  6 ---
 .../u-boot/u-boot-tools_2023.07.bb            |  2 +
 .../{u-boot_2023.04.bb => u-boot_2023.07.bb}  |  0
 5 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb
 rename meta/recipes-bsp/u-boot/{u-boot_2023.04.bb => u-boot_2023.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch b/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
deleted file mode 100644
index 9f38736bcd..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From dcd3d272975863128e25a4e25453cb6521cddc53 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 14 Jun 2023 16:09:59 +0800
-Subject: [PATCH] mkimage: Use PATH_MAX for path length
-
-Fixed when build xilinx_zynqmp in long directory ( >256):
-  |  /buildarea1/testtest/wr_build/wr1023test_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/build/tmp-glibc/work/xilinx_zynqmp-wrs-linux/u-boot-xlnx/1_v2023.01-xilinx-v2023.1+gitAUTOINC+40a08d69e7-r0/build/fitImage-linux: Image file name (uboot-mkimage) too long, can't create tmpfile.
-  | Error: Bad parameters for FIT image type
-
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/99d430f344bfdb0641022fd3efa26c29c957df02]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tools/mkimage.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/mkimage.h b/tools/mkimage.h
-index f5ca65e2ed..d92a3ff811 100644
---- a/tools/mkimage.h
-+++ b/tools/mkimage.h
-@@ -17,6 +17,7 @@
- #include <sys/stat.h>
- #include <time.h>
- #include <unistd.h>
-+#include <limits.h>
- #include <u-boot/sha1.h>
- #include "fdt_host.h"
- #include "imagetool.h"
-@@ -44,7 +45,7 @@ static inline ulong map_to_sysmem(void *ptr)
- #define ALLOC_CACHE_ALIGN_BUFFER(type, name, size) type name[size]
- 
- #define MKIMAGE_TMPFILE_SUFFIX		".tmp"
--#define MKIMAGE_MAX_TMPFILE_LEN		256
-+#define MKIMAGE_MAX_TMPFILE_LEN		PATH_MAX
- #define MKIMAGE_DEFAULT_DTC_OPTIONS	"-I dts -O dtb -p 500"
- #define MKIMAGE_MAX_DTC_CMDLINE_LEN	2 * MKIMAGE_MAX_TMPFILE_LEN + 35
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8a2e9aef94..eefa6cd8f4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "fd4ed6b7e83ec3aea9a2ce21baea8ca9676f40dd"
+SRCREV = "05aa6516c6bb419d01d69fac457c0de563bfd694"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
deleted file mode 100644
index b77a49af87..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
-SRC_URI += " \
-    file://0001-mkimage-Use-PATH_MAX-for-path-length.patch \
-"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb
new file mode 100644
index 0000000000..7eaf721ca8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb
@@ -0,0 +1,2 @@
+require u-boot-common.inc
+require u-boot-tools.inc
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot_2023.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2023.07.bb
-- 
2.37.3


