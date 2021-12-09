Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169EEC433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:12 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504070"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298282"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 25/33] vim: fix CVE-2021-3968 and CVE-2021-3973
Date: Thu,  9 Dec 2021 09:29:24 +0800
Message-Id: 
 <4d2cdd3971b4cd3e42c47ec10ec105adfbc78e6e.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159425

From: Ross Burton <ross@burtonini.com>

Backport a fix for -3972, and whitelist -3968: it isn't valid as it
fixes a bug which was introduced after 8.2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bec5caadfb53638748d8c41ce7230c2bf7808d27)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rash-when-using-CTRL-W-f-without-fin.patch | 92 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  4 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch

diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch b/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
new file mode 100644
index 0000000000..58d3442677
--- /dev/null
+++ b/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
@@ -0,0 +1,92 @@
+CVE: CVE-2021-3973
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b6154e9f530544ddc3130d981caae0dabc053757 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 17 Nov 2021 18:00:31 +0000
+Subject: [PATCH] patch 8.2.3611: crash when using CTRL-W f without finding a
+ file name  Problem:    Crash when using CTRL-W f without finding
+ a file name. Solution:   Bail out when the file name length is zero.
+
+---
+ src/findfile.c              | 8 ++++++++
+ src/normal.c                | 6 ++++--
+ src/testdir/test_visual.vim | 8 ++++++++
+ src/version.c               | 2 ++
+ 4 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/src/findfile.c b/src/findfile.c
+index dba547da1..5764fd7b8 100644
+--- a/src/findfile.c
++++ b/src/findfile.c
+@@ -1727,6 +1727,9 @@ find_file_in_path_option(
+     proc->pr_WindowPtr = (APTR)-1L;
+ # endif
+ 
++    if (len == 0)
++	return NULL;
++
+     if (first == TRUE)
+     {
+ 	// copy file name into NameBuff, expanding environment variables
+@@ -2094,7 +2097,12 @@ find_file_name_in_path(
+     int		c;
+ # if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
+     char_u	*tofree = NULL;
++# endif
+ 
++    if (len == 0)
++	return NULL;
++
++# if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
+     if ((options & FNAME_INCL) && *curbuf->b_p_inex != NUL)
+     {
+ 	tofree = eval_includeexpr(ptr, len);
+diff --git a/src/normal.c b/src/normal.c
+index 7cb959257..f0084f2ac 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -3778,8 +3778,10 @@ get_visual_text(
+ 	    *pp = ml_get_pos(&VIsual);
+ 	    *lenp = curwin->w_cursor.col - VIsual.col + 1;
+ 	}
+-	if (has_mbyte)
+-	    // Correct the length to include the whole last character.
++	if (**pp == NUL)
++	    *lenp = 0;
++	if (has_mbyte && *lenp > 0)
++	    // Correct the length to include all bytes of the last character.
+ 	    *lenp += (*mb_ptr2len)(*pp + (*lenp - 1)) - 1;
+     }
+     reset_VIsual_and_resel();
+diff --git a/src/testdir/test_visual.vim b/src/testdir/test_visual.vim
+index ae281238e..0705fdb57 100644
+--- a/src/testdir/test_visual.vim
++++ b/src/testdir/test_visual.vim
+@@ -894,4 +894,12 @@ func Test_block_insert_replace_tabs()
+   bwipe!
+ endfunc
+ 
++func Test_visual_block_ctrl_w_f()
++  " Emtpy block selected in new buffer should not result in an error.
++  au! BufNew foo sil norm f
++  edit foo
++
++  au! BufNew
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 52be3c39d..59a314b3a 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3611,
+ /**/
+     3582,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d0957bfeae..6cdf157cb6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch \
            file://0001-patch-8.2.3581-reading-character-past-end-of-line.patch \
            file://0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch \
+           file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch \
            "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
@@ -32,6 +33,9 @@ SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 
+# CVE-2021-3968 is related to an issue which was introduced after 8.2, this can be removed after 8.3.
+CVE_CHECK_WHITELIST += "CVE-2021-3968"
+
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-- 
2.33.1


