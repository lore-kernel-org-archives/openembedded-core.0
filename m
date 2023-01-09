Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67885C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:33:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.67457.1673256796896856305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bItfl7+p;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id c6so8892107pls.4
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6pxP4ENynLw8viUBwOATniKXbndEOMgbuAVlqAwLug=;
        b=bItfl7+pPJ3eTKuCmycgeRWe1eC8JuZbzh1E1JRdQFnFlwdXNx3NHpW4X5/Q//Kex0
         d8GEbUEitR0mJWYojipw5jkSJZNAfXIvoCLw6paD1THf67Eb3kdK7uBmlSO85dWas5Db
         mJAUC8r5Zs4hSj4XsY78hnxwaA2vdJ9hVq3vuYTpKu9yseNAkQ3c2kWA0SWLHspr+plC
         s8NwarrMBt/Ixlu0TXQCeKuTm+DhZGpv3ne5jGCylkotHCVLESgx44nYMahKY4g0Be/M
         EfnHVvgkx6wCCSFPbffgDnqezqtUAFNI/WxRR3gqn6dntk+XwJraPnKZd13tDnz1IV6F
         zYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6pxP4ENynLw8viUBwOATniKXbndEOMgbuAVlqAwLug=;
        b=If1Tk/04zKCo+VuAiBdlXhvM3MRFis/yCL9xLX2d2/uPZ+HTOu25+4IsH3CPgsU4Yj
         pH1MNqG+FCJUG0YXV+bqeWctdwbMC21PmdsX1fmORmqVV8C5ewkqVXA8uKAHHSZ/rj6R
         cFz1wjcv9ZUKGCi4tFEe5vwHuT4+9faARXNE7na+X637S/G3vCOqOdzQKaCguN09assM
         guVCO6P+wZyX/BMaizm/Ki5P1mjOzExzqekVpZw3uDuNfLtn/+Eju43qdg59aaliPYG0
         PQ2Z6w3X7roLMlaxUUDicCR4yd1LA4snvcHW8UQY2nTIiovnf4s5QD8ixGi0AupWXbX9
         2l1g==
X-Gm-Message-State: AFqh2kpLqmNuVPzu1ek1iXnfcj72vJel7Qk7kOagaU8GWkEFEEYGIsGx
	2bouIFLcNBu4vWaa7GQXLtC+6l+YZeQ=
X-Google-Smtp-Source: AMrXdXvhATVVh96glrlxF6qHvjN2oOwFI/K4NMlmueK8k2SyNx8e/JKY9xWE09SqC2+eSG1yCIAHPw==
X-Received: by 2002:a17:902:8d87:b0:192:d58f:e5ff with SMTP id v7-20020a1709028d8700b00192d58fe5ffmr22281246plo.16.1673256795848;
        Mon, 09 Jan 2023 01:33:15 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:140d:d8:3ab7:cd4:8b50])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902ced100b00168dadc7354sm5669807plg.78.2023.01.09.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 01:33:15 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] qemu: Fix CVE-2022-4144
Date: Mon,  9 Jan 2023 15:02:41 +0530
Message-Id: <20230109093241.19105-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175674

Add patch to fix CVE-2022-4144

Link: https://security-tracker.debian.org/tracker/CVE-2022-4144

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
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
2.17.1


