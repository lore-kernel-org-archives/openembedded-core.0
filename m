Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F327C60745
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 10:48:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2016 03:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="945950562"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.24.244])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2016 03:48:46 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:48:43 +0100
Message-Id: <1462358923-11914-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [krogoth][master][PATCH] qemu: updgrade to 2.5.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 10:48:47 -0000

This upgrade includes several worthwhile fixes, security and otherwise, including
a complete fix for CVE-2016-2857.

* drop CVE-2016-2857.patch as it's included in this release, along with several
  related patches which complete the fixes for CVE-2016-2857:
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=9bddb45dbc010cd8ee4d48bd501fa5d18dcec00c
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=e3a2cdfcb5e282139217924044ec5af00c7f8eed
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=fe90bdc25bcf9954ee286cd51de94776a17d04f6
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=d0ee85b4e4c6cc2c8fac311d6df2ed412ed0df5f
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=80b6e5723fac428ea6c08c821078286f43975df8
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=a375e0b03ee3438924b24a45e61ee189ec9361db
* drop CVE-2016-2197.patch as an equivalent fix is included in this release
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=aaf4fb6afb4653c86059255811886a5c4ea271f3
* drop CVE-2016-1568.patch as it's included in this release
  http://git.qemu.org/?p=qemu.git;a=commitdiff;h=4f046a6ba1d558eb043dc13a80d40cf7cb62ef95

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch | 46 -----------------
 .../recipes-devtools/qemu/qemu/CVE-2016-2197.patch | 59 ----------------------
 .../recipes-devtools/qemu/qemu/CVE-2016-2857.patch | 51 -------------------
 .../qemu/{qemu_2.5.0.bb => qemu_2.5.1.bb}          |  7 +--
 4 files changed, 2 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
 rename meta/recipes-devtools/qemu/{qemu_2.5.0.bb => qemu_2.5.1.bb} (80%)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
