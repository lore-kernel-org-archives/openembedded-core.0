Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A73EC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.14386.1679408434583596502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Fj1S8EjJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id le6so16139726plb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEPlbmydKoyuf7OxBCFWUAU86ESQn5Sq7VHfelk6S7Y=;
        b=Fj1S8EjJQ4SpcIheWDzuojQS5peJk0DxzudH4sP7Xgwbln2BLT0yVGZHeY9YQ3amR6
         q2DMlZICobWIDt8750966JWxCmeO6tglgD1NQX2fMRt49s3bQVsklb5OVf0z2NElnQGy
         zIYxUHAYbQ2/XdtA78a8yZKGamrNihqO2d7v4L/KBsP+YINfq3TV9yo1DZTemc23v0jS
         GvOSPXQ4eXMJ1n5WCHpNBi7s2TomxoJ5Rj6WHDfwhK2URpjBf0mm5lsRUlZJ0gcNYiQO
         5TB5F4ODAlB/K549eynmIC7e5DoGotZMNsOcoGS2cw4juSqu5h1h7CASR1tWCONy+T+W
         bMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEPlbmydKoyuf7OxBCFWUAU86ESQn5Sq7VHfelk6S7Y=;
        b=qFtKWZm2v8zkjA7QP3iGYgvDErizcoF0gKZ1RUUP355FQy2LxFo6D67acA7koWHqVX
         7t+cYeZDFkiSRjITU0Drq8o3KcscHdRtEQhbiyvnS/NNVCW0yatnCHqgQ8Tb6FTaXV5H
         qlvxeu59aY1WHXtCn4ZctqoSkfNpLIqw/QXKwoqemWwHyQoMaNDIgnuxaWzyB2RM6Blw
         OquEJdy5Tznq7ZRcstTYCdTGe+X1wEkUisUviUiCFiTquCbEL2o/9R1PKMmhx59po6lN
         3XcRkir228pv+jEoL8XlE74mINrAXYsI9PNJjEgz+/e5tNbDA+a6udWMFT1S30f0yL1F
         e9+w==
X-Gm-Message-State: AO0yUKUAVqcowjnDLYYoQA/3IhXSFevCqpIHZDKuoHcUjIX9RUMosshR
	XOsKL5rxmXEYdlMxLObObdwCFK/72zlApziEHQ8=
X-Google-Smtp-Source: AK7set8ET4HBjIRfGD4SyOwbVJ++Mw7HH9v9MzuiBYKTN5SqEGbeOuNo8jDuepchtwWLdXgu/ov2/g==
X-Received: by 2002:a05:6a20:4c1c:b0:d9:4c19:fe69 with SMTP id fm28-20020a056a204c1c00b000d94c19fe69mr3853822pzb.25.1679408433538;
        Tue, 21 Mar 2023 07:20:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can lead to out-of-bounds read
Date: Tue, 21 Mar 2023 04:20:07 -1000
Message-Id: <754cce68614c7985d5848134635a6b318f4505ab.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178873

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

Replace the tabs with spaces to correct the indent.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   9 +-
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 2 files changed, 108 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 36d0b9320f..0649727338 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,10 +112,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-0216-1.patch \
            file://CVE-2022-0216-2.patch \
            file://CVE-2021-3750.patch \
-	   file://CVE-2021-3638.patch \
-	   file://CVE-2021-20196.patch \
-	   file://CVE-2021-3507.patch \
-	   file://CVE-2021-3929.patch \
+           file://CVE-2021-3638.patch \
+           file://CVE-2021-20196.patch \
+           file://CVE-2021-3507.patch \
+           file://CVE-2021-3929.patch \
+           file://CVE-2022-4144.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
new file mode 100644
index 0000000000..3f0d5fbd5c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
@@ -0,0 +1,103 @@
+From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Mon, 28 Nov 2022 21:27:40 +0100
+Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt
+ (CVE-2022-4144)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Have qxl_get_check_slot_offset() return false if the requested
+buffer size does not fit within the slot memory region.
+
+Similarly qxl_phys2virt() now returns NULL in such case, and
+qxl_dirty_one_surface() aborts.
+
+This avoids buffer overrun in the host pointer returned by
+memory_region_get_ram_ptr().
+
+Fixes: CVE-2022-4144 (out-of-bounds read)
+Reported-by: Wenxu Yin (@awxylitol)
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
+
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@linaro.org>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20221128202741.4945-5-philmd@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622]
+CVE: CVE-2022-4144
+Comments: Deleted patch hunk in qxl.h,as it contains change
+in comments which is not present in current version of qemu.
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/display/qxl.c | 27 +++++++++++++++++++++++----
+ 1 file changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index cd7eb39d..6bc8385b 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
+ 
+ /* can be also called from spice server thread context */
+ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
+-                                      uint32_t *s, uint64_t *o)
++                                      uint32_t *s, uint64_t *o,
++                                      size_t size_requested)
+ {
+     uint64_t phys   = le64_to_cpu(pqxl);
+     uint32_t slot   = (phys >> (64 -  8)) & 0xff;
+     uint64_t offset = phys & 0xffffffffffff;
++    uint64_t size_available;
+ 
+     if (slot >= NUM_MEMSLOTS) {
+         qxl_set_guest_bug(qxl, "slot too large %d >= %d", slot,
+@@ -1468,6 +1470,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
+                           slot, offset, qxl->guest_slots[slot].size);
+         return false;
+     }
++    size_available = memory_region_size(qxl->guest_slots[slot].mr);
++    if (qxl->guest_slots[slot].offset + offset >= size_available) {
++        qxl_set_guest_bug(qxl,
++                          "slot %d offset %"PRIu64" > region size %"PRIu64"\n",
++                          slot, qxl->guest_slots[slot].offset + offset,
++                          size_available);
++        return false;
++    }
++    size_available -= qxl->guest_slots[slot].offset + offset;
++    if (size_requested > size_available) {
++        qxl_set_guest_bug(qxl,
++                          "slot %d offset %"PRIu64" size %zu: "
++                          "overrun by %"PRIu64" bytes\n",
++                          slot, offset, size_requested,
++                          size_requested - size_available);
++        return false;
++    }
+ 
+     *s = slot;
+     *o = offset;
+@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
+         offset = le64_to_cpu(pqxl) & 0xffffffffffff;
+         return (void *)(intptr_t)offset;
+     case MEMSLOT_GROUP_GUEST:
+-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
+             return NULL;
+         }
+         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
+@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
+     uint32_t slot;
+     bool rc;
+ 
+-    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
+-    assert(rc == true);
+     size = (uint64_t)height * abs(stride);
++    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
++    assert(rc == true);
+     trace_qxl_surfaces_dirty(qxl->id, offset, size);
+     qxl_set_dirty(qxl->guest_slots[slot].mr,
+                   qxl->guest_slots[slot].offset + offset,
+-- 
+2.25.1
+
-- 
2.34.1


