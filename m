Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FE5C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5545.1788326829107051386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qrdp9Vor;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso5308705e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326827; x=1788931627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=28CJidXR0pt89WG2pQePGbrZFc3DjiVxSEQ/iuqXCaw=;
        b=qrdp9VorslYoXQMvWAoP4zsyX9KZltfB0yNoedt6u6IyQpFeOx564Zp6fAmFNMJFPB
         0Uji4uwuKsMSpsAVpdVYEeDSugLOZSevi8f6X6l4INXCsomHhr/OOj7HJVuFUrJVrlAY
         4fPWlrVmj647aqm2IKEEWo6HDL7/xRXxGyFaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326827; x=1788931627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=28CJidXR0pt89WG2pQePGbrZFc3DjiVxSEQ/iuqXCaw=;
        b=OhSU2xLzl5kyCAf6GtQEsT8QB2K8py2YWV4w5/aB6HjJBALeTsFsPefUq4RdQI2AbV
         796Sv10qkAArpV2YjqUz9gfBmVsJE8I7gf99ZSdr8QE7/mx5Ufb0V2ymYU9IERQ4N6bW
         h+Ohv7p/BySeJW3Oux0x68wpl5VtA5KU2xkfUWxveKNJJNL3u2QY+vNcoU+vGnseTH0c
         yvDe+Pz4X756Ue/84GMVnfwNLVrnGTcjEHyH5Rc3xUeOQDN9c1GRGrWBZI7E44E85djl
         3TQjRlUcZNrtXSjqIMFwopwql/6NEF5Vk5keret2tg7pcgHLvTGR6Pn9gCIZ51pre9Wg
         MxCA==
X-Gm-Message-State: AFuF++ld/ttyIzc0WUGwwr/NifRfl71/LATi302wRDrLF27gVv5u8dEF
	mFyQI9CDO3NJdzhsFJ9ox4II7dxKvibFDUEfx1lUNdFg3iUfvtOIb1vuDXFeSllOguDxRiKbnpm
	XxqTKoAQ=
X-Gm-Gg: AR+sD10EZPV/e4NOQiJxU9lSsTSMmL7zdpHYiS9KL9jFffM4Cc4NoloBWOCdKWic9dE
	KcSwdIJ8CuHB+Ac5+5l0+WRcn0FKlW6ARygZqfdOJ12mzCxYW9jfMHUL5cG2w39f71MkF792/T1
	jtro6MBu/pcqNXddQIM1cOcMnSA/VGsg6HFZDFE4KwBHxu5CPL4do4XXSYW1PUjYlYoUdGTcHHL
	mjMTK8kuF77vWdaUKF11YsZ6vR58WOyXf3zvkaVek5dKQmWSn3qYO5uRjw9oiJmHwk6tmlJJogc
	i/kKZhsCUKIFDEjrBxhsAz0TWhCrHsKeOLk+ZnlhKK+ltWAWg9X6ITwkRNVysQ9gea602S5YTkq
	3sdYu47ZjE6/mrT2MNfhyxWfJjWP5hUVn61glcsv86jpeNuNdJSBzrG7hpfItzU5NSG7wrPpxOl
	p16GdR7dj0ztPyKwbsBsXkp5iXPEI1aMP5uxiYlL/8ZoDF8eIUKWgtEkGQJZfXjf/rmyXVaSVyr
	TFRBmVNRG6gldfaOZBFYh0Hl91s
X-Received: by 2002:a05:600c:4e44:b0:49c:dcf8:5216 with SMTP id 5b1f17b1804b1-49ce57e7f55mr39040825e9.6.1788326827249;
        Tue, 01 Sep 2026 22:27:07 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/27] vim: Security Fix for CVE-2026-59856
