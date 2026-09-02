Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126DEC624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5680.1788326832481676606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S7sCj/Mj;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8687630fso4318115e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326831; x=1788931631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wTw09VALjOWOA0j3Dd5A0kY93eSILGRHCUmWWoDq6ws=;
        b=S7sCj/MjX1iQXj7PAlpHDVWU0GEerFnJrSEhipl0VVu2eAmgWdA6GeA8Q6dnhNhBaa
         BTEswY0Yo4eiDJttvqvYHRw/0ZRrwS5MbxNQOcokJJH8ULc/CUEDThoIs6f2HBcCF1Bj
         L8y1iMfm/+B+N8uBB8oDDEzYfQlZ1T6lkH1go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326831; x=1788931631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wTw09VALjOWOA0j3Dd5A0kY93eSILGRHCUmWWoDq6ws=;
        b=pUQJpdilrqyE0r5ZI9NbZGfMoU/bo70WSxFQr2VMK7RmHNE2d6CazWdX01r8j4oLD8
         x8G/Rptnz+YvURBN1rY1P5Z69eiqY6l6eLwG7QPOwtdm/idmCFThY12SMHS3cWlQ9n/E
         1/Z1sWahR+Xtf3q08zjb1Uo8/mGFALfrHiFta9LoLd9rhuRtTFUuv+et/Sl11gUnNu30
         UPv/9O7jk86pJ6V018vasVn3cC5oje5lvRtOrpbD2N77P+MN0ECNIt6CRi35qb3f6WNr
         XgpTIAgEzP3hQoU7plC2fIamnH90asJig4P26VA97LS/pKbTCKgBqVqneshpUV6KZ2zo
         YNAg==
X-Gm-Message-State: AFuF++kPUbxZ9+bLnADqSgAkVga9U2fk9Lys/STkzTTkWSfIWbJg1JE/
	Aib94c5RhCFaUe8ZFk3FyrP2SEOWFQ8gvEmcyBPzwIWiZS5+kOpYRRuICWGonSDf6Lrts0QuVx0
	Fe8G1dRw=
X-Gm-Gg: AR+sD103Mt0NKsxOKu240bf6RmbojzZU3pn9N0jyhtLrnnOSFUBoPw5GJAWWNGCsx9K
	pLJyFa40Kq533yC+dhbeJLTtPe9IRHlfUtQ4cSWJ6uwHTwm1VvEeoi+EyHbjeXgMd/axBETbWPx
	NiG087unPprN3YVi8T8Gz0w9juLCAc2sapAMWf8szdZF48BQZVPUnoIcN/V+sQjakTKxi9MPP9A
	SfUJndphd5NoZCeYawV5k4Ubpoq5Dxl64N8IU8h/hEcAzS4R7TAtRNNlpdj2oy/HivkGctfTdST
	xMKdvOpDY0bG2Fr5/V+vstKNz1GnOZ55hmfDwGYkxvBeoEU1hpZvz5F/hYuCoUnKo9YRRbCwNaa
	PTCf3LZ6P6LyY/okrOdpYWc4CKiNlDmVOGcAMOmYw3JdOC1pO/9EYYcNnmEcEL7jWNuvMvUeryD
	rfCT/EUP1Lrim74+TbS87M0eqasdRS4YwUgn1K/I/pA/4SHH/egVSnK0dbt8DHsuawNQveKETGP
	Y6erAgIR/D5r4ykwQ==
X-Received: by 2002:a05:600c:310e:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49ce55906cfmr27491975e9.0.1788326830660;
        Tue, 01 Sep 2026 22:27:10 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/27] vim: Security Fix for CVE-2026-59858
