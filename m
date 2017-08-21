Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4E49F78274
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 20:55:39 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id k46so34186951wre.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OR6GG2AxJwTrb4nmAiDB6BT5QCScKeQtIhGihgIjfKU=;
	b=PSQhfWf7s7WtMuCUErLRfYlOdHux/8rtcSWZKo+9mzJ4KVfVSESqPMKO//MbGfG14o
	Qe56ouC5Hy3XHahcO0oSotbCOVAGBT72g7rrYvGn8lkX7Lr9o5ui2zOa7lRpEbTO2SKR
	Ck/rIXaYMhGW1vo4dmqeP8okqF2kJHZloK+cPc53NQdakoaDCCB04X+VIv1AgHrau6iQ
	K+6XFrOL+ALNYF8Ibrus62ugTVuNOhH9GHiFaHMtl2uo8eFMaQUvES/6D1Q1GUpBSx1V
	BGkHqJKBHu80Jto6gJWAXHeVVA7ekpBGb+nShvV29x3dQLBST/BtDzMfzyaEE0jXkkdI
	+ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OR6GG2AxJwTrb4nmAiDB6BT5QCScKeQtIhGihgIjfKU=;
	b=jZ1yHBe/593AuizX+wo0e6kMa/MqZ9MhveLK2cGPLoZV8tgAH+8eY+Zc+h/RUGINsB
	82lx/aeS+2DXq8oOKNY3zjY3YSYZig0W9hQqnelfTJSALonx3ARRGbxfeoCf2lGk2vC8
	mgkiGWLGzdoT58wCuDlLdR+B7hyJjylUxKTayqLzCpbXUd2Si/a1LGqmRKw4+oUkBhik
	nnRSCGFj1wQIzoIMuC4SVzYBA3ocuiMqmPkbDISS44FAztjkmKFsud6ZFsr79kddrUj7
	WJtQ+mM2ivyk8RARrWZgTcaqt5OZheUyOCsKOTPLye9EWnmVf4BoibqZugqitzCa72nB
	HVIA==
X-Gm-Message-State: AHYfb5joBR9D7+rzUd5B678ztNmW5BFz/Ow9lMeKcFxpHr3icOQZRskN
	/D6cpF7l5n5cKvjG
X-Received: by 10.28.191.68 with SMTP id p65mr8596709wmf.58.1503348939996;
	Mon, 21 Aug 2017 13:55:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m15sm10753083wrb.85.2017.08.21.13.55.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 13:55:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 22:57:20 +0200
Message-Id: <20170821205721.20086-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 1/2] squashfs: fix build with glibc-2.26
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
X-List-Received-Date: Mon, 21 Aug 2017 20:55:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../squashfs-tools-4.3-sysmacros.patch             | 32 ++++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
new file mode 100644
index 0000000000..39521a7d8b
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
@@ -0,0 +1,32 @@
+From https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-fs/squashfs-tools/files/squashfs-tools-4.3-sysmacros.patch
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Pending
+
+
+sys/types.h might not always include sys/sysmacros.h for major/minor/makedev
+
+--- a/squashfs-tools/mksquashfs.c
++++ b/squashfs-tools/mksquashfs.c
+@@ -59,6 +59,7 @@
+ #else
+ #include <endian.h>
+ #include <sys/sysinfo.h>
++#include <sys/sysmacros.h>
+ #endif
+ 
+ #include "squashfs_fs.h"
+--- a/squashfs-tools/unsquashfs.c
++++ b/squashfs-tools/unsquashfs.c
+@@ -38,6 +38,10 @@
+ #include <limits.h>
+ #include <ctype.h>
+ 
++#ifdef linux
++#include <sys/sysmacros.h>
++#endif
++
+ struct cache *fragment_cache, *data_cache;
+ struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
+ pthread_t *thread, *inflator_thread;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4f68d01131..0f991706c1 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -13,6 +13,7 @@ SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
            file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
+           file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
            file://fix-compat.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.14.1


