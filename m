Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F320FC4450E
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139219.1783291378490251078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N+AJaRa9;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476a130c138so2441615f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291377; x=1783896177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xOZvc3mPdF9EwNg1/wysA5MalEF/G7/XujYWquuWbH0=;
        b=N+AJaRa9aNcR0Jc4BaF02owghOW92Qf6mxzYxPXxRy5sHDKnuCW2Yxq7ieRPkfaI5f
         P3fKLUb7Xm982sBfx/2W65yvkqHb6uXdIiiX+Cb2cklXcmoIIRjYDAtoH2mWSj1vP33S
         SaqUNqgzXmC+66IpY5tMegGwGh7yhJdd0Wc50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291377; x=1783896177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xOZvc3mPdF9EwNg1/wysA5MalEF/G7/XujYWquuWbH0=;
        b=jFXrevaSQF4hpEKIrpR91styJIyiclh5iYrqZQ0R9a6PDDlrxAnYqSWBO+uUfJEEKH
         tVGkD2sRRSlr7j4ipaoNgwjfOZmaCj7wDDZMRLzeuaMZ/gEuGECEOfVLqhR6hz4DBN8j
         De3MrbrEApdo7Rrm05jVA0z4jJKVikrbcKzzFp33Dbs79CYtKqjFL4dviZBEw89QoYcP
         yAKgO2orvXOHNf010bDufVkWNiESMbwf0taYh3yOnFCGl9VzKOExeg6sej/65bjYB+Ka
         8UXPQ7Be3uPDPwZI3csPPiga24iUDWOJjFSG+L4JDUPNi1AjcovgZawZD4rzJaZbsQaO
         Y0dA==
X-Gm-Message-State: AOJu0YxvLxd07Q15M0cNjSvAnEFf7GQaWsYDBhRPtZsd1Nv1BI12IQd9
	5LwSHvKslvBOacyHqLuXGicSblXQ2AU/Kwo4r3sWY+c36DLrkms82qCAnZiUV7Z1eq/LEnOnQBd
	oxQqdlvI=
X-Gm-Gg: AfdE7cnpiwBH8OfG2qICBWIlK+zKwP2Fn1qwJ5y27Rt4lSBQVYHjhZHhAjFrydbrb0N
	ypl7ZwwFy5rMjD79Wkzw7KkqcqFfLPMj4XOl6zOXzUfunEIDymUsX4U+GTqtxiA3H1UvPMGH5wO
	DogJI5k1oQR3sYFMI7hAH7cU7O27zoHOs/6IicPxPIu92EVCOm7mPyWCFcBYCQVeqm32VdYnQ3b
	Sp9bTRycQ9aFbBvlrn4G4+TI8zowc8tN/rtZcONqShkMWI5CdPqQOV+sIX4ORWFHXSrozE01KQd
	a4IDzsxBpwZjEG/6zklzovYjh1fIBYQbOXP7hk4d1+QfQU8/0K9gRaXxTI2jUyTeXch1+tK/+Hu
	4Yjtew0EC0+OSizNTGw1ovei1JIvPFDOdysCYDfRuh516h0Sc+78+PrG+0QKH2Gf4G2Ssf9vcAN
	dwSrl4i2ROwDDZi6wDma37PwEOsA==
X-Received: by 2002:a05:6000:4284:b0:475:f100:35f5 with SMTP id ffacd0b85a97d-47aadfe42d3mr9191595f8f.50.1783291376634;
        Sun, 05 Jul 2026 15:42:56 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/55] vim: fix for CVE-2026-45130 & CVE-2026-46483
Date: Mon,  6 Jul 2026 00:41:14 +0200
Message-ID: <568dea049869b20f5d1717ebebf35011090b9b93.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240178

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] & [2] also mentioned at NVD report in [3] & [4]

[1] https://github.com/vim/vim/commit/92993329178cb1f72d700fff45ca86e1c2d369f8
[2] https://github.com/vim/vim/commit/3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-45130
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-46483

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-45130.patch            | 115 ++++++++++++++++++
 .../vim/files/CVE-2026-46483.patch            |  77 ++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 3 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-45130.patch b/meta/recipes-support/vim/files/CVE-2026-45130.patch