Date: Wed,  2 Sep 2026 07:25:39 +0200
Message-ID: <fbffe073ee8694f5c69e2f84aee356d5d02238f5.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244872

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59856
[2] https://security-tracker.debian.org/tracker/CVE-2026-59856

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-59856.patch            | 103 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59856.patch b/meta/recipes-support/vim/files/CVE-2026-59856.patch
new file mode 100644
index 00000000000..01267460d11
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59856.patch
@@ -0,0 +1,103 @@
+From 43afc581a37a35762dd0ef292f038b9dc5680a24 Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Fri, 26 Jun 2026 20:07:01 +0900
+Subject: [PATCH] patch 9.2.0736: potential command execution in PHP
+ omni-completion
+
+Problem:  With PHP omni-completion, a crafted file can potentially
+          execute arbitrary commands when completing a class member.
+Solution: Quote the class name before inserting it into the search()
+          pattern run via win_execute().
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/43afc581a37a35762dd0ef292f038b9dc5680a24]
+CVE: CVE-2026-59856
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/autoload/phpcomplete.vim        |  3 ++-
+ src/testdir/Make_all.mak                |  2 ++
+ src/testdir/test_plugin_phpcomplete.vim | 35 +++++++++++++++++++++++++
+ 3 files changed, 39 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_phpcomplete.vim
+
+diff --git a/runtime/autoload/phpcomplete.vim b/runtime/autoload/phpcomplete.vim
+index 5b4263ae45..93f7d8b450 100644
+--- a/runtime/autoload/phpcomplete.vim
++++ b/runtime/autoload/phpcomplete.vim
+@@ -2082,7 +2082,8 @@ function! phpcomplete#GetClassContentsStructure(file_path, file_lines, class_nam
+ 	let result = []
+ 	let popup_id = popup_create(a:file_lines, {'hidden': v:true})
+ 
+-	call win_execute(popup_id, 'call search(''\c\(class\|interface\|trait\)\_s\+'.a:class_name.'\(\>\|$\)'')')
++	call win_execute(popup_id, 'call search('
++		\ . string('\c\(class\|interface\|trait\)\_s\+' . a:class_name . '\(\>\|$\)') . ')')
+ 	call win_execute(popup_id, "let cfline = line('.')")
+ 	call win_execute(popup_id, "call search('{')")
+ 	call win_execute(popup_id, "let endline = line('.')")
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index 0d4aeb0432..7d57b2e727 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -248,6 +248,7 @@ NEW_TESTS = \
+ 	test_plugin_man \
+ 	test_plugin_matchparen \
+ 	test_plugin_python3complete \
++	test_plugin_phpcomplete \
+ 	test_plugin_tar \
+ 	test_plugin_termdebug \
+ 	test_plugin_tohtml \
+@@ -522,6 +523,7 @@ NEW_TESTS_RES = \
+ 	test_plugin_man.res \
+ 	test_plugin_matchparen.res \
+ 	test_plugin_python3complete.res \
++	test_plugin_phpcomplete.res \
+ 	test_plugin_tar.res \
+ 	test_plugin_termdebug.res \
+ 	test_plugin_tohtml.res \
+
+diff --git a/src/testdir/test_plugin_phpcomplete.vim b/src/testdir/test_plugin_phpcomplete.vim
+new file mode 100644
+index 0000000000..7f66be47b7
+--- /dev/null
++++ b/src/testdir/test_plugin_phpcomplete.vim
+@@ -0,0 +1,35 @@
++" Tests for the PHP omni-completion plugin (runtime/autoload/phpcomplete.vim).
++
++" A buffer class name is interpolated into a search() pattern run via
++" win_execute().  Without escaping, "'" closes the string and "|" starts a new
++" Ex command, so the name runs as an Ex command during completion.
++func Test_phpcomplete_no_exec_via_class_name()
++  unlet! g:phpcomplete_injected
++  let lines = ['<?php', 'class x {}', '']
++  let payload = "x')|let g:phpcomplete_injected = 1|call search('"
++
++  try
++    call phpcomplete#GetClassContentsStructure('x.php', lines, payload)
++  catch
++  endtry
++
++  call assert_false(exists('g:phpcomplete_injected'),
++        \ 'class name was executed as an Ex command during completion')
++
++  unlet! g:phpcomplete_injected
++endfunc
++
++func Test_phpcomplete_class_lookup_still_works()
++  let lines = ['<?php', 'class Foo {', '    public $bar;', '}', '']
++  let result = phpcomplete#GetClassContentsStructure('Foo.php', lines, 'Foo')
++
++  call assert_equal(type([]), type(result),
++        \ 'GetClassContentsStructure did not return a list')
++  call assert_true(len(result) > 0, 'no class structure returned')
++  call assert_match('class Foo', result[0].content,
++        \ 'class body missing from returned content')
++  call assert_match('bar', result[0].content,
++        \ 'class member missing from returned content')
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.44.4
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8794f831b05..37a965429a9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57452.patch \
            file://CVE-2026-57455.patch \
+           file://CVE-2026-59856.patch \
            "
 
 PV .= ".1683"

