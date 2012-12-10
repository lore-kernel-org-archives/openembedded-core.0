Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Thyd2-00007f-DT
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 09:22:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Dec 2012 00:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,250,1355126400"; d="scan'208";a="178804542"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Dec 2012 00:07:49 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 10:08:13 +0200
Message-Id: <1310001d58eaeee899c199610cbbdc49e19f3650.1355126594.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355126594.git.constantinx.musca@intel.com>
References: <cover.1355126594.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355126594.git.constantinx.musca@intel.com>
References: <cover.1355126594.git.constantinx.musca@intel.com>
Subject: [PATCH 3/3] qemu: upgrade to 1.3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 08:22:22 -0000

remove-hardcoded-libexec.patch: removed
    - included in the new version

qemu-vmware-vga-depth.patch: removed
    - doesn't apply anymore
    - the problem addressed by the patch is fixed by
reverting commit 1f202568e0553b416483e5993f1bde219c22cf72

Revert-vmware_vga-Add-back-some-info-in-local-state-.patch:
    - VMware VGA requires that the depth presented to the guest
to be the same as the Display Surface depth in order to do not
corrupt the display
    - do not cache the DS depth (the depth might change)
    - revert commit 1f202568

- QEMU now uses pixman (DEPENDS += "pixman")
- rearrange the recipe in order to mimic the bitbake flow
- update both variants (.tar.bz2, git)

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...re_vga-Add-back-some-info-in-local-state-.patch | 114 ++++++++++++++++++++
 .../qemu/{qemu-1.2.0 => files}/arm-bgr.patch       |   0
 .../enable-i386-linux-user.patch                   |   0
 .../fallback-to-safe-mmap_min_addr.patch           |   0
 .../fix-configure-checks.patch                     |   0
 .../qemu/{qemu-1.2.0 => files}/init-info.patch     |   0
 .../larger_default_ram_size.patch                  |   0
 .../qemu/{qemu-1.2.0 => files}/linker-flags.patch  |   0
 .../qemu/{qemu-1.2.0 => files}/no-strip.patch      |   0
 .../qemu/{qemu-1.2.0 => files}/powerpc_rom.bin     | Bin
 .../{qemu-1.2.0 => files}/relocatable_sdk.patch    |   0
 .../qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch    | 106 ------------------
 .../qemu/qemu-1.2.0/remove-hardcoded-libexec.patch |  41 -------
 .../qemu/qemu-git/enable-i386-linux-user.patch     |  55 ----------
 .../qemu/qemu-git/linker-flags.patch               |  25 -----
 meta/recipes-devtools/qemu/qemu-git/no-strip.patch |  15 ---
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin | Bin 4096 -> 0 bytes
 .../qemu/qemu-git/qemu-vmware-vga-depth.patch      | 118 ---------------------
 .../qemu/qemu-git/remove-hardcoded-libexec.patch   |  41 -------
 meta/recipes-devtools/qemu/qemu.inc                |  66 +++++++++---
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |  52 ---------
 meta/recipes-devtools/qemu/qemu_1.3.0.bb           |  10 ++
 meta/recipes-devtools/qemu/qemu_git.bb             |  11 +-
 23 files changed, 178 insertions(+), 476 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/arm-bgr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/fix-configure-checks.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/linker-flags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-1.2.0 => files}/relocatable_sdk.patch (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/no-strip.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_1.2.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_1.3.0.bb

diff --git a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch b/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
new file mode 100644
index 0000000..d56256e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
@@ -0,0 +1,114 @@
+From 2cf7df441ce4c36525ba4d2d040f8cb0b0c75f14 Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Fri, 7 Dec 2012 12:33:42 +0200
+Subject: [PATCH] Revert "vmware_vga: Add back some info in local state
+ partially reverting aa32b38c"
+
+- this reverts commit 1f202568e0553b416483e5993f1bde219c22cf72
+- do not cache the DS depth (the depth might change)
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+---
+ hw/vmware_vga.c | 30 +++++++++---------------------
+ 1 file changed, 9 insertions(+), 21 deletions(-)
+
+diff --git a/hw/vmware_vga.c b/hw/vmware_vga.c
+index 834588d..7c766fb 100644
+--- a/hw/vmware_vga.c
++++ b/hw/vmware_vga.c
+@@ -39,8 +39,6 @@ struct vmsvga_state_s {
+     VGACommonState vga;
+ 
+     int invalidated;
+-    int depth;
+-    int bypp;
+     int enable;
+     int config;
+     struct {
+@@ -57,9 +55,6 @@ struct vmsvga_state_s {
+     int new_height;
+     uint32_t guest;
+     uint32_t svgaid;
+-    uint32_t wred;
+-    uint32_t wgreen;
+-    uint32_t wblue;
+     int syncing;
+ 
+     MemoryRegion fifo_ram;
+@@ -723,25 +718,25 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
+         return SVGA_MAX_HEIGHT;
+ 
+     case SVGA_REG_DEPTH:
+-        return s->depth;
++        return ds_get_depth(s->vga.ds);
+ 
+     case SVGA_REG_BITS_PER_PIXEL:
+-        return (s->depth + 7) & ~7;
++        return ds_get_bits_per_pixel(s->vga.ds);
+ 
+     case SVGA_REG_PSEUDOCOLOR:
+         return 0x0;
+ 
+     case SVGA_REG_RED_MASK:
+-        return s->wred;
++        return ds_get_rmask(s->vga.ds);
+ 
+     case SVGA_REG_GREEN_MASK:
+-        return s->wgreen;
++        return ds_get_gmask(s->vga.ds);
+ 
+     case SVGA_REG_BLUE_MASK:
+-        return s->wblue;
++        return ds_get_bmask(s->vga.ds);
+ 
+     case SVGA_REG_BYTES_PER_LINE:
+-        return s->bypp * s->new_width;
++        return ds_get_bytes_per_pixel(s->vga.ds) * s->new_width;
+ 
+     case SVGA_REG_FB_START: {
+         struct pci_vmsvga_state_s *pci_vmsvga
+@@ -806,7 +801,7 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
+         return s->cursor.on;
+ 
+     case SVGA_REG_HOST_BITS_PER_PIXEL:
+-        return (s->depth + 7) & ~7;
++        return ds_get_bits_per_pixel(s->vga.ds);
+ 
+     case SVGA_REG_SCRATCH_SIZE:
+         return s->scratch_size;
+@@ -869,7 +864,7 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
+         break;
+ 
+     case SVGA_REG_BITS_PER_PIXEL:
+-        if (value != s->depth) {
++        if (value != ds_get_bits_per_pixel(s->vga.ds)) {
+             printf("%s: Bad bits per pixel: %i bits\n", __func__, value);
+             s->config = 0;
+         }
+@@ -1089,7 +1084,7 @@ static const VMStateDescription vmstate_vmware_vga_internal = {
+     .minimum_version_id_old = 0,
+     .post_load = vmsvga_post_load,
+     .fields      = (VMStateField[]) {
+-        VMSTATE_INT32_EQUAL(depth, struct vmsvga_state_s),
++        VMSTATE_UNUSED(4), /* was depth */
+         VMSTATE_INT32(enable, struct vmsvga_state_s),
+         VMSTATE_INT32(config, struct vmsvga_state_s),
+         VMSTATE_INT32(cursor.id, struct vmsvga_state_s),
+@@ -1142,13 +1137,6 @@ static void vmsvga_init(struct vmsvga_state_s *s,
+     vga_common_init(&s->vga);
+     vga_init(&s->vga, address_space, io, true);
+     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
+-    /* Save some values here in case they are changed later.
+-     * This is suspicious and needs more though why it is needed. */
+-    s->depth = ds_get_bits_per_pixel(s->vga.ds);
+-    s->bypp = ds_get_bytes_per_pixel(s->vga.ds);
+-    s->wred = ds_get_rmask(s->vga.ds);
+-    s->wgreen = ds_get_gmask(s->vga.ds);
+-    s->wblue = ds_get_bmask(s->vga.ds);
+ }
+ 
+ static uint64_t vmsvga_io_read(void *opaque, hwaddr addr, unsigned size)
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/arm-bgr.patch b/meta/recipes-devtools/qemu/files/arm-bgr.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/arm-bgr.patch
rename to meta/recipes-devtools/qemu/files/arm-bgr.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/files/enable-i386-linux-user.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/enable-i386-linux-user.patch
rename to meta/recipes-devtools/qemu/files/enable-i386-linux-user.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/fallback-to-safe-mmap_min_addr.patch
rename to meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/fix-configure-checks.patch b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/fix-configure-checks.patch
rename to meta/recipes-devtools/qemu/files/fix-configure-checks.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/init-info.patch b/meta/recipes-devtools/qemu/files/init-info.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/init-info.patch
rename to meta/recipes-devtools/qemu/files/init-info.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/files/larger_default_ram_size.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/larger_default_ram_size.patch
rename to meta/recipes-devtools/qemu/files/larger_default_ram_size.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/linker-flags.patch b/meta/recipes-devtools/qemu/files/linker-flags.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/linker-flags.patch
rename to meta/recipes-devtools/qemu/files/linker-flags.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/no-strip.patch b/meta/recipes-devtools/qemu/files/no-strip.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/no-strip.patch
rename to meta/recipes-devtools/qemu/files/no-strip.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/powerpc_rom.bin b/meta/recipes-devtools/qemu/files/powerpc_rom.bin
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/powerpc_rom.bin
rename to meta/recipes-devtools/qemu/files/powerpc_rom.bin
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch b/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch
rename to meta/recipes-devtools/qemu/files/relocatable_sdk.patch
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
deleted file mode 100644
index a1b8035..0000000
--- a/meta/recipes-devtools/qemu/qemu-1.2.0/qemu-vmware-vga-depth.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-# fix VMware VGA driver depth calculation error, which may cause segmentation fault
-#
-# ktian1, 06/29/2010
-
-Upstream-Status: Pending
-
-Index: qemu-1.2.0/console.h
-===================================================================
---- qemu-1.2.0.orig/console.h	2012-09-06 14:12:23.371832381 -0700
-+++ qemu-1.2.0/console.h	2012-09-06 14:12:23.627832390 -0700
-@@ -171,6 +171,12 @@
-     void (*free_displaysurface)(DisplaySurface *surface);
- };
- 
-+struct DisplayPostCallback {
-+    void (*postcall) (void *);
-+    void *parm;
-+    struct DisplayPostCallback *next;
-+};
-+
- struct DisplayState {
-     struct DisplaySurface *surface;
-     void *opaque;
-@@ -178,6 +184,7 @@
- 
-     struct DisplayAllocator* allocator;
-     struct DisplayChangeListener* listeners;
-+    struct DisplayPostCallback* postcalls;
- 
-     void (*mouse_set)(int x, int y, int on);
-     void (*cursor_define)(QEMUCursor *cursor);
-@@ -233,6 +240,12 @@
-     ds->listeners = dcl;
- }
- 
-+static inline void register_displaypostcallback(DisplayState *ds, DisplayPostCallback *dpc)
-+{
-+    dpc->next = ds->postcalls;
-+    ds->postcalls = dpc;
-+}
-+
- static inline void dpy_update(DisplayState *s, int x, int y, int w, int h)
- {
-     struct DisplayChangeListener *dcl = s->listeners;
-Index: qemu-1.2.0/hw/vmware_vga.c
-===================================================================
---- qemu-1.2.0.orig/hw/vmware_vga.c	2012-09-06 14:12:23.371832381 -0700
-+++ qemu-1.2.0/hw/vmware_vga.c	2012-09-06 14:18:05.595845288 -0700
-@@ -1081,6 +1081,8 @@
- static void vmsvga_init(struct vmsvga_state_s *s,
-                         MemoryRegion *address_space, MemoryRegion *io)
- {
-+    DisplayPostCallback *dpc;
-+
-     s->scratch_size = SVGA_SCRATCH_SIZE;
-     s->scratch = g_malloc(s->scratch_size * 4);
- 
-@@ -1098,6 +1100,10 @@
-     vga_common_init(&s->vga);
-     vga_init(&s->vga, address_space, io, true);
-     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
-+    dpc = g_malloc0(sizeof(DisplayPostCallback));
-+    dpc->postcall = vmsvga_reset;
-+    dpc->parm = s;
-+    register_displaypostcallback(s->vga.ds, dpc);
- 
-     s->depth = ds_get_bits_per_pixel(s->vga.ds);
-     s->bypp = ds_get_bytes_per_pixel(s->vga.ds);
-Index: qemu-1.2.0/qemu-common.h
-===================================================================
---- qemu-1.2.0.orig/qemu-common.h	2012-09-06 14:12:23.371832381 -0700
-+++ qemu-1.2.0/qemu-common.h	2012-09-06 14:12:23.643832391 -0700
-@@ -250,6 +250,7 @@
- typedef struct DisplayChangeListener DisplayChangeListener;
- typedef struct DisplaySurface DisplaySurface;
- typedef struct DisplayAllocator DisplayAllocator;
-+typedef struct DisplayPostCallback DisplayPostCallback;
- typedef struct PixelFormat PixelFormat;
- typedef struct TextConsole TextConsole;
- typedef TextConsole QEMUConsole;
-Index: qemu-1.2.0/vl.c
-===================================================================
---- qemu-1.2.0.orig/vl.c	2012-09-06 14:12:23.371832381 -0700
-+++ qemu-1.2.0/vl.c	2012-09-06 14:17:32.635844142 -0700
-@@ -2352,6 +2352,7 @@
-     char boot_devices[33] = "cad"; /* default to HD->floppy->CD-ROM */
-     DisplayState *ds;
-     DisplayChangeListener *dcl;
-+    DisplayPostCallback *dpc;
-     int cyls, heads, secs, translation;
-     QemuOpts *hda_opts = NULL, *opts, *machine_opts;
-     QemuOptsList *olist;
-@@ -3699,6 +3700,13 @@
- 
-     /* display setup */
-     dpy_resize(ds);
-+    dpc = ds->postcalls;
-+    while (dpc != NULL) {
-+        if (dpc->postcall != NULL)
-+            dpc->postcall(dpc->parm);
-+        dpc = dpc->next;
-+    }
-+
-     dcl = ds->listeners;
-     while (dcl != NULL) {
-         if (dcl->dpy_refresh != NULL) {
diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
deleted file mode 100644
index 8db460a..0000000
--- a/meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-This will allow the libexecdir to be set on the command line
-and have the files installed and used from the correct location
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: qemu-1.2.0/configure
-===================================================================
---- qemu-1.2.0.orig/configure
-+++ qemu-1.2.0/configure
-@@ -183,6 +183,7 @@ datadir="\${prefix}/share"
- qemu_docdir="\${prefix}/share/doc/qemu"
- bindir="\${prefix}/bin"
- libdir="\${prefix}/lib"
-+libexecdir="\${prefix}/libexec"
- includedir="\${prefix}/include"
- sysconfdir="\${prefix}/etc"
- confsuffix="/qemu"
-@@ -644,7 +645,9 @@ for opt do
-   ;;
-   --sysconfdir=*) sysconfdir="$optarg"
-   ;;
--  --sbindir=*|--libexecdir=*|--sharedstatedir=*|--localstatedir=*|\
-+  --libexecdir=*) libexecdir="$optarg"
-+  ;;
-+  --sbindir=*|--sharedstatedir=*|--localstatedir=*|\
-   --oldincludedir=*|--datarootdir=*|--infodir=*|--localedir=*|\
-   --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
-     # These switches are silently ignored, for compatibility with
-@@ -3190,8 +3193,8 @@ echo "sysconfdir=$sysconfdir" >> $config
- echo "qemu_confdir=$qemu_confdir" >> $config_host_mak
- echo "qemu_datadir=$qemu_datadir" >> $config_host_mak
- echo "qemu_docdir=$qemu_docdir" >> $config_host_mak
--echo "libexecdir=\${prefix}/libexec" >> $config_host_mak
--echo "CONFIG_QEMU_HELPERDIR=\"$prefix/libexec\"" >> $config_host_mak
-+echo "libexecdir=$libexecdir" >> $config_host_mak
-+echo "CONFIG_QEMU_HELPERDIR=\"$libexecdir\"" >> $config_host_mak
- 
- echo "ARCH=$ARCH" >> $config_host_mak
- if test "$debug_tcg" = "yes" ; then
diff --git a/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
deleted file mode 100644
index 76ed3a8..0000000
--- a/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Enable i386-linux-user
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration] 
-
-Index: qemu-0.14.0/Makefile.target
-===================================================================
---- qemu-0.14.0.orig/Makefile.target
-+++ qemu-0.14.0/Makefile.target
-@@ -78,8 +78,13 @@ ifeq ($(TARGET_BASE_ARCH), i386)
- libobj-y += cpuid.o
- endif
- libobj-$(CONFIG_NEED_MMU) += mmu.o
-+ifndef CONFIG_LINUX_USER
- libobj-$(TARGET_I386) += helper_opengl.o opengl_exec.o
- libobj-$(TARGET_X86_64) += helper_opengl.o opengl_exec.o
-+else
-+libobj-$(TARGET_I386) += dummygl.o
-+libobj-$(TARGET_X86_64) += dummygl.o
-+endif #CONFIG_LINUX_USER
- libobj-$(TARGET_ARM) += dummygl.o
- libobj-$(TARGET_MIPS) += dummygl.o
- libobj-$(TARGET_PPC) += dummygl.o
-Index: qemu-0.14.0/target-i386/dummygl.c
-===================================================================
---- /dev/null
-+++ qemu-0.14.0/target-i386/dummygl.c
-@@ -0,0 +1,26 @@
-+#include <string.h>
-+#include <stdlib.h>
-+#include <assert.h>
-+#include <stdint.h>
-+#include <X11/Xlib.h>
-+#include <X11/Xutil.h>
-+
-+void opengl_exec_set_parent_window(Display* _dpy, Window _parent_window)
-+{
-+
-+}
-+
-+void opengl_process_enable(void)
-+{
-+
-+}
-+
-+
-+void mem_opengl(uint64_t ptr)
-+{
-+
-+}
-+
-+void helper_opengl(void)
-+{
-+}
diff --git a/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
deleted file mode 100644
index 4569643..0000000
--- a/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
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
-Index: qemu-0.14.0/Makefile.target
-===================================================================
---- qemu-0.14.0.orig/Makefile.target
-+++ qemu-0.14.0/Makefile.target
-@@ -218,7 +218,7 @@ obj-$(CONFIG_REALLY_VIRTFS) += virtio-9p
- obj-y += rwhandler.o
- obj-$(CONFIG_KVM) += kvm.o kvm-all.o
- obj-$(CONFIG_NO_KVM) += kvm-stub.o
--LIBS+=-lz
-+LIBS+=-lz -lX11 -ldl
- 
- QEMU_CFLAGS += $(VNC_TLS_CFLAGS)
- QEMU_CFLAGS += $(VNC_SASL_CFLAGS)
diff --git a/meta/recipes-devtools/qemu/qemu-git/no-strip.patch b/meta/recipes-devtools/qemu/qemu-git/no-strip.patch
deleted file mode 100644
index 098070a..0000000
--- a/meta/recipes-devtools/qemu/qemu-git/no-strip.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration] 
-
-Index: qemu-0.14.0/Makefile
-===================================================================
---- qemu-0.14.0.orig/Makefile
-+++ qemu-0.14.0/Makefile
-@@ -235,7 +235,7 @@ install-sysconfig:
- install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
- 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
- ifneq ($(TOOLS),)
--	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
-+	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
- endif
- ifneq ($(BLOBS),)
- 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
diff --git a/meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin b/meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
deleted file mode 100644
index c4044296c51529878f5d2a46230949d09ef1d4e2..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 4096
zcmeHJQEMDk6h4#Pn8Z}5VUd7UHb$_7oo16ZWvl_Wq7bx}RV;`Ib~1CD44Ivo&djz(
z20DZ^Sm;B1^P!YL$|?xr50Dxx<W1-=Nb#jAB1A;VL+N<VoqKm?mo4n8m<wmm`OZ1_
zyXT&{cV+<&$6*H!JMdrW!2M?){{b*MgY{|vBVVIFj`A$ZQ4}1?4fK1d-SMjkR6spQ
z_GQ*+=6p}1edN8j-n~$%zt8GvfO5${M!BlzGeJ!LBFYOW#4B+{V8!s70opWVtXD3@
zDYsT7E6WA+<uUG+56Lw@`umUh__@Kqf6n8Nx^M%7WfVF8S{METF%22NokAEuO`<ed
z!}V9WmvV;4>hcYvi`OX{&F6WBRnw|kl?KhhA=dzmNj!qa7`0aw&RpKS@@VUVz<iB3
zMpQ$|xW4%zN%nJ?dQI!dwdlD}J%p)_T~Q;N05Shf4N8(@M;Ibka{YvEauGg?vIjtA
zbqtD8FaGQiqq(Cfl+!&ZM!lezVg)+I$)>XgU6}SL_e61d_GCWQDdT+4h>0J6J|vY6
z?n%vooL{&VPxp1(X12&CZmJJ@_@6`fnCE!)^YzN9>I}3^S{w(>9Y>+QAbsI`)YLe%
zhsb^kg>uN3pwJm3OoIDU=pIs8v?nECzNOo>lb47s&EaP<^|yU5q9tpZ%W9g#!{`Jv
zr|0H!wb2^S$51#BeALr<I95i*YdC^h)=oK8XTDy_e`39s6Efd#dZB8#PUySXQy=qb
zi2XtSc~LLG(q`vgB_qvg-;s)C8L6AkMN@f2<h+bp)Cgs?d9P4!Wp?qtu*JH{JmPj=
z9X5+MwRTe6R?5lm8zJYFbLBH3ET5Y^zkF@UH=8!Po3GplAFV<2I`~fY=BxF=C+}Vd
z-|60b7yIC&+PdqT)q3&`#C`C|bJS5^Z@xl5eDtl8^${oMHJ06gIf&9&36H?r)A;V4
z#+S@==jEcgSd;QG&rb6RyBX$`vA~Dw|Jwn1zD7)T#WL6@;i|`=;hOjXG2Diyht{Ia
zU{W_tp9O(xFxw7bGO#{l!uHt`7`AJysF!?pxyc-36&9O84uw{OE$RWwxh&Ptjb*0V
zmcvvc1M`U<9+ne0ptr1=y`Obs#c{9N%v@sN>&_Cx0<&mZafTbZr#AFp1v*?A3Nlm0
zZzgj>xMKNXQ@2&xYBnqPS-@>HKdpGnx?^IqQWS)y+YFH+ToxY7u|nTegHZRwP8V}b
zSae+sEb;%K*M1#ny}qNsYkLXA5B@1?u>#SJLhH*7Xlm<8f;#-X1y`fH6W_i8$-egB
zukYdwC~E6a_+TB*MCN`S^Bz_3)<>=KiD-M`L~SkEkMBZtb6dHCdSP>WD2n&sT(mn?
z+PpV(Q@b~GE4~eH#;xQaDju($jbT{3o+O+D*Tz`w>>7;I`r2-i+`I$ItrjS_{sHo6
zTN_Ym=RSmE(Ze$(%wLGV!aq8Lpw!l&igq#Dm@1(jj;@#MaSO(y^{Eo=O`A-R1mJvJ
aoLIp7h<sDgFE5ple~0izly{QHzx@jx&XA}8

diff --git a/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
deleted file mode 100644
index c4c5424..0000000
--- a/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-# fix VMware VGA driver depth calculation error, which may cause segmentation fault
-#
-# ktian1, 06/29/2010
-
-Upstream-Status: Pending
-
-Index: qemu-0.14.0/console.h
-===================================================================
---- qemu-0.14.0.orig/console.h
-+++ qemu-0.14.0/console.h
-@@ -171,6 +171,12 @@ struct DisplayAllocator {
-     void (*free_displaysurface)(DisplaySurface *surface);
- };
- 
-+struct DisplayPostCallback {
-+    void (*postcall) (void *);
-+    void *parm;
-+    struct DisplayPostCallback *next;
-+};
-+
- struct DisplayState {
-     struct DisplaySurface *surface;
-     void *opaque;
-@@ -178,6 +184,7 @@ struct DisplayState {
- 
-     struct DisplayAllocator* allocator;
-     struct DisplayChangeListener* listeners;
-+    struct DisplayPostCallback* postcalls;
- 
-     void (*mouse_set)(int x, int y, int on);
-     void (*cursor_define)(QEMUCursor *cursor);
-@@ -229,6 +236,12 @@ static inline void register_displaychang
-     ds->listeners = dcl;
- }
- 
-+static inline void register_displaypostcallback(DisplayState *ds, DisplayPostCallback *dpc)
-+{
-+    dpc->next = ds->postcalls;
-+    ds->postcalls = dpc;
-+}
-+
- static inline void dpy_update(DisplayState *s, int x, int y, int w, int h)
- {
-     struct DisplayChangeListener *dcl = s->listeners;
-Index: qemu-0.14.0/hw/vmware_vga.c
-===================================================================
---- qemu-0.14.0.orig/hw/vmware_vga.c
-+++ qemu-0.14.0/hw/vmware_vga.c
-@@ -1001,8 +1001,9 @@ static void vmsvga_update_display(void *
-     }
- }
- 
--static void vmsvga_reset(struct vmsvga_state_s *s)
-+static void vmsvga_reset(void *parm)
- {
-+    struct vmsvga_state_s *s = (struct vmsvga_state_s *)parm;
-     s->index = 0;
-     s->enable = 0;
-     s->config = 0;
-@@ -1207,6 +1208,8 @@ static const VMStateDescription vmstate_
- 
- static void vmsvga_init(struct vmsvga_state_s *s, int vga_ram_size)
- {
-+    DisplayPostCallback *dpc;
-+
-     s->scratch_size = SVGA_SCRATCH_SIZE;
-     s->scratch = qemu_malloc(s->scratch_size * 4);
- 
-@@ -1224,7 +1227,10 @@ static void vmsvga_init(struct vmsvga_st
-     vga_init(&s->vga);
-     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
- 
--    vmsvga_reset(s);
-+    dpc = qemu_mallocz(sizeof(DisplayPostCallback));
-+    dpc->postcall = vmsvga_reset;
-+    dpc->parm = s;
-+    register_displaypostcallback(s->vga.ds, dpc);
- }
- 
- static void pci_vmsvga_map_ioport(PCIDevice *pci_dev, int region_num,
-Index: qemu-0.14.0/qemu-common.h
-===================================================================
---- qemu-0.14.0.orig/qemu-common.h
-+++ qemu-0.14.0/qemu-common.h
-@@ -241,6 +241,7 @@ typedef struct DisplayState DisplayState
- typedef struct DisplayChangeListener DisplayChangeListener;
- typedef struct DisplaySurface DisplaySurface;
- typedef struct DisplayAllocator DisplayAllocator;
-+typedef struct DisplayPostCallback DisplayPostCallback;
- typedef struct PixelFormat PixelFormat;
- typedef struct TextConsole TextConsole;
- typedef TextConsole QEMUConsole;
-Index: qemu-0.14.0/vl.c
-===================================================================
---- qemu-0.14.0.orig/vl.c
-+++ qemu-0.14.0/vl.c
-@@ -1920,6 +1920,7 @@ int main(int argc, char **argv, char **e
-     char boot_devices[33] = "cad"; /* default to HD->floppy->CD-ROM */
-     DisplayState *ds;
-     DisplayChangeListener *dcl;
-+    DisplayPostCallback *dpc;
-     int cyls, heads, secs, translation;
-     QemuOpts *hda_opts = NULL, *opts;
-     QemuOptsList *olist;
-@@ -3101,6 +3102,13 @@ int main(int argc, char **argv, char **e
- 
-     /* display setup */
-     dpy_resize(ds);
-+    dpc = ds->postcalls;
-+    while (dpc != NULL) {
-+        if (dpc->postcall != NULL)
-+            dpc->postcall(dpc->parm);
-+        dpc = dpc->next;
-+    }
-+
-     dcl = ds->listeners;
-     while (dcl != NULL) {
-         if (dcl->dpy_refresh != NULL) {
diff --git a/meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch b/meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch
deleted file mode 100644
index 83f5463..0000000
--- a/meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-This will allow the libexecdir to be set on the command line
-and have the files installed and used from the correct location
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: qemu-1.2.0/configure
-===================================================================
---- qemu-1.2.0.orig/configure
-+++ qemu-1.2.0/configure
-@@ -183,6 +183,7 @@ datadir="\${prefix}/share"
- qemu_docdir="\${prefix}/share/doc/qemu"
- bindir="\${prefix}/bin"
- libdir="\${prefix}/lib"
-+libexecdir="\${prefix}/libexec"
- includedir="\${prefix}/include"
- sysconfdir="\${prefix}/etc"
- confsuffix="/qemu"
-@@ -644,7 +645,9 @@ for opt do
-   ;;
-   --sysconfdir=*) sysconfdir="$optarg"
-   ;;
--  --sbindir=*|--libexecdir=*|--sharedstatedir=*|--localstatedir=*|\
-+  --libexecdir=*) libexecdir="$optarg"
-+  ;;
-+  --sbindir=*|--sharedstatedir=*|--localstatedir=*|\
-   --oldincludedir=*|--datarootdir=*|--infodir=*|--localedir=*|\
-   --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
-     # These switches are silently ignored, for compatibility with
-@@ -3190,8 +3193,8 @@ echo "sysconfdir=$sysconfdir" >> $config
- echo "qemu_confdir=$qemu_confdir" >> $config_host_mak
- echo "qemu_datadir=$qemu_datadir" >> $config_host_mak
- echo "qemu_docdir=$qemu_docdir" >> $config_host_mak
--echo "libexecdir=\${prefix}/libexec" >> $config_host_mak
--echo "CONFIG_QEMU_HELPERDIR=\"$prefix/libexec\"" >> $config_host_mak
-+echo "libexecdir=$libexecdir" >> $config_host_mak
-+echo "CONFIG_QEMU_HELPERDIR=$libexecdir" >> $config_host_mak
- 
- echo "ARCH=$ARCH" >> $config_host_mak
- if test "$debug_tcg" = "yes" ; then
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95556ba..ca411a6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,23 +1,54 @@
 DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11"
+DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
+DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native"
+DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman"
+RDEPENDS_class-nativesdk = "nativesdk-libsdl"
+
+require qemu-targets.inc
+inherit autotools
+BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
-require qemu-targets.inc
-
 SDL ?= "--disable-sdl"
 SDL_class-native ?= ""
 SDL_class-nativesdk ?= ""
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez"
+SRC_URI = "\
+    file://powerpc_rom.bin \
+    file://no-strip.patch \
+    file://linker-flags.patch \
+    file://fix-configure-checks.patch \
+    file://fallback-to-safe-mmap_min_addr.patch \
+    file://larger_default_ram_size.patch \
+    file://arm-bgr.patch \
+    file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
+    "
 
-#EXTRA_OECONF += "--disable-sdl"
+SRC_URI_append_class-nativesdk = "\
+    file://relocatable_sdk.patch \
+    "
 
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
 
-inherit autotools
+EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
+				--disable-curl \
+				"
+
+do_configure_prepend_class-native() {
+	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
+	sed -i 's/-lX11//g' Makefile.target
+}
+
+do_configure_prepend_class-nativesdk() {
+	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
+		# Undo the -lX11 added by linker-flags.patch
+		sed -i 's/-lX11//g' Makefile.target
+	fi
+}
 
 do_configure() {
     # Handle distros such as CentOS 5 32-bit that do not have kvm support
@@ -38,16 +69,21 @@ do_install () {
 	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 }
 
-PACKAGECONFIG ??= ""
-
-DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0"
-RDEPENDS_class-nativesdk = "nativesdk-libsdl"
-EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
-				--disable-curl \
-				"
+# The following fragment will create a wrapper for qemu-mips user emulation
+# binary in order to work around a segmentation fault issue. Basically, by
+# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
+# This will trigger a MMU access fault in the virtual CPU. With this change,
+# the qemu-mips works fine.
+# IMPORTANT: This piece needs to be removed once the root cause is fixed!
+do_install_append() {
+	if [ -e "${D}/${bindir}/qemu-mips" ]; then
+		create_wrapper ${D}/${bindir}/qemu-mips \
+			QEMU_RESERVED_VA=0x0
+	fi
+}
+# END of qemu-mips workaround
 
-BBCLASSEXTEND = "native nativesdk"
+PACKAGECONFIG ??= ""
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
deleted file mode 100644
index af5eb03..0000000
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-require qemu.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI = "\
-    http://wiki.qemu.org/download/qemu-${PV}.tar.bz2 \
-    file://powerpc_rom.bin \
-    file://no-strip.patch \
-    file://linker-flags.patch \
-    file://qemu-vmware-vga-depth.patch \
-    file://fix-configure-checks.patch \
-    file://fallback-to-safe-mmap_min_addr.patch \
-    file://larger_default_ram_size.patch \
-    file://arm-bgr.patch \
-    file://remove-hardcoded-libexec.patch \
-    "
-SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
-SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
-
-PR = "r4"
-
-SRC_URI_append_class-nativesdk = "\
-    file://relocatable_sdk.patch \
-    "
-
-do_configure_prepend_class-nativesdk() {
-	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
-		# Undo the -lX11 added by linker-flags.patch
-		sed -i 's/-lX11//g' Makefile.target
-	fi
-}
-
-# The following fragment will create a wrapper for qemu-mips user emulation
-# binary in order to work around a segmentation fault issue. Basically, by
-# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
-# This will trigger a MMU access fault in the virtual CPU. With this change,
-# the qemu-mips works fine.
-# IMPORTANT: This piece needs to be removed once the root cause is fixed!
-do_install_append() {
-	if [ -e "${D}/${bindir}/qemu-mips" ]; then
-		create_wrapper ${D}/${bindir}/qemu-mips \
-			QEMU_RESERVED_VA=0x0
-	fi
-}
-# END of qemu-mips workaround
-
-do_configure_prepend_class-native() {
-	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
-	sed -i 's/-lX11//g' Makefile.target
-}
-
diff --git a/meta/recipes-devtools/qemu/qemu_1.3.0.bb b/meta/recipes-devtools/qemu/qemu_1.3.0.bb
new file mode 100644
index 0000000..7d007ea
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu_1.3.0.bb
@@ -0,0 +1,10 @@
+require qemu.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+
+SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
+SRC_URI[md5sum] = "a4030ddd2ba324152a97d65d3c0b247d"
+SRC_URI[sha256sum] = "878055ec05bc28fecfe2da97eb8bc992e8635575b67cebdfc5ca1ede171140a8"
+
+PR = "r0"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 0b58cf7..9465203 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -1,19 +1,14 @@
 require qemu.inc
 
-SRCREV = "6e4c0d1f03d6ab407509c32fab7cb4b8230f57ff"
+SRCREV = "6d6c9f59ca1b1a76ade7ad868bef191818f58819"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PV = "1.2+git"
+PV = "1.3.0+git${SRCPV}"
 PR = "r0"
 
-FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
-
-SRC_URI = "\
-    git://git.qemu.org/qemu.git;protocol=git \
-    file://powerpc_rom.bin \
-    "
+SRC_URI_prepend = "git://git.qemu.org/qemu.git;protocol=git"
 S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.11.7



