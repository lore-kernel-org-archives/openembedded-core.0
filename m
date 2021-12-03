Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AD9C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:37 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.15493.1638555696641164154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gOLHm4st;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id b68so3624171pfg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RPnwAvei5783RECdAdRuYvas8h5Zz8CdQvXt6vK/D4E=;
        b=gOLHm4stR4xmkfEAr8zbTAHtrDHxTZ9mgkVfRHSMGh5XA0mH9mySWDTXmOuCrirDhZ
         4p7Nnv6KK77EA5TdX93r3fVfLtYyoGm6uCtJMa/TxWhA/ok/vgMKefbSfMIfpvRx4wBH
         uKIsK6ugGfCRqxih/gcQAfkiPPbrGDm7uMIyOiCFhC/BvpsKZBif+h++JzDQb/RSnPrB
         4zXa4myB5aVjK00H4YiiZPqoe1bofwAfpL0QpCvg2eV0v4IHm26Wa3CnQWL4ywbPpMax
         IMdaF1ob9z+mZQ+HB3lnhBYHWtRifIV/L3V89p+KPoOCQy5h9Lt9xWY6bMliUdbVhdvu
         B/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RPnwAvei5783RECdAdRuYvas8h5Zz8CdQvXt6vK/D4E=;
        b=SXhikM9CM4Nbf+tnCUrS4RZzB3H6K+vy7QH06qcQ2UjZJJL44pQSE3obLkKgc18o2I
         mFL9eSObl9N5863MyXMkuzw9+SY3HH0WDrjiJGlbJS1QcNu7ZCq3wLyp9Zc1r8rokVj7
         SWVzKY948Jd20r/BYzO3yY0YSVJ5Bijs82ZL/Okql6uDnPViZn/TdeaR2/ZeVsQrIT35
         lIJL88+QQ0YGmDU9fqwTiXy6CkVuGfJkGDk4j+Yog+Yt4tDGTiU4psZp3vGnOjAJkx8y
         I0qXG63XVAhxg8YisKcJlVuSUMgkG8930nypVRub0gCMphYvcHI5c/O3wJOtjZ0xVTco
         bt4w==
X-Gm-Message-State: AOAM533/+8+9Z4++vQPQS6i1+mhf08o4ol28mCXd+UvLDDRwWXHMx2SM
	snnZlVTl4YVV/y8cibPC769qMYfDtM9pNMACRZs=
X-Google-Smtp-Source: 
 ABdhPJyXmtbfr1i/wfx187MMNTUy4qVWWJbfs2wrGg7CQqy7Rs4QSM30rYpk49AdcOlSz8H2ksFQMw==
X-Received: by 2002:a63:4963:: with SMTP id y35mr5677859pgk.279.1638555695590;
        Fri, 03 Dec 2021 10:21:35 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/18] vim: fix CVE-2021-3968 and CVE-2021-3973
Date: Fri,  3 Dec 2021 08:18:52 -1000
Message-Id: 
 <74e34f9551c2d9811da045b3957aabba5a9a4e2f.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159132

From: Ross Burton <ross@burtonini.com>

Backport a fix for -3972, and whitelist -3968: it isn't valid as it
fixes a bug which was introduced after 8.2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bec5caadfb53638748d8c41ce7230c2bf7808d27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index bd8aeba2fd..11fed67527 100644
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
2.25.1