deleted file mode 100644
index 56fd346..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4ab0359a8ae182a7ac5c99609667273167703fab Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Mon, 11 Jan 2016 14:10:42 -0500
-Subject: [PATCH] ide: ahci: reset ncq object to unused on error
-
-When processing NCQ commands, AHCI device emulation prepares a
-NCQ transfer object; To which an aio control block(aiocb) object
-is assigned in 'execute_ncq_command'. In case, when the NCQ
-command is invalid, the 'aiocb' object is not assigned, and NCQ
-transfer object is left as 'used'. This leads to a use after
-free kind of error in 'bdrv_aio_cancel_async' via 'ahci_reset_port'.
-Reset NCQ transfer object to 'unused' to avoid it.
-
-[Maintainer edit: s/ACHI/AHCI/ in the commit message. --js]
-
-Reported-by: Qinghao Tang <luodalongde@gmail.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: John Snow <jsnow@redhat.com>
-Message-id: 1452282511-4116-1-git-send-email-ppandit@redhat.com
-Signed-off-by: John Snow <jsnow@redhat.com>
-
-Upstream-Status: Backport
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=4ab0359a8ae182a7ac5c99609667273167703fab
-
-CVE: CVE-2016-1568
-[Yocto # 9013]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- hw/ide/ahci.c | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: qemu-2.5.0/hw/ide/ahci.c
-===================================================================
---- qemu-2.5.0.orig/hw/ide/ahci.c
-+++ qemu-2.5.0/hw/ide/ahci.c
-@@ -910,6 +910,7 @@ static void ncq_err(NCQTransferState *nc
-     ide_state->error = ABRT_ERR;
-     ide_state->status = READY_STAT | ERR_STAT;
-     ncq_tfs->drive->port_regs.scr_err |= (1 << ncq_tfs->tag);
-+    ncq_tfs->used = 0;
- }
- 
- static void ncq_finish(NCQTransferState *ncq_tfs)
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch
deleted file mode 100644
index 946435c..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From: Prasad J Pandit <address@hidden>
-
-When IDE AHCI emulation uses Frame Information Structures(FIS)
-engine for data transfer, the mapped FIS buffer address is stored
-in a static 'bounce.buffer'. When a request is made to map another
-memory region, address_space_map() returns NULL because
-'bounce.buffer' is in_use. It leads to a null pointer dereference
-error while doing 'dma_memory_unmap'. Add a check to avoid it.
-
-Reported-by: Zuozhi fzz <address@hidden>
-Signed-off-by: Prasad J Pandit <address@hidden>
-
-Upstream-Status: Backport
-https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg05740.html
-
-CVE: CVE-2016-2197
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- hw/ide/ahci.c | 16 ++++++++++------
-  1 file changed, 10 insertions(+), 6 deletions(-)
-
-  Update as per review
-    -> https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg05715.html
-
-Index: qemu-2.5.0/hw/ide/ahci.c
-===================================================================
---- qemu-2.5.0.orig/hw/ide/ahci.c
-+++ qemu-2.5.0/hw/ide/ahci.c
-@@ -661,9 +661,11 @@ static bool ahci_map_fis_address(AHCIDev
- 
- static void ahci_unmap_fis_address(AHCIDevice *ad)
- {
--    dma_memory_unmap(ad->hba->as, ad->res_fis, 256,
--                     DMA_DIRECTION_FROM_DEVICE, 256);
--    ad->res_fis = NULL;
-+    if (ad->res_fis) {
-+        dma_memory_unmap(ad->hba->as, ad->res_fis, 256,
-+                         DMA_DIRECTION_FROM_DEVICE, 256);
-+        ad->res_fis = NULL;
-+    }
- }
- 
- static bool ahci_map_clb_address(AHCIDevice *ad)
-@@ -677,9 +679,11 @@ static bool ahci_map_clb_address(AHCIDev
- 
- static void ahci_unmap_clb_address(AHCIDevice *ad)
- {
--    dma_memory_unmap(ad->hba->as, ad->lst, 1024,
--                     DMA_DIRECTION_FROM_DEVICE, 1024);
--    ad->lst = NULL;
-+    if (ad->lst) {
-+        dma_memory_unmap(ad->hba->as, ad->lst, 1024,
-+                         DMA_DIRECTION_FROM_DEVICE, 1024);
-+        ad->lst = NULL;
-+    }
- }
- 
- static void ahci_write_fis_sdb(AHCIState *s, NCQTransferState *ncq_tfs)
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
deleted file mode 100644
index 73cfa2a..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 362786f14a753d8a5256ef97d7c10ed576d6572b Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Wed, 2 Mar 2016 17:29:58 +0530
-Subject: [PATCH] net: check packet payload length
-
-While computing IP checksum, 'net_checksum_calculate' reads
-payload length from the packet. It could exceed the given 'data'
-buffer size. Add a check to avoid it.
-
-Reported-by: Liu Ling <liuling-it@360.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2016-2857
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=362786f14a753d8a5256ef97d7c10ed576d6572b
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- net/checksum.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-Index: qemu-2.5.0/net/checksum.c
-===================================================================
---- qemu-2.5.0.orig/net/checksum.c
-+++ qemu-2.5.0/net/checksum.c
-@@ -59,6 +59,11 @@ void net_checksum_calculate(uint8_t *dat
-     int hlen, plen, proto, csum_offset;
-     uint16_t csum;
- 
-+    /* Ensure data has complete L2 & L3 headers. */
-+    if (length < 14 + 20) {
-+        return;
-+    }
-+
-     if ((data[14] & 0xf0) != 0x40)
- 	return; /* not IPv4 */
-     hlen  = (data[14] & 0x0f) * 4;
-@@ -76,8 +81,9 @@ void net_checksum_calculate(uint8_t *dat
- 	return;
-     }
- 
--    if (plen < csum_offset+2)
--	return;
-+    if (plen < csum_offset + 2 || 14 + hlen + plen > length) {
-+        return;
-+    }
- 
-     data[14+hlen+csum_offset]   = 0;
-     data[14+hlen+csum_offset+1] = 0;
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.1.bb
similarity index 80%
rename from meta/recipes-devtools/qemu/qemu_2.5.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.5.1.bb
index 03a6cbe..3db6e36 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.1.bb
@@ -7,19 +7,16 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
-            file://CVE-2016-1568.patch \
-            file://CVE-2016-2197.patch \
             file://CVE-2016-2198.patch \
             file://pathlimit.patch \
-            file://CVE-2016-2857.patch \
             file://rng_move_request_from_RngEgd_to_RngBackend.patch \
             file://rng_remove_the_unused_request_cancellation_code.patch \
             file://rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch \
             file://CVE-2016-2858.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-SRC_URI[sha256sum] = "3443887401619fe33bfa5d900a4f2d6a79425ae2b7e43d5b8c36eb7a683772d4"
+SRC_URI[md5sum] = "42e73182dea8b9213fa7050e168a4615"
+SRC_URI[sha256sum] = "028752c33bb786abbfe496ba57315dc5a7d0a33b5a7a767f6d7a29020c525d2c"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.5.5


