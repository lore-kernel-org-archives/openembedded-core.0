Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92724C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 22:10:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45424.1782511819062972530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 15:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AZARG+Gl;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46cdcec58c2so1338509f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782511817; x=1783116617; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh5zXXXkPS2NsWhIFpAScqkoO/5xfUHluX6eR3kwOFE=;
        b=AZARG+GloA6HmlVVGNphAJQZCYZ6i8EwQWMG/1Z5ZtIK1D5fZ2MBSRmw7Hr6+OUIsz
         Ed2yELx8gmz4YVaZ/CInXxPbj3BIJWj8Pixqn0NOkBnDKdNZjn6vzGzweOBgdQc735S5
         /QXSuQ+LlTgiI/7ePEDUzxJwXVmt1P6JCkXRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782511817; x=1783116617;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lh5zXXXkPS2NsWhIFpAScqkoO/5xfUHluX6eR3kwOFE=;
        b=DkA3TJakM7oyspYA9Wix0jcArjS0OdKd7BYghIL7a0K7e/bFId5qJ9djPW3iHXwTZH
         kQ4mwNoBp1BfWeOxSGmF4rFtWr2LLJ6K+pEhvTlb6xMbdUtPPGok27Dk/C+3mdJt6tHH
         G2poyJzA2ev6JuW7CFd9c6WXbm4Ive3eyj7gDrkMw8L6PpRNHq2/FamNnlxrG+C2SnVS
         wOTleH+qbx1fFyVr+gBumzwOTehsQAfa8maR+5vjUSna7Sn8J25Cn462d7Od/7+dE+ht
         tPuZOYorE3ABQ/0YeO9UDJfPpe0JUvTwCgdM6ChHv0qmp7mh8y7by4ND8GPmgIFRVLAC
         VmEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG0CKX/CqwvNhioOQB4oNdDqY9Lp4vtxDwpJOm1/pj9el6agoSaXDuRHrZrCxaMnD1yVJKwYwGSdPe5FP5zhyF0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWKWTFNHlquj5hGqdEOetvXxwC38Ry4qMJyI4yLIo+IccihCEy
	wv3dxhief/kDZ5GcF3DGuqKIaBpfNh1hfWEGj63410RdxLkXscBpZSieoOTf2gC7OpPzU3IF3tZ
	GVlD4
X-Gm-Gg: AfdE7clGvAFZRIg77JQ7cKPW40qWXykrdsJhGpD8M49KpyDpW7alX866dESVUFnCVkk
	cpDO/xBF/5FQvi+FzHRJlkNpTZPUgb5u8DZIk8rW9qy1VTGZMy0S39vwWCiLpUACkbtr0+fpk/3
	TbzKm892SKj1v6JsdJwlg+gpjWRm0LEX65qUn+5vPtjtgUsO4u8OJ/7JclL75dl7LjNnpW/98vm
	LT/NNCBAd4HRxt/VAM81oTILCJuB9uX8UADpM2BuJG3PM77PzXyVAYA3mdg1lV0+Urjz5mXGxKd
	gHNqn6bc5vZyX6zFS3ij75Wg8XG+sm1F7FJ/QpaG2vF1rUOizl8HUdrF0x8+ahRwPCkymWP9F/2
	pZasPRsVNawnlDMaUeZ+OMqTiKkQrBqkml9dlmPw+fB88wyYhsA9XrFV4QI/JCUhImXwYlSvCO5
	XWqpe3krzcWM9FkZnakBR9+WBVJWxDsRmxjDet5vY3cKHHdgMmuvBTiueCQSwwNqZZQRaVHLNgo
	c14adlisP2Lw1xM
X-Received: by 2002:a05:6000:18a9:b0:461:a15a:4160 with SMTP id ffacd0b85a97d-46da8c5fcb6mr14294660f8f.13.1782511816934;
        Fri, 26 Jun 2026 15:10:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46e3d6ba143sm15572854f8f.33.2026.06.26.15.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:10:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 00:10:16 +0200
