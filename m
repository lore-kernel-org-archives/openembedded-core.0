Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709AFC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.5718.1678402697757370150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kF43jN01;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id z10so2025869pgr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fhkPek1vZyTdFuHhXqTIGvid+wKsEXaxJPBj9Sf8ak=;
        b=kF43jN01YJPxzprkgds9shv4Vq3uPLZsc93bR8yfX0gFZDI9egTguAy34IbHKLGe1e
         hwtRE1EQbR68HjY1K3mrNg/Up3AoR5ECy4nKsibGEzZtJAnWhCTnG4g6zVU1fre1ifGk
         DMxAIz0WUdrZeQQqZPy70FHOLlvUoXU4yFu5DqeTg/Kanho0Fc82omxCi1SBuEUXhmQi
         2oySLUuDUMAQl8ZzkFt4u/U0QJZAnRHaSNfMCJTXV+cwV+8Nnalfw5sZ9S3/qG2hJVuj
         qUOi4y5/F+fgHMK5XYYnsx1w95wCf7v84zwoiSDm7JlQcSq51f5xI6kG/EvVzmNKLa7I
         tGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fhkPek1vZyTdFuHhXqTIGvid+wKsEXaxJPBj9Sf8ak=;
        b=2JwI3w2DK/RzkkSAgAg9nltlhq2Zuv/3C5fxEifqtNSufmZgglP48C5GZ5aDcsYwMp
         duX69PaZ4IFtPE7RN+pRoimS0w+MX5AQcizWGZvdlbPy//87+ZA73lkPmDXCEYnPi8HR
         QB1PEcJgiD6zcUu3kXvi16fRkjLg1BTS5mYNf6AV4fRdWxw+tO9jlRVH2JVdCJeszTLx
         GaJYVIIffdh57yCt2ctg5dQuPD4UnAKqUo9Nv4DDpigvLZ2AhqdQst+Oq0jx/W9cKn+A
         6ucyIunsTfly1TXLX0fUva3f5AUSQ+XMItN+ISDrjatUIWQMuh82d0P1PLl2mfCF/Zrz
         tl+Q==
X-Gm-Message-State: AO0yUKWK5UfSX92+Sw1qEjlyZSRY0RCgVKWH/5qEUMc7lcr5AMJFdzbt
	shKhIPndDsQSnSDq2dh/oLTP2xbLVO0wNn+090I=
X-Google-Smtp-Source: AK7set8DF6DS10XtofBbkKbEH7MH8biIbmKndDi6n60ci8lOm6iAa5L+4QxSW9wBAiZbUb03YiP0+Q==
X-Received: by 2002:a62:1c91:0:b0:5e6:14a9:b0c8 with SMTP id c139-20020a621c91000000b005e614a9b0c8mr18148229pfc.32.1678402696770;
        Thu, 09 Mar 2023 14:58:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/27] qemu: Fix CVE-2022-4144
Date: Thu,  9 Mar 2023 12:57:38 -1000
Message-Id: <0af05af0fc0789860b1a52d77a572bac6075fbea.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178276

From: Bhabu Bindu <bindudaniel1996@gmail.com>

Add patch to fix CVE-2022-4144

Link: https://security-tracker.debian.org/tracker/CVE-2022-4144

(From OE-Core rev: 4cb3874abf4fdeb04337a48a14c765ba9b2269d4)

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-4144.patch             | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0b24540bf9..f3237971ce 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
            file://arm-cpreg-fix.patch \
            file://CVE-2022-3165.patch \
+           file://CVE-2022-4144.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
new file mode 100644
index 0000000000..96052a19e8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
@@ -0,0 +1,99 @@
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
+CVE: CVE-2022-4144
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622]
+Comments: Deleted patch hunk in qxl.h,as it contains change
+in comments which is not present in current version of qemu
+
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@linaro.org>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20221128202741.4945-5-philmd@linaro.org>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/display/qxl.c | 27 +++++++++++++++++++++++----
+ 1 files changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index 231d733250..0b21626aad 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
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
+@@ -1452,6 +1454,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
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
+@@ -1471,7 +1490,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
+         offset = le64_to_cpu(pqxl) & 0xffffffffffff;
+         return (void *)(intptr_t)offset;
+     case MEMSLOT_GROUP_GUEST:
+-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
+             return NULL;
+         }
+         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
+@@ -1937,9 +1956,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
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
-- 
2.34.1


