Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2808.1612492089537156863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222049"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:28:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 771684CE6D74
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Feb 2021 10:27:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:27:57 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] e2fsprogs: upgrade 1.45.6 -> 1.45.7
Date: Fri, 5 Feb 2021 10:27:50 +0800
Message-ID: <1612492070-33222-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 771684CE6D74.A1E92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
removed since it is included in 1.45.7

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-hardlinks-always-false-if-inode-0xF.patch | 55 -------------------
 ...2fsprogs_1.45.6.bb => e2fsprogs_1.45.7.bb} |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.6.bb => e2fsprogs_1.45.7.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
deleted file mode 100644
index 0e8cbad25a..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dcb36fd007ddb32d8c5cfcf5e9ddb3d713d65396 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 21 Jul 2020 09:43:03 +0800
-Subject: [PATCH] fix up check for hardlinks always false if inode > 0xFFFFFFFF
-
-Since commit [382ed4a1 e2fsck: use proper types for variables][1]
-applied, it used ext2_ino_t instead of ino_t for referencing inode
-numbers, but the type of is_hardlink's `ino' should not be instead,
-The ext2_ino_t is 32bit, if inode > 0xFFFFFFFF, its value will be
-truncated.
-
-Add a debug printf to show the value of inode, when it check for hardlink
-files, it will always return false if inode > 0xFFFFFFFF
-|--- a/misc/create_inode.c
-|+++ b/misc/create_inode.c
-|@@ -605,6 +605,7 @@ static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
-| {
-|        int i;
-|
-|+       printf("%s %d, %lX, %lX\n", __FUNCTION__, __LINE__, hdlinks->hdl[i].src_ino, ino);
-|        for (i = 0; i < hdlinks->count; i++) {
-|                if (hdlinks->hdl[i].src_dev == dev &&
-|                    hdlinks->hdl[i].src_ino == ino)
-
-Here is debug message:
-is_hardlink 608, 2913DB886, 913DB886
-
-The length of ext2_ino_t is 32bit (typedef __u32 __bitwise ext2_ino_t;),
-and ino_t is 64bit on 64bit system (such as x86-64), recover `ino' to ino_t.
-
-[1] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=382ed4a1c2b60acb9db7631e86dda207bde6076e
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/48]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- misc/create_inode.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index e8d1df6b..837f3875 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -601,7 +601,7 @@ out:
- 	return err;
- }
- 
--static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
-+static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ino_t ino)
- {
- 	int i;
- 
--- 
-2.18.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
index e6a4bd1f8c..1a00807757 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
@@ -6,14 +6,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://mkdir_p.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
-           file://0001-fix-up-check-for-hardlinks-always-false-if-inode-0xF.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "506d96fe640f76ab04276e0a7c578aa108ce19f8"
+SRCREV = "5403970e44241cec26f98aaa0124b9881b4bbf4f"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.25.1



