Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 982086A456
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 12:08:48 +0000 (UTC)
Received: from aimless.elisa-laajakaista.fi
	(a91-156-57-234.elisa-laajakaista.fi [91.156.57.234])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id B32C726541;
	Thu,  6 Jun 2013 14:08:46 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2013 15:08:40 +0300
Message-Id: <1370520520-13372-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qemu: update to 1.5.0
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
X-List-Received-Date: Thu, 06 Jun 2013 12:08:49 -0000

Patches removed:

0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
 - applied
0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
 - fixed different upstream
Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
 - fixed different upstream
arm-bgr.patch
 - this should be also fixed upstream, if still issue please resend.
fallback-to-safe-mmap_min_addr.patch
 - this should be also fixed upstream, if still issue please resend.
linker-flags.patch
 - unneeded with makefile changes

from configure the obsolete --audio-cards-list option has been removed.
---
 ...x-texinfo-table-markup-in-qemu-options.hx.patch |  213 --------------------
 ...x-generating-qemu-doc.html-with-texinfo-5.patch |   54 -----
 ...re_vga-Add-back-some-info-in-local-state-.patch |  114 -----------
 meta/recipes-devtools/qemu/files/arm-bgr.patch     |   30 ---
 .../files/fallback-to-safe-mmap_min_addr.patch     |   39 ----
 .../recipes-devtools/qemu/files/linker-flags.patch |   25 ---
 meta/recipes-devtools/qemu/qemu.inc                |    7 +-
 .../qemu/{qemu_1.4.1.bb => qemu_1.5.0.bb}          |    4 +-
 8 files changed, 3 insertions(+), 483 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/arm-bgr.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/linker-flags.patch
 rename meta/recipes-devtools/qemu/{qemu_1.4.1.bb => qemu_1.5.0.bb} (67%)

