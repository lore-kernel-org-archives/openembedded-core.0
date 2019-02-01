Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CFDA07C21E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:07:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so6139411wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nZ/AOO97+Eu8W3xuZyLe+CFnxebmA1aqyepy5K+Y/W4=;
	b=CHj4wBnaXIFg7OWuOnzA0DGTGKJHjXUo+LDGmR+WKDXPibqMvoQTB21VzEBOBEsmzE
	nSSC32LWxaXxU/S7uHub3G/Aphk6cgWoxp4T9Ki0/t5kJl8ZBo868eCwkiGfgd9JKadp
	MI5snKY5DqXia9kIV+LZ7eH6Sc8k6SXxZSiU7L43u2PR3y0eQrApl2yuRa5ont9942dS
	dtiakNLTgIHSaqrNulO7TKZtrai3bRHbXbZIXtOSZnkLxAF4sWVQ1GcxEW0gA39QQzTY
	T4K1xyPh1/2JmFqs6mpy7UT9ZgAjICGp4FnIREp5VGZ4XUcEl9yc3mkox+hWtLdArca/
	n3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nZ/AOO97+Eu8W3xuZyLe+CFnxebmA1aqyepy5K+Y/W4=;
	b=pLIX7P1Chc3Y1tsT5VoDkkrFPbN38Yc+ufbxE06HpVJg+K0rB4w00JJOUGleSkBHLl
	xb4KN/ZiITlyyF2KXD9hRC8viccwtbyrascNFz41AVNYdqdb1Q1c1KKAiJnKGzbMApIA
	Ua0YtGQndKcpK9uYeri+ByEH7Gq+fxEW8+MjPG9Dz7LsXGK6A/rHN3378CvZXClNxhRm
	wb/Yfgx7WABITAgESPMowNO3mSyt3uqSDs9UaogPN7BO3RBKX28YJV0w2PLmF7ZA6RjD
	b3nWbcL0seWsne+y8NLOXbTzNIAOV++agIa8g9tPpOFY3MxBJ9Uyv1+R8nFo9SSTcA3i
	GMdQ==
X-Gm-Message-State: AHQUAuZJK/gplQ3Jse+nIbIhUH2yluIO66kA9p5ybYNYz38o7V6uylJv
	Icly58EVQgZ1uS5dizsQSfUGzOMDIw8=
X-Google-Smtp-Source: AHgI3IZcZQqEnnIzG9rj3TM/Tl6h6QmIS4MBfMW+ry3yM1i8a/WdtKwcKnxe7Zw3D8lSEB4sZx8Nwg==
X-Received: by 2002:a1c:c1c9:: with SMTP id r192mr2359591wmf.146.1549026477177;
	Fri, 01 Feb 2019 05:07:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 141sm4802368wmb.5.2019.02.01.05.07.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:07:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 13:07:55 +0000
Message-Id: <20190201130755.32173-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] e2fsprogs: fix file system generation with large files
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
X-List-Received-Date: Fri, 01 Feb 2019 13:07:57 -0000

When copying files into the file system the file offset was being truncated to a
signed 32-bit value, so any files that are larger than 2^31 bytes were the right
size, but no content after that point.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...0001-create_inode-fix-copying-large-files.patch | 47 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
new file mode 100644
index 00000000000..93fd998fe4d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-create_inode-fix-copying-large-files.patch
@@ -0,0 +1,47 @@
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
index ce95dec5fec..720eaff06a3 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
+            file://0001-create_inode-fix-copying-large-files.patch \
                                 file://quiet-debugfs.patch \
 "
 
-- 
2.11.0


