Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3203AC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 04:14:51 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.29182.1640232889500822798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 20:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BN4Egri003456
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 22 Dec 2021 20:14:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BN4EfSN001259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Dec 2021 20:14:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 22 Dec 2021 20:14:41 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 22 Dec 2021 20:14:40 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] vim: upgrade to 8.2 patch 3752
Date: Thu, 23 Dec 2021 12:14:39 +0800
Message-ID: <20211223041439.22551-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 04:14:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159966

From: Ross Burton <ross@burtonini.com>

There's a fairly constant flow of CVEs being fixed in Vim, which are
getting increasing non-trivial to backport.

Instead of trying to backport (and potentially introduce more bugs), or
just ignoring them entirely, upgrade vim to the latest patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78a4796de27d710f97c336d288d797557a58694e)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...src-Makefile-improve-reproducibility.patch |  13 +-
 .../vim/files/CVE-2021-3778.patch             |  34 ---
 .../vim/files/CVE-2021-3872.patch             |  57 -----
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------------------
 .../vim/files/disable_acl_header_check.patch  |  15 +-
 .../vim/files/no-path-adjust.patch            |   8 +-
 meta/recipes-support/vim/files/racefix.patch  |   6 +-
 ...m-add-knob-whether-elf.h-are-checked.patch |  13 +-
 meta/recipes-support/vim/vim.inc              |  14 +-
 9 files changed, 28 insertions(+), 339 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3872.patch
 delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
