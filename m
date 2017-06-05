Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 1C63E6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 02:19:30 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym01.jp.fujitsu.com with smtp
	id 2bc5_37cf_99ac78d0_9812_4768_9d84_f021d4aafa68;
	Mon, 05 Jun 2017 11:19:24 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 67007AC0145
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:19:24 +0900 (JST)
Received: from g01jpexchkw38.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	546893283F0 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:19:23 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw38.g01.fujitsu.local (10.0.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 5 Jun 2017 11:19:20 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 11:20:40 +0900
Message-ID: <1496629240-14416-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] cairo: Fix CVE-2017-7475
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
X-List-Received-Date: Mon, 05 Jun 2017 02:19:31 -0000
Content-Type: text/plain

CVE: CVE-2017-7475

Bug 100763 - Denial-of-Service Attack due to Logical Problem in Program

https://bugs.freedesktop.org/show_bug.cgi?id=100763

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...et_bitmap_surface-bsc1036789-CVE-2017-7475.diff | 22 ++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.8.bb        |  4 +++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff

diff --git a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
new file mode 100644
index 0000000..96b1127
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
@@ -0,0 +1,22 @@
+Cairo: Fix Denial-of-Service Attack due to Logical Problem in Program
+
+https://bugs.freedesktop.org/show_bug.cgi?id=100763
+
+CVE: CVE-2017-7475
+Upstream-Status: Pending
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+Index: cairo-1.15.4/src/cairo-ft-font.c
+===================================================================
+--- cairo-1.15.4.orig/src/cairo-ft-font.c
++++ cairo-1.15.4/src/cairo-ft-font.c
+@@ -1149,7 +1149,7 @@ _get_bitmap_surface (FT_Bitmap		     *bi
+     width = bitmap->width;
+     height = bitmap->rows;
+ 
+-    if (width == 0 || height == 0) {
++    if (width == 0 || height == 0 || bitmap->buffer == NULL) {
+ 	*surface = (cairo_image_surface_t *)
+ 	    cairo_image_surface_create_for_data (NULL, format, 0, 0, 0);
+ 	return (*surface)->base.status;
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.8.bb b/meta/recipes-graphics/cairo/cairo_1.14.8.bb
index 5a3c74f..fe1f37d 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.8.bb
@@ -2,7 +2,9 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
+SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+	   file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \	
+          "
 
 SRC_URI[md5sum] = "4ef0db2eacb271c74f8a3fd87822aa98"
 SRC_URI[sha256sum] = "d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20"
-- 
1.9.1


