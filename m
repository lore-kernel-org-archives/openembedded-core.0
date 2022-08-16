Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C4DC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 11:15:48 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.14359.1660648546917911465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 04:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VOf/SWiO;
 spf=pass (domain: mvista.com, ip: 209.85.216.52,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id a8so9449116pjg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=N+kWFqsrsA6pLbn+qjieTfVfprZpb8TJCUN5gdEJvWU=;
        b=VOf/SWiOQrB1R4rW7weLStUOL4FihCumrwmXT5i7zjAGW4uS98ChiNE6cQtxVnlS5N
         dRq/Mqct6qn+kSk80EWDL5TLLbY52sBTug7/478799KJ9g5I/bRe2rgITRvAfz3JNYsT
         YENtrBm2Ffd43fzhkoyjwjiEOXHymtTTErRTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=N+kWFqsrsA6pLbn+qjieTfVfprZpb8TJCUN5gdEJvWU=;
        b=dtNrplHxiIwh8N3YavKnwn54KbTrsgadmwc6epFDlH0xa8g40rOV0GEWqFnW6c185K
         pDbT5r+O7GYZOgq9rhcv3neS7TuTQG25SgtNgjcm7e/yoxiTqnCpEJ5mANiaxwWvvCXt
         HIcgRjhuHD7l46dN/ionlvbZo6w4qDr7lYqzGTYfS/VhFbKk79BvldZskiffbjO3nFO2
         eJRLD4Zgu5Xve1J6/OtqMhoiSHmj/+D+V7CzI0YtwToKF4owGW7BHPPSnSzglfxw79r7
         eRF5XM0dufMIENk49gMvCPPDYsZM0cva+Tl5xrw32xcQW+qySGP+WHUrIxBYjIGXbrbE
         VZvg==
X-Gm-Message-State: ACgBeo3ilg9NPIqiZbqklIfkniKNez7Ceg3gVrS8oMbkBHcOLBbBGKc8
	nbJ5dnn6ckSUrLvRpqyfTCL/+yIZQU0Npw==
X-Google-Smtp-Source: 
 AA6agR7wBZrTeeq5onK1sSYsSwv5Rvke9SzpWh+KEvdfO+iqMNW5p0O67GNkLFUARqmQbtrHik1niA==
X-Received: by 2002:a17:903:192:b0:16f:8a63:18ef with SMTP id
 z18-20020a170903019200b0016f8a6318efmr21445189plg.95.1660648545973;
        Tue, 16 Aug 2022 04:15:45 -0700 (PDT)
Received: from MVIN00024 ([157.32.95.37])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a17090ac98400b001f1f5e812e9sm6187659pjt.20.2022.08.16.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 04:15:45 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 16:43:30 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] qemu: CVE-2020-27821 heap buffer overflow in
 msix_table_mmio_write
Date: Tue, 16 Aug 2022 16:43:28 +0530
Message-Id: <20220816111328.407499-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 11:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169433

Source: https://git.qemu.org/?p=qemu.git;
MR: 107558
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=4bfb024bc76973d40a359476dc0291f46e435442
ChangeID: c5d25422f43edb7d8728118eb482eba09474ef2c
Description:
          CVE-2020-27821 qemu: heap buffer overflow in msix_table_mmio_write() in hw/pci/msix.c.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-27821.patch            | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 10b4280b23..a773068499 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -99,6 +99,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-13253_5.patch \
            file://CVE-2020-13791.patch \
            file://CVE-2022-35414.patch \
+           file://CVE-2020-27821.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
new file mode 100644
index 0000000000..e26bc31bbb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
@@ -0,0 +1,73 @@
+From 15222d4636d742f3395fd211fad0cd7e36d9f43e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 16 Aug 2022 10:07:01 +0530
+Subject: [PATCH] CVE-2020-27821
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=4bfb024bc76973d40a359476dc0291f46e435442]
+CVE: CVE-2020-27821
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+memory: clamp cached translation in case it points to an MMIO region
+
+In using the address_space_translate_internal API, address_space_cache_init
+forgot one piece of advice that can be found in the code for
+address_space_translate_internal:
+
+    /* MMIO registers can be expected to perform full-width accesses based only
+     * on their address, without considering adjacent registers that could
+     * decode to completely different MemoryRegions.  When such registers
+     * exist (e.g. I/O ports 0xcf8 and 0xcf9 on most PC chipsets), MMIO
+     * regions overlap wildly.  For this reason we cannot clamp the accesses
+     * here.
+     *
+     * If the length is small (as is the case for address_space_ldl/stl),
+     * everything works fine.  If the incoming length is large, however,
+     * the caller really has to do the clamping through memory_access_size.
+     */
+
+address_space_cache_init is exactly one such case where "the incoming length
+is large", therefore we need to clamp the resulting length---not to
+memory_access_size though, since we are not doing an access yet, but to
+the size of the resulting section.  This ensures that subsequent accesses
+to the cached MemoryRegionSection will be in range.
+
+With this patch, the enclosed testcase notices that the used ring does
+not fit into the MSI-X table and prints a "qemu-system-x86_64: Cannot map used"
+error.
+
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+---
+ exec.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/exec.c b/exec.c
+index 2d6add46..1360051a 100644
+--- a/exec.c
++++ b/exec.c
+@@ -3632,6 +3632,7 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
+     AddressSpaceDispatch *d;
+     hwaddr l;
+     MemoryRegion *mr;
++    Int128 diff;
+ 
+     assert(len > 0);
+ 
+@@ -3640,6 +3641,15 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
+     d = flatview_to_dispatch(cache->fv);
+     cache->mrs = *address_space_translate_internal(d, addr, &cache->xlat, &l, true);
+ 
++    /*
++     * cache->xlat is now relative to cache->mrs.mr, not to the section itself.
++     * Take that into account to compute how many bytes are there between
++     * cache->xlat and the end of the section.
++     */
++    diff = int128_sub(cache->mrs.size,
++                     int128_make64(cache->xlat - cache->mrs.offset_within_region));
++    l = int128_get64(int128_min(diff, int128_make64(l)));
++
+     mr = cache->mrs.mr;
+     memory_region_ref(mr);
+     if (memory_access_is_direct(mr, is_write)) {
+-- 
+2.25.1
+
-- 
2.25.1