index 63a7b78f12..2fc11dbdc2 100644
--- a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
+++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
@@ -16,11 +16,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  src/Makefile | 14 ++++----------
  1 file changed, 4 insertions(+), 10 deletions(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index f2fafa4dc..7148d4bd9 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/config.mk
+Index: git/src/Makefile
+===================================================================
+--- git.orig/src/Makefile
++++ git/src/Makefile
+@@ -3101,16 +3101,10 @@ auto/pathdef.c: Makefile auto/config.mk
  	-@echo '#include "vim.h"' >> $@
  	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
  	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
@@ -41,6 +41,3 @@ index f2fafa4dc..7148d4bd9 100644
  	-@sh $(srcdir)/pathdef.sh
  
  GUI_GTK_RES_INPUTS = \
--- 
-2.17.1
-
diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
deleted file mode 100644
index 04ac413e56..0000000000
--- a/meta/recipes-support/vim/files/CVE-2021-3778.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9ba62f1042513fcadcc4e8fdcee171db66ef1d69 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Fri, 24 Sep 2021 15:15:24 +0800
-Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
- character
-
-Problem:    Reading beyond end of line with invalid utf-8 character.
-Solution:   Check for NUL when advancing.
-
-Upstream-Status: Backport [https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
-CVE: CVE-2021-3778
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/regexp_nfa.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
-index fb512f961..2806408de 100644
---- a/src/regexp_nfa.c
-+++ b/src/regexp_nfa.c
-@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char_u *match_text)
- 		match = FALSE;
- 		break;
- 	    }
--	    len2 += MB_CHAR2LEN(c2);
-+	    len2 += enc_utf8 ? utf_ptr2len(rex.line + col + len2)
-+	                                                     : MB_CHAR2LEN(c2);
- 	}
- 	if (match
- 		// check that no composing char follows
--- 
-2.17.1
-
diff --git a/meta/recipes-support/vim/files/CVE-2021-3872.patch b/meta/recipes-support/vim/files/CVE-2021-3872.patch
deleted file mode 100644
index f0f30933fa..0000000000
--- a/meta/recipes-support/vim/files/CVE-2021-3872.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 132d060ffbb9651f0d79bd0b6d80cab460235a99 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Fri, 12 Nov 2021 02:56:51 +0000
-Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is very
- long
-
-Problem:    Illegal memory access if buffer name is very long.
-Solution:   Make sure not to go over the end of the buffer.
-
-CVE: CVE-2021-3872
-
-Upstream-Status: Backport [https://github.com/vim/vim/commit/826bfe4bbd7594188e3d74d2539d9707b1c6a14b]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/drawscreen.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/drawscreen.c b/src/drawscreen.c
-index 3a88ee979..9acb70552 100644
---- a/src/drawscreen.c
-+++ b/src/drawscreen.c
-@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
- 	    *(p + len++) = ' ';
- 	if (bt_help(wp->w_buffer))
- 	{
--	    STRCPY(p + len, _("[Help]"));
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Help]"));
- 	    len += (int)STRLEN(p + len);
- 	}
- #ifdef FEAT_QUICKFIX
- 	if (wp->w_p_pvw)
- 	{
--	    STRCPY(p + len, _("[Preview]"));
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Preview]"));
- 	    len += (int)STRLEN(p + len);
- 	}
- #endif
-@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
- #endif
- 		)
- 	{
--	    STRCPY(p + len, "[+]");
--	    len += 3;
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", "[+]");
-+	    len += (int)STRLEN(p + len);
- 	}
- 	if (wp->w_buffer->b_p_ro)
- 	{
--	    STRCPY(p + len, _("[RO]"));
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[RO]"));
- 	    len += (int)STRLEN(p + len);
- 	}
- 
--- 
-2.31.1
-
diff --git a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
deleted file mode 100644
index 1cee759502..0000000000
--- a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From b7081e135a16091c93f6f5f7525a5c58fb7ca9f9 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Sat, 4 Sep 2021 18:47:28 +0200
-Subject: [PATCH] patch 8.2.3402: invalid memory access when using :retab with
- large value
-
-Problem:    Invalid memory access when using :retab with large value.
-Solution:   Check the number is positive.
-
-CVE: CVE-2021-3770
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Backport [https://github.com/vim/vim/commit/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9]
----
- src/indent.c               | 34 +++++++++++++++++++++-------------
- src/option.c               | 12 ++++++------
- src/optionstr.c            |  4 ++--
- src/testdir/test_retab.vim |  3 +++
- src/version.c              |  2 ++
- 5 files changed, 34 insertions(+), 21 deletions(-)
-
-Index: git/src/indent.c
-===================================================================
---- git.orig/src/indent.c
-+++ git/src/indent.c
-@@ -18,18 +18,19 @@
- /*
-  * Set the integer values corresponding to the string setting of 'vartabstop'.
-  * "array" will be set, caller must free it if needed.
-+ * Return FAIL for an error.
-  */
-     int
- tabstop_set(char_u *var, int **array)
- {
--    int valcount = 1;
--    int t;
--    char_u *cp;
-+    int	    valcount = 1;
-+    int	    t;
-+    char_u  *cp;
- 
-     if (var[0] == NUL || (var[0] == '0' && var[1] == NUL))
-     {
- 	*array = NULL;
--	return TRUE;
-+	return OK;
-     }
- 
-     for (cp = var; *cp != NUL; ++cp)
-@@ -43,8 +44,8 @@ tabstop_set(char_u *var, int **array)
- 		if (cp != end)
- 		    emsg(_(e_positive));
- 		else
--		    emsg(_(e_invarg));
--		return FALSE;
-+		    semsg(_(e_invarg2), cp);
-+		return FAIL;
- 	    }
- 	}
- 
-@@ -55,26 +56,33 @@ tabstop_set(char_u *var, int **array)
- 	    ++valcount;
- 	    continue;
- 	}
--	emsg(_(e_invarg));
--	return FALSE;
-+	semsg(_(e_invarg2), var);
-+	return FAIL;
-     }
- 
-     *array = ALLOC_MULT(int, valcount + 1);
-     if (*array == NULL)
--	return FALSE;
-+	return FAIL;
-     (*array)[0] = valcount;
- 
-     t = 1;
-     for (cp = var; *cp != NUL;)
-     {
--	(*array)[t++] = atoi((char *)cp);
--	while (*cp  != NUL && *cp != ',')
-+	int n = atoi((char *)cp);
-+
-+	if (n < 0 || n > 9999)
-+	{
-+	    semsg(_(e_invarg2), cp);
-+	    return FAIL;
-+	}
-+	(*array)[t++] = n;
-+	while (*cp != NUL && *cp != ',')
- 	    ++cp;
- 	if (*cp != NUL)
- 	    ++cp;
-     }
- 
--    return TRUE;
-+    return OK;
- }
- 
- /*
-@@ -1556,7 +1564,7 @@ ex_retab(exarg_T *eap)
- 
- #ifdef FEAT_VARTABS
-     new_ts_str = eap->arg;
--    if (!tabstop_set(eap->arg, &new_vts_array))
-+    if (tabstop_set(eap->arg, &new_vts_array) == FAIL)
- 	return;
-     while (vim_isdigit(*(eap->arg)) || *(eap->arg) == ',')
- 	++(eap->arg);
-Index: git/src/option.c
-===================================================================
---- git.orig/src/option.c
-+++ git/src/option.c
-@@ -2292,9 +2292,9 @@ didset_options2(void)
- #endif
- #ifdef FEAT_VARTABS
-     vim_free(curbuf->b_p_vsts_array);
--    tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
-+    (void)tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
-     vim_free(curbuf->b_p_vts_array);
--    tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
-+    (void)tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
- #endif
- }
- 
-@@ -5756,7 +5756,7 @@ buf_copy_options(buf_T *buf, int flags)
- 	    buf->b_p_vsts = vim_strsave(p_vsts);
- 	    COPY_OPT_SCTX(buf, BV_VSTS);
- 	    if (p_vsts && p_vsts != empty_option)
--		tabstop_set(p_vsts, &buf->b_p_vsts_array);
-+		(void)tabstop_set(p_vsts, &buf->b_p_vsts_array);
- 	    else
- 		buf->b_p_vsts_array = 0;
- 	    buf->b_p_vsts_nopaste = p_vsts_nopaste
-@@ -5914,7 +5914,7 @@ buf_copy_options(buf_T *buf, int flags)
- 		buf->b_p_isk = save_p_isk;
- #ifdef FEAT_VARTABS
- 		if (p_vts && p_vts != empty_option && !buf->b_p_vts_array)
--		    tabstop_set(p_vts, &buf->b_p_vts_array);
-+		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
- 		else
- 		    buf->b_p_vts_array = NULL;
- #endif
-@@ -5929,7 +5929,7 @@ buf_copy_options(buf_T *buf, int flags)
- 		buf->b_p_vts = vim_strsave(p_vts);
- 		COPY_OPT_SCTX(buf, BV_VTS);
- 		if (p_vts && p_vts != empty_option && !buf->b_p_vts_array)
--		    tabstop_set(p_vts, &buf->b_p_vts_array);
-+		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
- 		else
- 		    buf->b_p_vts_array = NULL;
- #endif
-@@ -6634,7 +6634,7 @@ paste_option_changed(void)
- 	    if (buf->b_p_vsts_array)
- 		vim_free(buf->b_p_vsts_array);
- 	    if (buf->b_p_vsts && buf->b_p_vsts != empty_option)
--		tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
-+		(void)tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
- 	    else
- 		buf->b_p_vsts_array = 0;
- #endif
-Index: git/src/optionstr.c
-===================================================================
---- git.orig/src/optionstr.c
-+++ git/src/optionstr.c
-@@ -2166,7 +2166,7 @@ did_set_string_option(
- 	    if (errmsg == NULL)
- 	    {
- 		int *oldarray = curbuf->b_p_vsts_array;
--		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)))
-+		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)) == OK)
- 		{
- 		    if (oldarray)
- 			vim_free(oldarray);
-@@ -2205,7 +2205,7 @@ did_set_string_option(
- 	    {
- 		int *oldarray = curbuf->b_p_vts_array;
- 
--		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)))
-+		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)) == OK)
- 		{
- 		    vim_free(oldarray);
- #ifdef FEAT_FOLDING
-Index: git/src/testdir/test_retab.vim
-===================================================================
---- git.orig/src/testdir/test_retab.vim
-+++ git/src/testdir/test_retab.vim
-@@ -74,4 +74,7 @@ endfunc
- func Test_retab_error()
-   call assert_fails('retab -1',  'E487:')
-   call assert_fails('retab! -1', 'E487:')
-+  call assert_fails('ret -1000', 'E487:')
-+  call assert_fails('ret 10000', 'E475:')
-+  call assert_fails('ret 80000000000000000000', 'E475:')
- endfunc
-Index: git/src/version.c
-===================================================================
---- git.orig/src/version.c
-+++ git/src/version.c
-@@ -743,6 +743,8 @@ static char *(features[]) =
- static int included_patches[] =
- {   /* Add new patch number below this line */
- /**/
-+    3402,
-+/**/
-     0
- };
- 
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
index 33089162b4..533138245d 100644
--- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -13,11 +13,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  src/configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/configure.ac b/src/configure.ac
-index 2d409b3ca06a..dbcaf6140263 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -3257,7 +3257,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
+Index: git/src/configure.ac
+===================================================================
+--- git.orig/src/configure.ac
++++ git/src/configure.ac
+@@ -3292,7 +3292,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h strin
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
  	utime.h sys/param.h sys/ptms.h libintl.h libgen.h \
