Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1C1C61DDA
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3049.1787945898833668254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xf96SiCH;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso12176015e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945897; x=1788550697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tcWhUDmmEtXYIymubPeEjD5qaZ9RKUSSz823z1q7AeU=;
        b=xf96SiCHMG2W4fOgndwAW7mT/UU2dj9opoZamSCFRZ18SNKxqvfWu0zZhb+hUJSlaY
         aDVpbkc0cgDF+FgotDOa6aaigsj2NY6AV9U+Xdmze1O6TiZ1U8Bxrenj9CDJwfgccQB+
         C8SvuEyxNP1bfDGQPZRR4gEtrwHgWsY+03e84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945897; x=1788550697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tcWhUDmmEtXYIymubPeEjD5qaZ9RKUSSz823z1q7AeU=;
        b=RpzcOi2NAX7W+88bRJq6St5I0fXKEwLTJ648vgJ8VCMD462XLqLb/ujj93DwSdzpTE
         kbXD9HvLbYIx6UV1uE9zWwtKcC3yNHj8A+pqIecnYyRkvp6JeGDyYow0XF6iwm/mzty0
         5haNUpyRki4i9QWg0bTcgq/K4JmJ7lJnsSATfvVGHSGh2QuyviNjg/T62k0LxjopLsTV
         mkH+Fn+ZQBaR545pMjDG4Pl5qKRSqvzlAEcSeqMJ8YiGzdYPs22heiMU+Q7p643vfmgp
         w8VBNf/N9ut013PA56ZOXLeNhXA5BMuYVuAR6ct4ymxSPj/2MEfs9mzv1xsya4QxHxMC
         NdTA==
X-Gm-Message-State: AFuF++mklcCZc1bVCeL2Zgxqi5oWAb4UQZYv7eyfu6Z+tz72/m7uc4gz
	xK6hqs6RODCJXwCDK9U/IOgkrC5t+kcfTLUH4s+PxexInmT7uBrOwjMn7T8a+4oX1RlzdEjtZLb
	OpzJU3KI=
X-Gm-Gg: AR+sD11cg1U7Yw9A0r8nYEXUkc2+sU0yAptkVUqTgDoaH7Ekcb51OAIPxrkFgq/KZKp
	uXGJRG5rGqqE+gOtIASEpHwiGpTG7R52iAUsm9SUj0aTk3Xd7TWbZA3HutdwFTMZnyrrJAuMpod
	rtYS1bLGFWMaMEJ5zPw58Ugj58eL0I1lp1MxnyMtyHahLSY4VrmXtBfj2L40qKPGjlcRuJoYK3J
	zSzKhnYfY0htIhIUJ97ZEZp+DadI4V1qTmxHbGuIxkjFnfU/I2QVzSQERiV3feXojERAIF+V3Y5
	EnBuVNuE4iegKPK8o7dDIYYlufjgSq5GFrLj/o9etOjsPTrv4ui8YrCCKuX/lCrjpAvBX0lm2/D
	ziPxz8aY2NaZs9FP87ZZFb79A0/FGgMFuD+rDu3pB0lwO2aE5Cp+CnwkQnFcZAVLz4BJJpFZq/h
	QqIScMvZGygxhVBD2br9JIYt5gP3BV2WtXBD7nxvp2YLZQ4W7qb1MzKDMPw0WGcigQGsqKutXdk
	B8B+bFsovohM5pTDtlgJQrsposOzF72vG1cWbrItdjYUykSgfss9SCoiCZ+gcUK
X-Received: by 2002:a05:600c:3b28:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-49b91c56cdemr134194605e9.14.1787945896827;
        Fri, 28 Aug 2026 12:38:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/56] vim: Fix for CVE-2026-59858
Date: Fri, 28 Aug 2026 21:35:32 +0200
Message-ID: <74ed9dcd715a214ca7fbc368aa763a400c69adcc.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244583

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59858

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-59858.patch            | 149 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch b/meta/recipes-support/vim/files/CVE-2026-59858.patch
new file mode 100644
index 00000000000..f18637bd938
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59858.patch
@@ -0,0 +1,149 @@
+From 09554668bd5ab31261a5c5585a0f58baa1080105 Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/ccomplete.vim        |  2 +-
+ src/testdir/Make_all.mak              |  2 +
+ src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
+ src/version.c                         |  2 +
+ 4 files changed, 67 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_ccomplete.vim
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index 51237be98..dc3388b52 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -600,7 +600,7 @@ def StructMembers( # {{{1
+         return []
+       endif
+       execute 'silent! keepjumps noautocmd '
+-        .. n .. 'vimgrep ' .. '/\t' .. typename .. '\(\t\|$\)/j '
++        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') .. '\(\t\|$\)/j '
+         .. fnames
+ 
+       qflist = getqflist()
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index b5735b6c3..0cf2c4110 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -243,6 +243,7 @@ NEW_TESTS = \
+ 	test_partial \
+ 	test_paste \
+ 	test_perl \
++	test_plugin_ccomplete \
+ 	test_plugin_comment \
+ 	test_plugin_glvs \
+ 	test_plugin_helpcurwin \
+@@ -523,6 +524,7 @@ NEW_TESTS_RES = \
+ 	test_partial.res \
+ 	test_paste.res \
+ 	test_perl.res \
++	test_plugin_ccomplete.res \
+ 	test_plugin_comment.res \
+ 	test_plugin_glvs.res \
+ 	test_plugin_helpcurwin.res \
+diff --git a/src/testdir/test_plugin_ccomplete.vim b/src/testdir/test_plugin_ccomplete.vim
+new file mode 100644
+index 000000000..a635bd50b
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
+diff --git a/src/version.c b/src/version.c
+index ceea0d5e7..92cd53129 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     736,
++/**/
++    735,
+ /**/
+     725,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9e2338fcb04..1da47d92430 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57456.patch \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
+           file://CVE-2026-59858.patch \
            "
 
 PV .= ".0340"

