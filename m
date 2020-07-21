Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10912.1595297822293892809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 19:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06L2GOUh019119
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 20 Jul 2020 19:16:35 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Jul 2020
 19:16:01 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH V2] e2fsprogs: fix up check for hardlinks always false if inode > 0xFFFFFFFF
Date: Mon, 20 Jul 2020 19:16:01 -0700
Message-ID: <20200721021601.99791-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While file has a large inode number (> 0xFFFFFFFF), mkfs.ext4 could
not parse hardlink correctly.

Prepare three hardlink files for mkfs.ext4

$ ls -il rootfs_ota/a rootfs_ota/boot/b rootfs_ota/boot/c
11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/a
11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/boot/b
11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/boot/c

$ truncate -s 1M rootfs_ota.ext4

$ mkfs.ext4 -F -i 8192 rootfs_ota.ext4 -L otaroot -U fd5f8768-c779-4dc9-adde-165a3d863349 -d rootfs_ota

$ mkdir mnt && sudo mount rootfs_ota.ext4 mnt

$ ls -il mnt/rootfs_ota/a mnt/rootfs_ota/boot/b
12 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/a
14 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/boot/b
15 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/boot/c

After applying this fix
$ ls -il mnt/rootfs_ota/a mnt/rootfs_ota/boot/b
12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/a
12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/boot/b
12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/boot/c

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-hardlinks-always-false-if-inode-0xF.patch | 55 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.6.bb             |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
new file mode 100644
index 0000000000..0e8cbad25a
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
@@ -0,0 +1,55 @@
+From dcb36fd007ddb32d8c5cfcf5e9ddb3d713d65396 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 21 Jul 2020 09:43:03 +0800
+Subject: [PATCH] fix up check for hardlinks always false if inode > 0xFFFFFFFF
+
+Since commit [382ed4a1 e2fsck: use proper types for variables][1]
+applied, it used ext2_ino_t instead of ino_t for referencing inode
+numbers, but the type of is_hardlink's `ino' should not be instead,
+The ext2_ino_t is 32bit, if inode > 0xFFFFFFFF, its value will be
+truncated.
+
+Add a debug printf to show the value of inode, when it check for hardlink
+files, it will always return false if inode > 0xFFFFFFFF
+|--- a/misc/create_inode.c
+|+++ b/misc/create_inode.c
+|@@ -605,6 +605,7 @@ static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
+| {
+|        int i;
+|
+|+       printf("%s %d, %lX, %lX\n", __FUNCTION__, __LINE__, hdlinks->hdl[i].src_ino, ino);
+|        for (i = 0; i < hdlinks->count; i++) {
+|                if (hdlinks->hdl[i].src_dev == dev &&
+|                    hdlinks->hdl[i].src_ino == ino)
+
+Here is debug message:
+is_hardlink 608, 2913DB886, 913DB886
+
+The length of ext2_ino_t is 32bit (typedef __u32 __bitwise ext2_ino_t;),
+and ino_t is 64bit on 64bit system (such as x86-64), recover `ino' to ino_t.
+
+[1] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=382ed4a1c2b60acb9db7631e86dda207bde6076e
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/48]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ misc/create_inode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index e8d1df6b..837f3875 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -601,7 +601,7 @@ out:
+ 	return err;
+ }
+ 
+-static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
++static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ino_t ino)
+ {
+ 	int i;
+ 
+-- 
+2.18.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
index 4ad5b03cac..15054768dd 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://mkdir_p.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
+           file://0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.21.0

