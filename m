Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 08627617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 18:52:26 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u10so5827328lbd.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=I75DQxTNjdjcTHglqb6YignMPpPF12ey4fM8QzWtSr0=;
	b=bml+Xa95uff2YHuq6FmNOTmlOwJSr09oBOaCx3sFQqYZVWudgp336wvuhN0EzMRaRM
	/Z4c66NZgLkTc18NlfMKGf55Q7Stt2TQiiG3AnYMps2Y2X5fexgdNQLkn2K5JKwbzPuA
	2EBBwtufBU1fW9NXRby5uVVirXfgCbF0nPTwc29kYIw1d0AbwWnekGbWAH612fLNQj0e
	UVkprB33ua6HFKTAZ7sjocx+BQ0eovuwuf2c2zfyXryvBf5mQT6uxUHa9jAoJ099qk6U
	IUoFy9qPBS0ycqQZM8um1fTsisi6xuExygbETZtY8aQ964OZonA9lVHaKi7bptEiCH3X
	8QfQ==
X-Received: by 10.112.22.37 with SMTP id a5mr36020304lbf.76.1408474346933;
	Tue, 19 Aug 2014 11:52:26 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id d7sm12968994lah.46.2014.08.19.11.52.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Aug 2014 11:52:26 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 18:52:17 +0000
Message-Id: <1408474337-26481-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] e2fsprogs: Backport fixes for building with musl
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
X-List-Received-Date: Tue, 19 Aug 2014 18:52:29 -0000

Both of these fixes have been applied upstream and improve general code
correctness.  They are needed when building with TCLIBC=musl but shouldn't cause
any harm with other libc implementations.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../e2fsprogs/0012-Fix-musl-build-failures.patch   | 54 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
new file mode 100644
index 0000000..2624f90
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
@@ -0,0 +1,54 @@
+From c6ff7feb9038d6e8aaffe2e69b205ad5fa33df2f Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Mon, 18 Aug 2014 21:02:56 +0200
+Subject: [PATCH] Fix musl build failures
+
+In lib/ext2fs/unix_io.c, __u64 should be used instead of __uint64_t. This type
+is guaranteed by the e2fsprogs build system.
+(795c02def3681a99cc792a5ebc162d06f8a1eeb7)
+
+In misc/create_inode.c, <limits.h> is needed for the definition of PATH_MAX.
+(bbccc6f3c6a106721fb6f1ef4df6bc32c7986235)
+
+Both of these fixes have been made upstream with the git commit IDs given but
+those are larger commits containing other changes not needed here.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+
+Upstream-status: Backport
+---
+ lib/ext2fs/unix_io.c | 6 +++---
+ misc/create_inode.c  | 1 +
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ext2fs/unix_io.c b/lib/ext2fs/unix_io.c
+index 19be630..0cc0f52 100644
+--- a/lib/ext2fs/unix_io.c
++++ b/lib/ext2fs/unix_io.c
+@@ -931,10 +931,10 @@ static errcode_t unix_discard(io_channel channel, unsigned long long block,
+ 
+ 	if (channel->flags & CHANNEL_FLAGS_BLOCK_DEVICE) {
+ #ifdef BLKDISCARD
+-		__uint64_t range[2];
++		__u64 range[2];
+ 
+-		range[0] = (__uint64_t)(block) * channel->block_size;
+-		range[1] = (__uint64_t)(count) * channel->block_size;
++		range[0] = (__u64)(block) * channel->block_size;
++		range[1] = (__u64)(count) * channel->block_size;
+ 
+ 		ret = ioctl(data->dev, BLKDISCARD, &range);
+ #else
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 6d8de04..fcec5aa 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -1,4 +1,5 @@
+ #include "create_inode.h"
++#include <limits.h>
+ 
+ #if __STDC_VERSION__ < 199901L
+ # if __GNUC__ >= 2
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 5302554..a08e937 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://acinclude.m4 \
             file://0009-misc-create_inode.c-handle-hardlinks.patch \
             file://0010-debugfs-use-the-functions-in-misc-create_inode.c.patch \
             file://0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch \
+            file://0012-Fix-musl-build-failures.patch \
             file://0001-e2fsprogs-fix-cross-compilation-problem.patch \
             file://misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch \
 "
-- 
2.0.4


