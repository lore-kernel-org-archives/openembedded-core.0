Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41939C54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:27 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.46712.1674657740409012310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=havbPQ14;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 200so13552780pfx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCoPAtCYlpT1qI7FmQ0hpotWUtxpJl2GlxLIG7e9c3A=;
        b=havbPQ14TP1wHPlSyF9fbY9sQH1yaHc5ugF67I+LgW/7rF0bxzy0bxF3sdgvwVxxx1
         C3lnSsXpJpr9UOzKmfZL3MR/ogaf7WRhdY9y3hS9tJsBeui/xmK2RX4l8U7f9ri8e+UY
         D9hULWhoJo/d/L3oHkBgbSRXF2HggopliT0GPclWssGw94zc2BSC2wWvA2VADj2JWXM9
         tdnm8JouiDSXiszbrRACuRVQOHKNkH0MmFdFTeFfienjjJMXJkrq+V3iqPrrjEaMtg20
         o/z45hRdx9LvrG96YHZHk1GWmtgWDkC+2VeLYOQT712LgvcLNgiT3/iKMGx87AFvqzjt
         YzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCoPAtCYlpT1qI7FmQ0hpotWUtxpJl2GlxLIG7e9c3A=;
        b=ZMzWpcz1j9yeCDXK3yFXgzrhxLtOGE9fMSbJQy2sVwxu1HGHQ9PS0kTCIJM7OCa3kw
         U37OARSzRxa9QtBz5XXBDPli17zLLw4+GNX62T2zlySMLik1ZfTikaiAzkA17h1l+msY
         WRXdEA6Q7zfKnNwvQh6di/c7AuL6vD8wOv+UdQGwWemxspiVDymza2gXmJUf1sd4Z2S0
         F930vgp96v6BRcyJLSKABKr0V7X4dLJwHJJNPtbW13PNlKrJb0wmkyI2J3PJyPicpROL
         l137COlnrB1PuJG2iJjJJfRoB2B4UutVl8RRHz2vtNO4yObVC535uuljqLCEtnJfQZEb
         o4GQ==
X-Gm-Message-State: AFqh2koPz/pjmj/ZV4Y0jHVOq14AyzROsCPG5O8AMxnLuaUNmeu9Qqto
	ReRlZwyZXv3jOVav53UvEdPOUH4EkHyQDJ0RUA4=
X-Google-Smtp-Source: AMrXdXsK2aaXdSfzgOnaRwim6EsQuJHHZl59eoIteR2KhZGi0IOBf9IBINFYqG2rErjvepzBUTlRiA==
X-Received: by 2002:a05:6a00:4291:b0:573:f869:2115 with SMTP id bx17-20020a056a00429100b00573f8692115mr32985646pfb.9.1674657739334;
        Wed, 25 Jan 2023 06:42:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/16] QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can lead to out-of-bounds read
Date: Wed, 25 Jan 2023 04:41:50 -1000
Message-Id: <7fdb46a83e117459780d5cd0997b0666b7b1a081.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176358

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fff2c87780..898fa1a8d8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -115,6 +115,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2021-20196.patch \
 	   file://CVE-2021-3507.patch \
+	   file://CVE-2022-4144.patch \
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
2.25.1


