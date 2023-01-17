Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF680C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:04:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.190923.1673939072355412449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HvGfoKYv;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id r21so525916plg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 23:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSy1VUsdTthExyQyUwMeUrx4J+wpRZDiY4zjG04EaA4=;
        b=HvGfoKYvJRdhGhP/Gg1/Wjg4Q11bWPAuu+ESxiyJkCFwcRCfUysx9Ylw3SwYbtDaeX
         aJOnnRR83UGw0OUvFL8RsLVheKMnEDHV4M6gqek+iauwqh7747p2y+ihHYs+iz3yOJtr
         LEPfU2eefbS+ahENq6/TCQurC/Wu/W06nqig8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSy1VUsdTthExyQyUwMeUrx4J+wpRZDiY4zjG04EaA4=;
        b=FGXNA/sQfkYmzg7eUInI/Rx+IAW6oInl/SszD9cNT8ego0qb1B2QFaOnQRAGCOwFyA
         sKTFKR07YFCfdEGlJKhib3xD647dJas0T08JvU0bjJnW/GmRE9qiEe/voGuuQYUdazfe
         cEP0sMoeB9wXfAYRbvzTIeIjn/zcDSfUTQFTqJt2dIVgPfU593Pi2yLtrMR/0jNHVA2/
         rX1JzWqM4HdcJtFYmcJ1oiI8iiA7/Zh8MbY2kRLl9c1I/4puvCJtQ4H66aEzmxkwYAxT
         nIz62YbFqZU4AEzYgMnCabk11KZ5GZlagn4fXuLGMf8AYtVoUqA4JiKXNgqAHyGPAQsb
         SLuw==
X-Gm-Message-State: AFqh2kqJQD2ms7FPuf6TKbZvbyT0oSpEbP/uTxjifnZVF9taWGSTRKfI
	hppar2tTM0aVmzCzAX7uO+0BtxrT0ONn2nQz
X-Google-Smtp-Source: AMrXdXsmHVWLbsVNUzuKEjMISYvYmoEgJpTKN1w/IseBDWBn2e6lQyF/cI4LgIgkCsUl7tdkoEN1lw==
X-Received: by 2002:a05:6a21:339a:b0:a7:345a:100f with SMTP id yy26-20020a056a21339a00b000a7345a100fmr2351293pzb.10.1673939071470;
        Mon, 16 Jan 2023 23:04:31 -0800 (PST)
Received: from MVIN00024 ([103.250.136.244])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902c94c00b00189a50d2a3esm7579458pla.241.2023.01.16.23.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 23:04:31 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 17 Jan 2023 12:34:25 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address  translation can lead to out-of-bounds read
Date: Tue, 17 Jan 2023 12:34:20 +0530
Message-Id: <20230117070420.225938-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 07:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176029

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


