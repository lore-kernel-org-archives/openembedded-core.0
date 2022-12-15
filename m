Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B1CC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:45:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.128332.1671093949097219230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJv7Uxr4;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id s7so6134676plk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kNv7AlLlFFJnRtks9uAPECMxkxEo1RxwuULQzYu1lYM=;
        b=MJv7Uxr4ep4Ol/gYnmrclIfhrizILi7lX5wtiL8c78hUggxUqOyVZ7gP4ELT++SVhE
         mNA7xqQvMozBRa2ZNbAc3NLbjP8I+Z+evDhRAj4eeWmELNz+1spSbuQxCGFZKcQ9CPh1
         lAcfGUtb3GduAnOa/I7Oz7HcGbDoBSfu8SnXGHrGpnzVQR5R3KozeGJnxEh59SnUERlZ
         1DuX4SZs6y/xzClZYnV3xum74eg8F+K5CUxyczZqrxgzOKNHgMptQeUpqvFRZvBZOqiO
         UqgnaJqgc425cRxwImcN7aRSWUDEQQOnVnnUGvEDJeAqWwx7yNCENsezlfkIkqp89gQi
         4DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNv7AlLlFFJnRtks9uAPECMxkxEo1RxwuULQzYu1lYM=;
        b=74ULz+5cLsees6zA53+OigEIBjG91iLY6UqlzgcgRw9KyAZ/J4cJa8NFzfAIUAI+rl
         Se8iOQ1ycEs6gRBAvTohQmZPT7xR7p72taZjnBq5uo++KAvgKCc9/EpBICzaYD2/Wq6z
         wsl9KwxCJl1w2IscTwt2mSNIdfZXimbVop/zzWoxZ8yUWjotXh07pypjoRkKpN0c0saL
         xuSdVshoiQrCBhhfusO/Olu2MjT/+/qsHoEzK7meoBIdQO74H6rzyckeUPVwBJeYOhWf
         TziUm/KlYFX4BE7yk3Q6g1NNAeKq3+lOsnZl0rKp6RZwu6wRO9y3uNmeQS6TauYFxeeq
         62zQ==
X-Gm-Message-State: AFqh2kpGTojsitIaeyhzMT9KEKjA9s5SF7G7yRdgbJplz7u7WGlUfny+
	O2JLPg3+MnokSDXgx5G4Lb+GAbpEQtI=
X-Google-Smtp-Source: AMrXdXsAPz4I+OERMxxzfBaBfRfPDvpHmvh8DTlomhM81dUfrOgKou12OaTEZUXUX61UP5YcYnRdSg==
X-Received: by 2002:a17:903:40cf:b0:190:f525:cde4 with SMTP id t15-20020a17090340cf00b00190f525cde4mr1905159pld.47.1671093948207;
        Thu, 15 Dec 2022 00:45:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 01/11] erofs-utils: Convert from off64_t to off_t
Date: Thu, 15 Dec 2022 00:45:36 -0800
Message-Id: <20221215084546.125368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174563

Ensure largefile macros are used to determine size of off_t and not the
explict 64bit version of functions and types

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-use-AC_SYS_LARGEFILE.patch |  43 +++++++
 ...eplace-l-stat64-by-equivalent-l-stat.patch | 109 ++++++++++++++++++
 ...-Make-LFS-mandatory-for-all-usecases.patch |  41 +++++++
 .../erofs-utils/erofs-utils_1.5.bb            |   8 +-
 4 files changed, 199 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch
