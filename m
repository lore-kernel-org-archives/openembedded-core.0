Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgNkl-0002bo-QA
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 23:47:43 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4424964lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 14:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FMksXmvq4GinEOwHKIXg+9ehQAxgPTJk/17lJAbaCLE=;
	b=C3+Uc80bfeTvDgwIr2ufgRilAA34o1qz14U9Z2bAsoG29x75FIkzoeyR79a18Zn8g6
	FUmdRlvqhpnevbHH4C1NSKtvC9yAfH90CsWxDY1Phb1KygBlloyp0kMEtpVqcl0U/pYs
	HymIYF8G1foY5kLaCaH1dYGnTRBv9bu61pK+ueMuTQRdrY2LPb1XUmwjLhMxJSpMeAI1
	D9WOIYX/wRtmoNeklVQv4aO9x1xNSlUyBghG41TPP969IfH9tw4Md/H5MKAws3uUPHDZ
	iXPs0dzVAiqljFErvcgUNOejcPLnZm14S1ESQPePNYCSsQIT+2gdQhjTd9EPAODrFn3l
	vaTw==
Received: by 10.152.103.38 with SMTP id ft6mr18000665lab.40.1354746798861;
	Wed, 05 Dec 2012 14:33:18 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id b7sm2725688lbk.17.2012.12.05.14.33.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 14:33:17 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TgNWl-00071U-0M; Thu, 06 Dec 2012 00:33:15 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 00:33:14 +0200
Message-Id: <1354746794-24290-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libmatchbox: fix build against libpng15
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
X-List-Received-Date: Wed, 05 Dec 2012 22:47:43 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libmatchbox/files/libpng15.patch               |   34 ++++++++++++++++++++
 .../libmatchbox/libmatchbox_1.9.bb                 |    6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/libmatchbox/files/libpng15.patch

diff --git a/meta/recipes-graphics/libmatchbox/files/libpng15.patch b/meta/recipes-graphics/libmatchbox/files/libpng15.patch
new file mode 100644
index 0000000..a463d9e
--- /dev/null
+++ b/meta/recipes-graphics/libmatchbox/files/libpng15.patch
@@ -0,0 +1,34 @@
+diff -Nurd libmatchbox-1.9/libmb/mbpixbuf.c libmatchbox-1.9/libmb/mbpixbuf.c
+--- libmatchbox-1.9/libmb/mbpixbuf.c	2006-07-26 22:12:25.000000000 +0300
++++ libmatchbox-1.9/libmb/mbpixbuf.c	2012-12-06 00:08:28.645988727 +0200
+@@ -224,6 +224,7 @@
+   png_structp png_ptr;
+   png_infop info_ptr;
+   png_bytep *row_pointers;
++  png_byte ct;
+ 
+   if ((fd = fopen( file, "rb" )) == NULL) return NULL;
+ 
+@@ -247,7 +248,7 @@
+     return NULL;
+   }
+ 
+-  if ( setjmp( png_ptr->jmpbuf ) ) {
++  if ( setjmp( png_jmpbuf( png_ptr ) ) ) {
+     png_destroy_read_struct( &png_ptr, &info_ptr, NULL);
+     fclose(fd);
+     return NULL;
+@@ -268,9 +269,11 @@
+   if (( color_type == PNG_COLOR_TYPE_GRAY )||
+       ( color_type == PNG_COLOR_TYPE_GRAY_ALPHA ))
+     png_set_gray_to_rgb(png_ptr);
++
++  ct = png_get_color_type(png_ptr, info_ptr);
+  
+-  if ( info_ptr->color_type == PNG_COLOR_TYPE_RGB_ALPHA 
+-       || info_ptr->color_type == PNG_COLOR_TYPE_GRAY_ALPHA
++  if ( ct == PNG_COLOR_TYPE_RGB_ALPHA 
++       || ct == PNG_COLOR_TYPE_GRAY_ALPHA
+        )
+     *has_alpha = 1;
+   else
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
index 2fcd1b0..559f9b5 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
@@ -1,12 +1,14 @@
 require libmatchbox.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://16bppfixes.patch \
            file://configure_fixes.patch \
            file://check.m4 \
-           file://matchbox-start-fix.patch"
+           file://matchbox-start-fix.patch \
+           file://libpng15.patch \
+"
 
 SRC_URI[md5sum] = "465fa15c43bf0091a3810e7702fe143f"
 SRC_URI[sha256sum] = "f7054f93c57ba6b758d0e4f47d4d2dd96a7fe487e1157eb70a4d642910275aea"
-- 
1.7.10.4



