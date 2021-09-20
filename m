Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.10863.1632141985224657001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NbAmu298;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id u15so29345527wru.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2yjZ28W7Y4YrrjZQ3kfeWdPwNXyCaB/d3FtJ/BdQnro=;
        b=NbAmu298IZo6go8gxvmp6swcl+xa1CPG7noVTmgP5eauPtpxDg3Bs+pgo6pirRDoiB
         kiFlELxf3InYNGw/K5XRaZKL0kxhuChugIUPEdg9SfkW4/TVUVowhapusBpW5Tf3pLdn
         1UiwcFX/d/q29/kIGwod3lRux2PV50WouRvVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2yjZ28W7Y4YrrjZQ3kfeWdPwNXyCaB/d3FtJ/BdQnro=;
        b=F0oyF6RPmJXmBp82mnC28S7fXWjAKKcPzLfQ4n/McgPHwaopZSeQciRKWNDeTnu3vW
         hpX0i2Y7Q3T/o6+76cFlPKVJSaFQfrMNhzI5/Uvto6f6cxqWUStRuAyQth2upRQjjpQ4
         vlq7ehfU6WCM0fOVTkUGzXoInNOUDJLjkcWzcwsiN9fvTlyWU3QtB5VcyrFGcvfqVUVx
         ZCvIdUHm7xgvDj8L2OGT98MauvDdBmJgdnNykBvoLIwPNsp6ytMSDy2k+mhApVMZRp7v
         Leix8c+fdEeSPwEsRm6N1qZGH1+IQC9xy1S1LMPfSJ8j8ufszJG7By0RJXPZPkB1SCIk
         /HEw==
X-Gm-Message-State: AOAM530ZcAxcZ1NaJnB0arQUO1mfOFac4MbBlMgoNZOV7OMB2TpsU0+S
	mcYgmwMR7SUn7GIHTt4SbLUjwsv5d/LT6fze
X-Google-Smtp-Source: ABdhPJzC6JsnvNphbISO50sT0BPNQdSd4IfWCvjk8+ow0uAcYxel+iWGCx/MvbSMucEo3ipBiG2mGw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr28894707wmb.79.1632141982969;
        Mon, 20 Sep 2021 05:46:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/14] vim: Backport fix for CVE-2021-3770
Date: Mon, 20 Sep 2021 13:46:08 +0100
Message-Id: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

diff --git a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
new file mode 100644
index 00000000000..1cee7595021
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
index 17322885dc6..7e9225fbcb5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,7 +17,9 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
 "
+
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
-- 
2.32.0

