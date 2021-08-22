Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9580.1629636686044598223
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l0ISFYxF;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id n5so9435035wro.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m+3R+ryW8azRwk8n86oQAtL/HYQZBgXV13GDLu4pCos=;
        b=l0ISFYxFMtm91mAbsXm8TnBOkgSn0WEaATt5T8jUi/HzGDtPFbNv6aHp8lDhKiuAs0
         3ac9IYuauCwOr7QVZWGeQ/jZj2j3wMBR9qF7DA1vUQOQroL4XXM0dxVeNzxpxugLyisG
         dqTYxKVnX1qXO8PjBvhex+5triG+pcsAGFTZMcrHn62vgdGB8hPodGF5GQfJEnQkpTQ/
         rzBbn6YM6FJaawpyBLB5hK5AMx0retjKsq7vim/i7u24zy9sI/s2Dt0quYkwQ7d09Tht
         HW2qYWPFv4s0qcXypBlAQ+kP+PtZ3Bk9Ph8jvqxnbR0TBAROvj1jKpPpM7hNaWGHbwo6
         EtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m+3R+ryW8azRwk8n86oQAtL/HYQZBgXV13GDLu4pCos=;
        b=lFKTxKrQ0oJ5VeVwEqCQQJQl9P8IgxCVsere53s8JulqxVkf5VS2ghgsfGSoT1ofSx
         UhRdyO+dkKHg65cBlolON+BabYym7YwTd2DG0EfOmYb64DWeTFDhOnBr8WssmC+WRDkK
         2WGSxUBm/pRC2TnTwm+5xXro5xdhAv+KtD2XBSxB/XETsMN0I4d1eOMO8nAOG3H94ZsL
         1zqLFmBQUAHliNzVYFRYrQog2Zpclyfvbq7490FARugS14AeuSWLzjPxbLSMLHWXjFj8
         dT3/1lzoxrSd9XPaj6QWIC7HB8PZhb710eNYHWHEoyjXFGsKbkmD0hHrUbGcpReRChpc
         MOpA==
X-Gm-Message-State: AOAM533fUNK9JAJleKmrX9jr+kqb6xpwvhIgeQqmsyz5o/p/GgTGYiV2
	7vFM6Vj0xDKmGElCMI+lISswAve23ZF1oA==
X-Google-Smtp-Source: ABdhPJwh2K+shbHraQUXMk4gL3rxgzx+JFgdO38phk4kno9lEp2NpiVB52kSpgmJXEGOejScGyxq0Q==
X-Received: by 2002:a05:6000:22d:: with SMTP id l13mr8622315wrz.410.1629636684616;
        Sun, 22 Aug 2021 05:51:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/55] e2fsprogs: upgrade 1.46.2 -> 1.46.4
Date: Sun, 22 Aug 2021 14:50:28 +0200
Message-Id: <20210822125103.310416-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop big-inodes-for-small-fs.patch: upstream made the same fix.

Drop 0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
(upstream has fixed the issue).

