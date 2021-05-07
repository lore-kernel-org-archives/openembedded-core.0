Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tLc/B2jdsAWFPDikwA8TaTeAuwiAg/4Lo60k4FOTOYDRC1Gpi0cfJsU473AmmhuLGUQSpIw5bC
 eTQ9WghTcPEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794764"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:14 -0700
IronPort-SDR: d3ru+l106r2OHVcK9wA+4v7mN/qG97mAZBHY2mP58StJsf69lEx4Pu8HXBtjmZGXnBk3s8hxtN
 zmiDUz0sm5kw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331638"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/31] qemu: fix CVE-2020-27821
Date: Fri,  7 May 2021 15:02:30 +0800
Message-Id: <5240cce285d3baea513da0fc577b69e6f078a527.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

memory: clamp cached translation in case it points to an MMIO region

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df92b3359743ed1837fa57df8035d121f5c5676b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-27821.patch            | 143 ++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5797bbecf2..3e5838d671 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
            file://CVE-2021-20257.patch \
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
2.30.2

