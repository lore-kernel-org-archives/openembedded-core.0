Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.39051.1595256184300086717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 07:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06KEh0TJ007074
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 20 Jul 2020 07:43:00 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Jul 2020
 07:42:47 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] e2fsprogs: fix mkfs.ext4 not parse hardlink if file has a large inode number
Date: Mon, 20 Jul 2020 07:42:47 -0700
Message-ID: <20200720144247.102922-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While file has a large inode number, mkfs.ext4 could not parse
hardlink.

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
 ...-up-check-for-hardlinks-not-accurate.patch | 54 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.6.bb             |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
new file mode 100644
index 0000000000..0a0687651d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
@@ -0,0 +1,54 @@
+From c8b243a94a8d2d0a63d353d5d6e91aa6e780e4a2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 20 Jul 2020 20:53:23 +0800
+Subject: [PATCH] fix up check for hardlinks not accurate
+
+Since commit [382ed4a1 e2fsck: use proper types for variables][1]
+applied, the input params `ino' of is_hardlink, it used ext2_ino_t
+instead of ino_t for referencing inode numbers, but it missed to do the
+same thing on `src_ino' which is used to compare with `ino'.
+Comparing between different types may cause the hardlinks check is
+not accurate.
+
+[snip misc/create_inode.c]
+static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
+{
+    int i;
+
+    for (i = 0; i < hdlinks->count; i++) {
+        if (hdlinks->hdl[i].src_dev == dev &&
+            hdlinks->hdl[i].src_ino == ino)
+            return i;
+    }
+    return -1;
+}
+[snip misc/create_inode.c]
+
+Change the type of src_ino to ext2_ino_t, the reason why uses ext2_ino_t
+instead of ino_t for referencing inode numbers at [2]
+
+[1] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=382ed4a1c2b60acb9db7631e86dda207bde6076e
+[2] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=31dbecd482405e0d3a67eb58e1a1c8cb9f2ad83e
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/47]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ misc/create_inode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/create_inode.h b/misc/create_inode.h
+index b5eeb420..0561a78a 100644
+--- a/misc/create_inode.h
++++ b/misc/create_inode.h
+@@ -11,7 +11,7 @@
+ struct hdlink_s
+ {
+ 	dev_t src_dev;
+-	ino_t src_ino;
++	ext2_ino_t src_ino;
+ 	ext2_ino_t dst_ino;
+ };
+ 
+-- 
+2.18.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
index 4ad5b03cac..7b6d2c3b45 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://mkdir_p.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
+           file://0001-fix-up-check-for-hardlinks-not-accurate.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.18.2

