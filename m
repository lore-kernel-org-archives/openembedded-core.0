Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BC3C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5806.1783591628418868076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=021Nhjq3;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so12243125e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591627; x=1784196427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YxujmGIcIB1R2Wl6HOOVqk64xP19YCoQheBX2sUcrVA=;
        b=021Nhjq3U5krjc/F50o1kM8iT2AncsEkkudMrB1yFrLE5beYgowoUZMfmwy8LxGvXv
         I2pvUAipNn0JetzZ8YwcwPrAixwOE5rOBP/zVpxhVwM1wu4EUTwdqvWIn9ZQ4APYUUq9
         RPSr7EnybycdkFROnsQF/SrPgNwFiFgRgibHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591627; x=1784196427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YxujmGIcIB1R2Wl6HOOVqk64xP19YCoQheBX2sUcrVA=;
        b=eR/k65cjvS3jDlRxudnpVnnzZbEl5YE+rdZDQ4yr/g+qCx005CDVuNY5/HMPp44epy
         521Gc6DJW4vYd6JcxrgzhX049ItFRFwYjyBX7szll/KV+iTy6U5cYmADED0GCucWgkvB
         mku0jZOCHVJ+MdhqGk2F0lCemeVwa7wFoYkAHO9WZeRb5d9h+zVE1EeTpy9YrLjVy4+A
         b17hsExHDBkV0uRLMBX4+9m/6H2dd0kl0t1fFEakgEJ0PBoAHAUn1MJjJUSgcIZd0nkF
         S47KszlC56KAh9l7OdAg+PJEyIrQ3nH9FAhZl6Pknc5SaM8ACxb1UU13TDBYiB4Fptea
         xibA==
X-Gm-Message-State: AOJu0Ywo6/RTRZk0lmsAS1k+1V/rgxKf8+hzzRkVKpaXnE7p8aezWrKs
	6hXFp0sTu/Q8Ian2Bjt6t5c8X5cNyYkJfiQayJbZhXAfArjugw9HuQ2T1WQa0cGwFZCRqX0WlRL
	VfIE9Cx0=
X-Gm-Gg: AfdE7cmzBLMDvTrJs8v5YMh0+N/2Mm2ms6470660xVq1ycma55XbsbUTlKylIWEDckJ
	HcsECmAZdAcp03zgkdNBElRjLK5blOfya2I4KNQGlJrw1F29bnvYJjTfHqEgjV0VS0jlQOIBkR6
	7D7BmTRfLa2Vj7Y1CgCSHzs60zFTxBk73A7Hvv4jdexnagawl+jIPKYBahLrwg62D+SRDeEkMbf
	N7OWHiQ6O3bQn58F1mQuAlzDh1vFVPWRTSE7YTTJdg42SLT9Z9vU1RKAFRlPks+5B4S33kSnezB
	Y1LpYwhnRlTz8UhA+zbs5vJLpZECC9phEu0Neb+Ct6pSzrS1eA5JgddjU5LMKVDER40VfFXkFuI
	polDg6H5AFHxzG/5fB0MKxgYmPFzz2uqQItPRQQfYS6iCLQP48OF98KLvaRNPeitrOlkHNJ8n0f
	IV9AbOumSLh6TP7tAUMPTBrhSMzUxEgxS+2hRAcekMKFs54EPn/hLOZ8N+j1D+VJWzgsv4EDnyj
	TJUizg6H+rTdSUMMyJBtLu4uvns
X-Received: by 2002:a05:600c:6098:b0:493:c432:f48f with SMTP id 5b1f17b1804b1-493e68384camr63227045e9.0.1783591626422;
        Thu, 09 Jul 2026 03:07:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/25] vim: fix for CVE-2026-28421, CVE-2026-41411 & CVE-2026-44656
Date: Thu,  9 Jul 2026 12:06:27 +0200
Message-ID: <467a876ebf63823938faa946c1b8e5ec515bf40a.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240558

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]