Add 0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
to correct a ptest failure due to incorrectly expected inode size
(recent change that wasn't run against the tests upstream?).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-ext2fs-unix_io.c-do-unlock-on-error.patch | 24 -------
 ...io.c-revert-parts-of-libext2fs-fix-p.patch | 48 -------------
 ...ct_io-expect-correct-expected-output.patch | 69 +++++++++++++++++++
 .../e2fsprogs/big-inodes-for-small-fs.patch   | 22 ------
 ...-missing-check-for-permission-denied.patch |  4 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  2 +-
 ...2fsprogs_1.46.2.bb => e2fsprogs_1.46.4.bb} |  7 +-
 7 files changed, 74 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.2.bb => e2fsprogs_1.46.4.bb} (95%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
deleted file mode 100644
index 26f972b313..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 42ba67f9a51ef959e7fd8dac29b5398c121c6976 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Apr 2021 23:45:56 +0200
-Subject: [PATCH] lib/ext2fs/unix_io.c: do unlock on error
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/68]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- lib/ext2fs/unix_io.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/ext2fs/unix_io.c b/lib/ext2fs/unix_io.c
-index 64eee342..528c2fbc 100644
---- a/lib/ext2fs/unix_io.c
-+++ b/lib/ext2fs/unix_io.c
-@@ -398,7 +398,7 @@ static errcode_t raw_write_blk(io_channel channel,
- 		mutex_lock(data, BOUNCE_MTX);
- 		if (ext2fs_llseek(data->dev, location, SEEK_SET) < 0) {
- 			retval = errno ? errno : EXT2_ET_LLSEEK_FAILED;
--			goto error_out;
-+			goto error_unlock;
- 		}
- 		actual = write(data->dev, buf, size);
- 		mutex_unlock(data, BOUNCE_MTX);
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
deleted file mode 100644
index 2452f7e08e..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3593063f735f453d43f461292e26913436c11ca3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sat, 1 May 2021 13:06:12 +0200
-Subject: [PATCH] lib/ext2fs/unix_io.c: revert parts of "libext2fs: fix
- potential races in unix_io"
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/68]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- lib/ext2fs/unix_io.c | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/lib/ext2fs/unix_io.c b/lib/ext2fs/unix_io.c
-index 528c2fbc..f4916b21 100644
---- a/lib/ext2fs/unix_io.c
-+++ b/lib/ext2fs/unix_io.c
-@@ -311,10 +311,10 @@ bounce_read:
- 			size += really_read;
- 			goto short_read;
- 		}
--		actual = size;
--		if (actual > align_size)
--			actual = align_size;
--		actual -= offset;
-+		if ((actual + offset) > align_size)
-+			actual = align_size - offset;
-+		if (actual > size)
-+			actual = size;
- 		memcpy(buf, data->bounce + offset, actual);
- 
- 		really_read += actual;
-@@ -455,9 +455,10 @@ bounce_write:
- 			}
- 		}
- 		actual = size;
--		if (actual > align_size)
--			actual = align_size;
--		actual -= offset;
-+		if ((actual + offset) > align_size)
-+			actual = align_size - offset;
-+		if (actual > size)
-+			actual = size;
- 		memcpy(((char *)data->bounce) + offset, buf, actual);
- 		if (ext2fs_llseek(data->dev, aligned_blk * align_size, SEEK_SET) < 0) {
- 			retval = errno ? errno : EXT2_ET_LLSEEK_FAILED;
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
new file mode 100644
index 0000000000..f198df83eb
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
@@ -0,0 +1,69 @@
+From ea5adf259e01c790f9ba69d6fe88d691de410b6f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 22 Aug 2021 14:37:32 +0200
+Subject: [PATCH] tests/u_direct_io/expect: correct expected output
+
+This is likely the right fix, but upstream needs to confirm.
+
+Upstream-Status: Inappropriate [issue reported https://github.com/tytso/e2fsprogs/issues/80]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/u_direct_io/expect | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/tests/u_direct_io/expect b/tests/u_direct_io/expect
+index b0cdc730..830cbd75 100644
+--- a/tests/u_direct_io/expect
++++ b/tests/u_direct_io/expect
+@@ -19,8 +19,8 @@ Filesystem OS type:       Linux
+ Inode count:              32768
+ Block count:              32768
+ Reserved block count:     1638
+-Overhead clusters:        5131
+-Free blocks:              27631
++Overhead clusters:        6155
++Free blocks:              26607
+ Free inodes:              32757
+ First block:              0
+ Block size:               4096
+@@ -29,27 +29,29 @@ Reserved GDT blocks:      7
+ Blocks per group:         32768
+ Fragments per group:      32768
+ Inodes per group:         32768
+-Inode blocks per group:   1024
++Inode blocks per group:   2048
+ Flex block group size:    16
+ Mount count:              0
+ Check interval:           15552000 (6 months)
+ Reserved blocks uid:      0
+ Reserved blocks gid:      0
+ First inode:              11
+-Inode size:	          128
++Inode size:	          256
++Required extra isize:     32
++Desired extra isize:      32
+ Journal inode:            8
+ Default directory hash:   half_md4
+ Journal backup:           inode blocks
+ Directories:              2
+  Group  0: block bitmap at 9, inode bitmap at 25, inode table at 41
+-           27631 free blocks, 32757 free inodes, 2 used directories
++           26607 free blocks, 32757 free inodes, 2 used directories
+ e2fsck -fn -N test_filesys $LOOP
+ Pass 1: Checking inodes, blocks, and sizes
+ Pass 2: Checking directory structure
+ Pass 3: Checking directory connectivity
+ Pass 4: Checking reference counts
+ Pass 5: Checking group summary information
+-test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
++test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
+ Exit status is 0
+ e2fsck -fn -N test_filesys $TMPFILE
+ Pass 1: Checking inodes, blocks, and sizes
+@@ -57,5 +59,5 @@ Pass 2: Checking directory structure
+ Pass 3: Checking directory connectivity
+ Pass 4: Checking reference counts
+ Pass 5: Checking group summary information
+-test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
++test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
+ Exit status is 0
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
deleted file mode 100644
index caeb560d32..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Ensure "small" file systems also have the default inode size (256 bytes) so that
-can store 64-bit timestamps and work past 2038.
-
-The "small" type is any size >3MB and <512MB, which covers a lot of relatively
-small filesystems built by OE, especially when they're sized to fit the contents
-and expand to the storage on boot.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
-index 01e35cf8..29f41dc0 100644
---- a/misc/mke2fs.conf.in
-+++ b/misc/mke2fs.conf.in
-@@ -16,7 +16,6 @@
- 	}
- 	small = {
- 		blocksize = 1024
--		inode_size = 128
- 		inode_ratio = 4096
- 	}
- 	floppy = {
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index e8b2aafbf3..a4f98246bb 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 8957443bcbea43685c76eb3cbc5009f7fd529283 Mon Sep 17 00:00:00 2001
+From f1e161a48f74b46ae3c99921971c4b5ae8d587c9 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
@@ -19,7 +19,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/support/profile.c b/lib/support/profile.c
-index 585ed595..810dd66b 100644
+index f54739e7..53ea68f1 100644
 --- a/lib/support/profile.c
 +++ b/lib/support/profile.c
 @@ -335,7 +335,7 @@ profile_init(const char * const *files, profile_t *ret_profile)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 96eb7f20df..41a4047622 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 3b75308cc75adc249db6ca36e42fe93309b9a018 Mon Sep 17 00:00:00 2001
+From 550b5fbece84dde16ce9910c2cad390ea4a2f5d5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
similarity index 95%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
index 8cc046c794..f42cefcaf9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
@@ -4,17 +4,14 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch \
-           file://0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch \
+           file://0001-tests-u_direct_io-expect-correct-expected-output.patch \
            "
 
 SRC_URI:append:class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
-                                file://big-inodes-for-small-fs.patch \
 "
 
-
-SRCREV = "1eea0e2bd9a6760ebad834d5d2cf700fffe5ebe2"
+SRCREV = "849005eac51ea2097bd9e5f2b0adc16b53c5486d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.31.1

