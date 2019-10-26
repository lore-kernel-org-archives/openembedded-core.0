Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BC6E17FBCB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 20:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 470tFk0jLkzJm
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 22:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572122538;
	bh=kYgbPpN3Ck3vz+eQ7Y0v6WXnItnHbTPDQcBRwQj2K7Y=;
	h=From:To:Subject:Date:From;
	b=Sv/J6I3FFiciAyoFJJfekvOBNFPp3ZKg7u5IYVZXEMUI5jYDx4rWrjscugmaIBsJk
	zexf6mBAdePtRLp7SRGBC8MA/ILeNqgtPmAUQq3exPlPVfYUJ8OnrcwgMttFgKCLt+
	KIsEh9BmpW844Dq5uxvHSJ+mjRclYnTZK3SOOsTrriAgy50oAOpV+XzsmBMM0gHnYo
	Gag7x2Sq0VfhDlxhRIbZZWCvenl3wfMEAKdKuKMm/pLhx/nAMx283BQdElgGEdIe8R
	ovkIgGPZE1VY116MYbbIv0BafhW8e5uDSrP3rw9lVLOLvl6xah/5bY4g6Qn4L9EKUh
	sjTuH4rzX+KyqOAL+7z8s/fWgYenmqJcs7DeBNthewEb2iMRNcGq2NSvZrH8zlqhsC
	TdebxT/nN29VU87KYHBJw7CWkbjlhR/MQpBRiadpPzoNPJImzDwBVF+z7rv0mC08CQ
	6ZYdkko7F/8t4kka1Kyji7t6GiM2p6C0CdcP089+BNcYJULFE5FKgsXzSANdUre97d
	r9vKNDeBEDWj6XULOx80t5tcZ7pOkTRPQuV8I7ya4ZpJGt4X6EbXgDefCJr5Bcgkf6
	AgEt8k2PcmmxKRXQ8WLDMGYbvgDQMAQom0rhzxIDJXVZLQf3NJRMksdO/VOhsjOhxo
	bEmLPtpRhCxr/cS1fW9gI4xU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Oct 2019 23:42:13 +0300
Message-Id: <20191026204216.9298-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] squashfs-tools: Upgrade to 4.4
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
X-List-Received-Date: Sat, 26 Oct 2019 20:42:19 -0000

Patch for issue fixed upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../squashfs-tools-4.3-sysmacros.patch        | 32 -------------------
 .../squashfs-tools/squashfs-tools_git.bb      |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
deleted file mode 100644
index f2e88f416a..0000000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-tools-4.3-sysmacros.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-fs/squashfs-tools/files/squashfs-tools-4.3-sysmacros.patch
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Pending
-
-
-sys/types.h might not always include sys/sysmacros.h for major/minor/makedev
-
---- a/squashfs-tools/mksquashfs.c
-+++ b/squashfs-tools/mksquashfs.c
-@@ -59,6 +59,7 @@
- #else
- #include <endian.h>
- #include <sys/sysinfo.h>
-+#include <sys/sysmacros.h>
- #endif
- 
- #include "squashfs_fs.h"
---- a/squashfs-tools/unsquashfs.c
-+++ b/squashfs-tools/unsquashfs.c
-@@ -40,6 +40,10 @@
- #include <limits.h>
- #include <ctype.h>
- 
-+#ifdef linux
-+#include <sys/sysmacros.h>
-+#endif
-+
- struct cache *fragment_cache, *data_cache;
- struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
- pthread_t *thread, *inflator_thread;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 51e4a5939d..53d3787271 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -5,10 +5,9 @@ SECTION = "base"
 LICENSE = "GPL-2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "4.3+gitr${SRCPV}"
-SRCREV = "f95864afe8833fe3ad782d714b41378e860977b1"
+PV = "4.4"
+SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
-           file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
 "
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
 SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
-- 
2.17.1


