Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798C4C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 12:21:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14160.1668687697846571565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 04:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FejEGKhN;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id io19so1449280plb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFe0VJPNqzYmXYRUSj6yq80B69E13Ij2NIJ99+Eal3s=;
        b=FejEGKhN6ZX/1SEnig/j8fSR6a9uug/A5CTimH04khO281y7IkyldrcfPTtKVEhIy9
         PO0ub2ktwln8Rs4fsNCz1hQYenIWXkPF7zphwJ7ehLKSskapTyQrW2TRxyvBpjKOVT35
         1tnjP0RytWz9KDcK27LWs9pMz8xPfZc/1Mfgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFe0VJPNqzYmXYRUSj6yq80B69E13Ij2NIJ99+Eal3s=;
        b=N/dR1DnMwTcASDenjDR+WCmF8jMDXvBbBBf6YAPfKTounvCUjmT43649qdYk71Q1er
         VWHJbIDWm3lb2vhb0UZ/UXK3CjNvAOyD38bZZTvTHaHJ29/IKaUQzuY+EZYrzY/LO61K
         phAYX4akiWwfElUCXLav3du/L3cfe4ybMSW3ejXWXd9PZvc90AOhOy2IyCrdy6WE75UY
         +ME1BJdcFwChPe4kDPqAGOzu4EIh4FmRs6MtloFR8hM6xg2UIzQwMxyTseGD3cEq2dOr
         Cb01RZaX4R9C+GtnB8nhd/FZtLW4/0gh2I1lAuEvAuSmxCUHoEi3wuWhujjFEhv0lKZm
         VYUg==
X-Gm-Message-State: ANoB5pnN7eR6/dO8CEhyOYpiF4T4K7bHBby+Mo+rhDvVtRboRoQoQ33k
	jOqUm4yAZru4YW1pWnYgLhP4VpeTW9Q8dg==
X-Google-Smtp-Source: AA0mqf6UOy2+j2TVN0tUr01WiKHjo2mPsW00tVf8q9880xQWX5NEE2ZKHTTcohbNMBWrzdSvD/dJ9Q==
X-Received: by 2002:a17:90a:f011:b0:212:e996:704d with SMTP id bt17-20020a17090af01100b00212e996704dmr2572214pjb.132.1668687694754;
        Thu, 17 Nov 2022 04:21:34 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.74.191.107])
        by smtp.gmail.com with ESMTPSA id y19-20020a1709027c9300b0017f9db0236asm1198035pll.82.2022.11.17.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 04:21:34 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] qemu: fix CVE-2021-20196 block fdc null pointer dereference may lead to guest crash
Date: Thu, 17 Nov 2022 17:51:22 +0530
Message-Id: <20221117122122.257937-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 12:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173419

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20196.patch            | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 28caefef07..e601cee890 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,6 +112,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-0216-1.patch \
            file://CVE-2022-0216-2.patch \
            file://CVE-2021-3750.patch \
+	   file://CVE-2021-20196.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
new file mode 100644
index 0000000000..3d65c1b2f1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
@@ -0,0 +1,50 @@
+From b983146dcebd7dee9a727f3b83ad86361ef58637 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Thu, 17 Nov 2022 17:37:08 +0530
+Subject: [PATCH] CVE-2021-20196
+
+Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
+CVE: CVE-2021-20196
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
+
+Guest might select another drive on the bus by setting the
+DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
+The current controller model doesn't expect a BlockBackend
+to be NULL. A simple way to fix CVE-2021-20196 is to create
+an empty BlockBackend when it is missing. All further
+accesses will be safely handled, and the controller state
+machines keep behaving correctly.
+---
+ hw/block/fdc.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index ac5d31e8..a887369c 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1356,7 +1356,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
+ 
+ static FDrive *get_cur_drv(FDCtrl *fdctrl)
+ {
+-    return get_drv(fdctrl, fdctrl->cur_drv);
++    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
++
++    if (!cur_drv->blk) {
++        /*
++         * Kludge: empty drive line selected. Create an anonymous
++         * BlockBackend to avoid NULL deref with various BlockBackend
++         * API calls within this model (CVE-2021-20196).
++         * Due to the controller QOM model limitations, we don't
++         * attach the created to the controller device.
++         */
++        cur_drv->blk = blk_create_empty_drive();
++    }
++    return cur_drv;
+ }
+ 
+ /* Status A register : 0x00 (read-only) */
+-- 
+2.25.1
+
-- 
2.25.1


