Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 93DBE7C61A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 11:49:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a62so5965493wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 03:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=j/oPdpacVkyq+1q0cvZzSUkzgR2XGoFzimPs7DEVssc=;
	b=tDar0k3s1//WNQouya/DIWoqoVtMHCSk12Uz5yDFES2KgQHB/f6ZwdgBnGBGQJoYLp
	f5m/G3LAqvkRREL6sxFaCqN07IwBvJZ9/t9nQ5CwMh0qXmGUZjepm3p94NvuMA0lma/x
	L7Nkuxv8BqVYmPcYT0OMCiwmhuz4KXWFL+utoTQmPCuhmL/FTVgp9juW5zXiSwxGkyHT
	zr0CaXTtQuR/J9QWRDHJWSUOTF5ZaWbJMTLEwEek31qdRKG7+sNmDxLv0GQUXfDkS/TY
	3KIAVymFs+0nKmhi4r50M1OU578doHHRFxyEXER+L8YS1vpRxrKKLfWI6E+FPPjmks4j
	TPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j/oPdpacVkyq+1q0cvZzSUkzgR2XGoFzimPs7DEVssc=;
	b=LYELUpDAg8ivrvmJ4wSx82gBe5rVlE+7vgXAbhFnVUUTonoil9wB8mdttT2nj2RlaQ
	ywbdndK5oeQ/1MduuF583ZIlUegI6+Vw6hhZmhpMmd5r+wvfO4X77nIAgHlUliu9kcVV
	seOhk2XnUd2N2XY2DbTvEnvk5uTLXJ2NmcvxEK9/QnPb4fcSqjsOQfwtRzCShhuZuiX+
	b4lnWwOL7k8yGzD7aNvqlOtb975xPV+B6N2QnI/6ciXWiT7QN8MEYZ/0PkuSL2uee5ea
	BNVWzPp/kCx5zil8Hg//uWG4NOLTyBCFPmukM84/fnplne0U3VF4uSiTkhqAJ9A3TLld
	bR2w==
X-Gm-Message-State: AHQUAubrhM2cIP174FZaRFjc3olyQtljajfBIsJ8C6QiVHzIR25pwJ6p
	Iy+KXyFpEsO5RQwfGacFKr0+JRybOXA=
X-Google-Smtp-Source: AHgI3IbRxowNyAyioQAFEV1je3D5rRD2Cdz5gyj7+AakteKcJElbVl7Lp/Fvn7FyVAZYfxjEgUQzpQ==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr2447904wmk.12.1550144983896; 
	Thu, 14 Feb 2019 03:49:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c186sm3377326wmf.34.2019.02.14.03.49.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 03:49:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 11:49:38 +0000
Message-Id: <20190214114938.3044-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][thud] e2fsprogs: fix file system generation with large files
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
X-List-Received-Date: Thu, 14 Feb 2019 11:49:44 -0000

When copying files into the file system the file offset was being truncated to a
signed 32-bit value, so any files that are larger than 2^31 bytes were the right
size, but no content after that point.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...0001-create_inode-fix-copying-large-files.patch | 50 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
new file mode 100644
index 00000000000..c89581dce84
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 674ab87b8338372338d20e21a350f88b4ff6c7c8 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 1 Feb 2019 10:59:59 +0000
+Subject: [PATCH] create_inode: fix copying large files
+
+When copying large files into a ext filesystem at mkfs time the copy fails at
+2^31 bytes in.  There are two problems:
+
+copy_file_chunk() passes an offset (off_t, 64-bit typically) to
+ext2fs_file_lseek() which expects a ext2_off_t (typedef to __u32) so the value
+is truncated. Solve by calling ext2fs_file_llseek() which takes a u64 offset
+instead.
+
+try_lseek_copy() rounds the data and hole offsets as found by lseek() to block
+boundaries, but the calculation gets truncated to 32-bits.  Solve by casting the
+32-bit blocksize to off_t to ensure this doesn't happen.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ misc/create_inode.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 05aa6363..f106dcda 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -438,7 +438,7 @@ static errcode_t copy_file_chunk(ext2_filsys fs, int fd, ext2_file_t e2_file,
+ 				ptr += blen;
+ 				continue;
+ 			}
+-			err = ext2fs_file_lseek(e2_file, off + bpos,
++			err = ext2fs_file_llseek(e2_file, off + bpos,
+ 						EXT2_SEEK_SET, NULL);
+ 			if (err)
+ 				goto fail;
+@@ -481,7 +481,7 @@ static errcode_t try_lseek_copy(ext2_filsys fs, int fd, struct stat *statbuf,
+ 			return EXT2_ET_UNIMPLEMENTED;
+ 
+ 		data_blk = data & ~(fs->blocksize - 1);
+-		hole_blk = (hole + (fs->blocksize - 1)) & ~(fs->blocksize - 1);
++		hole_blk = (hole + (off_t)(fs->blocksize - 1)) & ~(off_t)(fs->blocksize - 1);
+ 		err = copy_file_chunk(fs, fd, e2_file, data_blk, hole_blk, buf,
+ 				      zerobuf);
+ 		if (err)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index ce95dec5fec..cffb5362d6d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
+            file://0001-create_inode-fix-copying-large-files.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.11.0


