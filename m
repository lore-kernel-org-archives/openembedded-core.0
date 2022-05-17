Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 04/31] qemu: backport patch for CVE-2021-4206
Date: Tue, 17 May 2022 08:23:50 -1000
Message-Id: <0e684c12a762534261fcd7849fdcda0bb8031c0b.1652811454.git.steve@sakoman.com>
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Davide Gardenal <davidegarde2000@gmail.com>

CVE: CVE-2021-4206

Upstream fix:
https://git.qemu.org/?p=qemu.git;a=commit;h=fa892e9abb728e76afcf27323ab29c57fb0fe7aa

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-4206.patch             | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1efbb104e2..b7762f83a8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch \
            file://0002-virtio-net-fix-map-leaking-on-error-during-receive.patch \
            file://pvrdma.patch \
+           file://CVE-2021-4206.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
new file mode 100644
index 0000000000..05f9c8f790
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
@@ -0,0 +1,89 @@
+From fa892e9abb728e76afcf27323ab29c57fb0fe7aa Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Thu, 7 Apr 2022 10:17:12 +0200
+Subject: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
+ (CVE-2021-4206)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Prevent potential integer overflow by limiting 'width' and 'height' to
+512x512. Also change 'datasize' type to size_t. Refer to security
+advisory https://starlabs.sg/advisories/22-4206/ for more information.
+
+Fixes: CVE-2021-4206
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Marc-AndrÃ© Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20220407081712.345609-1-mcascell@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+https://git.qemu.org/?p=qemu.git;a=commit;h=fa892e9abb728e76afcf27323ab29c57fb0fe7aa
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ hw/display/qxl-render.c | 7 +++++++
+ hw/display/vmware_vga.c | 2 ++
+ ui/cursor.c             | 8 +++++++-
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
+index 237ed29..ca21700 100644
+--- a/hw/display/qxl-render.c
++++ b/hw/display/qxl-render.c
+@@ -247,6 +247,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCursor *cursor,
+     size_t size;
+ 
+     c = cursor_alloc(cursor->header.width, cursor->header.height);
++
++    if (!c) {
++        qxl_set_guest_bug(qxl, "%s: cursor %ux%u alloc error", __func__,
++                cursor->header.width, cursor->header.height);
++        goto fail;
++    }
++
+     c->hot_x = cursor->header.hot_spot_x;
+     c->hot_y = cursor->header.hot_spot_y;
+     switch (cursor->header.type) {
+diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
+index 98c8347..45d06cb 100644
+--- a/hw/display/vmware_vga.c
++++ b/hw/display/vmware_vga.c
+@@ -515,6 +515,8 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
+     int i, pixels;
+ 
+     qc = cursor_alloc(c->width, c->height);
++    assert(qc != NULL);
++
+     qc->hot_x = c->hot_x;
+     qc->hot_y = c->hot_y;
+     switch (c->bpp) {
+diff --git a/ui/cursor.c b/ui/cursor.c
+index 1d62ddd..835f080 100644
+--- a/ui/cursor.c
++++ b/ui/cursor.c
+@@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
+ 
+     /* parse pixel data */
+     c = cursor_alloc(width, height);
++    assert(c != NULL);
++
+     for (pixel = 0, y = 0; y < height; y++, line++) {
+         for (x = 0; x < height; x++, pixel++) {
+             idx = xpm[line][x];
+@@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)
+ QEMUCursor *cursor_alloc(int width, int height)
+ {
+     QEMUCursor *c;
+-    int datasize = width * height * sizeof(uint32_t);
++    size_t datasize = width * height * sizeof(uint32_t);
++
++    if (width > 512 || height > 512) {
++        return NULL;
++    }
+ 
+     c = g_malloc0(sizeof(QEMUCursor) + datasize);
+     c->width  = width;
+-- 
+1.8.3.1
+
-- 
2.25.1

