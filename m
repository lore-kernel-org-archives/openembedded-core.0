Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A82CC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 22:14:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45242.1782512081832820378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 15:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iN7xn+6N;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so16480675e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782512080; x=1783116880; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtQMj2D/3ga/TZiH7lDJZ5Od654au03Q6wN/D+wYANw=;
        b=iN7xn+6Nzu/CdJ3zaYhkdIwnCY8NO1UDaTNGBXYOVOwDksoDH+IJnYz4QopgVQKhv4
         DD/mxjzY67rkPaFv4s5T9o67+rTL6kbfi0Omm8dbTcxFznj/RdLWkQGxVdghxQDk66yV
         oUPltb0VA+M9ku27KVqM5aCgwfnQiiBS+rb64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782512080; x=1783116880;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtQMj2D/3ga/TZiH7lDJZ5Od654au03Q6wN/D+wYANw=;
        b=BJUPM8Zl1WsIqHknjj+IBbuwRcedQ2AwS8eTFnhmFmQDhvpI0l0+eQA/r2GlnktPm7
         +CceiAfglqW17ZajpnVXNz1K9yiaAMjyqX4Qpwmh/oOD/UC72OPfK46OPjjlWkn2sRQg
         O6//XFHLZ2yxALk7JxnbT337T4IWmq2BC+yv2ib9/upwZ155nob3M0BQpgaVES5BwN6t
         fkMTcng+1lWED5DvS0TBUpakIP0NRG5PAH0rVrXjA2gnPxT8VZ1fQmNyUOELK1jrjOhJ
         9C5dYW24u9cbjupvNcExO/l7jaPBCk35Ix1avgkRtQmQiCMwA14Ll5o1s24x1esPxH5c
         g9vg==
X-Forwarded-Encrypted: i=1; AFNElJ/17Ha0caZM+vQ7TbVFrP6DwA8DkHNGklQ2vJ7iUnND9lOXkbr4VQCSmWELEbd1Wj64KxPkJEgSx9aUlwhgtIFhDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMUhXDRuzC8KTz1KUWGJ43JpNbL7asM373CMY2thJWy/jLdFOq
	6+iIyazx4APMMwqAHxd8hDxFLf0ohnEUr3snfzDKbRFaG8q06kUGjlxzGJ/fW3ggMZE=
X-Gm-Gg: AfdE7ckm2x9GP7WIQEgBsAnLFrEUTVWcaO9CSvY6m1JbyNXfB5+2HJass8XY8gXvjoo
	usXxplAWp4lC0ATKTQ/b1ja0gUJRaKdPS3N3Oljy0UvB1PHmXqMGLLgLR+bfEBPlfOn/8yTY2eE
	GB1FgolHyiP6jb4vaiBCMZc759Tt3KN+dLEL6eSNqNXtZMTnGsnojLJ/7TNkGVRlvMt7xTVWv8u
	VQXdLFQfxeNOmkLkETgYNns5KHcQHsXOKVXJqmsqbykfuAV0SZ3pftuynh/Mo+GnEl5hahe9Ugv
	8yxztOhE3u8hB43bd5Bf1upZ8vvstRT6DDfMhVjMGXMwojZcauTt7hpIUqYTBPTI2ipZxJ2yQtW
	e14a/BgbRfb12+AHki/YLVetwS0UHejOWpurLirkkwT8Acf+6L+romabzDmBP8kaaNTE0CRyYif
	aXWq0oqwLmTPpTAFy5hYOYJ22++cpTDs3EU6VYDxj47Pmhp/pKwLhmjzPWaI1v22F3Knr8i+BXl
	+592/6wf0mmnfX0
X-Received: by 2002:a05:600c:3587:b0:492:4871:7e21 with SMTP id 5b1f17b1804b1-4926641b4c3mr100449095e9.10.1782512079704;
        Fri, 26 Jun 2026 15:14:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269086ab7sm155088585e9.13.2026.06.26.15.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:14:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 00:14:38 +0200
Message-Id: <DJJBSOD5OELC.1H1HZF4N5OIU0@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] vim: fix for CVE-2026-28421,
 CVE-2026-41411 & CVE-2026-44656
X-Mailer: aerc 0.20.0
References: <20260619090142.386553-1-hprajapati@mvista.com>
In-Reply-To: <20260619090142.386553-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 22:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239664

