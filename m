Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.34378.1620051017974206977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 143EAGxM003383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 3 May 2021 07:10:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 3 May 2021 07:10:16 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 3 May 2021 07:10:15 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] qemu: fix CVE-2020-27821
Date: Mon, 3 May 2021 10:10:12 -0400
Message-ID: <20210503141013.28102-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

memory: clamp cached translation in case it points to an MMIO region

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-27821.patch            | 143 ++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 062d7907cf..d120b0822f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -55,6 +55,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_10.patch \
            file://CVE-2021-20257.patch \
 	   file://CVE-2021-3392.patch \
+           file://CVE-2020-27821.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
new file mode 100644
index 0000000000..58622f0487
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
@@ -0,0 +1,143 @@
+From 279f90a9ab07304f0a49fc10e4bfd1243a8cddbe Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 1 Dec 2020 09:29:56 -0500
+Subject: [PATCH 1/2] memory: clamp cached translation in case it points to an
+ MMIO region
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
+
+Upstream-Status: Backport [4bfb024bc76973d40a359476dc0291f46e435442]
+CVE: CVE-2020-27821
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ softmmu/physmem.c       | 10 ++++++++
+ tests/qtest/fuzz-test.c | 51 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 3027747c0..2cd1de4a2 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -3255,6 +3255,7 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
+     AddressSpaceDispatch *d;
+     hwaddr l;
+     MemoryRegion *mr;
++    Int128 diff;
+ 
+     assert(len > 0);
+ 
+@@ -3263,6 +3264,15 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
+     d = flatview_to_dispatch(cache->fv);
+     cache->mrs = *address_space_translate_internal(d, addr, &cache->xlat, &l, true);
+ 
++    /*
++     * cache->xlat is now relative to cache->mrs.mr, not to the section itself.
++     * Take that into account to compute how many bytes are there between
++     * cache->xlat and the end of the section.
++     */
++    diff = int128_sub(cache->mrs.size,
++		      int128_make64(cache->xlat - cache->mrs.offset_within_region));
++    l = int128_get64(int128_min(diff, int128_make64(l)));
++
+     mr = cache->mrs.mr;
+     memory_region_ref(mr);
+     if (memory_access_is_direct(mr, is_write)) {
+diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
+index 9cb4c42bd..28739248e 100644
+--- a/tests/qtest/fuzz-test.c
++++ b/tests/qtest/fuzz-test.c
+@@ -47,6 +47,55 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
+     qtest_outl(s, 0x5d02, 0xebed205d);
+ }
+ 
++/*
++ * Here a MemoryRegionCache pointed to an MMIO region but had a
++ * larger size than the underlying region.
++ */
++static void test_mmio_oob_from_memory_region_cache(void)
++{
++    QTestState *s;
++
++    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
++		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
++
++    qtest_outl(s, 0xcf8, 0x80001811);
++    qtest_outb(s, 0xcfc, 0x6e);
++    qtest_outl(s, 0xcf8, 0x80001824);
++    qtest_outl(s, 0xcf8, 0x80001813);
++    qtest_outl(s, 0xcfc, 0xa080000);
++    qtest_outl(s, 0xcf8, 0x80001802);
++    qtest_outl(s, 0xcfc, 0x5a175a63);
++    qtest_outb(s, 0x6e08, 0x9e);
++    qtest_writeb(s, 0x9f003, 0xff);
++    qtest_writeb(s, 0x9f004, 0x01);
++    qtest_writeb(s, 0x9e012, 0x0e);
++    qtest_writeb(s, 0x9e01b, 0x0e);
++    qtest_writeb(s, 0x9f006, 0x01);
++    qtest_writeb(s, 0x9f008, 0x01);
++    qtest_writeb(s, 0x9f00a, 0x01);
++    qtest_writeb(s, 0x9f00c, 0x01);
++    qtest_writeb(s, 0x9f00e, 0x01);
++    qtest_writeb(s, 0x9f010, 0x01);
++    qtest_writeb(s, 0x9f012, 0x01);
++    qtest_writeb(s, 0x9f014, 0x01);
++    qtest_writeb(s, 0x9f016, 0x01);
++    qtest_writeb(s, 0x9f018, 0x01);
++    qtest_writeb(s, 0x9f01a, 0x01);
++    qtest_writeb(s, 0x9f01c, 0x01);
++    qtest_writeb(s, 0x9f01e, 0x01);
++    qtest_writeb(s, 0x9f020, 0x01);
++    qtest_writeb(s, 0x9f022, 0x01);
++    qtest_writeb(s, 0x9f024, 0x01);
++    qtest_writeb(s, 0x9f026, 0x01);
++    qtest_writeb(s, 0x9f028, 0x01);
++    qtest_writeb(s, 0x9f02a, 0x01);
++    qtest_writeb(s, 0x9f02c, 0x01);
++    qtest_writeb(s, 0x9f02e, 0x01);
++    qtest_writeb(s, 0x9f030, 0x01);
++    qtest_outb(s, 0x6e10, 0x00);
++    qtest_quit(s);
++}
++
+ int main(int argc, char **argv)
+ {
+     const char *arch = qtest_get_arch();
+@@ -58,6 +107,8 @@ int main(int argc, char **argv)
+                        test_lp1878263_megasas_zero_iov_cnt);
+         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
+                        test_lp1878642_pci_bus_get_irq_level_assert);
++        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
++                       test_mmio_oob_from_memory_region_cache);
+     }
+ 
+     return g_test_run();
+-- 
+2.29.2
+
-- 
2.29.2

