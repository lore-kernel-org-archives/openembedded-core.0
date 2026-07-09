Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458ECC44510
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5804.1783591627602935274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HjqWdZs6;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c7902f47so12974265e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591626; x=1784196426; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s78DQD9pLNJ+PIFZRBtDK711a+6GaDeOHPmI/BGmLR4=;
        b=HjqWdZs69WZ8Dm5wYLE3udAHpvG5oFRoFqYxcoWsOArCouYfEe3ikqFKuHwNd8LRUc
         eL5xJpKgQP7cYZS0FbfAHTbsusaIlkebhqqYWfAQ5IQKFsyEpaH8mrECiA53u+wGkwlb
         rU+Xo96kBIF42iXvKNRGHMdWWoA9BtGdpB2qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591626; x=1784196426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s78DQD9pLNJ+PIFZRBtDK711a+6GaDeOHPmI/BGmLR4=;
        b=e8cYrEQhXCIVyvet+T8EyIc3BJ7uBRsBZKSacfI4T2FoCdsq63DEzBZqfnEJWIQfGM
         IT3zfzXlG0Oc5U4/QMg/vE9wgoGc/4dcx6A1KfCOWUNsSGN1/7U9BHa7VG78D/GMgd8A
         Xzv9FQqK8c5jcV1aqTsBU44Dy036pxO9uh3VVVUL68E2yUVDuqPEVybEYyHv32dDR93a
         yPLTPwgewPLUZHfi4i8qqoM3FJLk9haFsug07GJLpcFK9aUUJr/Aj6Lrsmf16yPWgOJx
         XdUaE1FG78tsXkkpqlyNSvSO/xIo/nGp7aquKgiMFm0EcmOl9P3nvlKA1aEoKNKnpP8b
         aeWw==
X-Gm-Message-State: AOJu0Ywgr2BuXko0DQDrucIzWSXMmpt1s1IN0tZxCIPd+Rk1yXHY29iu
	9p3BvI7uxsiNbTdhYnaMOnzevs/dmP9ZAtzNsmKzD3zIeJzxDKWvCJCYjgPGrVG0Xl3qotrba1P
	thYf9rRE=
X-Gm-Gg: AfdE7cmw+vjkS6hNdZcmQC/k0Ji8nzy/RCWwdErXowkxZLwLPMq7yheABB86r/FFsKk
	v3M54k1hwN+AbaX8xmXEcK70r0R46VzjnM2oP7oOslrnawLIgOVMiEa7980VMeLsCN81WIkbwmm
	uT4lP77YsziGQLsWvjchrwt3p05Bdjbs27DhxUzxwCFqJDGb0/6z6F3/RLVMs8kvlO/ySBeUWB0
	mas01MVk0O6pBr99KxdFymAUU0QLvIOOQTN8BtbntcHxV8cIpjbUqRBMtfEQPlboR1KGJLveeGl
	Axqa2FSiNi26kgMYt9kV0U+EQYUeF4yDx8D0CINXr+27DTPFOzkcIBR8Y8LBS1O6ZMn5dTR0iOF
	n/WbLKiOdtrGTIIh+Wi+IERCv4X+YYHat3SfP9COr2TqxovX7xWo7gjHoqcz+z4uNYMRBEHpuUV
	9LnngM/A6QLoannknVzYmqTcGClbVoxFN79MYM3o2utP1kDPvEmPxOyCmZFKDrwmNxf2GbDpOlM
	erPHBVYmll/z0j+pw==
X-Received: by 2002:a05:600c:8b34:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493e685f1dbmr59763945e9.19.1783591625719;
        Thu, 09 Jul 2026 03:07:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/25] vim: fix for CVE-2026-34982, CVE-2026-34714 & CVE-2026-35177
Date: Thu,  9 Jul 2026 12:06:26 +0200
Message-ID: <8ac3bc9efbac82abf66f5ad41d4bccfdf11fefd5.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240557

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]

[1] https://github.com/vim/vim/commit/75661a66a1db1e1f3f1245c615f13a7de44c0587
[2] https://github.com/vim/vim/commit/664701eb7576edb7c7c7d9f2d600815ec1f43459
[3] https://github.com/vim/vim/commit/7088926316d8d4a7572a242d0765e99adfc8b083
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-34982
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-34714
[6] https://nvd.nist.gov/vuln/detail/CVE-2026-35177