On Fri Jun 19, 2026 at 11:01 AM CEST, Hitendra Prajapati via lists.openembe=
dded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]
>
> [1] https://github.com/vim/vim/commit/65c1a143c331c886dc28888dd632708f953=
b4eb3
> [2] https://github.com/vim/vim/commit/c78194e41d5a0b05b0ddf383b6679b1503f=
977fb
> [3] https://github.com/vim/vim/commit/190cb3c2b9c769a3972bcfd991a7b5b6cb7=
71ef0
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-28421
> [5] https://nvd.nist.gov/vuln/detail/CVE-2026-41411

Hello,

As fas as I can tell, CVE-2026-41411 also impacts wrynose. Can you check
that for each scarthgap CVE to fix there is also a fix for master AND
wrynose?

Can you send a fix for wrynose and then, ping back here please?

Thanks!

> [6] https://nvd.nist.gov/vuln/detail/CVE-2026-44656
>
> More info :
> CVE-2026-28421 - Validate block tree indices and readfile() line bounds.
> CVE-2026-41411 - Disallow backticks before attempting to expand filenames=
.
> CVE-2026-44656 - Prevent shell execution from 'path' backticks via modeli=
nes.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-28421.patch            | 148 ++++++++++++++++++
>  .../vim/files/CVE-2026-41411.patch            |  75 +++++++++
>  .../vim/files/CVE-2026-44656.patch            | 130 +++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   3 +
>  4 files changed, 356 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28421.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-28421.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-28421.patch
> new file mode 100644
> index 0000000000..8739212da2
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-28421.patch
> @@ -0,0 +1,148 @@
> +From 65c1a143c331c886dc28888dd632708f953b4eb3 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Mon, 23 Feb 2026 21:42:39 +0000
> +Subject: [PATCH] patch 9.2.0077: [security]: Crash when recovering a cor=
rupted
> + swap file
> +
> +Problem:  memline: a crafted swap files with bogus pe_page_count/pe_bnum
> +          values could cause a multi-GB allocation via mf_get(), and
> +          invalid pe_old_lnum/pe_line_count values could cause a SEGV
> +          when passed to readfile() (ehdgks0627, un3xploitable)
> +Solution: Add bounds checks on pe_page_count and pe_bnum against
> +          mf_blocknr_max before descending into the block tree, and
> +          validate pe_old_lnum >=3D 1 and pe_line_count > 0 before calli=
ng
> +          readfile().
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-r2gw-2x48-jj5p
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-28421
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/65c1a1=
43c331c886dc28888dd632708f953b4eb3]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/memline.c                | 29 ++++++++++++++++++++++++++--
> + src/po/vim.pot               |  5 ++++-
> + src/testdir/test_recover.vim | 37 ++++++++++++++++++++++++++++++++++++
> + 3 files changed, 68 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/memline.c b/src/memline.c
> +index b93eb0a..15ac203 100644
> +--- a/src/memline.c
> ++++ b/src/memline.c
> +@@ -1597,8 +1597,12 @@ ml_recover(int checkext)
> + 			if (!cannot_open)
> + 			{
> + 			    line_count =3D pp->pb_pointer[idx].pe_line_count;
> +-			    if (readfile(curbuf->b_ffname, NULL, lnum,
> +-					pp->pb_pointer[idx].pe_old_lnum - 1,
> ++			    linenr_T pe_old_lnum =3D pp->pb_pointer[idx].pe_old_lnum;
> ++			    // Validate pe_line_count and pe_old_lnum from the
> ++			    // untrusted swap file before passing to readfile().
> ++			    if (line_count <=3D 0 || pe_old_lnum < 1 ||
> ++				    readfile(curbuf->b_ffname, NULL, lnum,
> ++					pe_old_lnum - 1,
> + 					line_count, NULL, 0) !=3D OK)
> + 				cannot_open =3D TRUE;
> + 			    else
> +@@ -1629,6 +1633,27 @@ ml_recover(int checkext)
> + 		    bnum =3D pp->pb_pointer[idx].pe_bnum;
> + 		    line_count =3D pp->pb_pointer[idx].pe_line_count;
> + 		    page_count =3D pp->pb_pointer[idx].pe_page_count;
> ++		    // Validate pe_bnum and pe_page_count from the untrusted
> ++		    // swap file before passing to mf_get(), which uses
> ++		    // page_count to calculate allocation size.  A bogus value
> ++		    // (e.g. 0x40000000) would cause a multi-GB allocation.
> ++		    // pe_page_count must be >=3D 1 and bnum + page_count must
> ++		    // not exceed the number of pages in the swap file.
> ++		    if (page_count < 1
> ++			    || bnum + page_count > mfp->mf_blocknr_max + 1)
> ++		    {
> ++			++error;
> ++			ml_append(lnum++,
> ++				(char_u *)_("???ILLEGAL BLOCK NUMBER"),
> ++				(colnr_T)0, TRUE);
> ++			// Skip this entry and pop back up the stack to keep
> ++			// recovering whatever else we can.
> ++			idx =3D ip->ip_index + 1;
> ++			bnum =3D ip->ip_bnum;
> ++			page_count =3D 1;
> ++			--buf->b_ml.ml_stack_top;
> ++			continue;
> ++		    }
> + 		    idx =3D 0;
> + 		    continue;
> + 		}
> +diff --git a/src/po/vim.pot b/src/po/vim.pot
> +index 9608271..be79cf0 100644
> +--- a/src/po/vim.pot
> ++++ b/src/po/vim.pot
> +@@ -8,7 +8,7 @@ msgid ""
> + msgstr ""
> + "Project-Id-Version: Vim\n"
> + "Report-Msgid-Bugs-To: vim-dev@vim.org\n"
> +-"POT-Creation-Date: 2026-04-30 12:40+0200\n"
> ++"POT-Creation-Date: 2026-02-27 21:04+0000\n"
> + "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
> + "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
> + "Language-Team: LANGUAGE <LL@li.org>\n"
> +@@ -1960,6 +1960,9 @@ msgstr ""
> + msgid "???LINES MISSING"
> + msgstr ""
> +=20
> ++msgid "???ILLEGAL BLOCK NUMBER"
> ++msgstr ""
> ++
> + msgid "???BLOCK MISSING"
> + msgstr ""
> +=20
> +diff --git a/src/testdir/test_recover.vim b/src/testdir/test_recover.vim
> +index db59223..93425f1 100644
> +--- a/src/testdir/test_recover.vim
> ++++ b/src/testdir/test_recover.vim
> +@@ -471,4 +471,41 @@ func Test_noname_buffer()
> +   call assert_equal(['one', 'two'], getline(1, '$'))
> + endfunc
> +=20
> ++" Test for recovering a corrupted swap file, those caused a crash
> ++func Test_recover_corrupted_swap_file1()
> ++  CheckUnix
> ++  " only works correctly on 64bit Unix systems:
> ++  if v:sizeoflong !=3D 8 || !has('unix')
> ++    throw 'Skipped: Corrupt Swap file sample requires a 64bit Unix buil=
d'
> ++  endif
> ++  " Test 1: Heap buffer-overflow
> ++  new
> ++  let sample =3D 'samples/recover-crash1.swp'
> ++  let target =3D 'Xpoc1.swp'
> ++  call filecopy(sample, target)
> ++  try
> ++    sil recover! Xpoc1
> ++  catch /^Vim\%((\S\+)\)\=3D:E1364:/
> ++  endtry
> ++  let content =3D getline(1, '$')->join()
> ++  call assert_match('???ILLEGAL BLOCK NUMBER', content)
> ++  call delete(target)
> ++  bw!
> ++"
> ++"  " Test 2: Segfault
> ++  new
> ++  let sample =3D 'samples/recover-crash2.swp'
> ++  let target =3D 'Xpoc2.swp'
> ++  call filecopy(sample, target)
> ++  try
> ++    sil recover! Xpoc2
> ++  catch /^Vim\%((\S\+)\)\=3D:E1364:/
> ++  endtry
> ++  let content =3D getline(1, '$')->join()
> ++  call assert_match('???ILLEGAL BLOCK NUMBER', content)
> ++  call assert_match('???LINES MISSING', content)
> ++  call delete(target)
> ++  bw!
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-41411.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-41411.patch
> new file mode 100644
> index 0000000000..85139dc1f6
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-41411.patch
> @@ -0,0 +1,75 @@
> +From c78194e41d5a0b05b0ddf383b6679b1503f977fb Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Wed, 15 Apr 2026 20:17:17 +0000
> +Subject: [PATCH] patch 9.2.0357: [security]: command injection via backt=
icks
> + in tag files
> +
> +Problem:  [security]: command injection via backticks in tag files
> +          (Srinivas Piskala Ganesh Babu, Andy Ngo)
> +Solution: Disallow backticks before attempting to expand filenames.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-cwgx-gcj7-6qh8
> +
> +Supported by AI
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-41411
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/c78194=
e41d5a0b05b0ddf383b6679b1503f977fb]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/tag.c                    |  4 +++-
> + src/testdir/test_tagjump.vim | 22 ++++++++++++++++++++++
> + 2 files changed, 25 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/tag.c b/src/tag.c
> +index d3a7399..0e203f0 100644
> +--- a/src/tag.c
> ++++ b/src/tag.c
> +@@ -4126,8 +4126,10 @@ expand_tag_fname(char_u *fname, char_u *tag_fname=
, int expand)
> +=20
> +     /*
> +      * Expand file name (for environment variables) when needed.
> ++     * Disallow backticks, they could execute arbitrary shell
> ++     * commands.  This is not needed for tag filenames.
> +      */
> +-    if (expand && mch_has_wildcard(fname))
> ++    if (expand && mch_has_wildcard(fname) && vim_strchr(fname, '`') =3D=
=3D NULL)
> +     {
> + 	ExpandInit(&xpc);
> + 	xpc.xp_context =3D EXPAND_FILES;
> +diff --git a/src/testdir/test_tagjump.vim b/src/testdir/test_tagjump.vim
> +index 47618d0..a95b8b5 100644
> +--- a/src/testdir/test_tagjump.vim
> ++++ b/src/testdir/test_tagjump.vim
> +@@ -1670,4 +1670,26 @@ func Test_tag_excmd_with_number_vim9script()
> +   bwipe!
> + endfunc
> +=20
> ++" Test that backtick expressions in tag filenames are not expanded.
> ++" This prevents command injection via malicious tags files.
> ++func Test_tag_backtick_filename_not_expanded()
> ++  let pwned_file =3D 'Xtags_pwnd'
> ++  call assert_false(filereadable(pwned_file))
> ++
> ++  let tagline =3D "main\t`touch " .. pwned_file .. "`\t/^int main/;\"\t=
f"
> ++  call writefile([tagline], 'Xbt_tags', 'D')
> ++  call writefile(['int main(int argc, char **argv) {', '}'], 'Xbt_main.=
c', 'D')
> ++
> ++  set tags=3DXbt_tags
> ++  sp Xbt_main.c
> ++
> ++  " The :tag command should fail to find the file, but must NOT execute
> ++  " the backtick shell command.
> ++  call assert_fails('tag main', 'E429:')
> ++  call assert_false(filereadable(pwned_file))
> ++
> ++  set tags&
> ++  bwipe!
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-44656.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-44656.patch
> new file mode 100644
> index 0000000000..57278c08da
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-44656.patch
> @@ -0,0 +1,130 @@
> +From 190cb3c2b9c769a3972bcfd991a7b5b6cb771ef0 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Sun, 3 May 2026 16:10:03 +0000
> +Subject: [PATCH] patch 9.2.0435: [security]: backticks in 'path' may cau=
se
> + shell execution on completion
> +
> +Problem:  [security]: Backticks enclosed shell commands in the 'path'
> +          option value are executed during completion (q1uf3ng).
> +Solution: Skip path entries containing backticks, add P_SECURE to 'path'
> +          option, so that it cannot be set from a modeline (for symmetry=
 with
> +          the 'cdpath' option)
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-hwg5-3cxw-wvvg
> +
> +Supported by AI.
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-44656
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/190cb3=
c2b9c769a3972bcfd991a7b5b6cb771ef0]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/doc/options.txt            |  5 ++++-
> + src/findfile.c                     |  4 ++++
> + src/optiondefs.h                   |  2 +-
> + src/testdir/test_find_complete.vim | 17 +++++++++++++++++
> + src/testdir/test_modeline.vim      | 14 ++++++++++++++
> + 5 files changed, 40 insertions(+), 2 deletions(-)
> +
> +diff --git a/runtime/doc/options.txt b/runtime/doc/options.txt
> +index 8dba6f4..d06411f 100644
> +--- a/runtime/doc/options.txt
> ++++ b/runtime/doc/options.txt
> +@@ -1,4 +1,4 @@
> +-*options.txt*	For Vim version 9.1.  Last change: 2025 Aug 23
> ++*options.txt*	For Vim version 9.2.  Last change: 2026 May 03
> +=20
> +=20
> + 		  VIM REFERENCE MANUAL	  by Bram Moolenaar
> +@@ -6615,6 +6615,9 @@ A jump table for the options with a short descript=
ion can be found at |Q_op|.
> + <	Replace the ';' with a ':' or whatever separator is used.  Note that
> + 	this doesn't work when $INCL contains a comma or white space.
> +=20
> ++	This option cannot be set from a |modeline| or in the |sandbox|, for
> ++	security reasons.
> ++
> + 						*'perldll'*
> + 'perldll'		string	(default depends on the build)
> + 			global
> +diff --git a/src/findfile.c b/src/findfile.c
> +index 008338c..f73a66b 100644
> +--- a/src/findfile.c
> ++++ b/src/findfile.c
> +@@ -2412,6 +2412,10 @@ expand_path_option(
> +     {
> + 	buflen =3D copy_option_part(&path_option, buf, MAXPATHL, " ,");
> +=20
> ++	// do not expand backticks, could have been set via a modeline
> ++	if (vim_strchr(buf, '`') !=3D NULL)
> ++	    continue;
> ++
> + 	if (buf[0] =3D=3D '.' && (buf[1] =3D=3D NUL || vim_ispathsep(buf[1])))
> + 	{
> + 	    size_t  plen;
> +diff --git a/src/optiondefs.h b/src/optiondefs.h
> +index bd02d04..72d3f36 100644
> +--- a/src/optiondefs.h
> ++++ b/src/optiondefs.h
> +@@ -1957,7 +1957,7 @@ static struct vimoption options[] =3D
> + 			    (char_u *)&p_pm, PV_NONE,
> + 			    did_set_backupext_or_patchmode, NULL,
> + 			    {(char_u *)"", (char_u *)0L} SCTX_INIT},
> +-    {"path",	    "pa",   P_STRING|P_EXPAND|P_VI_DEF|P_COMMA|P_NODUP,
> ++    {"path",	    "pa",   P_STRING|P_EXPAND|P_VI_DEF|P_SECURE|P_COMMA|P_=
NODUP,
> + 			    (char_u *)&p_path, PV_PATH, NULL, NULL,
> + 			    {
> + #if defined(AMIGA) || defined(MSWIN)
> +diff --git a/src/testdir/test_find_complete.vim b/src/testdir/test_find_=
complete.vim
> +index 079fb78..8b8b71c 100644
> +--- a/src/testdir/test_find_complete.vim
> ++++ b/src/testdir/test_find_complete.vim
> +@@ -161,4 +161,21 @@ func Test_find_complete()
> +   set path&
> + endfunc
> +=20
> ++" Verify that backticks in 'path' are not executed
> ++func Test_find_completion_backtick_in_path()
> ++  CheckUnix
> ++  CheckExecutable id
> ++
> ++  new Xpoc.c
> ++  setl path+=3D`id>Xrce_marker`
> ++  " Triggering completion must not execute the backtick command.
> ++  call getcompletion('', 'file_in_path')
> ++  call assert_false(filereadable('Xrce_marker'))
> ++  call feedkeys(":find \t\n", "xt")
> ++  call assert_false(filereadable('Xrce_marker'))
> ++
> ++  bwipe!
> ++  call delete('Xrce_marker')
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +diff --git a/src/testdir/test_modeline.vim b/src/testdir/test_modeline.v=
im
> +index c00032b..fc11cc6 100644
> +--- a/src/testdir/test_modeline.vim
> ++++ b/src/testdir/test_modeline.vim
> +@@ -386,4 +386,18 @@ func Test_modeline_forbidden()
> +   bw!
> + endfunc
> +=20
> ++" Verify that backticks in 'path' set from a modeline are not executed
> ++func Test_path_modeline()
> ++  let lines =3D<< trim END
> ++    // vim: set path+=3Dfoobar :
> ++  END
> ++  call writefile(lines, 'Xpoc.c', 'D')
> ++
> ++  set nomodelinestrict modeline
> ++  call assert_fails('split Xpoc.c', 'E520:')
> ++
> ++  bwipe!
> ++  set modelinestrict& modeline&
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 0b7a831eed..3a988fbe7d 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -25,6 +25,9 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://CVE-2026-34714.patch \
>             file://CVE-2026-39881.patch \
>             file://CVE-2026-35177.patch \
> +           file://CVE-2026-44656.patch \
> +           file://CVE-2026-41411.patch \
> +           file://CVE-2026-28421.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