[1] https://github.com/vim/vim/commit/65c1a143c331c886dc28888dd632708f953b4eb3
[2] https://github.com/vim/vim/commit/c78194e41d5a0b05b0ddf383b6679b1503f977fb
[3] https://github.com/vim/vim/commit/190cb3c2b9c769a3972bcfd991a7b5b6cb771ef0
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-28421
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-41411
[6] https://nvd.nist.gov/vuln/detail/CVE-2026-44656

More info :
CVE-2026-28421 - Validate block tree indices and readfile() line bounds.
CVE-2026-41411 - Disallow backticks before attempting to expand filenames.
CVE-2026-44656 - Prevent shell execution from 'path' backticks via modelines.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28421.patch            | 148 ++++++++++++++++++
 .../vim/files/CVE-2026-41411.patch            |  75 +++++++++
 .../vim/files/CVE-2026-44656.patch            | 130 +++++++++++++++
 meta/recipes-support/vim/vim.inc              |   3 +
 4 files changed, 356 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28421.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28421.patch b/meta/recipes-support/vim/files/CVE-2026-28421.patch
new file mode 100644
index 00000000000..cd3dd1d13f7
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28421.patch
@@ -0,0 +1,148 @@
+From 65c1a143c331c886dc28888dd632708f953b4eb3 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 21:42:39 +0000
+Subject: [PATCH] patch 9.2.0077: [security]: Crash when recovering a corrupted
+ swap file
+
+Problem:  memline: a crafted swap files with bogus pe_page_count/pe_bnum
+          values could cause a multi-GB allocation via mf_get(), and
+          invalid pe_old_lnum/pe_line_count values could cause a SEGV
+          when passed to readfile() (ehdgks0627, un3xploitable)
+Solution: Add bounds checks on pe_page_count and pe_bnum against
+          mf_blocknr_max before descending into the block tree, and
+          validate pe_old_lnum >= 1 and pe_line_count > 0 before calling
+          readfile().
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-r2gw-2x48-jj5p
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-28421
+Upstream-Status: Backport [https://github.com/vim/vim/commit/65c1a143c331c886dc28888dd632708f953b4eb3]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/memline.c                | 29 ++++++++++++++++++++++++++--
+ src/po/vim.pot               |  5 ++++-
+ src/testdir/test_recover.vim | 37 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 68 insertions(+), 3 deletions(-)
+
+diff --git a/src/memline.c b/src/memline.c
+index b93eb0a..15ac203 100644
+--- a/src/memline.c
++++ b/src/memline.c
+@@ -1597,8 +1597,12 @@ ml_recover(int checkext)
+ 			if (!cannot_open)
+ 			{
+ 			    line_count = pp->pb_pointer[idx].pe_line_count;
+-			    if (readfile(curbuf->b_ffname, NULL, lnum,
+-					pp->pb_pointer[idx].pe_old_lnum - 1,
++			    linenr_T pe_old_lnum = pp->pb_pointer[idx].pe_old_lnum;
++			    // Validate pe_line_count and pe_old_lnum from the
++			    // untrusted swap file before passing to readfile().
++			    if (line_count <= 0 || pe_old_lnum < 1 ||
++				    readfile(curbuf->b_ffname, NULL, lnum,
++					pe_old_lnum - 1,
+ 					line_count, NULL, 0) != OK)
+ 				cannot_open = TRUE;
+ 			    else
+@@ -1629,6 +1633,27 @@ ml_recover(int checkext)
+ 		    bnum = pp->pb_pointer[idx].pe_bnum;
+ 		    line_count = pp->pb_pointer[idx].pe_line_count;
+ 		    page_count = pp->pb_pointer[idx].pe_page_count;
++		    // Validate pe_bnum and pe_page_count from the untrusted
++		    // swap file before passing to mf_get(), which uses
++		    // page_count to calculate allocation size.  A bogus value
++		    // (e.g. 0x40000000) would cause a multi-GB allocation.
++		    // pe_page_count must be >= 1 and bnum + page_count must
++		    // not exceed the number of pages in the swap file.
++		    if (page_count < 1
++			    || bnum + page_count > mfp->mf_blocknr_max + 1)
++		    {
++			++error;
++			ml_append(lnum++,
++				(char_u *)_("???ILLEGAL BLOCK NUMBER"),
++				(colnr_T)0, TRUE);
++			// Skip this entry and pop back up the stack to keep
++			// recovering whatever else we can.
++			idx = ip->ip_index + 1;
++			bnum = ip->ip_bnum;
++			page_count = 1;
++			--buf->b_ml.ml_stack_top;
++			continue;
++		    }
+ 		    idx = 0;
+ 		    continue;
+ 		}
+diff --git a/src/po/vim.pot b/src/po/vim.pot
+index 9608271..be79cf0 100644
+--- a/src/po/vim.pot
++++ b/src/po/vim.pot
+@@ -8,7 +8,7 @@ msgid ""
+ msgstr ""
+ "Project-Id-Version: Vim\n"
+ "Report-Msgid-Bugs-To: vim-dev@vim.org\n"
+-"POT-Creation-Date: 2026-04-30 12:40+0200\n"
++"POT-Creation-Date: 2026-02-27 21:04+0000\n"
+ "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
+ "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
+ "Language-Team: LANGUAGE <LL@li.org>\n"
+@@ -1960,6 +1960,9 @@ msgstr ""
+ msgid "???LINES MISSING"
+ msgstr ""
+ 
++msgid "???ILLEGAL BLOCK NUMBER"
++msgstr ""
++
+ msgid "???BLOCK MISSING"
+ msgstr ""
+ 
+diff --git a/src/testdir/test_recover.vim b/src/testdir/test_recover.vim
+index db59223..93425f1 100644
+--- a/src/testdir/test_recover.vim
++++ b/src/testdir/test_recover.vim
+@@ -471,4 +471,41 @@ func Test_noname_buffer()
+   call assert_equal(['one', 'two'], getline(1, '$'))
+ endfunc
+ 
++" Test for recovering a corrupted swap file, those caused a crash
++func Test_recover_corrupted_swap_file1()
++  CheckUnix
++  " only works correctly on 64bit Unix systems:
++  if v:sizeoflong != 8 || !has('unix')
++    throw 'Skipped: Corrupt Swap file sample requires a 64bit Unix build'
++  endif
++  " Test 1: Heap buffer-overflow
++  new
++  let sample = 'samples/recover-crash1.swp'
++  let target = 'Xpoc1.swp'
++  call filecopy(sample, target)
++  try
++    sil recover! Xpoc1
++  catch /^Vim\%((\S\+)\)\=:E1364:/
++  endtry
++  let content = getline(1, '$')->join()
++  call assert_match('???ILLEGAL BLOCK NUMBER', content)
++  call delete(target)
++  bw!
++"
++"  " Test 2: Segfault
++  new
++  let sample = 'samples/recover-crash2.swp'
++  let target = 'Xpoc2.swp'
++  call filecopy(sample, target)
++  try
++    sil recover! Xpoc2
++  catch /^Vim\%((\S\+)\)\=:E1364:/
++  endtry
++  let content = getline(1, '$')->join()
++  call assert_match('???ILLEGAL BLOCK NUMBER', content)
++  call assert_match('???LINES MISSING', content)
++  call delete(target)
++  bw!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-41411.patch b/meta/recipes-support/vim/files/CVE-2026-41411.patch
new file mode 100644
index 00000000000..11a34f4087f
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-41411.patch
@@ -0,0 +1,75 @@
+From c78194e41d5a0b05b0ddf383b6679b1503f977fb Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Wed, 15 Apr 2026 20:17:17 +0000
+Subject: [PATCH] patch 9.2.0357: [security]: command injection via backticks
+ in tag files
+
+Problem:  [security]: command injection via backticks in tag files
+          (Srinivas Piskala Ganesh Babu, Andy Ngo)
+Solution: Disallow backticks before attempting to expand filenames.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-cwgx-gcj7-6qh8
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-41411
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c78194e41d5a0b05b0ddf383b6679b1503f977fb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/tag.c                    |  4 +++-
+ src/testdir/test_tagjump.vim | 22 ++++++++++++++++++++++
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/src/tag.c b/src/tag.c
+index d3a7399..0e203f0 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -4126,8 +4126,10 @@ expand_tag_fname(char_u *fname, char_u *tag_fname, int expand)
+ 
+     /*
+      * Expand file name (for environment variables) when needed.
++     * Disallow backticks, they could execute arbitrary shell
++     * commands.  This is not needed for tag filenames.
+      */
+-    if (expand && mch_has_wildcard(fname))
++    if (expand && mch_has_wildcard(fname) && vim_strchr(fname, '`') == NULL)
+     {
+ 	ExpandInit(&xpc);
+ 	xpc.xp_context = EXPAND_FILES;
+diff --git a/src/testdir/test_tagjump.vim b/src/testdir/test_tagjump.vim
+index 47618d0..a95b8b5 100644
+--- a/src/testdir/test_tagjump.vim
++++ b/src/testdir/test_tagjump.vim
+@@ -1670,4 +1670,26 @@ func Test_tag_excmd_with_number_vim9script()
+   bwipe!
+ endfunc
+ 
++" Test that backtick expressions in tag filenames are not expanded.
++" This prevents command injection via malicious tags files.
++func Test_tag_backtick_filename_not_expanded()
++  let pwned_file = 'Xtags_pwnd'
++  call assert_false(filereadable(pwned_file))
++
++  let tagline = "main\t`touch " .. pwned_file .. "`\t/^int main/;\"\tf"
++  call writefile([tagline], 'Xbt_tags', 'D')
++  call writefile(['int main(int argc, char **argv) {', '}'], 'Xbt_main.c', 'D')
++
++  set tags=Xbt_tags
++  sp Xbt_main.c
++
++  " The :tag command should fail to find the file, but must NOT execute
++  " the backtick shell command.
++  call assert_fails('tag main', 'E429:')
++  call assert_false(filereadable(pwned_file))
++
++  set tags&
++  bwipe!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-44656.patch b/meta/recipes-support/vim/files/CVE-2026-44656.patch
new file mode 100644
index 00000000000..70cd72b098b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-44656.patch
@@ -0,0 +1,130 @@
+From 190cb3c2b9c769a3972bcfd991a7b5b6cb771ef0 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 3 May 2026 16:10:03 +0000
+Subject: [PATCH] patch 9.2.0435: [security]: backticks in 'path' may cause
+ shell execution on completion
+
+Problem:  [security]: Backticks enclosed shell commands in the 'path'
+          option value are executed during completion (q1uf3ng).
+Solution: Skip path entries containing backticks, add P_SECURE to 'path'
+          option, so that it cannot be set from a modeline (for symmetry with
+          the 'cdpath' option)
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-hwg5-3cxw-wvvg
+
+Supported by AI.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-44656
+Upstream-Status: Backport [https://github.com/vim/vim/commit/190cb3c2b9c769a3972bcfd991a7b5b6cb771ef0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/doc/options.txt            |  5 ++++-
+ src/findfile.c                     |  4 ++++
+ src/optiondefs.h                   |  2 +-
+ src/testdir/test_find_complete.vim | 17 +++++++++++++++++
+ src/testdir/test_modeline.vim      | 14 ++++++++++++++
+ 5 files changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/doc/options.txt b/runtime/doc/options.txt
+index 8dba6f4..d06411f 100644
+--- a/runtime/doc/options.txt
++++ b/runtime/doc/options.txt
+@@ -1,4 +1,4 @@
+-*options.txt*	For Vim version 9.1.  Last change: 2025 Aug 23
++*options.txt*	For Vim version 9.2.  Last change: 2026 May 03
+ 
+ 
+ 		  VIM REFERENCE MANUAL	  by Bram Moolenaar
+@@ -6615,6 +6615,9 @@ A jump table for the options with a short description can be found at |Q_op|.
+ <	Replace the ';' with a ':' or whatever separator is used.  Note that
+ 	this doesn't work when $INCL contains a comma or white space.
+ 
++	This option cannot be set from a |modeline| or in the |sandbox|, for
++	security reasons.
++
+ 						*'perldll'*
+ 'perldll'		string	(default depends on the build)
+ 			global
+diff --git a/src/findfile.c b/src/findfile.c
+index 008338c..f73a66b 100644
+--- a/src/findfile.c
++++ b/src/findfile.c
+@@ -2412,6 +2412,10 @@ expand_path_option(
+     {
+ 	buflen = copy_option_part(&path_option, buf, MAXPATHL, " ,");
+ 
++	// do not expand backticks, could have been set via a modeline
++	if (vim_strchr(buf, '`') != NULL)
++	    continue;
++
+ 	if (buf[0] == '.' && (buf[1] == NUL || vim_ispathsep(buf[1])))
+ 	{
+ 	    size_t  plen;
+diff --git a/src/optiondefs.h b/src/optiondefs.h
+index bd02d04..72d3f36 100644
+--- a/src/optiondefs.h
++++ b/src/optiondefs.h
+@@ -1957,7 +1957,7 @@ static struct vimoption options[] =
+ 			    (char_u *)&p_pm, PV_NONE,
+ 			    did_set_backupext_or_patchmode, NULL,
+ 			    {(char_u *)"", (char_u *)0L} SCTX_INIT},
+-    {"path",	    "pa",   P_STRING|P_EXPAND|P_VI_DEF|P_COMMA|P_NODUP,
++    {"path",	    "pa",   P_STRING|P_EXPAND|P_VI_DEF|P_SECURE|P_COMMA|P_NODUP,
+ 			    (char_u *)&p_path, PV_PATH, NULL, NULL,
+ 			    {
+ #if defined(AMIGA) || defined(MSWIN)
+diff --git a/src/testdir/test_find_complete.vim b/src/testdir/test_find_complete.vim
+index 079fb78..8b8b71c 100644
+--- a/src/testdir/test_find_complete.vim
++++ b/src/testdir/test_find_complete.vim
+@@ -161,4 +161,21 @@ func Test_find_complete()
+   set path&
+ endfunc
+ 
++" Verify that backticks in 'path' are not executed
++func Test_find_completion_backtick_in_path()
++  CheckUnix
++  CheckExecutable id
++
++  new Xpoc.c
++  setl path+=`id>Xrce_marker`
++  " Triggering completion must not execute the backtick command.
++  call getcompletion('', 'file_in_path')
++  call assert_false(filereadable('Xrce_marker'))
++  call feedkeys(":find \t\n", "xt")
++  call assert_false(filereadable('Xrce_marker'))
++
++  bwipe!
++  call delete('Xrce_marker')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/testdir/test_modeline.vim b/src/testdir/test_modeline.vim
+index c00032b..fc11cc6 100644
+--- a/src/testdir/test_modeline.vim
++++ b/src/testdir/test_modeline.vim
+@@ -386,4 +386,18 @@ func Test_modeline_forbidden()
+   bw!
+ endfunc
+ 
++" Verify that backticks in 'path' set from a modeline are not executed
++func Test_path_modeline()
++  let lines =<< trim END
++    // vim: set path+=foobar :
++  END
++  call writefile(lines, 'Xpoc.c', 'D')
++
++  set nomodelinestrict modeline
++  call assert_fails('split Xpoc.c', 'E520:')
++
++  bwipe!
++  set modelinestrict& modeline&
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e9b5df291d2..b7cdd61c93e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -25,6 +25,9 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-34982.patch \
            file://CVE-2026-34714.patch \
            file://CVE-2026-35177.patch \
+           file://CVE-2026-44656.patch \
+           file://CVE-2026-41411.patch \
+           file://CVE-2026-28421.patch \
            "
 
 PV .= ".1683"

