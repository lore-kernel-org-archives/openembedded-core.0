Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5A3C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 20:14:28 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.2444.1638908067282442001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 12:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/Y/nzWr;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s137so89364pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 12:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/qadA2j3n59i0vogE5wTzNboy+UgOvXvPgeOgg0GRM=;
        b=S/Y/nzWruTWLGU4h6URuGbL2JSEpuAhZfAuLtBoNLOw8wHUrjiBuRtznyA8iYSCp0W
         h+ogOT2F96Y4+wNSlg5zfvNz8nm7fUZ08plwKMye4cqhksbxVsgq7ln8qfxmaqawcpdv
         nJEVd/0sUCBxGLy/omn2gLZD4xct7gtffTxuV5+TJSNtWX4ilcEHVNHRYLZIJbGqYg0I
         SDkH4Lg5s45dHCSQUe1EpOcbq3QEPLPLfSLy5WgW9kyHIm2yOBNs+Cq9gsBJ7L6KGG//
         D5ehDO0VX6u4d8iyxl49MGXmR+vrM0OljBgbyA7CDBvjhhGBK02X/oL4hziwlDrDBj9w
         nUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/qadA2j3n59i0vogE5wTzNboy+UgOvXvPgeOgg0GRM=;
        b=nHT/a9jw8JW6Wifuq42XXx4m3f537eI/mP4yu0zG/XBCAZCFEW8Ke4eG5pBBos0BlV
         VU5snlEq+QVPn5fkrucHrqMgGiVnlPoHlbc6SAqNfNPv1xtC5JZa5q8y4nANrK/I6To2
         Vc/vdiAsgZSQHSJuAicMP2KgEeI5RJI/G2Dntpuq6n+/DvlvDWrQo3o7mJoDX1NOIvrY
         vfd62lZKlLc/XIfMiHMY+Rg3T387xOtW6mKZKXd83OvfAhAN3f1NzIpe57oqSwt2jtgI
         uwkCqPzdDk0QlbPMC05e4omqtmFvS25CgpAw3WPV6q0n78EwY++zv4kWDNZ8I08sNk+e
         53xQ==
X-Gm-Message-State: AOAM530vHHQA/4WEK9fA49sbCT2e4OLRUvVTMXntYFxSEwFIVOwCqcN6
	VJArOyUMZXrqvEmVYBttOMmQsTrUOU+6eQ==
X-Google-Smtp-Source: 
 ABdhPJwoVtxobIMInIRs/j5efS9GKQUKkT+p/8Sf40br+vQTlitRXWciQZDNkgXrOwZc4Dwa2tb51Q==
X-Received: by 2002:a63:6907:: with SMTP id e7mr25496411pgc.481.1638908066341;
        Tue, 07 Dec 2021 12:14:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 m13sm354950pgt.22.2021.12.07.12.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 12:14:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] mesa: Fix broadcom vulkan driver build on 32bit arches
 with 64bit time_t
Date: Tue,  7 Dec 2021 12:14:23 -0800
Message-Id: <20211207201423.1109106-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 20:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159333

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update patch status

 ...unt-for-64bit-time_t-on-32bit-arches.patch | 41 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
new file mode 100644
index 00000000000..e87d7d73114
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
@@ -0,0 +1,41 @@
+From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 7 Dec 2021 11:13:27 -0800
+Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches
+
+This makes is a bit more portable, especially on 32bit architectures
+with 64bit time_t defaults. Especially on musl its a must.
+
+Fixes
+../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format specifies type 'long' but the argument has type 'time_t' (aka 'long long') [-Werror,-Wformat]
+              time.tv_sec);
+              ^~~~~~~~~~~
+
+Also reported here [1]
+
+[1] https://github.com/agherzan/meta-raspberrypi/issues/969
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14118]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/broadcom/vulkan/v3dv_bo.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo.c
+index 71679ce..dc5e7f5 100644
+--- a/src/broadcom/vulkan/v3dv_bo.c
++++ b/src/broadcom/vulkan/v3dv_bo.c
+@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)
+ 
+       struct timespec time;
+       clock_gettime(CLOCK_MONOTONIC, &time);
+-      fprintf(stderr, "  now:               %ld\n",
+-              time.tv_sec);
++      fprintf(stderr, "  now:               %lld\n",
++              (long long)time.tv_sec);
+    }
+ 
+    if (cache->size_list_size) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 30b9e93f630..31ff38dfdca 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
 SRC_URI[sha256sum] = "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
-- 
2.34.1


