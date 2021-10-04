Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E549C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:31:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.14171.1633372312550130891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225859644"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="225859644"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208861"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:08 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/11] vim: Backport fix for CVE-2021-3770
Date: Tue,  5 Oct 2021 00:50:50 +0800
Message-Id: 
 <27c7e46bc4dbabdcd8c5c1a9de2906c5bc8a48c4.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:31:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156629

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54d3d023ce55ba4a7160ed25a283f0918e7d8e2e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

diff --git a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
new file mode 100644
index 0000000000..1cee759502
--- /dev/null
+++ b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
@@ -0,0 +1,207 @@
+From b7081e135a16091c93f6f5f7525a5c58fb7ca9f9 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Sat, 4 Sep 2021 18:47:28 +0200
+Subject: [PATCH] patch 8.2.3402: invalid memory access when using :retab with
+ large value
+
+Problem:    Invalid memory access when using :retab with large value.
+Solution:   Check the number is positive.
+
+CVE: CVE-2021-3770
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Backport [https://github.com/vim/vim/commit/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9]
+---
+ src/indent.c               | 34 +++++++++++++++++++++-------------
+ src/option.c               | 12 ++++++------
+ src/optionstr.c            |  4 ++--
+ src/testdir/test_retab.vim |  3 +++
+ src/version.c              |  2 ++
+ 5 files changed, 34 insertions(+), 21 deletions(-)
+
+Index: git/src/indent.c
+===================================================================
+--- git.orig/src/indent.c
++++ git/src/indent.c
+@@ -18,18 +18,19 @@
+ /*
+  * Set the integer values corresponding to the string setting of 'vartabstop'.
+  * "array" will be set, caller must free it if needed.
++ * Return FAIL for an error.
+  */
+     int
+ tabstop_set(char_u *var, int **array)
+ {
+-    int valcount = 1;
+-    int t;
+-    char_u *cp;
++    int	    valcount = 1;
++    int	    t;
++    char_u  *cp;
+ 
+     if (var[0] == NUL || (var[0] == '0' && var[1] == NUL))
+     {
+ 	*array = NULL;
+-	return TRUE;
++	return OK;
+     }
+ 
+     for (cp = var; *cp != NUL; ++cp)
+@@ -43,8 +44,8 @@ tabstop_set(char_u *var, int **array)
+ 		if (cp != end)
+ 		    emsg(_(e_positive));
+ 		else
+-		    emsg(_(e_invarg));
+-		return FALSE;
++		    semsg(_(e_invarg2), cp);
++		return FAIL;
+ 	    }
+ 	}
+ 
+@@ -55,26 +56,33 @@ tabstop_set(char_u *var, int **array)
+ 	    ++valcount;
+ 	    continue;
+ 	}
+-	emsg(_(e_invarg));
+-	return FALSE;
++	semsg(_(e_invarg2), var);
++	return FAIL;
+     }
+ 
+     *array = ALLOC_MULT(int, valcount + 1);
+     if (*array == NULL)
+-	return FALSE;
++	return FAIL;
+     (*array)[0] = valcount;
+ 
+     t = 1;
+     for (cp = var; *cp != NUL;)
+     {
+-	(*array)[t++] = atoi((char *)cp);
+-	while (*cp  != NUL && *cp != ',')
++	int n = atoi((char *)cp);
++
++	if (n < 0 || n > 9999)
++	{
++	    semsg(_(e_invarg2), cp);
++	    return FAIL;
++	}
++	(*array)[t++] = n;
++	while (*cp != NUL && *cp != ',')
+ 	    ++cp;
+ 	if (*cp != NUL)
+ 	    ++cp;
+     }
+ 
+-    return TRUE;
++    return OK;
+ }
+ 
+ /*
+@@ -1556,7 +1564,7 @@ ex_retab(exarg_T *eap)
+ 
+ #ifdef FEAT_VARTABS
+     new_ts_str = eap->arg;
+-    if (!tabstop_set(eap->arg, &new_vts_array))
++    if (tabstop_set(eap->arg, &new_vts_array) == FAIL)
+ 	return;
+     while (vim_isdigit(*(eap->arg)) || *(eap->arg) == ',')
+ 	++(eap->arg);
+Index: git/src/option.c
+===================================================================
+--- git.orig/src/option.c
++++ git/src/option.c
+@@ -2292,9 +2292,9 @@ didset_options2(void)
+ #endif
+ #ifdef FEAT_VARTABS
+     vim_free(curbuf->b_p_vsts_array);
+-    tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
++    (void)tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
+     vim_free(curbuf->b_p_vts_array);
+-    tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
++    (void)tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
+ #endif
+ }
+ 
+@@ -5756,7 +5756,7 @@ buf_copy_options(buf_T *buf, int flags)
+ 	    buf->b_p_vsts = vim_strsave(p_vsts);
+ 	    COPY_OPT_SCTX(buf, BV_VSTS);
+ 	    if (p_vsts && p_vsts != empty_option)
+-		tabstop_set(p_vsts, &buf->b_p_vsts_array);
++		(void)tabstop_set(p_vsts, &buf->b_p_vsts_array);
+ 	    else
+ 		buf->b_p_vsts_array = 0;
+ 	    buf->b_p_vsts_nopaste = p_vsts_nopaste
+@@ -5914,7 +5914,7 @@ buf_copy_options(buf_T *buf, int flags)
+ 		buf->b_p_isk = save_p_isk;
+ #ifdef FEAT_VARTABS
+ 		if (p_vts && p_vts != empty_option && !buf->b_p_vts_array)
+-		    tabstop_set(p_vts, &buf->b_p_vts_array);
++		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
+ 		else
+ 		    buf->b_p_vts_array = NULL;
+ #endif
+@@ -5929,7 +5929,7 @@ buf_copy_options(buf_T *buf, int flags)
+ 		buf->b_p_vts = vim_strsave(p_vts);
+ 		COPY_OPT_SCTX(buf, BV_VTS);
+ 		if (p_vts && p_vts != empty_option && !buf->b_p_vts_array)
+-		    tabstop_set(p_vts, &buf->b_p_vts_array);
++		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
+ 		else
+ 		    buf->b_p_vts_array = NULL;
+ #endif
+@@ -6634,7 +6634,7 @@ paste_option_changed(void)
+ 	    if (buf->b_p_vsts_array)
+ 		vim_free(buf->b_p_vsts_array);
+ 	    if (buf->b_p_vsts && buf->b_p_vsts != empty_option)
+-		tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
++		(void)tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
+ 	    else
+ 		buf->b_p_vsts_array = 0;
+ #endif
+Index: git/src/optionstr.c
+===================================================================
+--- git.orig/src/optionstr.c
++++ git/src/optionstr.c
+@@ -2166,7 +2166,7 @@ did_set_string_option(
+ 	    if (errmsg == NULL)
+ 	    {
+ 		int *oldarray = curbuf->b_p_vsts_array;
+-		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)))
++		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)) == OK)
+ 		{
+ 		    if (oldarray)
+ 			vim_free(oldarray);
+@@ -2205,7 +2205,7 @@ did_set_string_option(
+ 	    {
+ 		int *oldarray = curbuf->b_p_vts_array;
+ 
+-		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)))
++		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)) == OK)
+ 		{
+ 		    vim_free(oldarray);
+ #ifdef FEAT_FOLDING
+Index: git/src/testdir/test_retab.vim
+===================================================================
+--- git.orig/src/testdir/test_retab.vim
++++ git/src/testdir/test_retab.vim
+@@ -74,4 +74,7 @@ endfunc
+ func Test_retab_error()
+   call assert_fails('retab -1',  'E487:')
+   call assert_fails('retab! -1', 'E487:')
++  call assert_fails('ret -1000', 'E487:')
++  call assert_fails('ret 10000', 'E475:')
++  call assert_fails('ret 80000000000000000000', 'E475:')
+ endfunc
+Index: git/src/version.c
+===================================================================
+--- git.orig/src/version.c
++++ git/src/version.c
+@@ -743,6 +743,8 @@ static char *(features[]) =
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
++    3402,
++/**/
+     0
+ };
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e45f9b828d..e04c653fe3 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,7 +19,9 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://racefix.patch \
            file://CVE-2021-3778.patch \
            file://CVE-2021-3796.patch \
+           file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
 "
+
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
-- 
2.31.1


