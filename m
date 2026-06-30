Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF21BC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 04:43:05 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14126.1782794578949244308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 21:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=c8p8HmHH;
 spf=pass (domain: mvista.com, ip: 74.125.82.177, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so7929194eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 21:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782794578; x=1783399378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kec7xpznYGHsXApFlOi+gAKUhbzwfxwEkKKHZ9YIOg=;
        b=c8p8HmHHUXniMNAnxAbm4uoD+uQsWOVb1HohFm+HKn9WS28eYmAPiKaYyMx5uDJtrm
         usPFYewvZHngMaTVqDvdP888+8JYbVYuppyqGk9BvyICyvLKdk6+A2cCWD65oF42FBhb
         vzz4Mj9GZXCYZrBLZhaSiSTbHyFDoF0cDo4Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782794578; x=1783399378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Kec7xpznYGHsXApFlOi+gAKUhbzwfxwEkKKHZ9YIOg=;
        b=byJd6V+nVv1HtZSkfYTuXu6/QvqJvwupo2KOMgbXpHne3CoZgqolYwVNufrHOf1XYL
         rGvcw4+tLQzM+2/yingQ1Q1y+BAXfpoO/+0bl8W1dYcloR85QopV6Lf2KWcPmaJG6+gk
         29Hm/5Y9PLHVVNvCaZuh0qeRj8UoSOAuuq9zHq/ZaaTpGwRWoOdAUXHTIMD7ZkbAtvil
         T8QhS205icNaaDYg1onHEPmHYHD9CGfqcaPo8b0gkIQfVRNfZMNfPLMXR0dvYEXTVW0s
         qceXn4c7LsABvP4zlGgRpNaPbCelt70SCkTUKLzbXONS23MpY5bP7pa8lGH4iHOUni3Q
         KBgg==
X-Gm-Message-State: AOJu0YyMAatXPWbG3pShtMaDqYGhmVjV0p0EqNAVd+MrPlgiFFdEn86p
	zxrboS0IMIIDNQGb4IcJASnkViOywFwLGn23jlfjZmiqV4I1P5F8xKwbzjBC5fLEiaRZhT8w/L/
	9UxgFgN4=
X-Gm-Gg: AfdE7cm95qEm1pjxl5YU4CSu+cPX03jYMpcncAdPHWMW/yR0VSbOdElEspZ5sbuJThO
	bmELg8rTz5dv6b6SV9C7eyNU3xJg/Ph3cbTnogwgMZdbP46e5eWXQeRh4mEUaKX+WPOXHRxqo+j
	iMqVaxoJZd9oZ3hUnV8Xz9sCpqS3Q2AEP4FWr2HNt8TMcwlCIQvqKrYX+VPD5b0X4GUU5USJh5M
	bKZxx2qh5CY1bXrL9iaIGvP55vIjeFJEqCUk4WHMG7nRzjKcEcx7eUZkXkSoCEDOO7YvSUxh+IP
	6s3LcZDJwc2eOrVAMYiZIDKqhECsyZTmsUuRUcvCbVrcJYKzU7Aw1VMjkFkGz+xCCnxnPJ6J5if
	/SrczkD7+cnCdHjBCocAK3bYRFHM+HRCkUmJK/gws2I9kQADkJJBIaOAvSZ2ER8HXgeq1yk2mdg
	qGp54Kidnn6MKytSHgTjBavsFuA1BJXLI5NnsB
X-Received: by 2002:a05:7301:578a:b0:30b:f73f:ff6e with SMTP id 5a478bee46e88-30ee11fc7c0mr1365127eec.11.1782794578156;
        Mon, 29 Jun 2026 21:42:58 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3168af7sm4851047eec.19.2026.06.29.21.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:42:57 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 1/3] vim: fix for CVE-2026-41411 & CVE-2026-44656
Date: Tue, 30 Jun 2026 10:12:42 +0530
Message-ID: <20260630044249.12023-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 04:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239833

Pick patch from [1] & [2] also mentioned at NVD report in [3] & [4]

[1] https://github.com/vim/vim/commit/c78194e41d5a0b05b0ddf383b6679b1503f977fb
[2] https://github.com/vim/vim/commit/190cb3c2b9c769a3972bcfd991a7b5b6cb771ef0
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-41411
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-44656

More info :
CVE-2026-41411 - Disallow backticks before attempting to expand filenames.
CVE-2026-44656 - Prevent shell execution from 'path' backticks via modelines.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-41411.patch            |  75 +++++++++++
 .../vim/files/CVE-2026-44656.patch            | 124 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 3 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-41411.patch b/meta/recipes-support/vim/files/CVE-2026-41411.patch
new file mode 100644
index 0000000000..13d613c204
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
+index d3e27e6023..0f12e384b5 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -4137,8 +4137,10 @@ expand_tag_fname(char_u *fname, char_u *tag_fname, int expand)
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
+index bbab3c70e8..c0fa7b02e6 100644
+--- a/src/testdir/test_tagjump.vim
++++ b/src/testdir/test_tagjump.vim
+@@ -1693,4 +1693,26 @@ func Test_tag_excmd_with_number_vim9script()
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
index 0000000000..971e4c145b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-44656.patch
@@ -0,0 +1,124 @@
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
+ runtime/doc/options.txt            |  3 +++
+ src/findfile.c                     |  4 ++++
+ src/optiondefs.h                   |  2 +-
+ src/testdir/test_find_complete.vim | 17 +++++++++++++++++
+ src/testdir/test_modeline.vim      | 14 ++++++++++++++
+ 5 files changed, 39 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/doc/options.txt b/runtime/doc/options.txt
+index f083d6ff10..8a4d782262 100644
+--- a/runtime/doc/options.txt
++++ b/runtime/doc/options.txt
+@@ -6750,6 +6750,9 @@ A jump table for the options with a short description can be found at |Q_op|.
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
+index 0c5d1cf252..fccbc05a76 100644
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
+index a5e1fe99df..dac06119fc 100644
+--- a/src/optiondefs.h
++++ b/src/optiondefs.h
+@@ -1954,7 +1954,7 @@ static struct vimoption options[] =
+ 			    (char_u *)&p_pm, PV_NONE,
+ 			    did_set_backupext_or_patchmode, NULL,
+ 			    {(char_u *)"", (char_u *)0L} SCTX_INIT},
+-    {"path",	    "pa",   P_STRING|P_EXPAND|P_VI_DEF|P_COMMA|P_NODUP,
++    {"path",	    "pa",   P_STRING|P_EXPAND|P_VI_DEF|P_SECURE|P_COMMA|P_NODUP,
+ 			    (char_u *)&p_path, PV_PATH, NULL, NULL,
+ 			    {
+ #if defined(AMIGA) || defined(MSWIN)
+diff --git a/src/testdir/test_find_complete.vim b/src/testdir/test_find_complete.vim
+index 079fb78043..8b8b71c303 100644
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
+index 79fc7d14d5..20fb7e0677 100644
+--- a/src/testdir/test_modeline.vim
++++ b/src/testdir/test_modeline.vim
+@@ -493,4 +493,18 @@ func Test_modeline_nowrap_lcs_extends()
+   set equalalways&
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
index d6fdf45706..efd24650f4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-44656.patch \
+           file://CVE-2026-41411.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


