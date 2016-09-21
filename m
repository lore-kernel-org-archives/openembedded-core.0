Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.38])
	by mail.openembedded.org (Postfix) with ESMTP id 406CF60851
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:10:31 +0000 (UTC)
Received: from 1bmcbs-0001uX-W8 by out10b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1bmcbt-0001vF-Tf
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2016 01:10:29 -0700
Received: by emcmailer; Wed, 21 Sep 2016 01:10:29 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1bmcbs-0001uX-W8
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2016 01:10:28 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Sep 2016 10:10:28 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2016 10:10:22 +0200
Message-ID: <1474445422-48590-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][krogoth] qemu: CVE-2016-3710
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
X-List-Received-Date: Wed, 21 Sep 2016 08:10:33 -0000
Content-Type: text/plain

Fixes an out-of-bounds read/write access flaw which was found
in the way QEMU's VGA emulation with VESA BIOS Extensions (VBE)
support performed read/write operations using I/O port methods.

A privileged guest user could use this flaw to execute arbitrary
code on the host with the privileges of the host's QEMU process.

Reference to pstream fix:
-------------------------
https://lists.gnu.org/archive/html/qemu-devel/2016-05/msg01197.html

References:
-----------
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-3710
http://www.openwall.com/lists/oss-security/2016/05/09/3
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-3710

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-3710.patch | 111 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch
new file mode 100644
index 0000000..48b9589
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch
@@ -0,0 +1,111 @@
+From 3bf1817079bb0d80c0d8a86a7c7dd0bfe90eb82e Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 26 Apr 2016 08:49:10 +0200
+Subject: [PATCH] vga: fix banked access bounds checking (CVE-2016-3710)
+
+vga allows banked access to video memory using the window at 0xa00000
+and it supports a different access modes with different address
+calculations.
+
+The VBE bochs extentions support banked access too, using the
+VBE_DISPI_INDEX_BANK register.  The code tries to take the different
+address calculations into account and applies different limits to
+VBE_DISPI_INDEX_BANK depending on the current access mode.
+
+Which is probably effective in stopping misprogramming by accident.
+But from a security point of view completely useless as an attacker
+can easily change access modes after setting the bank register.
+
+Drop the bogus check, add range checks to vga_mem_{readb,writeb}
+instead.
+
+Upstream-Status: Backport [from v2.6.0-rc5~1^2~4
+commit: 3bf1817079bb0d80c0d8a86a7c7dd0bfe90eb82e]
+
+Fixes: CVE-2016-3710
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ hw/display/vga.c | 24 ++++++++++++++++++------
+ 1 file changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/hw/display/vga.c b/hw/display/vga.c
+index 657e9f1..b9191ca 100644
+--- a/hw/display/vga.c
++++ b/hw/display/vga.c
+@@ -179,6 +179,7 @@ static void vga_update_memory_access(VGACommonState *s)
+             size = 0x8000;
+             break;
+         }
++        assert(offset + size <= s->vram_size);
+         memory_region_init_alias(&s->chain4_alias, memory_region_owner(&s->vram),
+                                  "vga.chain4", &s->vram, offset, size);
+         memory_region_add_subregion_overlap(s->legacy_address_space, base,
+@@ -716,11 +717,7 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val)
+             vbe_fixup_regs(s);
+             break;
+         case VBE_DISPI_INDEX_BANK:
+-            if (s->vbe_regs[VBE_DISPI_INDEX_BPP] == 4) {
+-              val &= (s->vbe_bank_mask >> 2);
+-            } else {
+-              val &= s->vbe_bank_mask;
+-            }
++            val &= s->vbe_bank_mask;
+             s->vbe_regs[s->vbe_index] = val;
+             s->bank_offset = (val << 16);
+             vga_update_memory_access(s);
+@@ -819,13 +816,21 @@ uint32_t vga_mem_readb(VGACommonState *s, hwaddr addr)
+ 
+     if (s->sr[VGA_SEQ_MEMORY_MODE] & VGA_SR04_CHN_4M) {
+         /* chain 4 mode : simplest access */
++        assert(addr < s->vram_size);
+         ret = s->vram_ptr[addr];
+     } else if (s->gr[VGA_GFX_MODE] & 0x10) {
+         /* odd/even mode (aka text mode mapping) */
+         plane = (s->gr[VGA_GFX_PLANE_READ] & 2) | (addr & 1);
+-        ret = s->vram_ptr[((addr & ~1) << 1) | plane];
++        addr = ((addr & ~1) << 1) | plane;
++        if (addr >= s->vram_size) {
++            return 0xff;
++        }
++        ret = s->vram_ptr[addr];
+     } else {
+         /* standard VGA latched access */
++        if (addr * sizeof(uint32_t) >= s->vram_size) {
++            return 0xff;
++        }
+         s->latch = ((uint32_t *)s->vram_ptr)[addr];
+ 
+         if (!(s->gr[VGA_GFX_MODE] & 0x08)) {
+@@ -882,6 +887,7 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
+         plane = addr & 3;
+         mask = (1 << plane);
+         if (s->sr[VGA_SEQ_PLANE_WRITE] & mask) {
++            assert(addr < s->vram_size);
+             s->vram_ptr[addr] = val;
+ #ifdef DEBUG_VGA_MEM
+             printf("vga: chain4: [0x" TARGET_FMT_plx "]\n", addr);
+@@ -895,6 +901,9 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
+         mask = (1 << plane);
+         if (s->sr[VGA_SEQ_PLANE_WRITE] & mask) {
+             addr = ((addr & ~1) << 1) | plane;
++            if (addr >= s->vram_size) {
++                return;
++            }
+             s->vram_ptr[addr] = val;
+ #ifdef DEBUG_VGA_MEM
+             printf("vga: odd/even: [0x" TARGET_FMT_plx "]\n", addr);
+@@ -968,6 +977,9 @@ void vga_mem_writeb(VGACommonState *s, hwaddr addr, uint32_t val)
+         mask = s->sr[VGA_SEQ_PLANE_WRITE];
+         s->plane_updated |= mask; /* only used to detect font change */
+         write_mask = mask16[mask];
++        if (addr * sizeof(uint32_t) >= s->vram_size) {
++            return;
++        }
+         ((uint32_t *)s->vram_ptr)[addr] =
+             (((uint32_t *)s->vram_ptr)[addr] & ~write_mask) |
+             (val & write_mask);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index 03a6cbe..7651e9a 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://rng_remove_the_unused_request_cancellation_code.patch \
             file://rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch \
             file://CVE-2016-2858.patch \
+            file://CVE-2016-3710.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
1.9.1


