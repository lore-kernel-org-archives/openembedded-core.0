Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33134D58CB0
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 23:01:59 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5697.1774220508923200740
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 16:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MKJLreSE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202603222301464ba5bb3685000207a9-obn_sn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202603222301464ba5bb3685000207a9
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 00:01:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vITwsi4kH5ZVCGvfwoOXAPLk9YW/ZvkT0tjx4urCDhw=;
 b=MKJLreSE648nuJl/eR7UiIEE3xeNH9rI9Eh4Gq+skgHeKRzgtitFRqDtspkUPHT/C7AcjU
 PmMYkvsRUNmiT3yuzWPiZ/Qq5+7bE3B9gSZktzR4ohQPe+vihjkg0D2rQWm2pncSn5LntpXV
 tUH83VsfXunZX/8wuYayDKYgNtQZ0piOW/nu4Oa8hDqE/q2LwKcNYZPRLn4BcXNkzl4tRfgN
 XUGTVwJRRtnIQLWMj9XUADmA6X4LU3IJny6H7V37BPOPlQU/tVhPp/TN0nqAVuBqMzhGwmnb
 2KgbI8cbkiOZL5/ZYXwji+X05SGLDlC8V0mwndc6OhLcHGrAJerschHg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/4] e2fsprogs: upgrade 1.47.3 -> 1.47.4
Date: Mon, 23 Mar 2026 00:01:29 +0100
Message-Id: <20260322230131.12001-2-peter.marko@siemens.com>
In-Reply-To: <20260322230131.12001-1-peter.marko@siemens.com>
References: <20260322230131.12001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233685

Drop patch included in this release.

Release Notes: [1]

[1] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.4.txt?h=v1.47.4

Signed-off-by: Peter Marko <peter.marko@siemens.com>

https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.4.txt?h=v1.47.4
---
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 -------------------
 .../e2fsprogs/e2fsprogs/ptest.patch           |  4 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  2 +-
 ...2fsprogs_1.47.3.bb => e2fsprogs_1.47.4.bb} |  3 +-
 4 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.3.bb => e2fsprogs_1.47.4.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
deleted file mode 100644
index 1c578022fb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 30 Nov 2025 21:47:50 +0800
-Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
-
-Fixed:
-$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
-$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
-$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
-__populate_fs: Ext2 file too big while writing file "largefile"
-mke2fs: Ext2 file too big while populating file system
-
-This was because the offset is overflow, use __u64 to fix the problem.
-
-Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
-the metadata, so it should be enough large for it, just leave it there.
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/create_inode.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 624efc03..14273534 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
- }
- #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
- 
--static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const char *buf, unsigned int n_bytes) {
-+static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *buf, unsigned int n_bytes) {
- 	errcode_t err = ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
- 	if (err)
- 		return err;
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index f4e1057a36..806694a29f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -17,7 +17,7 @@ diff --git a/tests/Makefile.in b/tests/Makefile.in
 index ba06b3b6..5a3e48f4 100644
 --- a/tests/Makefile.in
 +++ b/tests/Makefile.in
-@@ -20,7 +20,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
+@@ -21,7 +21,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
  	@echo "#!/bin/sh" > test_one
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
@@ -26,7 +26,7 @@ index ba06b3b6..5a3e48f4 100644
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
-@@ -31,7 +31,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
+@@ -33,7 +33,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
  	@echo "Creating test_script..."
  	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 4ba150e27d..40b935cfd2 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -16,7 +16,7 @@ diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
 index 909c1df3..0842369e 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2518,7 +2518,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
index 40658399d9..90f8f37b8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
@@ -4,14 +4,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
+SRCREV = "ece89fac4603e400155b7bbf6326284f8511bca9"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \

