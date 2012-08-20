Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3UqD-0003GO-BB
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 18:28:37 +0200
Received: by weyr6 with SMTP id r6so4250402wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S5LLC/WP+srT7pkRo2LsFF70HbZHFZvox6qjaM2v1Ng=;
	b=xXOLWgpqGk3U4GDnyUFSwjDQd3fYNxZZ5P/PGaf0SnacwA48tQpWdRgrql2TFTRghn
	FCCt2W1Bxh+ms5hpYDgiA/XnU+EXngrWHhYFwBqYQfF//dTZpiVmLoVwGU8AFsUvKazA
	yewE82zXELaDGUGTSMWx19aN2W3vsw1PhV3pVUA2HGqUhFATTnrJeEqaX3rPqgwZyYvE
	AoaD8Vub4EVHOoJ1r0aqef1Dgvna3VXpkAbREKaScByHpQaZEXDdyncWKHhFfHMgmr84
	l9/mQcnYWKn3Pd9Y5emTm6WzfwkSpkSvJj5W88l0eQhNGZvb3Fv30qmVK+ioGAsmZ6zy
	pDjw==
Received: by 10.180.84.1 with SMTP id u1mr30272257wiy.15.1345479394635;
	Mon, 20 Aug 2012 09:16:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm28678460wiz.0.2012.08.20.09.16.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 09:16:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 18:16:35 +0200
Message-Id: <1345479395-16197-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] qemu-0.15: fix location of qemu-vmware-vga-depth.patch file
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
X-List-Received-Date: Mon, 20 Aug 2012 16:28:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch   |  118 --------------------
 .../qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch   |  118 ++++++++++++++++++++
 2 files changed, 118 insertions(+), 118 deletions(-)
 delete mode 100644 meta/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch

diff --git a/meta/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch b/meta/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
deleted file mode 100644
index c4c5424..0000000
--- a/meta/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
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
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
new file mode 100644
index 0000000..c4c5424
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-vmware-vga-depth.patch
@@ -0,0 +1,118 @@
+# fix VMware VGA driver depth calculation error, which may cause segmentation fault
+#
+# ktian1, 06/29/2010
+
+Upstream-Status: Pending
+
+Index: qemu-0.14.0/console.h
+===================================================================
+--- qemu-0.14.0.orig/console.h
++++ qemu-0.14.0/console.h
+@@ -171,6 +171,12 @@ struct DisplayAllocator {
+     void (*free_displaysurface)(DisplaySurface *surface);
+ };
+ 
++struct DisplayPostCallback {
++    void (*postcall) (void *);
++    void *parm;
++    struct DisplayPostCallback *next;
++};
++
+ struct DisplayState {
+     struct DisplaySurface *surface;
+     void *opaque;
+@@ -178,6 +184,7 @@ struct DisplayState {
+ 
+     struct DisplayAllocator* allocator;
+     struct DisplayChangeListener* listeners;
++    struct DisplayPostCallback* postcalls;
+ 
+     void (*mouse_set)(int x, int y, int on);
+     void (*cursor_define)(QEMUCursor *cursor);
+@@ -229,6 +236,12 @@ static inline void register_displaychang
+     ds->listeners = dcl;
+ }
+ 
++static inline void register_displaypostcallback(DisplayState *ds, DisplayPostCallback *dpc)
++{
++    dpc->next = ds->postcalls;
++    ds->postcalls = dpc;
++}
++
+ static inline void dpy_update(DisplayState *s, int x, int y, int w, int h)
+ {
+     struct DisplayChangeListener *dcl = s->listeners;
+Index: qemu-0.14.0/hw/vmware_vga.c
+===================================================================
+--- qemu-0.14.0.orig/hw/vmware_vga.c
++++ qemu-0.14.0/hw/vmware_vga.c
+@@ -1001,8 +1001,9 @@ static void vmsvga_update_display(void *
+     }
+ }
+ 
+-static void vmsvga_reset(struct vmsvga_state_s *s)
++static void vmsvga_reset(void *parm)
+ {
++    struct vmsvga_state_s *s = (struct vmsvga_state_s *)parm;
+     s->index = 0;
+     s->enable = 0;
+     s->config = 0;
+@@ -1207,6 +1208,8 @@ static const VMStateDescription vmstate_
+ 
+ static void vmsvga_init(struct vmsvga_state_s *s, int vga_ram_size)
+ {
++    DisplayPostCallback *dpc;
++
+     s->scratch_size = SVGA_SCRATCH_SIZE;
+     s->scratch = qemu_malloc(s->scratch_size * 4);
+ 
+@@ -1224,7 +1227,10 @@ static void vmsvga_init(struct vmsvga_st
+     vga_init(&s->vga);
+     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
+ 
+-    vmsvga_reset(s);
++    dpc = qemu_mallocz(sizeof(DisplayPostCallback));
++    dpc->postcall = vmsvga_reset;
++    dpc->parm = s;
++    register_displaypostcallback(s->vga.ds, dpc);
+ }
+ 
+ static void pci_vmsvga_map_ioport(PCIDevice *pci_dev, int region_num,
+Index: qemu-0.14.0/qemu-common.h
+===================================================================
+--- qemu-0.14.0.orig/qemu-common.h
++++ qemu-0.14.0/qemu-common.h
+@@ -241,6 +241,7 @@ typedef struct DisplayState DisplayState
+ typedef struct DisplayChangeListener DisplayChangeListener;
+ typedef struct DisplaySurface DisplaySurface;
+ typedef struct DisplayAllocator DisplayAllocator;
++typedef struct DisplayPostCallback DisplayPostCallback;
+ typedef struct PixelFormat PixelFormat;
+ typedef struct TextConsole TextConsole;
+ typedef TextConsole QEMUConsole;
+Index: qemu-0.14.0/vl.c
+===================================================================
+--- qemu-0.14.0.orig/vl.c
++++ qemu-0.14.0/vl.c
+@@ -1920,6 +1920,7 @@ int main(int argc, char **argv, char **e
+     char boot_devices[33] = "cad"; /* default to HD->floppy->CD-ROM */
+     DisplayState *ds;
+     DisplayChangeListener *dcl;
++    DisplayPostCallback *dpc;
+     int cyls, heads, secs, translation;
+     QemuOpts *hda_opts = NULL, *opts;
+     QemuOptsList *olist;
+@@ -3101,6 +3102,13 @@ int main(int argc, char **argv, char **e
+ 
+     /* display setup */
+     dpy_resize(ds);
++    dpc = ds->postcalls;
++    while (dpc != NULL) {
++        if (dpc->postcall != NULL)
++            dpc->postcall(dpc->parm);
++        dpc = dpc->next;
++    }
++
+     dcl = ds->listeners;
+     while (dcl != NULL) {
+         if (dcl->dpy_refresh != NULL) {
-- 
1.7.8.6