@@ -26,7 +26,7 @@ index 2d409b3ca06a..dbcaf6140263 100644
  	sys/access.h sys/sysinfo.h wchar.h wctype.h)
  
  dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3886,6 +3886,7 @@ AC_ARG_ENABLE(acl,
+@@ -3974,6 +3974,7 @@ AC_ARG_ENABLE(acl,
  	, [enable_acl="yes"])
  if test "$enable_acl" = "yes"; then
    AC_MSG_RESULT(no)
@@ -34,6 +34,3 @@ index 2d409b3ca06a..dbcaf6140263 100644
    AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
  	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
  		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 05c2d803f6..9d6da80913 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -7,9 +7,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
+Index: git/src/Makefile
+===================================================================
+--- git.orig/src/Makefile
++++ git/src/Makefile
+@@ -2565,11 +2565,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
  		 rm -rf $$cvs; \
  	      fi
  	-chmod $(FILEMOD) $(DEST_TOOLS)/*
diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
index 48dca44cad..1cb8fb442f 100644
--- a/meta/recipes-support/vim/files/racefix.patch
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -9,9 +9,9 @@ Index: git/src/po/Makefile
 ===================================================================
 --- git.orig/src/po/Makefile
 +++ git/src/po/Makefile
-@@ -165,17 +165,16 @@ $(PACKAGE).pot: ../*.c ../if_perl.xs ../
- 		po/gvim.desktop.in po/vim.desktop.in
- 	mv -f ../$(PACKAGE).po $(PACKAGE).pot
+@@ -207,17 +207,16 @@ $(PACKAGE).pot: $(PO_INPUTLIST) $(PO_VIM
+ 	# Delete the temporary files
+ 	rm *.js
  
 -vim.desktop: vim.desktop.in $(POFILES)
 +LINGUAS:
diff --git a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
index 37914d4cd9..5284ba45b6 100644
--- a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
+++ b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
@@ -14,11 +14,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  src/configure.ac | 7 +++++++
  1 file changed, 7 insertions(+)
 
-diff --git a/src/configure.ac b/src/configure.ac
-index 0ee86ad..64736f0 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
+Index: git/src/configure.ac
+===================================================================
+--- git.orig/src/configure.ac
++++ git/src/configure.ac
+@@ -3264,11 +3264,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [in
  	AC_MSG_RESULT(no))
  
  dnl Checks for header files.
@@ -37,6 +37,3 @@ index 0ee86ad..64736f0 100644
  
  AC_HEADER_DIRENT
  
--- 
-2.7.4
-
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 864006192b..7174d818ff 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -8,8 +8,9 @@ BUGTRACKER = "https://github.com/vim/vim/issues"
 DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
+
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=a19edd7ec70d573a005d9e509375a99a"
+LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=909f1394892b7e0f9c2a95306c0c552b"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -17,17 +18,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
-           file://CVE-2021-3778.patch \
-           file://CVE-2021-3796.patch \
-           file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
-           file://CVE-2021-3903.patch \
-           file://CVE-2021-3872.patch \
-           file://CVE-2021-3875.patch \
-           file://CVE-2021-3927.patch \
-           file://CVE-2021-3928.patch \
 "
 
-SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
+PV .= ".3752"
+SRCREV = "8603be338ac810446f23c092f21bc6082f787519"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.17.1


