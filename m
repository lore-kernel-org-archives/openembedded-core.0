Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5C6C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:45 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19878.1646056840489874149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Ck4hW6OZ;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056844; x=1677592844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d6+vQYKvNmL5426NuBYJVfm7bCa4LyKhMP0sNgn7RWU=;
  b=Ck4hW6OZGdzv0dsvLMnoeQrehbzw/ypYTxEgtrjW8ZiXR3S9d4gXsL+n
   N7j4BN1lcfERL9Ic27LDC58A4fgaE/xsNutdJPnvhw/SooTw246GT/ZzH
   IXAAj4KIx3eq/En1RBvgee1LYRgN+hvYPUBrEK2MXrU0vXudBLviWRaYm
   R3mTJPMd1H4T45BKB7QAl4flQSrEtb9J1ZEb2YWF0AiT842EkBSTE5Fw+
   EDjQeZ+cN6dPzDZXXEQp+bq/QNUs9m6LQcZnaGLsXTtXt7/Xa1sUSIbnr
   fkSCvTs+71hTGFIGU3A0yEeyO28h4uvX+3PTsjTj6pn1bJlxpilcOcEUn
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232856925"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232856925"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:44 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092167"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/39] e2fsprogs: backport to fix one regression
Date: Mon, 28 Feb 2022 21:59:53 +0800
Message-Id: 
 <9fe70a643a2d8723001421a18b5736e70a1eaa34.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162459

From: Changqing Li <changqing.li@windriver.com>

Backport a patch in 1.46.3 which fix one regression:
This is what the changelog says:
    Fix e2fsck so that the if the s_interval is zero, and the last mount
    or write time is in the future, it will fix invalid last mount/write
    timestamps in the superblock. (This was a regression introduced in
    v1.45.5.)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.35.1


