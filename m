Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB46AC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 08:08:19 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.8340.1645430898663701762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21L88H8w029463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:08:17 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 21 Feb 2022 00:08:17 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 00:08:16 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 21 Feb 2022 00:08:16 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][hardknott][PATCH] e2fsprogs: backport to fix one regression
Date: Mon, 21 Feb 2022 16:08:15 +0800
Message-ID: <20220221080815.1979337-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 08:08:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162017

From: Changqing Li <changqing.li@windriver.com>

Backport a patch in 1.46.3 which fix one regression:
This is what the changelog says:
    Fix e2fsck so that the if the s_interval is zero, and the last mount
    or write time is in the future, it will fix invalid last mount/write
    timestamps in the superblock. (This was a regression introduced in
    v1.45.5.)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  3 +-
 ...mount-write-time-when-e2fsck-is-forc.patch | 66 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index fb02b2006e..1250a9b99c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,8 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
 SECTION = "base"
 DEPENDS = "util-linux attr autoconf-archive"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master \
+           file://0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch"
 S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
new file mode 100644
index 0000000000..d679b25b1d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
@@ -0,0 +1,66 @@
+From 2c69c94217b6db083d601d4fd62d6ab6c1628fee Mon Sep 17 00:00:00 2001
+From: Lukas Czerner <lczerner@redhat.com>
+Date: Mon, 14 Jun 2021 15:27:25 +0200
+Subject: [PATCH] e2fsck: fix last mount/write time when e2fsck is forced
+
+With commit c52d930f e2fsck is no longer able to fix bad last
+mount/write time by default because it is conditioned on s_checkinterval
+not being zero, which it is by default.
+
+One place where it matters is when other e2fsprogs tools require to run
+full file system check before a certain operation. If the last mount
+time is for any reason in future, it will not allow it to run even if
+full e2fsck is ran.
+
+Fix it by checking the last mount/write time when the e2fsck is forced,
+except for the case where we know the system clock is broken.
+
+[ Reworked the conditionals so error messages claiming that the last
+  write/mount time were corrupted wouldn't be always printed when the
+  e2fsck was run with the -f option, thus causing 299 out of 372
+  regression tests to fail.  -- TYT ]
+
+Fixes: c52d930f ("e2fsck: don't check for future superblock times if checkinterval == 0")
+Reported-by: Dusty Mabe <dustymabe@redhat.com>
+Signed-off-by: Lukas Czerner <lczerner@redhat.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/2c69c94217b6db083d601d4fd62d6ab6c1628fee]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ e2fsck/super.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/e2fsck/super.c b/e2fsck/super.c
+index e1c3f935..31e2ffb2 100644
+--- a/e2fsck/super.c
++++ b/e2fsck/super.c
+@@ -1038,9 +1038,9 @@ void check_super_block(e2fsck_t ctx)
+ 	 * Check to see if the superblock last mount time or last
+ 	 * write time is in the future.
+ 	 */
+-	if (!broken_system_clock && fs->super->s_checkinterval &&
+-	    !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
+-	    fs->super->s_mtime > (__u32) ctx->now) {
++	if (((ctx->options & E2F_OPT_FORCE) || fs->super->s_checkinterval) &&
++	    !broken_system_clock && !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
++	    (fs->super->s_mtime > (__u32) ctx->now)) {
+ 		pctx.num = fs->super->s_mtime;
+ 		problem = PR_0_FUTURE_SB_LAST_MOUNT;
+ 		if (fs->super->s_mtime <= (__u32) ctx->now + ctx->time_fudge)
+@@ -1050,9 +1050,9 @@ void check_super_block(e2fsck_t ctx)
+ 			fs->flags |= EXT2_FLAG_DIRTY;
+ 		}
+ 	}
+-	if (!broken_system_clock && fs->super->s_checkinterval &&
+-	    !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
+-	    fs->super->s_wtime > (__u32) ctx->now) {
++	if (((ctx->options & E2F_OPT_FORCE) || fs->super->s_checkinterval) &&
++	    !broken_system_clock && !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
++	    (fs->super->s_wtime > (__u32) ctx->now)) {
+ 		pctx.num = fs->super->s_wtime;
+ 		problem = PR_0_FUTURE_SB_LAST_WRITE;
+ 		if (fs->super->s_wtime <= (__u32) ctx->now + ctx->time_fudge)
+-- 
+2.25.1
+
-- 
2.25.1