diff --git a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch b/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
deleted file mode 100644
index 9435cfe..0000000
--- a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From 9a7146ca91c04d05af36684d8b3ca79c1254abc2 Mon Sep 17 00:00:00 2001
-From: Markus Armbruster <armbru@redhat.com>
-Date: Wed, 13 Feb 2013 19:49:40 +0100
-Subject: [PATCH 1/2] doc: Fix texinfo @table markup in qemu-options.hx
-
-End tables before headings, start new ones afterwards.  Fixes
-incorrect indentation of headings "File system options" and "Virtual
-File system pass-through options" in manual page and qemu-doc.
-
-Normalize markup some to increase chances it survives future edits.
-
-Upstream-Status: Backport
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Markus Armbruster <armbru@redhat.com>
-Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
-Message-id: 1360781383-28635-5-git-send-email-armbru@redhat.com
-Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
----
- qemu-options.hx | 56 +++++++++++++++++++++++++++++++++++++-------------------
- 1 file changed, 37 insertions(+), 19 deletions(-)
-
-diff --git a/qemu-options.hx b/qemu-options.hx
-index 9d7131a..54bd92a 100644
---- a/qemu-options.hx
-+++ b/qemu-options.hx
-@@ -537,13 +537,15 @@ STEXI
- @end table
- ETEXI
- 
--DEF("usb", 0, QEMU_OPTION_usb,
--    "-usb            enable the USB driver (will be the default soon)\n",
--    QEMU_ARCH_ALL)
- STEXI
- USB options:
- @table @option
-+ETEXI
- 
-+DEF("usb", 0, QEMU_OPTION_usb,
-+    "-usb            enable the USB driver (will be the default soon)\n",
-+    QEMU_ARCH_ALL)
-+STEXI
- @item -usb
- @findex -usb
- Enable the USB driver (will be the default soon)
-@@ -610,9 +612,15 @@ possible drivers and properties, use @code{-device help} and
- @code{-device @var{driver},help}.
- ETEXI
- 
-+STEXI
-+@end table
-+ETEXI
- DEFHEADING()
- 
- DEFHEADING(File system options:)
-+STEXI
-+@table @option
-+ETEXI
- 
- DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
-     "-fsdev fsdriver,id=id[,path=path,][security_model={mapped-xattr|mapped-file|passthrough|none}]\n"
-@@ -676,9 +684,15 @@ Specifies the tag name to be used by the guest to mount this export point
- 
- ETEXI
- 
-+STEXI
-+@end table
-+ETEXI
- DEFHEADING()
- 
- DEFHEADING(Virtual File system pass-through options:)
-+STEXI
-+@table @option
-+ETEXI
- 
- DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
-     "-virtfs local,path=path,mount_tag=tag,security_model=[mapped-xattr|mapped-file|passthrough|none]\n"
-@@ -769,11 +783,9 @@ ETEXI
- STEXI
- @end table
- ETEXI
--
- DEFHEADING()
- 
- DEFHEADING(Display options:)
--
- STEXI
- @table @option
- ETEXI
-@@ -1215,7 +1227,6 @@ ETEXI
- STEXI
- @end table
- ETEXI
--
- ARCHHEADING(, QEMU_ARCH_I386)
- 
- ARCHHEADING(i386 target only:, QEMU_ARCH_I386)
-@@ -1301,10 +1312,10 @@ Specify SMBIOS type 0 fields
- Specify SMBIOS type 1 fields
- ETEXI
- 
--DEFHEADING()
- STEXI
- @end table
- ETEXI
-+DEFHEADING()
- 
- DEFHEADING(Network options:)
- STEXI
-@@ -1718,13 +1729,19 @@ libpcap, so it can be analyzed with tools such as tcpdump or Wireshark.
- Indicate that no network devices should be configured. It is used to
- override the default configuration (@option{-net nic -net user}) which
- is activated if no @option{-net} options are provided.
-+ETEXI
- 
-+STEXI
- @end table
- ETEXI
--
- DEFHEADING()
- 
- DEFHEADING(Character device options:)
-+STEXI
-+
-+The general form of a character device option is:
-+@table @option
-+ETEXI
- 
- DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
-     "-chardev null,id=id[,mux=on|off]\n"
-@@ -1766,10 +1783,6 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
- )
- 
- STEXI
--
--The general form of a character device option is:
--@table @option
--
- @item -chardev @var{backend} ,id=@var{id} [,mux=on|off] [,@var{options}]
- @findex -chardev
- Backend is one of:
-@@ -1990,14 +2003,15 @@ Connect to a spice virtual machine channel, such as vdiport.
- 
- Connect to a spice port, allowing a Spice client to handle the traffic
- identified by a name (preferably a fqdn).
-+ETEXI
- 
-+STEXI
- @end table
- ETEXI
--
- DEFHEADING()
- 
--STEXI
- DEFHEADING(Device URL Syntax:)
-+STEXI
- 
- In addition to using normal file images for the emulated storage devices,
- QEMU can also use networked resources such as iSCSI devices. These are
-@@ -2113,10 +2127,16 @@ qemu-system-x86_84 --drive file=gluster://192.0.2.1/testvol/a.img
- @end example
- 
- See also @url{http://www.gluster.org}.
-+ETEXI
-+
-+STEXI
- @end table
- ETEXI
- 
- DEFHEADING(Bluetooth(R) options:)
-+STEXI
-+@table @option
-+ETEXI
- 
- DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
-     "-bt hci,null    dumb bluetooth HCI - doesn't respond to commands\n" \
-@@ -2130,8 +2150,6 @@ DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
-     "                emulate a bluetooth device 'dev' in scatternet 'n'\n",
-     QEMU_ARCH_ALL)
- STEXI
--@table @option
--
- @item -bt hci[...]
- @findex -bt
- Defines the function of the corresponding Bluetooth HCI.  -bt options
-@@ -2183,9 +2201,11 @@ currently:
- @item keyboard
- Virtual wireless keyboard implementing the HIDP bluetooth profile.
- @end table
--@end table
- ETEXI
- 
-+STEXI
-+@end table
-+ETEXI
- DEFHEADING()
- 
- DEFHEADING(Linux/Multiboot boot specific:)
-@@ -2242,11 +2262,9 @@ ETEXI
- STEXI
- @end table
- ETEXI
--
- DEFHEADING()
- 
- DEFHEADING(Debug/Expert options:)
--
- STEXI
- @table @option
- ETEXI
--- 
-1.8.1.5
-
diff --git a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch b/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
deleted file mode 100644
index cabbf0e..0000000
--- a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f983d4978e1c49ee936ad52bf2de0c531420f5f8 Mon Sep 17 00:00:00 2001
-From: Cole Robinson <crobinso@redhat.com>
-Date: Wed, 20 Feb 2013 07:20:31 +0000
-Subject: [PATCH 2/2] docs: Fix generating qemu-doc.html with texinfo 5
-
-LC_ALL=C makeinfo --no-headers --no-split --number-sections --html qemu-doc.texi -o qemu-doc.html
-./qemu-options.texi:1521: unknown command `list'
-./qemu-options.texi:1521: table requires an argument: the formatter for @item
-./qemu-options.texi:1521: warning: @table has text but no @item
-
-Upstream-Status: Pending
-http://patchwork.ozlabs.org/patch/222131/
-
-CC: qemu-stable@nongnu.org
-Signed-off-by: Cole Robinson <crobinso@redhat.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Reviewed-by: Markus Armbruster <armbru@redhat.com>
----
- qemu-options.hx | 19 +++++++------------
- 1 file changed, 7 insertions(+), 12 deletions(-)
-
-diff --git a/qemu-options.hx b/qemu-options.hx
-index 54bd92a..5d2d9b8 100644
---- a/qemu-options.hx
-+++ b/qemu-options.hx
-@@ -2089,18 +2089,13 @@ QEMU supports using either local sheepdog devices or remote networked
- devices.
- 
- Syntax for specifying a sheepdog device
--@table @list
--``sheepdog:<vdiname>''
--
--``sheepdog:<vdiname>:<snapid>''
--
--``sheepdog:<vdiname>:<tag>''
--
--``sheepdog:<host>:<port>:<vdiname>''
--
--``sheepdog:<host>:<port>:<vdiname>:<snapid>''
--
--``sheepdog:<host>:<port>:<vdiname>:<tag>''
-+@table @code
-+@item sheepdog:<vdiname>
-+@item sheepdog:<vdiname>:<snapid>
-+@item sheepdog:<vdiname>:<tag>
-+@item sheepdog:<host>:<port>:<vdiname>
-+@item sheepdog:<host>:<port>:<vdiname>:<snapid>
-+@item sheepdog:<host>:<port>:<vdiname>:<tag>
- @end table
- 
- Example
--- 
-1.8.1.5
-
diff --git a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch b/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
deleted file mode 100644
index d56256e..0000000
--- a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 2cf7df441ce4c36525ba4d2d040f8cb0b0c75f14 Mon Sep 17 00:00:00 2001
-From: Constantin Musca <constantinx.musca@intel.com>
-Date: Fri, 7 Dec 2012 12:33:42 +0200
-Subject: [PATCH] Revert "vmware_vga: Add back some info in local state
- partially reverting aa32b38c"
-
-- this reverts commit 1f202568e0553b416483e5993f1bde219c22cf72
-- do not cache the DS depth (the depth might change)
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
----
- hw/vmware_vga.c | 30 +++++++++---------------------
- 1 file changed, 9 insertions(+), 21 deletions(-)
-
-diff --git a/hw/vmware_vga.c b/hw/vmware_vga.c
-index 834588d..7c766fb 100644
---- a/hw/vmware_vga.c
-+++ b/hw/vmware_vga.c
-@@ -39,8 +39,6 @@ struct vmsvga_state_s {
-     VGACommonState vga;
- 
-     int invalidated;
--    int depth;
--    int bypp;
-     int enable;
-     int config;
-     struct {
-@@ -57,9 +55,6 @@ struct vmsvga_state_s {
-     int new_height;
-     uint32_t guest;
-     uint32_t svgaid;
--    uint32_t wred;
--    uint32_t wgreen;
--    uint32_t wblue;
-     int syncing;
- 
-     MemoryRegion fifo_ram;
-@@ -723,25 +718,25 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
-         return SVGA_MAX_HEIGHT;
- 
-     case SVGA_REG_DEPTH:
--        return s->depth;
-+        return ds_get_depth(s->vga.ds);
- 
-     case SVGA_REG_BITS_PER_PIXEL:
--        return (s->depth + 7) & ~7;
-+        return ds_get_bits_per_pixel(s->vga.ds);
- 
-     case SVGA_REG_PSEUDOCOLOR:
-         return 0x0;
- 
-     case SVGA_REG_RED_MASK:
--        return s->wred;
-+        return ds_get_rmask(s->vga.ds);
- 
-     case SVGA_REG_GREEN_MASK:
--        return s->wgreen;
-+        return ds_get_gmask(s->vga.ds);
- 
-     case SVGA_REG_BLUE_MASK:
--        return s->wblue;
-+        return ds_get_bmask(s->vga.ds);
- 
-     case SVGA_REG_BYTES_PER_LINE:
--        return s->bypp * s->new_width;
-+        return ds_get_bytes_per_pixel(s->vga.ds) * s->new_width;
- 
-     case SVGA_REG_FB_START: {
-         struct pci_vmsvga_state_s *pci_vmsvga
-@@ -806,7 +801,7 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
-         return s->cursor.on;
- 
-     case SVGA_REG_HOST_BITS_PER_PIXEL:
--        return (s->depth + 7) & ~7;
-+        return ds_get_bits_per_pixel(s->vga.ds);
- 
-     case SVGA_REG_SCRATCH_SIZE:
-         return s->scratch_size;
-@@ -869,7 +864,7 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
-         break;
- 
-     case SVGA_REG_BITS_PER_PIXEL:
--        if (value != s->depth) {
-+        if (value != ds_get_bits_per_pixel(s->vga.ds)) {
-             printf("%s: Bad bits per pixel: %i bits\n", __func__, value);
-             s->config = 0;
-         }
-@@ -1089,7 +1084,7 @@ static const VMStateDescription vmstate_vmware_vga_internal = {
-     .minimum_version_id_old = 0,
-     .post_load = vmsvga_post_load,
-     .fields      = (VMStateField[]) {
--        VMSTATE_INT32_EQUAL(depth, struct vmsvga_state_s),
-+        VMSTATE_UNUSED(4), /* was depth */
-         VMSTATE_INT32(enable, struct vmsvga_state_s),
-         VMSTATE_INT32(config, struct vmsvga_state_s),
-         VMSTATE_INT32(cursor.id, struct vmsvga_state_s),
-@@ -1142,13 +1137,6 @@ static void vmsvga_init(struct vmsvga_state_s *s,
-     vga_common_init(&s->vga);
-     vga_init(&s->vga, address_space, io, true);
-     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
--    /* Save some values here in case they are changed later.
--     * This is suspicious and needs more though why it is needed. */
--    s->depth = ds_get_bits_per_pixel(s->vga.ds);
--    s->bypp = ds_get_bytes_per_pixel(s->vga.ds);
--    s->wred = ds_get_rmask(s->vga.ds);
--    s->wgreen = ds_get_gmask(s->vga.ds);
--    s->wblue = ds_get_bmask(s->vga.ds);
- }
- 
- static uint64_t vmsvga_io_read(void *opaque, hwaddr addr, unsigned size)
--- 
-1.7.11.7
-
diff --git a/meta/recipes-devtools/qemu/files/arm-bgr.patch b/meta/recipes-devtools/qemu/files/arm-bgr.patch
deleted file mode 100644
index f3ebde6..0000000
--- a/meta/recipes-devtools/qemu/files/arm-bgr.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-After kernel commit:
-
-http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.0/commit/?h=meta&id=9728c1b6a724daefc413b44e10253cdbb5e06d08
-
-It appears that the emulated colours in qemu are incorrect and that 
-the red and blue channels are reversed. This patch reverses that logic
-so the colours are correctly displayed on the versatile platform which
-doesn't support the BGR bit.
-
-RP 16/9/2011
-
-Upstream-Status: Pending
-
-Index: qemu-1.2.0/hw/pl110.c
-===================================================================
---- qemu-1.2.0.orig/hw/pl110.c	2012-09-06 14:07:27.619821133 -0700
-+++ qemu-1.2.0/hw/pl110.c	2012-09-06 14:12:07.699829648 -0700
-@@ -168,7 +168,11 @@
-         fprintf(stderr, "pl110: Bad color depth\n");
-         exit(1);
-     }
--    if (s->cr & PL110_CR_BGR)
-+
-+    if (s->version && s->bpp == BPP_16)
-+        /* Code assumes BPP_16 == 565 and BGR is never set on the versatile in 565 mode */
-+        bpp_offset = 0;
-+    else if (s->cr & PL110_CR_BGR)
-         bpp_offset = 0;
-     else
-         bpp_offset = 24;
diff --git a/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
deleted file mode 100644
index 2075386..0000000
--- a/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c313f89c33217ac0e471554dace2144718f86669 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 13 May 2010 12:23:40 +0200
-Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when /proc/sys/vm/mmap_min_addr cannot be read
-
-* 65536 is default at least for ubuntu and fedora.
----
- linux-user/main.c |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-Upstream-Status: Pending
-
-Index: qemu-0.14.0/linux-user/main.c
-===================================================================
---- qemu-0.14.0.orig/linux-user/main.c
-+++ qemu-0.14.0/linux-user/main.c
-@@ -36,6 +36,7 @@
- #include "envlist.h"
- 
- #define DEBUG_LOGFILE "/tmp/qemu.log"
-+#define MMAP_MIN_ADDR_DEFAULT 65536
- 
- char *exec_path;
- 
-@@ -3010,8 +3011,14 @@ int main(int argc, char **argv, char **e
-             if (fscanf(fp, "%lu", &tmp) == 1) {
-                 mmap_min_addr = tmp;
-                 qemu_log("host mmap_min_addr=0x%lx\n", mmap_min_addr);
-+            } else {
-+                qemu_log("cannot read value from /proc/sys/vm/mmap_min_addr, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
-+                mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
-             }
-             fclose(fp);
-+        } else {
-+            qemu_log("cannot open /proc/sys/vm/mmap_min_addr for reading, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
-+            mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
-         }
-     }
- 
diff --git a/meta/recipes-devtools/qemu/files/linker-flags.patch b/meta/recipes-devtools/qemu/files/linker-flags.patch
deleted file mode 100644
index 0106ae2..0000000
--- a/meta/recipes-devtools/qemu/files/linker-flags.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fedora 13 switched the default behaviour of the linker to no longer
-indirectly link to required libraries (i.e. dependencies of a library
-already linked to). Therefore we need to explicitly pass the depended on
-libraries into the linker for building to work on Fedora 13.
-
-More information is available on the Fedora Wiki:
-https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
-
-JL - 15/06/10
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: qemu-1.2.0/Makefile.target
-===================================================================
---- qemu-1.2.0.orig/Makefile.target	2012-09-05 07:03:06.000000000 -0700
-+++ qemu-1.2.0/Makefile.target	2012-09-06 13:42:24.819764288 -0700
-@@ -130,7 +130,7 @@
- obj-$(CONFIG_HAVE_CORE_DUMP) += dump.o
- obj-$(CONFIG_NO_GET_MEMORY_MAPPING) += memory_mapping-stub.o
- obj-$(CONFIG_NO_CORE_DUMP) += dump-stub.o
--LIBS+=-lz
-+LIBS+=-lz -lX11 -ldl
- 
- QEMU_CFLAGS += $(VNC_TLS_CFLAGS)
- QEMU_CFLAGS += $(VNC_SASL_CFLAGS)
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0a7dc4e..7caef6e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -20,13 +20,8 @@ SDL_class-nativesdk ?= ""
 SRC_URI = "\
     file://powerpc_rom.bin \
     file://no-strip.patch \
-    file://linker-flags.patch \
     file://fix-configure-checks.patch \
-    file://fallback-to-safe-mmap_min_addr.patch \
     file://larger_default_ram_size.patch \
-    file://arm-bgr.patch \
-    file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
-    file://0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch \
     "
 
 SRC_URI_append_class-nativesdk = "\
@@ -37,7 +32,7 @@ SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
diff --git a/meta/recipes-devtools/qemu/qemu_1.4.1.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
similarity index 67%
rename from meta/recipes-devtools/qemu/qemu_1.4.1.bb
rename to meta/recipes-devtools/qemu/qemu_1.5.0.bb
index f59d28a..2ea4f12 100644
--- a/meta/recipes-devtools/qemu/qemu_1.4.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://fdt_header.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "eb2d696956324722b5ecfa46e41f9a75"
-SRC_URI[sha256sum] = "75063a9326221607de3599e89fb5af80f2d8080ddc55ca253fff113843432df1"
+SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
+SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
-- 
1.7.10.4