Date: Wed,  2 Sep 2026 07:25:41 +0200
Message-ID: <7a9e6b91121683b4694d11138f148bfdd3e6f97a.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244875

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
[2] https://security-tracker.debian.org/tracker/CVE-2026-59858

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch b/meta/recipes-support/vim/files/CVE-2026-59858.patch
new file mode 100644
index 00000000000..0b754ec2d34
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59858.patch
@@ -0,0 +1,134 @@
+From 6b611b0d15603c52ebdad17172b0232b4f65704e Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Fri, 26 Jun 2026 15:41:24 +0900
+Subject: [PATCH] patch 9.2.0735: [security]: arbitrary Ex command execution
+ during C omni-completion
+
+Problem:  [security]: With C omni-completion, a crafted tags file can execute
+          arbitrary Ex commands when completing a struct/union member
+          (cipher-creator)
+Solution: Escape the type field before inserting it into the :vimgrep
+          pattern so it cannot close the pattern and start a new command
+          (Hirohito Higashi).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-mf92-v4xw-j45x
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704e]
+CVE: CVE-2026-59858
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/autoload/ccomplete.vim        |  2 +-
+ src/testdir/Make_all.mak              |  2 +
+ src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_ccomplete.vim
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index cb4bb2c167..248d6f2e60 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -593,7 +593,7 @@ def StructMembers( # {{{1
+         return []
+       endif
+       execute 'silent! keepjumps noautocmd '
+-        .. n .. 'vimgrep ' .. '/\t' .. typename .. '\(\t\|$\)/j '
++        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') .. '\(\t\|$\)/j '
+         .. fnames
+ 
+       qflist = getqflist()
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index 7d57b2e727..681e9b3b2a 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -242,6 +242,7 @@ NEW_TESTS = \
+ 	test_partial \
+ 	test_paste \
+ 	test_perl \
++	test_plugin_ccomplete \
+ 	test_plugin_comment \
+ 	test_plugin_glvs \
+ 	test_plugin_helptoc \
+@@ -516,6 +517,7 @@ NEW_TESTS_RES = \
+ 	test_partial.res \
+ 	test_paste.res \
+ 	test_perl.res \
++	test_plugin_ccomplete.res \
+ 	test_plugin_comment.res \
+ 	test_plugin_glvs.res \
+ 	test_plugin_helptoc.res \
+diff --git a/src/testdir/test_plugin_ccomplete.vim b/src/testdir/test_plugin_ccomplete.vim
+new file mode 100644
+index 0000000000..a635bd50bd
+--- /dev/null
++++ b/src/testdir/test_plugin_ccomplete.vim
+@@ -0,0 +1,62 @@
++" Tests for the C omni-completion plugin (runtime/autoload/ccomplete.vim).
++
++func s:WriteTags(lines)
++  " Mark unsorted so lookup is a linear scan regardless of entry order.
++  let tagsfile = tempname()
++  call writefile(["!_TAG_FILE_SORTED\t0\t/0/"] + a:lines, tagsfile)
++  return tagsfile
++endfunc
++
++" A crafted typeref field is interpolated into the :vimgrep pattern in
++" StructMembers().  Without escaping, "/" closes the pattern and "|" starts a
++" new Ex command, so the field runs as an Ex command during completion.
++func Test_ccomplete_no_exec_via_typeref()
++  unlet! g:ccomplete_injected
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:x/|let g:ccomplete_injected = 1|\"",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  call ccomplete#Complete(0, 'myvar.x')
++
++  call assert_false(exists('g:ccomplete_injected'),
++        \ 'typeref field was executed as an Ex command during omni-completion')
++
++  bwipe!
++  let &tags = save_tags
++  unlet! g:ccomplete_injected
++endfunc
++
++" A legitimate typeref must still drive struct-member completion: escaping the
++" field value must not break the normal path.
++func Test_ccomplete_typeref_completion_still_works()
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:struct:mystruct",
++        \ "alpha\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
++        \ "beta\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  let items = ccomplete#Complete(0, 'myvar.')
++
++  call assert_equal(type([]), type(items),
++        \ 'ccomplete#Complete did not return a list')
++  let names = map(copy(items), 'v:val.word')
++  call assert_true(index(names, 'alpha') >= 0,
++        \ 'struct member "alpha" missing from completion: ' . string(names))
++  call assert_true(index(names, 'beta') >= 0,
++        \ 'struct member "beta" missing from completion: ' . string(names))
++
++  bwipe!
++  let &tags = save_tags
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a484a5c8405..6ef9745b574 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57455.patch \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
+           file://CVE-2026-59858.patch \
            "
 
 PV .= ".1683"