new file mode 100644
index 0000000000..75c91f51a7
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch
@@ -0,0 +1,43 @@
+From fef3b16dba2c5f6ad88951b80cdfbedd423e80a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Dec 2022 20:16:52 -0800
+Subject: [PATCH v3 1/3] configure: use AC_SYS_LARGEFILE
+
+The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=64
+where necessary to ensure that off_t and all interfaces using off_t
+are 64bit, even on 32bit systems.
+
+Pass -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=66 via CFLAGS
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215064758.93821-1-raj.khem@gmail.com/T/#t]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index a736ff0..e8bb003 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,6 +13,8 @@ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_AUX_DIR(config)
+ AM_INIT_AUTOMAKE([foreign -Wall])
+ 
++AC_SYS_LARGEFILE
++
+ # Checks for programs.
+ AM_PROG_AR
+ AC_PROG_CC
+@@ -319,6 +321,9 @@ if test "x$enable_lzma" = "xyes"; then
+   CPPFLAGS="${saved_CPPFLAGS}"
+ fi
+ 
++# Enable 64-bit off_t
++CFLAGS+=" -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
++
+ # Set up needed symbols, conditionals and compiler/linker flags
+ AM_CONDITIONAL([ENABLE_LZ4], [test "x${have_lz4}" = "xyes"])
+ AM_CONDITIONAL([ENABLE_LZ4HC], [test "x${have_lz4hc}" = "xyes"])
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
new file mode 100644
index 0000000000..d12bebbf87
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
@@ -0,0 +1,109 @@
+From 856189c324834b838f0e9cfc0d2e05f12518f264 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Dec 2022 22:17:35 -0800
+Subject: [PATCH v3 2/3] erofs: replace [l]stat64 by equivalent [l]stat
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215064758.93821-2-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/inode.c | 10 +++++-----
+ lib/xattr.c |  4 ++--
+ mkfs/main.c |  4 ++--
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/lib/inode.c b/lib/inode.c
+index f192510..38003fc 100644
+--- a/lib/inode.c
++++ b/lib/inode.c
+@@ -773,7 +773,7 @@ static u32 erofs_new_encode_dev(dev_t dev)
+ 
+ #ifdef WITH_ANDROID
+ int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
+-			       struct stat64 *st,
++			       struct stat *st,
+ 			       const char *path)
+ {
+ 	/* filesystem_config does not preserve file type bits */
+@@ -818,7 +818,7 @@ int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
+ }
+ #else
+ static int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
+-				      struct stat64 *st,
++				      struct stat *st,
+ 				      const char *path)
+ {
+ 	return 0;
+@@ -826,7 +826,7 @@ static int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
+ #endif
+ 
+ static int erofs_fill_inode(struct erofs_inode *inode,
+-			    struct stat64 *st,
++			    struct stat *st,
+ 			    const char *path)
+ {
+ 	int err = erofs_droid_inode_fsconfig(inode, st, path);
+@@ -910,7 +910,7 @@ static struct erofs_inode *erofs_new_inode(void)
+ /* get the inode from the (source) path */
+ static struct erofs_inode *erofs_iget_from_path(const char *path, bool is_src)
+ {
+-	struct stat64 st;
++	struct stat st;
+ 	struct erofs_inode *inode;
+ 	int ret;
+ 
+@@ -918,7 +918,7 @@ static struct erofs_inode *erofs_iget_from_path(const char *path, bool is_src)
+ 	if (!is_src)
+ 		return ERR_PTR(-EINVAL);
+ 
+-	ret = lstat64(path, &st);
++	ret = lstat(path, &st);
+ 	if (ret)
+ 		return ERR_PTR(-errno);
+ 
+diff --git a/lib/xattr.c b/lib/xattr.c
+index 71ffe3e..fd0e728 100644
+--- a/lib/xattr.c
++++ b/lib/xattr.c
+@@ -467,7 +467,7 @@ static int erofs_count_all_xattrs_from_path(const char *path)
+ {
+ 	int ret;
+ 	DIR *_dir;
+-	struct stat64 st;
++	struct stat st;
+ 
+ 	_dir = opendir(path);
+ 	if (!_dir) {
+@@ -502,7 +502,7 @@ static int erofs_count_all_xattrs_from_path(const char *path)
+ 			goto fail;
+ 		}
+ 
+-		ret = lstat64(buf, &st);
++		ret = lstat(buf, &st);
+ 		if (ret) {
+ 			ret = -errno;
+ 			goto fail;
+diff --git a/mkfs/main.c b/mkfs/main.c
+index d2c9830..5279805 100644
+--- a/mkfs/main.c
++++ b/mkfs/main.c
+@@ -581,7 +581,7 @@ int main(int argc, char **argv)
+ 	struct erofs_buffer_head *sb_bh;
+ 	struct erofs_inode *root_inode;
+ 	erofs_nid_t root_nid;
+-	struct stat64 st;
++	struct stat st;
+ 	erofs_blk_t nblocks;
+ 	struct timeval t;
+ 	char uuid_str[37] = "not available";
+@@ -609,7 +609,7 @@ int main(int argc, char **argv)
+ 			return 1;
+ 	}
+ 
+-	err = lstat64(cfg.c_src_path, &st);
++	err = lstat(cfg.c_src_path, &st);
+ 	if (err)
+ 		return 1;
+ 	if (!S_ISDIR(st.st_mode)) {
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch
new file mode 100644
index 0000000000..97faa5d673
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch
@@ -0,0 +1,41 @@
+From 8f8cbc7b773da63bce8226249784ba6824635c9c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Dec 2022 20:19:27 -0800
+Subject: [PATCH v3 3/3] internal.h: Make LFS mandatory for all usecases
+
+erosfs depend on the consistent use of a 64bit offset
+type, force downstreams to use transparent LFS (_FILE_OFFSET_BITS=64),
+so that it becomes impossible for them to use 32bit interfaces.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215064758.93821-3-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/erofs/internal.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/erofs/internal.h b/include/erofs/internal.h
+index 6a70f11..d3b2986 100644
+--- a/include/erofs/internal.h
++++ b/include/erofs/internal.h
+@@ -21,6 +21,7 @@ typedef unsigned short umode_t;
+ 
+ #include "erofs_fs.h"
+ #include <fcntl.h>
++#include <sys/types.h> /* for off_t definition */
+ 
+ #ifndef PATH_MAX
+ #define PATH_MAX        4096    /* # chars in a path name including nul */
+@@ -104,6 +105,10 @@ struct erofs_sb_info {
+ 	};
+ };
+ 
++
++/* make sure that any user of the erofs headers has atleast 64bit off_t type */
++extern int erofs_assert_largefile[sizeof(off_t)-8];
++
+ /* global sbi */
+ extern struct erofs_sb_info sbi;
+ 
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
index b9a97b3e53..6ce5843570 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
 SRCREV = "a2821a66b42aee5430bccee82c280e38d1e9ab29"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master \
+           file://0001-configure-use-AC_SYS_LARGEFILE.patch \
+           file://0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch \
+           file://0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch \
+           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
@@ -19,7 +23,7 @@ inherit pkgconfig autotools
 PACKAGECONFIG ??= "lz4"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 
-EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
+EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse --enable-largefile"
 
 CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"
 
-- 
2.39.0


