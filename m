Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963D2C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:37 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19554.1784798793574630070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NPTrH3nG;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso260945a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798793; x=1785403593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcrC88SHTY9tP755hd23D96FOs0pRRkrMq7CLcFnWhI=;
        b=NPTrH3nG/9+RtNPaww+Dk36mJtCj1ZRoc6O8uOyiIpqdPjVP6szqgTJGeBRwjzNl/v
         Pdg7A/tyI4RA+OHysuttOWok3yELt2qaK3l9cQSHIjjg7yUk2Vv5fmPK2fP2OiIw7naY
         IzaXBgFE0+0YsDnIXbA8tBrBZJ7zLLzDzpRXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798793; x=1785403593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcrC88SHTY9tP755hd23D96FOs0pRRkrMq7CLcFnWhI=;
        b=OosDESmH6i+CuC3Ja2pWyd1CMf2IQkQt4UL/IHns+zqgZjCsND1MolgHczdD69GwMg
         2MzcpiAsnIZCMPNH1KCsruS9BOtdGXRkOJqnyLdsudjPxP3zN90GR20FdLbc7IpUjOJl
         Y0jM1Whi63HGPZPLirKCr3QMihp7higfEiMk2s6n6PEvl0TI8JdOb0keYydBgJBHx8E+
         3bbiFx1ynODlqDgy5b+jYBDsOQQozDszS6g2PfZw2WTSlCfUZZZK8lmtezSPv4A0tNnW
         UXi45DuK2vDFV/WCF7cHtsWcXADIut0Vaa46ZQaHjZBi00kaHitpI6nVA5jt/LX2p/T0
         BQ3g==
X-Gm-Message-State: AOJu0YzC2OZ3Ns6eNNmvvYvr1iP56DC5DafPzq6BwtkKOPAvap+nd/Ot
	DjSLWIRQqe/alG0+9dHoipd2nheO8dAUV8BijRxualcbImFL97JWCGFvENn4/QwII6Y/4QoRwcp
	C0MYY0JI=
X-Gm-Gg: AR+sD10MSdZlWiYuGidkTsdjQU7lJkJPk2W+t1QSsEDKgrCSz98UkAVHFGDYgStwfzE
	Di754hi7NNV2FEXtkwQoU3/2+qL9+Ol9FoYOmE8VFE3I1Ga1IrViVoWYDHwA+fssqJTXlqWWjzL
	BGiu4AcCQgPIvdgF0jZqz/E5Z+5OnwI44eCsHj/9Oo4ghkqxDAskH87VlnCeCHgxr0/DzYXhZ+9
	HPERF3amdxk15N0CXaeg+aGScYDH9ZMNfTGEzlU92kyBE50296YlHBIrax+GToYswM3UfOqQAQU
	dA7eLrsRrQnryly4Gx2w0bPTiEBSnpJBd8l5Uxo6w13zYM1aSwd/6NoKB52hO2Gqfc3kC5Wx/PZ
	efo71OoT3HUW4wJfyYs2ZZS7A6bmzq4crur/UICAeAZB7ZrFyW1JVm/sjZ9Fv44oMZCduMXm+pF
	usZRp0vb1mX+Q=
X-Received: by 2002:a05:6a21:2d4b:b0:3c0:4269:47bb with SMTP id adf61e73a8af0-3c44b1d93a8mr2399071637.52.1784798792893;
        Thu, 23 Jul 2026 02:26:32 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:32 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 11/13] vim: Security Fix for CVE-2026-59856
Date: Thu, 23 Jul 2026 14:53:52 +0530
Message-Id: <20260723092354.54697-11-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241815

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59856
[2] https://security-tracker.debian.org/tracker/CVE-2026-59856

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-59856.patch            | 103 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59856.patch b/meta/recipes-support/vim/files/CVE-2026-59856.patch
new file mode 100644
index 0000000000..01267460d1
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
index 8794f831b0..37a965429a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57452.patch \
            file://CVE-2026-57455.patch \
+           file://CVE-2026-59856.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


