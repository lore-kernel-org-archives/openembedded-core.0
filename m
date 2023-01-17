Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60DCC677F1
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.196991.1673964539796302408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JHD6nxeU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id k18so9608318pll.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOq7cTz2grv+MgBOocKZkXj0xL9rJzwKz+x44wSV6oA=;
        b=JHD6nxeUp90wuk1oj26vrEvWSN5PVN/2n4YyXImINcvo+bQHbnCLsi+TzM8axlHrqA
         9h5KYZFy/Yd64o8H1egF8I9DZrAiWYsaJ7VTQJQ+poxH3Y39W2yGUMKFsfWJA48nDP4S
         Ch3hm7MO5KdBbEbBarwvI0GxPCNbDWtac0vGV0jgr62jvXxkoTEJKhbeZy4BckknBSqy
         gutXljL7h0q5knyyJPY0/80DdYHWkYQXKzDMq96qy+G8g0J8xq0hIYDKHO0C3g0Q1oxA
         3UcMnc1VJCxrhqxCWxilmkDgoGYdhj6DEs19/uBk6quGIjQcEIVm/AlU9XQqBGNF2bcp
         tFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOq7cTz2grv+MgBOocKZkXj0xL9rJzwKz+x44wSV6oA=;
        b=X+W0USTJ96vi5LtXF47bW6z3/f4EV/2mJARK0C1ozxcyJA+zZofg0WJWbNj3ZonCfv
         jfDcowhVT29KxDPj+W7+4S97RrCbSLMyax8zt3YQ70HEvU9jupqnHqa0QXuhDIrMLd+k
         oKugSTRq8m6eDL9VhCs8sI1t4B5Ow9BLgPxJf6u9orp7O0RpaO53AAZx7jll6XToA0Wz
         AlbvABp/4hgX7fcYJJbNK3Pnlu9yKr5JEilVEC0yBJssYD1B/A1unVwWyH7zAIDY62Sb
         sXSvw9CE6r9w+wzLckA7b9z+UlAT4ccOPhdg9oAJg9E4qP8dQcsGxYROaJ+kqetU4GeC
         GQPA==
X-Gm-Message-State: AFqh2kplH1i9LVTTkSlUrecStb+RFVMz6cVYJRSmyIxC3W8R59LZqbp3
	mp7v8Ac7pa1d2t3/yJjDk1YZJ6E9t4WbhVUUNqw=
X-Google-Smtp-Source: AMrXdXv7RxsLv4CNfQKF0oRvYM1jVqYqu4wT9pJ85Cyoyztu9XC1jmiVAC4I8mVIHoThI9NkdZXABQ==
X-Received: by 2002:a17:903:1204:b0:194:91e6:1e69 with SMTP id l4-20020a170903120400b0019491e61e69mr3859040plh.12.1673964538740;
        Tue, 17 Jan 2023 06:08:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:08:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] qemu: Fix CVE-2022-4144
Date: Tue, 17 Jan 2023 04:08:38 -1000
Message-Id: <4cb3874abf4fdeb04337a48a14c765ba9b2269d4.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176039

From: Bhabu Bindu <bindudaniel1996@gmail.com>

Add patch to fix CVE-2022-4144

Link: https://security-tracker.debian.org/tracker/CVE-2022-4144

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-4144.patch             | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cc9681fb4b..b68be447f1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -92,6 +92,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0020-target-ppc-move-xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch \
            file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch \
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
2.25.1


