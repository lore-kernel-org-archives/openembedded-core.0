Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
Subject: [kirkstone][PATCH 2/2] qemu: backport patch for CVE-2021-4207
Date: Mon, 16 May 2022 10:54:48 +0200
Message-Id: <20220516085448.1022070-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>

CVE: CVE-2021-4207

Upstream fix:
https://git.qemu.org/?p=qemu.git;a=commit;h=9569f5cb5b4bffa9d3ebc8ba7da1e03830a9a895

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-4207.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b7762f83a8..cc69eca9ae 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-virtio-net-fix-map-leaking-on-error-during-receive.patch \
            file://pvrdma.patch \
            file://CVE-2021-4206.patch \
+           file://CVE-2021-4207.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch
new file mode 100644
index 0000000000..38f36abd9e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch
@@ -0,0 +1,43 @@
+From 9569f5cb5b4bffa9d3ebc8ba7da1e03830a9a895 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Thu, 7 Apr 2022 10:11:06 +0200
+Subject: [PATCH] display/qxl-render: fix race condition in qxl_cursor
+ (CVE-2021-4207)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Avoid fetching 'width' and 'height' a second time to prevent possible
+race condition. Refer to security advisory
+https://starlabs.sg/advisories/22-4207/ for more information.
+
+Fixes: CVE-2021-4207
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Marc-AndrÃ© Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20220407081106.343235-1-mcascell@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+https://git.qemu.org/?p=qemu.git;a=commit;h=9569f5cb5b4bffa9d3ebc8ba7da1e03830a9a895
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ hw/display/qxl-render.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
+index d28849b..237ed29 100644
+--- a/hw/display/qxl-render.c
++++ b/hw/display/qxl-render.c
+@@ -266,7 +266,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCursor *cursor,
+         }
+         break;
+     case SPICE_CURSOR_TYPE_ALPHA:
+-        size = sizeof(uint32_t) * cursor->header.width * cursor->header.height;
++        size = sizeof(uint32_t) * c->width * c->height;
+         qxl_unpack_chunks(c->data, size, qxl, &cursor->chunk, group_id);
+         if (qxl->debug > 2) {
+             cursor_print_ascii_art(c, "qxl/alpha");
+-- 
+1.8.3.1
+
-- 
2.32.0

