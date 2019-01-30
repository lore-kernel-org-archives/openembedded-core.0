Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9067C29B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJ8v4nnmz5k
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548840847;
	bh=v0emlsbUdzgmxRr2Q327BZU/5+8XIwAnhcaKMxxl8ok=;
	h=From:To:Subject:Date:From;
	b=FBLkc3D65jz7YyApfyQr0uToSjafEY4aS9XqWWRXhj/KbSE1lGe6OYKFIA3q4ksEx
	5r+mER1D39w/8/OEscTT0GJk85P6VH1bBt5BCqloxCvuFjy6STmAu2VLcK02SDDpXH
	QOdX1wMf10hfwSecvnMfeXCx0eOlaBgYokiPxnnSv3Q9KWCBAlaZ4lSGy6PwxBOGic
	MNzHtvJ2z5XAvq5uPNbtcIzaT7OQGqiYmXBIM1AakMC7KZ4xQ7o7EoJUHg+FF+pO1H
	sVpo6LyC9s6wifgMBAV2nTTyOnqV2xIKWr5oHWzVbSTsokV204t1zf96Cn09hbClN6
	EGI2xJCrPpfnDo+jHl3X0py+0XFNieCw//uJYqsYFc3t2TMUG6ePVNZodZYpaFpYNK
	1kG92cVMXGh62/F6pmfrB7NNgDbAB46pjjBnGZ85O7Nsa9S8HjJrX6l1iXXkS8ZDe7
	7EP+RgLG54mRlvQGsL2h/GlqkNev2DCMUFE3dHxGP9B4aaAHZH1EQvuhM1EDVRGxm2
	4Kjwdv+S2xGzgU3OcDeUhsRgssw4HcgoyRjYs6eUPehWJILIlq/F8499KWpwJbMHAl
	WlYw2AdjhGGN+Bu1AEperKt59LqOaHJ7+D64VFTUvjjbtaZMLt1U8Xzh1SyEb/z+Ca
	3oO7tSCyschIFSUFK7+ip1ds=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:34:06 +0200
Message-Id: <20190130093406.10391-2-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Drop util-linux-native-qsort.patch
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
X-List-Received-Date: Wed, 30 Jan 2019 09:34:07 -0000

CentOS 5.x is no longer supported for 2 years,
and uninative being default since Yocto 2.1 should
in any case already cover this issue better.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../util-linux/util-linux-native-qsort.patch       | 33 ----------------------
 meta/recipes-core/util-linux/util-linux_2.32.1.bb  |  6 ----
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch

diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
deleted file mode 100644
index 68bf22de8c..0000000000
--- a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 26 Mar 2014 01:30:29 +0000
-Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
-
-qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
-the host like CentOS 5.x.
-
-Upstream-Status: Inappropriate [Other]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libfdisk/src/sun.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-Index: util-linux-2.24.2/libfdisk/src/sun.c
-===================================================================
---- util-linux-2.24.2.orig/libfdisk/src/sun.c
-+++ util-linux-2.24.2/libfdisk/src/sun.c
-@@ -431,10 +431,9 @@ static int sun_verify_disklabel(struct f
-     }
-     verify_sun_starts = starts;
- 
--    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
--	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
--	  verify_sun_starts);
--
-+    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
-+         (int (*)(const void *,const void *)) verify_sun_cmp);
-+ 
-     if (array[0] == -1) {
- 	fdisk_info(cxt, _("No partitions defined."));
- 	return 0;
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
index c909836cbb..0ba218b8f2 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -1,15 +1,9 @@
 MAJOR_VERSION = "2.32"
 require util-linux.inc
 
-# To support older hosts, we need to patch and/or revert
-# some upstream changes.  Only do this for native packages.
-OLDHOST = ""
-OLDHOST_class-native = "file://util-linux-native-qsort.patch"
-
 SRC_URI += "file://configure-sbindir.patch \
             file://runuser.pamd \
             file://runuser-l.pamd \
-            ${OLDHOST} \
             file://ptest.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
-- 
2.11.0


