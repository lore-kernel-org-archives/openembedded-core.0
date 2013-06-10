Return-Path: <net147@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id AD0526204F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 05:02:09 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so6833354pbc.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2013 22:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GEqYGYNqIhNLLw+Bd2v1X9AjhRJ9f6zBd52xToLDPDM=;
	b=XBiPNfe19FvrwhRro9f5CouLVYoiWIRB2NBwlkZoOMEzbUHyqTrDTlm39GteSfj2t9
	AY+b8jq9gt4KlMYfR6ljgvbf0fJAuOcies4kbFXqioe+Bmh0DrD2JKSB+yoKwX5sVu8l
	Mq8md3fFkzOIDXeLFlkFlMesKZ0D1UmjJebKFoouis/L0IPaanlqsU/IbUrzcB38Ap7t
	+ZYyB5NX44hctDvhc226tof/1EhyKnwChNfKGtLtKMwMFvvn8wWbggDstD4PSPnuAo/9
	hn7GKTNCiZBGuOV097qxoonraB8f8BHVJd3WOVmXoGLm8SxxwTxn0ILc7IAipkMMy4Nb
	58Vg==
X-Received: by 10.66.122.130 with SMTP id ls2mr12307433pab.128.1370840530664; 
	Sun, 09 Jun 2013 22:02:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id p2sm13926970pag.22.2013.06.09.22.02.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 09 Jun 2013 22:02:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 15:15:55 +1000
Message-Id: <1370841355-26796-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] util-linux: update to 2.23.1
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
X-List-Received-Date: Mon, 10 Jun 2013 05:02:10 -0000

Removed patches integrated upstream.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...-fix-loopcxt_check_size-to-work-with-blkd.patch | 60 ----------------------
 ...etup-use-warn_size-for-regular-files-only.patch | 29 -----------
 .../{util-linux_2.23.bb => util-linux_2.23.1.bb}   |  7 +--
 3 files changed, 2 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
 rename meta/recipes-core/util-linux/{util-linux_2.23.bb => util-linux_2.23.1.bb} (70%)

diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch b/meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
deleted file mode 100644
index d1093f2..0000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From e3b6cb87e0ba1304fa07ec316784de1c6243b28e Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 13 May 2013 10:54:41 +0200
-Subject: [PATCH] lib/loopdev: fix loopcxt_check_size() to work with blkdevs
-
-The loopcxt_check_size() is workaround for kernels < v3.9, kernel has
-been fixed by commit 541c742a7559eb65f0e36d3e2338c2ca532a3e61.
-
-The function sets loopdev size according to backing file size. The
-problem is that the backing file could be a block device where
-stat.st_size is zero, so we have to use blkdev_get_size() for block
-devices.
-
-Addresses: https://bugs.archlinux.org/task/35193
-Reported-by: Dave Reisner <d@falconindy.com>
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- lib/loopdev.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/lib/loopdev.c b/lib/loopdev.c
-index c35e306..3b65b5d 100644
---- a/lib/loopdev.c
-+++ b/lib/loopdev.c
-@@ -1097,7 +1097,17 @@ static int loopcxt_check_size(struct loopdev_cxt *lc, int file_fd)
- 	if (fstat(file_fd, &st))
- 		return -errno;
- 
--	expected_size = st.st_size;
-+	if (S_ISBLK(st.st_mode)) {
-+		if (blkdev_get_size(file_fd,
-+				(unsigned long long *) &expected_size))
-+			return -errno;
-+	} else
-+		expected_size = st.st_size;
-+
-+	if (expected_size == 0 || expected_size <= lc->info.lo_offset) {
-+		DBG(lc, loopdev_debug("failed to determine expected size"));
-+		return 0;	/* ignore this error */
-+	}
- 
- 	if (lc->info.lo_offset > 0)
- 		expected_size -= lc->info.lo_offset;
-@@ -1113,6 +1123,10 @@ static int loopcxt_check_size(struct loopdev_cxt *lc, int file_fd)
- 		return -errno;
- 
- 	if (expected_size != size) {
-+		DBG(lc, loopdev_debug("warning: loopdev and expected "
-+				      "size dismatch (%ju/%ju)",
-+				      size, expected_size));
-+
- 		if (loopcxt_set_capacity(lc)) {
- 			/* ioctl not available */
- 			if (errno == ENOTTY || errno == EINVAL)
--- 
-1.8.2.3
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch b/meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
deleted file mode 100644
index 3382e7f..0000000
--- a/meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From b048b8af3a5568c90f6e0c2d56f6cb399dedb0d1 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 13 May 2013 11:00:47 +0200
-Subject: [PATCH] losetup: use warn_size() for regular files only
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- sys-utils/losetup.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys-utils/losetup.c b/sys-utils/losetup.c
-index ccf120e..b44c9e5 100644
---- a/sys-utils/losetup.c
-+++ b/sys-utils/losetup.c
-@@ -380,7 +380,7 @@ static void warn_size(const char *filename, uint64_t size)
- 	struct stat st;
- 
- 	if (!size) {
--		if (stat(filename, &st))
-+		if (stat(filename, &st) || S_ISBLK(st.st_mode))
- 			return;
- 		size = st.st_size;
- 	}
--- 
-1.8.2.3
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.23.bb b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
similarity index 70%
rename from meta/recipes-core/util-linux/util-linux_2.23.bb
rename to meta/recipes-core/util-linux/util-linux_2.23.1.bb
index b85df21..12f5021 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
@@ -1,5 +1,4 @@
 MAJOR_VERSION = "2.23"
-PR = "r0"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -12,13 +11,11 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-configure.patch \
-            file://0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch \
-            file://0001-losetup-use-warn_size-for-regular-files-only.patch \
             ${OLDHOST} \
 "
 
-SRC_URI[md5sum] = "7bd10387f1aa00efaa4b07dfa13215bc"
-SRC_URI[sha256sum] = "19ee024b4c6678eaa928d38edc011c332b088e0ff06239575f6b7e00a1855959"
+SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
+SRC_URI[sha256sum] = "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-- 
1.8.2.3


