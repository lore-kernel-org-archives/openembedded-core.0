Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 829C26080F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:07 +0000 (UTC)
Received: by qkas77 with SMTP id s77so27965406qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=j0yfsL8FJVJMSHriizl/jLLFUbI/Igg3XRwL0UbNFtI=;
	b=TiO84OhB38aJLh2rWRUJ4mmFkpYX8QiLtFlnR/UNJef4o+jO7uLRJiRB60m76uwQH6
	uIR5Ti9uFVa/v56iAb5k4eQ9huH/C3bEzQg8uAoQlDv8o79hejoyo/wWrT6QVnQA44Qx
	xDnTKFuf0T2A8ZuC1owYlGYuD/hQ9br4khHXgEyZQDeRCurN2le1s7iD8RoxM1MmCRmB
	t6l+M2naomy+oykls3sJFNwcr1L9mvf1t8xrb9IRcKSUAZJ8Fzg0oP07AarvSLNDZa2J
	zzanpLlOQVT+jgyqsjoj3XN424bMsKN4k1qaDYLAy3wqhm/p5kHO9h0gs5lpPZZ3ZGhq
	L+Cg==
X-Received: by 10.55.21.168 with SMTP id 40mr8387173qkv.70.1447953067968;
	Thu, 19 Nov 2015 09:11:07 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:52 +0000
Message-Id: <1ab3c2b1a18e93d5c5d5fd9e5690509e000a3f49.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
Subject: [PATCH 05/13] squashfs-tools: Define FNM_EXTMATCH if not defined
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:09 -0000

helps compiling when using musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../squashfs-tools/squashfs-tools/fix-compat.patch | 63 ++++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb           |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
new file mode 100644
index 0000000..d545146
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
@@ -0,0 +1,63 @@
+Define FNM_EXTMATCH if not defined its glibc specific define
+include missing sys/stat.h for stat* function declarations
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: squashfs-tools/action.c
+===================================================================
+--- squashfs-tools.orig/action.c
++++ squashfs-tools/action.c
+@@ -44,6 +44,10 @@
+ #include "action.h"
+ #include "error.h"
+ 
++#if !defined(FNM_EXTMATCH)
++#define FNM_EXTMATCH 0
++#endif
++
+ /*
+  * code to parse actions
+  */
+Index: squashfs-tools/mksquashfs.c
+===================================================================
+--- squashfs-tools.orig/mksquashfs.c
++++ squashfs-tools/mksquashfs.c
+@@ -1286,6 +1286,10 @@ void write_dir(squashfs_inode *inode, st
+ 		dir_size + 3, directory_block, directory_offset, NULL, NULL,
+ 		dir, 0);
+ 
++#if !defined(FNM_EXTMATCH)
++#define FNM_EXTMATCH 0
++#endif
++
+ #ifdef SQUASHFS_TRACE
+ 	{
+ 		unsigned char *dirp;
+Index: squashfs-tools/pseudo.c
+===================================================================
+--- squashfs-tools.orig/pseudo.c
++++ squashfs-tools/pseudo.c
+@@ -32,6 +32,7 @@
+ #include <stdlib.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
++#include <sys/stat.h>
+ #include <ctype.h>
+ 
+ #include "pseudo.h"
+Index: squashfs-tools/unsquashfs.c
+===================================================================
+--- squashfs-tools.orig/unsquashfs.c
++++ squashfs-tools/unsquashfs.c
+@@ -38,6 +38,10 @@
+ #include <limits.h>
+ #include <ctype.h>
+ 
++#ifndef FNM_EXTMATCH
++#define FNM_EXTMATCH 0
++#endif
++
+ struct cache *fragment_cache, *data_cache;
+ struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
+ pthread_t *thread, *inflator_thread;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 7aebd00..33ed09a 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -13,6 +13,7 @@ SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
            file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
+           file://fix-compat.patch \
 "
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
 SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
-- 
2.6.3


