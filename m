Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE7B97C21E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:09:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v13so7018189wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=j/oPdpacVkyq+1q0cvZzSUkzgR2XGoFzimPs7DEVssc=;
	b=F6ku1ANKPVlILiDyBdDNTCPmsyyDi9Dd7EwBY00YZIlEe78jPR7cghPJ5VSvzA9AZV
	AYGn8jqmpk3DSUpKpVElg8sWJE7v2Zaq0LvIUVKLFiH16RU5usfLixnO/OuiBUuzkw4T
	DIhldNd+XTSEvP8ynSQ47jaIKlJiY/+0cg/LhmEh+8J3LFY8PNCTsvlz+iss2Y6pH5gQ
	ZH+75cgiAv62K49l9it1BxZ9QqHr8wIcJBd0GJDfsESEXmjvxG8h/ryBwtbDlDRrNh2U
	33hAa2LrjCUSImCbxe3cp2qcR63FUNEx7FCR502v3362bPRgYCw5DuVJgDxKVh0IZOTo
	Z3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j/oPdpacVkyq+1q0cvZzSUkzgR2XGoFzimPs7DEVssc=;
	b=LXF5Klj+konl5+DKPh0t7W+nZopnCCyc8q6nYsxkNDtHSNJUlYlaPvcFmTCE46mUQL
	5ona4aRnS3vJaKBCBrSV7Z0Mc0R+lpH7G9Nzwxnlz4yBoG1TZjCCyNwmJisoJUGVqW1K
	2ahrLa2m2Ha6q2ISwMdVi8Ptm0Xoqmt9PWy44XXMhZlcjfMH+mAkqizqTvHz+3wudove
	XsCZuM/jW5ks+ZdNCOQE65DaBY3bq2U/eqAlIwC6qUBtzZkQfQZIBSxPTK6FAbC2kUSw
	m2s8cmIsOsyMqa1Hg6L2C9U3eUT5FqLVf69yVK9m6dptSHlztkLwB379bEfifaggoL6A
	jmyw==
X-Gm-Message-State: AJcUukd7wZ0ztFnIPdG799tIVkpQHHpw3bAbrWujT5RhEBJXzaIxocSq
	6FfWKxsLHkvGsCMCV4bR1B97Ulemg8c=
X-Google-Smtp-Source: ALg8bN67N/fOEyxd+IPczXDk3UfekElQFJ56ST6rzYquLv/60hMMEtiRBZfy8t627FRyH2v+/nGp6A==
X-Received: by 2002:adf:8464:: with SMTP id 91mr40594245wrf.251.1549026581993; 
	Fri, 01 Feb 2019 05:09:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	125sm3201656wmm.26.2019.02.01.05.09.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:09:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 13:09:39 +0000
Message-Id: <20190201130939.32677-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3] e2fsprogs: fix file system generation with large files
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
X-List-Received-Date: Fri, 01 Feb 2019 13:09:42 -0000

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


