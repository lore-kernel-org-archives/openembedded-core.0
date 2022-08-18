Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C838CC32772
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.44930.1660841815254665801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZBhaFB+t;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 s4-20020a17090a5d0400b001fabc6bb0baso3001883pji.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=vhs7AGiHJEa+L0iZ0memkr1SqPs2eAaXOPfKO19Cz4U=;
        b=ZBhaFB+t20IdPrJufdsyJNGv7xe8V3zCoyYZeIGwRjN8uzHOPjRm62lbXaMoCmUMQP
         HyZKAcQIuseofP/wETLP0c8mvYiawntz9Up/y7G5vxtXrRkdpVlzuXzOsKbMi1vmD/4c
         RtbDBsvgTQ8tzYjYc5Dwr2Q+4dqULHZMI/qwmJ7HvagGtdQpnhN2Favw/KMFux9zo9tD
         z69xWgV4KrLVzTEoDaxwv5Rq0vJKHJYC85gKU4YdAHrNc/xN3jF2BWK7XgtBByO0x9pL
         bZg9Y2EFcZVFTImO5bkf7AecuYCmrfw/Y35AXqIux2L5o/GO+fwrketub5IIPn7ijmOr
         dIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=vhs7AGiHJEa+L0iZ0memkr1SqPs2eAaXOPfKO19Cz4U=;
        b=cLlZv/rop3dq+waMlA4bpx9L/zgF7G6GIdoVGMxpiEynqYdb5/K3TlyW26bwrIwBl1
         d2zLgH5VhM+XczP+XIEWMBpVJDd3ODqijaBsfUGwTjvNAbBt/csWZNwGmnheQ+2TPZGe
         lKCCpn0/55aY+877nMQHVKnwHvAsympmnmUuAXDbbUEqYfez9H3CjQCf/aPebxqQFkaO
         tB2S66SF6ucS/6NH3ZOZ+ESaczkoTute1GSpeYIF6wmT6KN4JI8YmyOZyXqbA/cD8KNn
         vSLw3BZvf9jL9kax9IJX4UPnckV8tEpE2w2cpR5xcXaO3pWQTzjaXBUOyJ6/ot6zZTYO
         3YCw==
X-Gm-Message-State: ACgBeo3xQGK8Rup98X0ybSSa/1EReOeY8u8oToJQWn6HkuqUFYRNItfv
	/1AuqtsKekDzP+x+FHRFN+mtvW1vObUvlapU
X-Google-Smtp-Source: 
 AA6agR4yswidFt9R47CGN61EtLcHy66/k/l3HyLZBI8Si5MgzM4HrcEYPf6fsbZA29Xk658dhbu3AQ==
X-Received: by 2002:a17:902:b214:b0:171:2e1f:6d1a with SMTP id
 t20-20020a170902b21400b001712e1f6d1amr3345958plr.147.1660841814229;
        Thu, 18 Aug 2022 09:56:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.56.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:56:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] qemu: CVE-2020-27821 heap buffer overflow in
 msix_table_mmio_write
Date: Thu, 18 Aug 2022 06:56:18 -1000
Message-Id: 
 <198bd53bdc77d2b01dae19993bde79f03f4dd02c.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169523

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://git.qemu.org/?p=qemu.git;
MR: 107558
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=4bfb024bc76973d40a359476dc0291f46e435442
ChangeID: c5d25422f43edb7d8728118eb482eba09474ef2c
Description:
          CVE-2020-27821 qemu: heap buffer overflow in msix_table_mmio_write() in hw/pci/msix.c.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