More info :
CVE-2026-34982 - vim: arbitrary command execution via modeline sandbox bypass.
CVE-2026-34714 - vim: Arbitrary code execution via crafted file.
CVE-2026-35177 - vim zip.vim plugin: Arbitrary file overwrite via path traversal bypass.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-34714.patch            | 109 ++++++++++++++++++
 .../vim/files/CVE-2026-34982.patch            | 105 +++++++++++++++++
 .../vim/files/CVE-2026-35177.patch            |  60 ++++++++++
 meta/recipes-support/vim/vim.inc              |   3 +
 4 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-34714.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-34982.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-35177.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-34714.patch b/meta/recipes-support/vim/files/CVE-2026-34714.patch
new file mode 100644
index 00000000000..fef167e535e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-34714.patch
@@ -0,0 +1,109 @@
+From 664701eb7576edb7c7c7d9f2d600815ec1f43459 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 30 Mar 2026 08:20:43 +0000
+Subject: [PATCH] patch 9.2.0272: [security]: 'tabpanel' can be set in a
+ modeline
+
+Problem:  'tabpanel' can be set in a modeline
+Solution: Set the P_MLE flag for the 'tabpanel' option, disable
+          autocmd_add()/autocomd_delete() functions in restricted/secure
+          mode.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-2gmj-rpqf-pxvh
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-34714
+Upstream-Status: Backport [https://github.com/vim/vim/commit/664701eb7576edb7c7c7d9f2d600815ec1f43459]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/autocmd.c                 |  3 +++
+ src/optiondefs.h              |  2 +-
+ src/testdir/test_autocmd.vim  |  5 +++++
+ src/testdir/test_tabpanel.vim | 16 ++++++++++++++++
+ src/version.c                 |  2 ++
+ 5 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/src/autocmd.c b/src/autocmd.c
+index 94f9c1fba4..8a6b363aad 100644
+--- a/src/autocmd.c
++++ b/src/autocmd.c
+@@ -3069,6 +3069,9 @@ autocmd_add_or_delete(typval_T *argvars, typval_T *rettv, int delete)
+     rettv->v_type = VAR_BOOL;
+     rettv->vval.v_number = VVAL_FALSE;
+ 
++    if (check_restricted() || check_secure())
++	return;
++
+     if (check_for_list_arg(argvars, 0) == FAIL)
+ 	return;
+ 
+diff --git a/src/optiondefs.h b/src/optiondefs.h
+index 62d142e637..bd02d04f47 100644
+--- a/src/optiondefs.h
++++ b/src/optiondefs.h
+@@ -2570,7 +2570,7 @@ static struct vimoption options[] =
+ 			    (char_u *)&p_tpm, PV_NONE, NULL, NULL,
+ 			    {(char_u *)10L, (char_u *)0L} SCTX_INIT},
+ #if defined(FEAT_TABPANEL)
+-    {"tabpanel",  "tpl",    P_STRING|P_VI_DEF|P_RALL,
++    {"tabpanel",  "tpl",    P_STRING|P_VI_DEF|P_RALL|P_MLE,
+ 			    (char_u *)&p_tpl, PV_NONE, NULL, NULL,
+ 			    {(char_u *)"", (char_u *)0L} SCTX_INIT},
+     {"tabpanelopt","tplo",  P_STRING|P_ALLOCED|P_VI_DEF|P_ONECOMMA|P_COLON
+diff --git a/src/testdir/test_autocmd.vim b/src/testdir/test_autocmd.vim
+index 43605f7e11..1fea13b00a 100644
+--- a/src/testdir/test_autocmd.vim
++++ b/src/testdir/test_autocmd.vim
+@@ -5501,4 +5501,9 @@ func Test_VimResized_and_window_width_not_equalized()
+   call StopVimInTerminal(buf)
+ endfunc
+ 
++func Test_autocmd_add_secure()
++  call assert_fails('sandbox call autocmd_add([{"event": "BufRead", "cmd": "let x = 1"}])', 'E48:')
++  call assert_fails('sandbox call autocmd_delete([{"event": "BufRead"}])', 'E48:')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/testdir/test_tabpanel.vim b/src/testdir/test_tabpanel.vim
+index ecc12b59be..b0d4202dc4 100644
+--- a/src/testdir/test_tabpanel.vim
++++ b/src/testdir/test_tabpanel.vim
+@@ -770,4 +770,20 @@ function Test_tabpanel_with_cmdline_pum()
+ 
+   call StopVimInTerminal(buf)
+ endfunc
++
++func Test_tabpanel_no_modeline()
++  let _tpl = &tabpanel
++  let _mls = &modelineexpr
++
++  set nomodelineexpr
++  setlocal modeline
++  new
++  call writefile(['/* vim: set tabpanel=test: */'], 'Xtabpanel.txt', 'D')
++  call assert_fails(':e Xtabpanel.txt', 'E992:')
++
++  let &tabpanel = _tpl
++  let &modelineexpr = _mls
++  bw!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 4f47ec2688..309ddf7f7c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1687,
+ /**/
+     1686,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-34982.patch b/meta/recipes-support/vim/files/CVE-2026-34982.patch
new file mode 100644
index 00000000000..e896f3b44d5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-34982.patch
@@ -0,0 +1,105 @@
+From 75661a66a1db1e1f3f1245c615f13a7de44c0587 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 31 Mar 2026 18:29:00 +0000
+Subject: [PATCH] patch 9.2.0276: [security]: modeline security bypass
+
+Problem:  [security]: modeline security bypass
+Solution: disallow mapset() from secure mode, set the P_MLE flag for the
+          'complete', 'guitabtooltip' and 'printheader' options.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-8h6p-m6gr-mpw9
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-34982
+Upstream-Status: Backport [https://github.com/vim/vim/commit/75661a66a1db1e1f3f1245c615f13a7de44c0587]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/map.c                     |  3 +++
+ src/optiondefs.h              |  6 +++---
+ src/testdir/test_modeline.vim | 25 +++++++++++++++++++++++++
+ 3 files changed, 31 insertions(+), 3 deletions(-)
+
+diff --git a/src/map.c b/src/map.c
+index fbecf4aced..7677243625 100644
+--- a/src/map.c
++++ b/src/map.c
+@@ -2746,6 +2746,9 @@ f_mapset(typval_T *argvars, typval_T *rettv UNUSED)
+     int		dict_only;
+     mapblock_T	*mp_result[2] = {NULL, NULL};
+ 
++    if (check_secure())
++	return;
++
+     // If first arg is a dict, then that's the only arg permitted.
+     dict_only = argvars[0].v_type == VAR_DICT;
+     if (in_vim9script()
+diff --git a/src/optiondefs.h b/src/optiondefs.h
+index 77155a63e8..62d142e637 100644
+--- a/src/optiondefs.h
++++ b/src/optiondefs.h
+@@ -683,7 +683,7 @@ static struct vimoption options[] =
+     {"compatible",  "cp",   P_BOOL|P_RALL,
+ 			    (char_u *)&p_cp, PV_NONE, did_set_compatible, NULL,
+ 			    {(char_u *)TRUE, (char_u *)FALSE} SCTX_INIT},
+-    {"complete",    "cpt",  P_STRING|P_ALLOCED|P_VI_DEF|P_ONECOMMA|P_NODUP,
++    {"complete",    "cpt",  P_STRING|P_ALLOCED|P_VI_DEF|P_ONECOMMA|P_NODUP|P_MLE,
+ 			    (char_u *)&p_cpt, PV_CPT, did_set_complete, expand_set_complete,
+ 			    {(char_u *)".,w,b,u,t,i", (char_u *)0L}
+ 			    SCTX_INIT},
+@@ -1326,7 +1326,7 @@ static struct vimoption options[] =
+ 			    {(char_u *)NULL, (char_u *)0L}
+ #endif
+ 			    SCTX_INIT},
+-    {"guitabtooltip",  "gtt", P_STRING|P_VI_DEF|P_RWIN,
++    {"guitabtooltip",  "gtt", P_STRING|P_VI_DEF|P_RWIN|P_MLE,
+ #if defined(FEAT_GUI_TABLINE)
+ 			    (char_u *)&p_gtt, PV_NONE, NULL, NULL,
+ 			    {(char_u *)"", (char_u *)0L}
+@@ -2044,7 +2044,7 @@ static struct vimoption options[] =
+ 			    {(char_u *)NULL, (char_u *)0L}
+ #endif
+ 			    SCTX_INIT},
+-    {"printheader", "pheader",  P_STRING|P_VI_DEF|P_GETTEXT,
++    {"printheader", "pheader",  P_STRING|P_VI_DEF|P_GETTEXT|P_MLE,
+ #ifdef FEAT_PRINTER
+ 			    (char_u *)&p_header, PV_NONE, NULL, NULL,
+ 			    // untranslated to avoid problems when 'encoding'
+diff --git a/src/testdir/test_modeline.vim b/src/testdir/test_modeline.vim
+index 1f8686328a..c00032ba72 100644
+--- a/src/testdir/test_modeline.vim
++++ b/src/testdir/test_modeline.vim
+@@ -361,4 +361,29 @@ func Test_modeline_disable()
+   call assert_equal(2, &sw)
+ endfunc
+ 
++func Test_modeline_forbidden()
++  let tempfile = tempname()
++  let lines =<< trim END
++    some test text for completion
++    vim: set complete=F{->system('touch_should_not_run')} :
++  END
++  call writefile(lines, tempfile, 'D')
++  call assert_fails($'new {tempfile}', 'E992:')
++  bw!
++  let lines =<< trim END
++    some text
++    vim: set guitabtooltip=%{%mapset()%}:
++  END
++  call writefile(lines, tempfile)
++  call assert_fails($'new {tempfile}', 'E992:')
++  bw!
++  let lines =<< trim END
++    some text
++    vim: set printheader=%{mapset('n',0,{})%)%}:
++  END
++  call writefile(lines, tempfile, 'D')
++  call assert_fails($'new {tempfile}', 'E992:')
++  bw!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-35177.patch b/meta/recipes-support/vim/files/CVE-2026-35177.patch
new file mode 100644
index 00000000000..66e5e975e4d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-35177.patch
@@ -0,0 +1,60 @@
+From 7088926316d8d4a7572a242d0765e99adfc8b083 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Wed, 1 Apr 2026 16:23:49 +0000
+Subject: [PATCH] patch 9.2.0280: [security]: path traversal issue in zip.vim
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem:  [security]: path traversal issue in zip.vim
+          (Michał Majchrowicz)
+Solution: Detect more such attacks and warn the user.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-jc86-w7vm-8p24
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-35177
+Upstream-Status: Backport [https://github.com/vim/vim/commit/7088926316d8d4a7572a242d0765e99adfc8b083]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/zip.vim | 8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/autoload/zip.vim b/runtime/autoload/zip.vim
+index c46ec44708..e57fbcfde0 100644
+--- a/runtime/autoload/zip.vim
++++ b/runtime/autoload/zip.vim
+@@ -16,6 +16,7 @@
+ " 2024 Aug 21 by Vim Project: simplify condition to detect MS-Windows
+ " 2025 Mar 11 by Vim Project: handle filenames with leading '-' correctly
+ " 2025 Jul 12 by Vim Project: drop ../ on write to prevent path traversal attacks
++" 2026 Apr 01 by Vim Project: Detect more path traversal attacks
+ " License:	Vim License  (see vim's :help license)
+ " Copyright:	Copyright (C) 2005-2019 Charles E. Campbell {{{1
+ "		Permission is hereby granted to use and distribute this code,
+@@ -246,6 +247,11 @@ fun! zip#Write(fname)
+     return
+   endif
+ 
++  if simplify(a:fname) =~ '\.\.[/\\]'
++    call s:Mess('Error', "***error*** (zip#Write) Path Traversal Attack detected, not writing!")
++    return
++  endif
++
+   let curdir= getcwd()
+   let tmpdir= tempname()
+   if tmpdir =~ '\.'
+@@ -344,7 +350,7 @@ fun! zip#Extract()
+   if fname =~ '/$'
+     call s:Mess('Error', "***error*** (zip#Extract) Please specify a file, not a directory")
+     return
+-  elseif fname =~ '^[.]\?[.]/'
++  elseif fname =~ '^[.]\?[.]/' || simplify(fname) =~ '\.\.[/\\]'
+     call s:Mess('Error', "***error*** (zip#Browse) Path Traversal Attack detected, not extracting!")
+     return
+   endif
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1396ac4fbc7..e9b5df291d2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,6 +22,9 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28418.patch \
            file://CVE-2026-28419.patch \
            file://CVE-2026-39881.patch \
+           file://CVE-2026-34982.patch \
+           file://CVE-2026-34714.patch \
+           file://CVE-2026-35177.patch \
            "
 
 PV .= ".1683"