Message-Id: <DJJBPBOYLJL3.3BJ4OY8GBGGUY@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] vim: fix for CVE-2026-34982,
 CVE-2026-34714 & CVE-2026-35177
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260619085840.386150-1-hprajapati@mvista.com>
In-Reply-To: <20260619085840.386150-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 22:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239663

On Fri Jun 19, 2026 at 10:58 AM CEST, Hitendra Prajapati via lists.openembe=
dded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]
>
> [1] https://github.com/vim/vim/commit/75661a66a1db1e1f3f1245c615f13a7de44=
c0587
> [2] https://github.com/vim/vim/commit/664701eb7576edb7c7c7d9f2d600815ec1f=
43459
> [3] https://github.com/vim/vim/commit/7088926316d8d4a7572a242d0765e99adfc=
8b083
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-34982
> [5] https://nvd.nist.gov/vuln/detail/CVE-2026-34714
> [6] https://nvd.nist.gov/vuln/detail/CVE-2026-35177
>
> More info :
> CVE-2026-34982 - vim: arbitrary command execution via modeline sandbox by=
pass.
> CVE-2026-34714 - vim: Arbitrary code execution via crafted file.
> CVE-2026-35177 - vim zip.vim plugin: Arbitrary file overwrite via path tr=
aversal bypass.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-34714.patch            | 109 ++++++++++++++++++
>  .../vim/files/CVE-2026-34982.patch            | 105 +++++++++++++++++
>  .../vim/files/CVE-2026-35177.patch            |  58 ++++++++++
>  meta/recipes-support/vim/vim.inc              |   5 +-
>  4 files changed, 276 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-34714.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-34982.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-35177.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-34714.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-34714.patch
> new file mode 100644
> index 0000000000..fef167e535
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-34714.patch
> @@ -0,0 +1,109 @@
> +From 664701eb7576edb7c7c7d9f2d600815ec1f43459 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Mon, 30 Mar 2026 08:20:43 +0000
> +Subject: [PATCH] patch 9.2.0272: [security]: 'tabpanel' can be set in a
> + modeline
> +
> +Problem:  'tabpanel' can be set in a modeline
> +Solution: Set the P_MLE flag for the 'tabpanel' option, disable
> +          autocmd_add()/autocomd_delete() functions in restricted/secure
> +          mode.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-2gmj-rpqf-pxvh
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-34714
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/664701eb757=
6edb7c7c7d9f2d600815ec1f43459]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/autocmd.c                 |  3 +++
> + src/optiondefs.h              |  2 +-
> + src/testdir/test_autocmd.vim  |  5 +++++
> + src/testdir/test_tabpanel.vim | 16 ++++++++++++++++
> + src/version.c                 |  2 ++
> + 5 files changed, 27 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/autocmd.c b/src/autocmd.c
> +index 94f9c1fba4..8a6b363aad 100644
> +--- a/src/autocmd.c
> ++++ b/src/autocmd.c
> +@@ -3069,6 +3069,9 @@ autocmd_add_or_delete(typval_T *argvars, typval_T =
*rettv, int delete)
> +     rettv->v_type =3D VAR_BOOL;
> +     rettv->vval.v_number =3D VVAL_FALSE;
> +=20
> ++    if (check_restricted() || check_secure())
> ++	return;
> ++
> +     if (check_for_list_arg(argvars, 0) =3D=3D FAIL)
> + 	return;
> +=20
> +diff --git a/src/optiondefs.h b/src/optiondefs.h
> +index 62d142e637..bd02d04f47 100644
> +--- a/src/optiondefs.h
> ++++ b/src/optiondefs.h
> +@@ -2570,7 +2570,7 @@ static struct vimoption options[] =3D
> + 			    (char_u *)&p_tpm, PV_NONE, NULL, NULL,
> + 			    {(char_u *)10L, (char_u *)0L} SCTX_INIT},
> + #if defined(FEAT_TABPANEL)
> +-    {"tabpanel",  "tpl",    P_STRING|P_VI_DEF|P_RALL,
> ++    {"tabpanel",  "tpl",    P_STRING|P_VI_DEF|P_RALL|P_MLE,
> + 			    (char_u *)&p_tpl, PV_NONE, NULL, NULL,
> + 			    {(char_u *)"", (char_u *)0L} SCTX_INIT},
> +     {"tabpanelopt","tplo",  P_STRING|P_ALLOCED|P_VI_DEF|P_ONECOMMA|P_CO=
LON
> +diff --git a/src/testdir/test_autocmd.vim b/src/testdir/test_autocmd.vim
> +index 43605f7e11..1fea13b00a 100644
> +--- a/src/testdir/test_autocmd.vim
> ++++ b/src/testdir/test_autocmd.vim
> +@@ -5501,4 +5501,9 @@ func Test_VimResized_and_window_width_not_equalize=
d()
> +   call StopVimInTerminal(buf)
> + endfunc
> +=20
> ++func Test_autocmd_add_secure()
> ++  call assert_fails('sandbox call autocmd_add([{"event": "BufRead", "cm=
d": "let x =3D 1"}])', 'E48:')
> ++  call assert_fails('sandbox call autocmd_delete([{"event": "BufRead"}]=
)', 'E48:')
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +diff --git a/src/testdir/test_tabpanel.vim b/src/testdir/test_tabpanel.v=
im
> +index ecc12b59be..b0d4202dc4 100644
> +--- a/src/testdir/test_tabpanel.vim
> ++++ b/src/testdir/test_tabpanel.vim
> +@@ -770,4 +770,20 @@ function Test_tabpanel_with_cmdline_pum()
> +=20
> +   call StopVimInTerminal(buf)
> + endfunc
> ++
> ++func Test_tabpanel_no_modeline()
> ++  let _tpl =3D &tabpanel
> ++  let _mls =3D &modelineexpr
> ++
> ++  set nomodelineexpr
> ++  setlocal modeline
> ++  new
> ++  call writefile(['/* vim: set tabpanel=3Dtest: */'], 'Xtabpanel.txt', =
'D')
> ++  call assert_fails(':e Xtabpanel.txt', 'E992:')
> ++
> ++  let &tabpanel =3D _tpl
> ++  let &modelineexpr =3D _mls
> ++  bw!
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +diff --git a/src/version.c b/src/version.c
> +index 4f47ec2688..309ddf7f7c 100644
> +--- a/src/version.c
> ++++ b/src/version.c
> +@@ -724,6 +724,8 @@ static char *(features[]) =3D
> +=20
> + static int included_patches[] =3D
> + {   /* Add new patch number below this line */
> ++/**/
> ++    1687,
> + /**/
> +     1686,
> + /**/
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-34982.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-34982.patch
> new file mode 100644
> index 0000000000..a646dfd8cb
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-34982.patch
> @@ -0,0 +1,105 @@
> +From 75661a66a1db1e1f3f1245c615f13a7de44c0587 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Tue, 31 Mar 2026 18:29:00 +0000
> +Subject: [PATCH] patch 9.2.0276: [security]: modeline security bypass
> +
> +Problem:  [security]: modeline security bypass
> +Solution: disallow mapset() from secure mode, set the P_MLE flag for the
> +          'complete', 'guitabtooltip' and 'printheader' options.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-8h6p-m6gr-mpw9
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-34982
> +Upstream-Status: Backport from [https://github.com/vim/vim/commit/75661a=
66a1db1e1f3f1245c615f13a7de44c0587]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/map.c                     |  3 +++
> + src/optiondefs.h              |  6 +++---
> + src/testdir/test_modeline.vim | 25 +++++++++++++++++++++++++
> + 3 files changed, 31 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/map.c b/src/map.c
> +index fbecf4aced..7677243625 100644
> +--- a/src/map.c
> ++++ b/src/map.c
> +@@ -2746,6 +2746,9 @@ f_mapset(typval_T *argvars, typval_T *rettv UNUSED=
)
> +     int		dict_only;
> +     mapblock_T	*mp_result[2] =3D {NULL, NULL};
> +=20
> ++    if (check_secure())
> ++	return;
> ++
> +     // If first arg is a dict, then that's the only arg permitted.
> +     dict_only =3D argvars[0].v_type =3D=3D VAR_DICT;
> +     if (in_vim9script()
> +diff --git a/src/optiondefs.h b/src/optiondefs.h
> +index 77155a63e8..62d142e637 100644
> +--- a/src/optiondefs.h
> ++++ b/src/optiondefs.h
> +@@ -683,7 +683,7 @@ static struct vimoption options[] =3D
> +     {"compatible",  "cp",   P_BOOL|P_RALL,
> + 			    (char_u *)&p_cp, PV_NONE, did_set_compatible, NULL,
> + 			    {(char_u *)TRUE, (char_u *)FALSE} SCTX_INIT},
> +-    {"complete",    "cpt",  P_STRING|P_ALLOCED|P_VI_DEF|P_ONECOMMA|P_NO=
DUP,
> ++    {"complete",    "cpt",  P_STRING|P_ALLOCED|P_VI_DEF|P_ONECOMMA|P_NO=
DUP|P_MLE,
> + 			    (char_u *)&p_cpt, PV_CPT, did_set_complete, expand_set_complete,
> + 			    {(char_u *)".,w,b,u,t,i", (char_u *)0L}
> + 			    SCTX_INIT},
> +@@ -1326,7 +1326,7 @@ static struct vimoption options[] =3D
> + 			    {(char_u *)NULL, (char_u *)0L}
> + #endif
> + 			    SCTX_INIT},
> +-    {"guitabtooltip",  "gtt", P_STRING|P_VI_DEF|P_RWIN,
> ++    {"guitabtooltip",  "gtt", P_STRING|P_VI_DEF|P_RWIN|P_MLE,
> + #if defined(FEAT_GUI_TABLINE)
> + 			    (char_u *)&p_gtt, PV_NONE, NULL, NULL,
> + 			    {(char_u *)"", (char_u *)0L}
> +@@ -2044,7 +2044,7 @@ static struct vimoption options[] =3D
> + 			    {(char_u *)NULL, (char_u *)0L}
> + #endif
> + 			    SCTX_INIT},
> +-    {"printheader", "pheader",  P_STRING|P_VI_DEF|P_GETTEXT,
> ++    {"printheader", "pheader",  P_STRING|P_VI_DEF|P_GETTEXT|P_MLE,
> + #ifdef FEAT_PRINTER
> + 			    (char_u *)&p_header, PV_NONE, NULL, NULL,
> + 			    // untranslated to avoid problems when 'encoding'
> +diff --git a/src/testdir/test_modeline.vim b/src/testdir/test_modeline.v=
im
> +index 1f8686328a..c00032ba72 100644
> +--- a/src/testdir/test_modeline.vim
> ++++ b/src/testdir/test_modeline.vim
> +@@ -361,4 +361,29 @@ func Test_modeline_disable()
> +   call assert_equal(2, &sw)
> + endfunc
> +=20
> ++func Test_modeline_forbidden()
> ++  let tempfile =3D tempname()
> ++  let lines =3D<< trim END
> ++    some test text for completion
> ++    vim: set complete=3DF{->system('touch_should_not_run')} :
> ++  END
> ++  call writefile(lines, tempfile, 'D')
> ++  call assert_fails($'new {tempfile}', 'E992:')
> ++  bw!
> ++  let lines =3D<< trim END
> ++    some text
> ++    vim: set guitabtooltip=3D%{%mapset()%}:
> ++  END
> ++  call writefile(lines, tempfile)
> ++  call assert_fails($'new {tempfile}', 'E992:')
> ++  bw!
> ++  let lines =3D<< trim END
> ++    some text
> ++    vim: set printheader=3D%{mapset('n',0,{})%)%}:
> ++  END
> ++  call writefile(lines, tempfile, 'D')
> ++  call assert_fails($'new {tempfile}', 'E992:')
> ++  bw!
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--=20
> +2.35.7
> +
> diff --git a/meta/recipes-support/vim/files/CVE-2026-35177.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-35177.patch
> new file mode 100644
> index 0000000000..23e1043879
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-35177.patch
> @@ -0,0 +1,58 @@
> +From 7088926316d8d4a7572a242d0765e99adfc8b083 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Wed, 1 Apr 2026 16:23:49 +0000
> +Subject: [PATCH] patch 9.2.0280: [security]: path traversal issue in zip=
.vim
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Problem:  [security]: path traversal issue in zip.vim
> +          (Micha=C5=82 Majchrowicz)
> +Solution: Detect more such attacks and warn the user.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-jc86-w7vm-8p24
> +
> +CVE: CVE-2026-35177
> +Upstream-Status: Backport from https://github.com/vim/vim/commit/7088926=
316d8d4a7572a242d0765e99adfc8b083

Please respect the syntax "Upstream-Status: Backport [URL]" (with
Brackets). I do use this syntax to automate much of my reviews.

> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/zip.vim | 8 +++++++-
> + 1 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/runtime/autoload/zip.vim b/runtime/autoload/zip.vim
> +index c46ec44708..e57fbcfde0 100644
> +--- a/runtime/autoload/zip.vim
> ++++ b/runtime/autoload/zip.vim
> +@@ -16,6 +16,7 @@
> + " 2024 Aug 21 by Vim Project: simplify condition to detect MS-Windows
> + " 2025 Mar 11 by Vim Project: handle filenames with leading '-' correct=
ly
> + " 2025 Jul 12 by Vim Project: drop ../ on write to prevent path travers=
al attacks
> ++" 2026 Apr 01 by Vim Project: Detect more path traversal attacks
> + " License:	Vim License  (see vim's :help license)
> + " Copyright:	Copyright (C) 2005-2019 Charles E. Campbell {{{1
> + "		Permission is hereby granted to use and distribute this code,
> +@@ -246,6 +247,11 @@ fun! zip#Write(fname)
> +     return
> +   endif
> +=20
> ++  if simplify(a:fname) =3D~ '\.\.[/\\]'
> ++    call s:Mess('Error', "***error*** (zip#Write) Path Traversal Attack=
 detected, not writing!")
> ++    return
> ++  endif
> ++
> +   let curdir=3D getcwd()
> +   let tmpdir=3D tempname()
> +   if tmpdir =3D~ '\.'
> +@@ -344,7 +350,7 @@ fun! zip#Extract()
> +   if fname =3D~ '/$'
> +     call s:Mess('Error', "***error*** (zip#Extract) Please specify a fi=
le, not a directory")
> +     return
> +-  elseif fname =3D~ '^[.]\?[.]/'
> ++  elseif fname =3D~ '^[.]\?[.]/' || simplify(fname) =3D~ '\.\.[/\\]'
> +     call s:Mess('Error', "***error*** (zip#Browse) Path Traversal Attac=
k detected, not extracting!")
> +     return
> +   endif
> +--=20
> +2.35.7
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 1396ac4fbc..0b7a831eed 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -16,12 +16,15 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dma=
ster;protocol=3Dhttps \
>             file://disable_acl_header_check.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> +           file://CVE-2026-34982.patch \
> +           file://CVE-2026-33412.patch \
>             file://CVE-2026-25749.patch \
>             file://CVE-2026-26269.patch \
> -           file://CVE-2026-33412.patch \

CVE-2026-33412.patch was moved without being mentionned in commit
message. Please don't mix unrelated changes.

Since you sent 5 individual patches for vim: can you send me a v2 this
the above changes but as a series (with the 4 other patches)?

Thanks!

>             file://CVE-2026-28418.patch \
>             file://CVE-2026-28419.patch \
> +           file://CVE-2026-34714.patch \
>             file://CVE-2026-39881.patch \
> +           file://CVE-2026-35177.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