new file mode 100644
index 00000000000..a86ba79e74f
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-45130.patch
@@ -0,0 +1,115 @@
+From 92993329178cb1f72d700fff45ca86e1c2d369f8 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Wed, 6 May 2026 20:50:00 +0200
+Subject: [PATCH] patch 9.2.0450: [security]: heap buffer overflow in
+ spellfile.c read_compound()
+
+Problem:  read_compound() in spellfile.c computes the size of the regex
+          pattern buffer using signed-int arithmetic on the attacker
+          controlled SN_COMPOUND sectionlen.  With sectionlen=0x40000008
+          and UTF-8 encoding active the multiplication wraps to 27 while
+          the per-byte loop writes up to ~1B bytes, overflowing the heap.
+          Reachable when loading a crafted .spl file (e.g. via 'set spell'
+          after a modeline sets 'spelllang').  The cp/ap/crp allocations
+          have the same int + 1 overflow class (Daniel Cervera)
+Solution: Use type size_t as buffer size and reject values larger than
+          COMPOUND_MAX_LEN (100000).  Apply the same size_t treatment to
+          the cp/ap/crp allocations.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-q4jv-r9gj-6cwv
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/92993329178cb1f72d700fff45ca86e1c2d369f8]
+CVE: CVE-2026-45130
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/spellfile.c                | 20 ++++++++++++++------
+ src/testdir/test_spellfile.vim |  4 ++++
+ 2 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index a9a347a89a..5102dad5b6 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -290,6 +290,9 @@
+ #define CF_WORD		0x01
+ #define CF_UPPER	0x02
+ 
++// Max allowed length for COMPOUND section
++#define COMPOUND_MAX_LEN	100000
++
+ /*
+  * Loop through all the siblings of a node (including the node)
+  */
+@@ -1219,6 +1222,8 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     char_u	*crp;
+     int		cnt;
+     garray_T	*gap;
++    size_t	patsize;
++    size_t	flagsize;
+ 
+     if (todo < 2)
+ 	return SP_FORMERROR;	// need at least two bytes
+@@ -1275,16 +1280,19 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     // "a[bc]/a*b+" -> "^\(a[bc]\|a*b\+\)$".
+     // Inserting backslashes may double the length, "^\(\)$<Nul>" is 7 bytes.
+     // Conversion to utf-8 may double the size.
+-    c = todo * 2 + 7;
++    if ((size_t)todo > COMPOUND_MAX_LEN)
++	return SP_FORMERROR;
++    patsize = (size_t)todo * 2 + 7;
+     if (enc_utf8)
+-	c += todo * 2;
+-    pat = alloc(c);
++	patsize += (size_t)todo * 2;
++    flagsize = (size_t)todo + 1;
++    pat = alloc(patsize);
+     if (pat == NULL)
+ 	return SP_OTHERERROR;
+ 
+     // We also need a list of all flags that can appear at the start and one
+     // for all flags.
+-    cp = alloc(todo + 1);
++    cp = alloc(flagsize);
+     if (cp == NULL)
+     {
+ 	vim_free(pat);
+@@ -1293,7 +1301,7 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     slang->sl_compstartflags = cp;
+     *cp = NUL;
+ 
+-    ap = alloc(todo + 1);
++    ap = alloc(flagsize);
+     if (ap == NULL)
+     {
+ 	vim_free(pat);
+@@ -1305,7 +1313,7 @@ read_compound(FILE *fd, slang_T *slang, int len)
+     // And a list of all patterns in their original form, for checking whether
+     // compounding may work in match_compoundrule().  This is freed when we
+     // encounter a wildcard, the check doesn't work then.
+-    crp = alloc(todo + 1);
++    crp = alloc(flagsize);
+     slang->sl_comprules = crp;
+ 
+     pp = pat;
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index f46a25d99e..8f3ef4907d 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -334,6 +334,10 @@ func Test_spellfile_format_error()
+   " SN_COMPOUND: incorrect comppatlen
+   call Spellfile_Test(0z080000000007040101000000020165, 'E758:')
+ 
++  " SN_COMPOUND: oversized sectionlen
++  let v = eval('0z08004000000803010161' .. repeat('61', 50) .. 'FF')
++  call Spellfile_Test(v, 'E759:')
++
+   " SN_INFO: missing info
+   call Spellfile_Test(0z0F0000000005040101, '')
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-46483.patch b/meta/recipes-support/vim/files/CVE-2026-46483.patch
new file mode 100644
index 00000000000..72167d4c25e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-46483.patch
@@ -0,0 +1,77 @@
+From 3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 14 May 2026 15:35:28 +0000
+Subject: [PATCH] patch 9.2.0479: [security]: runtime(tar): command injection
+ in tar plugin
+
+Problem:  [security]: runtime(tar): command injection in tar plugin
+          (Christopher Lusk)
+Solution: Use the correct shellescape(args, 1) form for a :! command
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-2fpv-9ff7-xg5w
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1]
+CVE: CVE-2026-46483
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/tar.vim        |  5 +++--
+ src/testdir/test_plugin_tar.vim | 19 +++++++++++++++++++
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/autoload/tar.vim b/runtime/autoload/tar.vim
+index 722a0ab680..d2db9d3b18 100644
+--- a/runtime/autoload/tar.vim
++++ b/runtime/autoload/tar.vim
+@@ -23,6 +23,7 @@
+ "   2026 Apr 06 by Vim Project: fix bugs with lz4 support (#19925)
+ "   2026 Apr 09 by Vim Project: fix bugs with zstd support (#19930)
+ "   2026 Apr 09 by Vim Project: fix bug with dotted filename (#19930)
++"   2026 May 14 by Vim Project: use correct shellescape() call in Vimuntar()
+ "
+ "	Contains many ideas from Michael Toren's <tar.vim>
+ "
+@@ -812,9 +813,9 @@ fun! tar#Vimuntar(...)
+   " if necessary, decompress the tarball; then, extract it
+   if tartail =~ '\.tgz'
+    if executable("gunzip")
+-    silent exe "!gunzip ".shellescape(tartail)
++    silent exe "!gunzip ".shellescape(tartail, 1)
+    elseif executable("gzip")
+-    silent exe "!gzip -d ".shellescape(tartail)
++    silent exe "!gzip -d ".shellescape(tartail, 1)
+    else
+     echoerr "unable to decompress<".tartail."> on this system"
+     if simplify(curdir) != simplify(tarhome)
+diff --git a/src/testdir/test_plugin_tar.vim b/src/testdir/test_plugin_tar.vim
+index 80b7a76d6d..f1ee9130c6 100644
+--- a/src/testdir/test_plugin_tar.vim
++++ b/src/testdir/test_plugin_tar.vim
+@@ -313,3 +313,22 @@ def g:Test_extract_with_dotted_filename()
+   delete('X.txt')
+   bw!
+ enddef
++
++def g:Test_extract_command_injection()
++  CheckExecutable gunzip
++  CheckExecutable touch
++  var tgz = eval('0z1F8B08087795056A000364756D6D792E74617200EDCE2B12C2300004D01C254' ..
++   '7480269CE534080A8495BD1DBF3996106C3A08A7ACFACD8157B59A7690BFB4A0FC3707C666E357D' ..
++   'E65BC8B5A47CC8A5D61A522EA5B510D3CEBF5ED679197B8CE17CEDB7F9D4C76FBB5F3D000000000' ..
++   '000000000FCD11D32415E2C00280000')
++  var dirname = tempname()
++
++  mkdir(dirname, 'R')
++  var tar = dirname .. "/';%$(touch pwned)'.tgz"
++  writefile(tgz, tar)
++  new
++  exe "e " .. fnameescape(tar)
++  exe ":Vimuntar " .. dirname
++  assert_false(filereadable(dirname .. "/pwned"))
++  bw!
++enddef
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index efd24650f4a..6eafc53c746 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            file://CVE-2026-44656.patch \
            file://CVE-2026-41411.patch \
+           file://CVE-2026-45130.patch \
+           file://CVE-2026-46483.patch \
            "
 
 PV .= ".0340"

