Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9839AC7EE32
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 05:26:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.8335.1677734778851551137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 21:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=i9nhxK/w;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677734780; x=1709270780;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TF9EkiXVJmkOenmI447VJUA5ztBK/OPzmULzpyNhnkI=;
  b=i9nhxK/wMbbeZQ7floUSUCe3JFTgx4pCU4RO6bE2pe9aNLqh9UN3X4rq
   D3FaCJIIx79YuCjifsqpx4KBjW/RJdcSuW85mtCkTlJbDFsW6mJnDspCe
   WU9fiRMhNDjHPXXYf1SiM3fZUA4T63G1Htt8aGdbGW9yYeEu/K9Z9c7g1
   qZgq/RwzCLw4LKnAtUMe/RUFhdQBk1neLRLHqrURI3BpXBTqMvKMHdZV7
   G8X6r5oR0iujnvzqcZ8Ra1SYi71Qo2f7rV4izONjuzYWwvNPujik6XkTd
   LUFCpVfo1VujpvnzJyOmnW3NOs97oFlkjgDpwlbtPcHV9OnhZA3bGWGqj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="333346952"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="333346952"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 21:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="848947127"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="848947127"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 01 Mar 2023 21:26:19 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][patch 3/3] qemu: Fix CVE-2022-4144
Date: Thu,  2 Mar 2023 13:26:08 +0800
Message-Id: <20230302052608.1326340-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230302052608.1326340-1-chee.yang.lee@intel.com>
References: <20230302052608.1326340-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 05:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177956

From: Bhabu Bindu <bindudaniel1996@gmail.com>

Add patch to fix CVE-2022-4144

Link: https://security-tracker.debian.org/tracker/CVE-2022-4144

(From OE-Core rev: 4cb3874abf4fdeb04337a48a14c765ba9b2269d4)

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
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
2.37.3


