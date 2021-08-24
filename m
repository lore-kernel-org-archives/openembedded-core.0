Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1010.1629822390051305487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360377"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360377"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659086"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/28] e2fsprogs: ensure small images have 256-byte inodes
Date: Wed, 25 Aug 2021 00:25:26 +0800
Message-Id: <61451d2e3e13ec99069701e2771084c57f4cdd16.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

e2fsprogs calls filesystems larger than 3MB but smaller than 512MB
"small", which has some implications:

- blocksize 1024 instead of 4096
- inode_ratio 4096 instead of 16384
- inode_size 128 instead of 256

The outcome of the inode size dropping to 128 bytes is that they cannot
store 64-bit timestamps, so are not Y2038-safe.

A previous attempt to solve this problem[1] changed some of the canned
wic files to pass -T default to mkfs.ext4, but this only covered wic
images and not traditional images.  Also, actually small filesystems,
for example a core-image-minimal, will happily be tens of megabytes and
with the "default" options will result in an image which runs out of
blocks before it runs out of space:

mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

Considering that many OpenEmbedded images are in fact "small", being
2038-safe is worth the marginal increase is disk usage.  This patch
alters the small configuration in native builds so that it also has
256-byte inodes.  Target is unchanged so that standard behaviour is
maintained outside of the build.

This is actually the same underlying patch that Mathieu Dubois-Briand
sent in April, but the wic change in [1] was accepted instead. I believe
that is the wrong approach and this approach covers more cases.

[ YOCTO #14478 ]

[1] openembedded-core eecbe62
[2] https://lists.openembedded.org/g/openembedded-core/message/150298

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ab0ae83a24ee99e69f8ac54256b253a122aef8a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../e2fsprogs/big-inodes-for-small-fs.patch   | 22 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.46.1.bb             |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
new file mode 100644
index 0000000000..caeb560d32
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
@@ -0,0 +1,22 @@
+Ensure "small" file systems also have the default inode size (256 bytes) so that
+can store 64-bit timestamps and work past 2038.
+
+The "small" type is any size >3MB and <512MB, which covers a lot of relatively
+small filesystems built by OE, especially when they're sized to fit the contents
+and expand to the storage on boot.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
+index 01e35cf8..29f41dc0 100644
+--- a/misc/mke2fs.conf.in
++++ b/misc/mke2fs.conf.in
+@@ -16,7 +16,6 @@
+ 	}
+ 	small = {
+ 		blocksize = 1024
+-		inode_size = 128
+ 		inode_ratio = 4096
+ 	}
+ 	floppy = {
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
index be8b67c35d..ddc9bfec90 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
+                                file://big-inodes-for-small-fs.patch \
 "
 
 
-- 
2.31.1

