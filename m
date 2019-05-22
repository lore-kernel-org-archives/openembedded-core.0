Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 895457E3A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 08:29:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4585R76Wc6z4q
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558513796;
	bh=7MHBYOcG5qrd3YSNmjaWdnGrZBfiIFGQfV6SE7UO6qQ=;
	h=From:To:Subject:Date:From;
	b=mVGm0ttYpqFQ3TMcI5C0WQSWz3jegqrhV8BluAklt7MW7/bTy1OrGrc5nGuZZdJkB
	QKW4t2FenwAaiPXEVBHCbsLn3R5asCSFk2KytSERKuThaKj20g8oANss0/xdUtek7O
	adjBoJ90MfDoeOcsySn+7IQ/GuR1WApF2KET8/zIUWNbhYinfHqR1pawoNEypCWpUS
	dRO2qcRNylRK4L7Hq3g/IdS65I3+crq0cbvxXr6aKQjw/I4m4PPGQ5plrwufW+Ubfo
	imIeTfaA5BPt+X4WDaXv2NF2OkAmiaNPIQkZiusIO1crGomsWeKNZsJUKggydFlKDR
	42BxFYcOVr7viDvZL62tkZqmJst9ca6snxhupbrfulYB0sySEcWrglSeHxILMStb2p
	W47lZ43dG+2fEyDnc9q2vDb+qpzo/7O0sNgxtJ5uaWExd0IJkhT6vwU6EEf5gPbWWm
	554afvaMXF5qzIdzhVD1YfcSZMNOZ8O7oH3u3Mh78MLD0rXtX49Q8XipIzuzJnppvV
	Qv6LsDLn55+oPYjx4z21veJ6n5TFb/NXn4dkVKP2S+acNEwjOwU7Lf0pdJOgDQezpD
	OHd5p6MzQ9hyzIhpUSedZqpxl5snV7O73cVDBzULj97ds+aHweWxSEfixtRX3kPWX5
	3PZT4YbNjmf6MjnZ4T4V8OhE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 11:29:54 +0300
Message-Id: <20190522082954.24027-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] squashfs-tools: Mark as incompatible with musl
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
X-List-Received-Date: Wed, 22 May 2019 08:29:57 -0000

Silently ignoring FNM_EXTMATCH makes fnmatch()
behave different from what callers expect.

Mark as incompatible with musl instead of risking
broken runtime behaviour.

The practical consequences should be small since
what is used in OE is mainly squashfs-tools-native.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../squashfs-tools/fix-compat.patch           | 46 -------------------
 .../squashfs-tools/squashfs-tools_git.bb      |  3 ++
 2 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
index 0ce7b4e8ce..87c1e8cac0 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
@@ -1,39 +1,8 @@
-Define FNM_EXTMATCH if not defined its glibc specific define
 include missing sys/stat.h for stat* function declarations
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: squashfs-tools/action.c
-===================================================================
---- squashfs-tools.orig/action.c
-+++ squashfs-tools/action.c
-@@ -44,6 +44,10 @@
- #include "action.h"
- #include "error.h"
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- /*
-  * code to parse actions
-  */
-Index: squashfs-tools/mksquashfs.c
-===================================================================
---- squashfs-tools.orig/mksquashfs.c
-+++ squashfs-tools/mksquashfs.c
-@@ -1261,6 +1261,10 @@ void write_dir(squashfs_inode *inode, st
- 		dir_size + 3, directory_block, directory_offset, NULL, NULL,
- 		dir, 0);
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- #ifdef SQUASHFS_TRACE
- 	{
- 		unsigned char *dirp;
 Index: squashfs-tools/pseudo.c
 ===================================================================
 --- squashfs-tools.orig/pseudo.c
@@ -46,18 +15,3 @@ Index: squashfs-tools/pseudo.c
  #include <ctype.h>
  
  #include "pseudo.h"
-Index: squashfs-tools/unsquashfs.c
-===================================================================
---- squashfs-tools.orig/unsquashfs.c
-+++ squashfs-tools/unsquashfs.c
-@@ -42,6 +42,10 @@
- #include <sys/sysmacros.h>
- #endif
- 
-+#ifndef FNM_EXTMATCH
-+#define FNM_EXTMATCH 0
-+#endif
-+
- struct cache *fragment_cache, *data_cache;
- struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
- pthread_t *thread, *inflator_thread;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 5a8b5f77bd..dc1568a77c 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -19,6 +19,9 @@ SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e
 
 S = "${WORKDIR}/git/squashfs-tools"
 
+# needs FNM_EXTMATCH
+COMPATIBLE_HOST_libc-musl = 'null'
+
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
 PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
-- 
2.17.1


