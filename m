Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F080077326
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:32:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAG7WGlB007578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Nov 2015 23:32:17 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 15 Nov 2015 23:32:16 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 02:32:11 -0500
Message-ID: <f9f3fba7c022715def0474aba0203997a0c31d32.1447659023.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447659023.git.wenzong.fan@windriver.com>
References: <cover.1447659023.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] qemu: fix CVE-2015-5225
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
X-List-Received-Date: Mon, 16 Nov 2015 07:32:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Wenzong Fan <wenzong.fan@windriver.com>

Buffer overflow in the vnc_refresh_server_surface function in the VNC
display driver in QEMU before 2.4.0.1 allows guest users to cause a
denial of service (heap memory corruption and process crash) or
possibly execute arbitrary code on the host via unspecified vectors,
related to refreshing the server display surface.

Backport upstream commit:
http://git.qemu.org/?p=qemu.git;a=commit;h=eb8934b0418b3b1d125edddc4fc334a54334a49b

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../qemu/qemu/qemu-CVE-2015-5225.patch             | 91 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5225.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5225.patch b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5225.patch
new file mode 100644
index 0000000..561a960
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5225.patch
@@ -0,0 +1,91 @@
+From efec4dcd2552e85ed57f276b58f09fc385727450 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 17 Aug 2015 19:56:53 +0200
+Subject: [PATCH] vnc: fix memory corruption (CVE-2015-5225)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The _cmp_bytes variable added by commit "bea60dd ui/vnc: fix potential
+memory corruption issues" can become negative.  Result is (possibly
+exploitable) memory corruption.  Reason for that is it uses the stride
+instead of bytes per scanline to apply limits.
+
+For the server surface is is actually fine.  vnc creates that itself,
+there is never any padding and thus scanline length always equals stride.
+
+For the guest surface scanline length and stride are typically identical
+too, but it doesn't has to be that way.  So add and use a new variable
+(guest_ll) for the guest scanline length.  Also rename min_stride to
+line_bytes to make more clear what it actually is.  Finally sprinkle
+in an assert() to make sure we never use a negative _cmp_bytes again.
+
+Reported-by: 范祚至(库特) <zuozhi.fzz@alibaba-inc.com>
+Reviewed-by: P J P <ppandit@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+(cherry picked from commit eb8934b0418b3b1d125edddc4fc334a54334a49b)
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+
+Upstream-Status: Backport
+
+Backport upstream commit:
+http://git.qemu.org/?p=qemu.git;a=commit;h=eb8934b0418b3b1d125edddc4fc334a54334a49b
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ ui/vnc.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/ui/vnc.c b/ui/vnc.c
+index e26973a..caf82f5 100644
+--- a/ui/vnc.c
++++ b/ui/vnc.c
+@@ -2872,7 +2872,7 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
+                     pixman_image_get_width(vd->server));
+     int height = MIN(pixman_image_get_height(vd->guest.fb),
+                      pixman_image_get_height(vd->server));
+-    int cmp_bytes, server_stride, min_stride, guest_stride, y = 0;
++    int cmp_bytes, server_stride, line_bytes, guest_ll, guest_stride, y = 0;
+     uint8_t *guest_row0 = NULL, *server_row0;
+     VncState *vs;
+     int has_dirty = 0;
+@@ -2891,17 +2891,21 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
+      * Update server dirty map.
+      */
+     server_row0 = (uint8_t *)pixman_image_get_data(vd->server);
+-    server_stride = guest_stride = pixman_image_get_stride(vd->server);
++    server_stride = guest_stride = guest_ll =
++        pixman_image_get_stride(vd->server);
+     cmp_bytes = MIN(VNC_DIRTY_PIXELS_PER_BIT * VNC_SERVER_FB_BYTES,
+                     server_stride);
+     if (vd->guest.format != VNC_SERVER_FB_FORMAT) {
+         int width = pixman_image_get_width(vd->server);
+         tmpbuf = qemu_pixman_linebuf_create(VNC_SERVER_FB_FORMAT, width);
+     } else {
++        int guest_bpp =
++            PIXMAN_FORMAT_BPP(pixman_image_get_format(vd->guest.fb));
+         guest_row0 = (uint8_t *)pixman_image_get_data(vd->guest.fb);
+         guest_stride = pixman_image_get_stride(vd->guest.fb);
++        guest_ll = pixman_image_get_width(vd->guest.fb) * ((guest_bpp + 7) / 8);
+     }
+-    min_stride = MIN(server_stride, guest_stride);
++    line_bytes = MIN(server_stride, guest_ll);
+ 
+     for (;;) {
+         int x;
+@@ -2932,9 +2936,10 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
+             if (!test_and_clear_bit(x, vd->guest.dirty[y])) {
+                 continue;
+             }
+-            if ((x + 1) * cmp_bytes > min_stride) {
+-                _cmp_bytes = min_stride - x * cmp_bytes;
++            if ((x + 1) * cmp_bytes > line_bytes) {
++                _cmp_bytes = line_bytes - x * cmp_bytes;
+             }
++            assert(_cmp_bytes >= 0);
+             if (memcmp(server_ptr, guest_ptr, _cmp_bytes) == 0) {
+                 continue;
+             }
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 1505b80..24e8ef5 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
+            file://qemu-CVE-2015-5225.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
1.9.1


