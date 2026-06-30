Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF139C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 04:43:15 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14132.1782794589284564575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 21:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kZ7qKxcu;
 spf=pass (domain: mvista.com, ip: 74.125.82.169, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so7929351eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 21:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782794589; x=1783399389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWh7qxygroHvcYxy9NT4Ww4If1sJQfBSQdw3QaA4rrc=;
        b=kZ7qKxcuHA8eET41Jlo4aGYoKgha5I+/5/+FxWu17QyiKL31r7/gWPOuKcDaPzHtET
         K4hbFDSBtiEqjr9s0+15utj5PTOI4kMwZL7AvEYSjYkdiYs9647uZgsXnhhpCNrr9sT+
         uMpd68EFTRVvpo886eKIHSMjM/JnOyw5fdvCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782794589; x=1783399389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWh7qxygroHvcYxy9NT4Ww4If1sJQfBSQdw3QaA4rrc=;
        b=gotvy1m+jG1CeumBTgC7SDQs4x5AB6JJN4E9B2V4LauOLUOxFZcnoQ+crMl+uTsWEb
         JQQ4RAisRyFKUAdU1sJ8eaD5gFMce2Og2Upt6jyjzNjeH5gfMUk+GsqFGMNIeZf8F+X3
         Idb1W4PB+dApBft4oQkiJ5xjuJ0cghlcpZgphDbUMP/ya6jp2r6OBAYVdmAmoDpDGlrD
         2+QQl2N/v+QxfyRgVf/t0E50CMUmZxD2Hqa4rBxMDex4IbXMIZOjyS2RnDnIrRjSPunw
         +1dAA0JW+bRfQqEB9ZF+U2jLZwu8BKXaHoWEQqpPE8GEHoT0cp/MC4UjOUK2ftze6aq5
         lECQ==
X-Gm-Message-State: AOJu0YzSPpAts3TFWaN2gzBq8JoSHAXeIG/JzLk/3Nv6Xnwue3L+w7sy
	qb935wK3dFO5LvT+H47zBIiabTLvTLilq0mLQcEofs39eh4pJjGxF6OchrD6VNI56FwHRJD9Zng
	NQzKAHMg=
X-Gm-Gg: AfdE7ck44fTnHRZJXrR8783t7Z+CgP7y4J40lL1Gto6X3dnywlBBZXzPkzb+VQs11e8
	ZbMUNW2eghNziKOjpElegUV1I8zab0EEXbJJQzcrw6JKiG+r1kJ35wb0JPOCi6sLrO7Yyo8mUcY
	OryuZdtU8avBNYG32kc239DsfQMKiIkmupY18cjnnSUiSStkYhUpgHoHM2mNCxiULgeJ4LschZB
	XnXeqq//i35IVyZD6TCChDKBxyxXaxCBtMTvrr78i+AZwuWgcJfm/3VfccRYICNSVxqGUweFZt/
	YibWeTm/4nEwEcFYUeaSV44FWyIdTXf8U5qWOfxys9xMPM0vmzyxOudeHYxqmstdOy3Jg0xDJHX
	S8tECSAPTPxQ2HHjqjcT7P5gTUDF2/mP+TcUbHcmwQC0HhhyTHc29nd4yHW0wQ6HZX0tU4nsSmP
	gFWglt7J5fPNPDMVi6PyN2gaHZyw==
X-Received: by 2002:a05:7301:6192:20b0:305:56a:c38f with SMTP id 5a478bee46e88-30ee134ff47mr1086626eec.26.1782794588456;
        Mon, 29 Jun 2026 21:43:08 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3168af7sm4851047eec.19.2026.06.29.21.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:43:08 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 2/3] vim: fix for CVE-2026-45130 & CVE-2026-46483
Date: Tue, 30 Jun 2026 10:12:43 +0530
Message-ID: <20260630044249.12023-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630044249.12023-1-hprajapati@mvista.com>
References: <20260630044249.12023-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 04:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239834

Pick patch from [1] & [2] also mentioned at NVD report in [3] & [4]

[1] https://github.com/vim/vim/commit/92993329178cb1f72d700fff45ca86e1c2d369f8
[2] https://github.com/vim/vim/commit/3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-45130
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-46483

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-45130.patch            | 115 ++++++++++++++++++
 .../vim/files/CVE-2026-46483.patch            |  77 ++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 3 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-45130.patch b/meta/recipes-support/vim/files/CVE-2026-45130.patch
new file mode 100644
index 0000000000..a86ba79e74
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
index 0000000000..72167d4c25
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
index efd24650f4..6eafc53c74 100644
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
-- 
2.50.1


