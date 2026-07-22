Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A23FC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47126.1784723666116259652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cMiry6tm;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e347638adso7556000a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723665; x=1785328465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhtQIebtHCUf5i1JGKj3dT/7bvnIDHWmD/WeMpaY2Yw=;
        b=cMiry6tms9MMwrfPV6i6lNIXIOHeXIORb6yHyNWtZVUVleeFEAczMjmWt5+jSKyYZe
         yH21Oce+wk+zm3MTkYSKbtalSTOsOb+BJ2nq6Vo4AuNhrPpyYz19as88npxr6UHeOkUK
         MZLMzk1vO43iEMkbSG4l8avJwtPP2YyDeVMHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723665; x=1785328465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OhtQIebtHCUf5i1JGKj3dT/7bvnIDHWmD/WeMpaY2Yw=;
        b=EbzHGjNsTJvQelIKrCA3lbTD5afUiGpbUIJqoNJJBRG6wMxv26cZl+GchfqN1ynOlU
         E+FWswJWW7odInGNGzuRJ+W5OQEk7I8LowWO/LhaUFQzMMX6jcNSioo6u/dndFDSrHft
         eVbBmpRKm3fG7Tl9QMDdH0VjdpfDUmbSnGbGrN2a4gBFSLkprcw28NkbUTQt2rlo1GVB
         jMnLrV7yk6c2N3meSDsbz4sf9TLGl4MSy1nAPnPrcUr8fblkON9YH2f/9MtWkCb78tfA
         VfDs//GYC6AtgLVQ5P+5GiYSbNrHfXqIsF6ALAlQ+Py91Mt1sHPnbStBpGphVuZTbvCs
         zw4g==
X-Gm-Message-State: AOJu0Yx11b0SwQwO7/YT7zhgRw0oEd3g79vhmOyM2/gE0Kk9EKGmZyzo
	PRoKPdRrKfQrEou1CTGDzibZXvYW7S0zQjFNXv5Lfhbe1UQ8O91LgxplbHp6xdzqlakn7Q3bBs8
	ukIRC5Fg=
X-Gm-Gg: AR+sD12qV2s2dDbl+MAsj9gF+CAOk1D+ZiloEYOotstEKZnAovM/zpzP83weGRVNT6o
	bEKSeQrlENZLv/1SE2X+7LDKcpXHEUnUDwrokMSLZEnvS3ukLYsIYw2Pfcic04ceiSxdg2qAebe
	x1X4GLl+F5ys45P/E7Q5OBPM18+3hMBEZfcpuUbdqMvvtCfWZNCiJ15URroR05LSG0+lpAb1UzU
	wCth88ssFf7ykE9PdVWvYczhvn4n4eA30OgMCsjlQZ4AUz8c3UROh9Th5zdVQ8zkxgsy1Ni8v0V
	hRFRH+PmRZwd0pXvTb9KgSNI9hCTu8iXVfQqIJaMFweBgvgZol7RM432pb34jP69ukpXRZCAtCb
	BhmrtPX6vaLf7UGbG09TDU9w5iAjVzZpi1HBFuaBIjVK8UflaKlUh4/7FJuA2/0ZeLX6hJo+E+Y
	iNcsGIl9g0+MuE1w0O
X-Received: by 2002:a17:90b:4d8f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-38eb400a9camr839788a91.13.1784723665391;
        Wed, 22 Jul 2026 05:34:25 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:24 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 08/10] vim: Fix CVE-2026-59856
Date: Wed, 22 Jul 2026 18:03:34 +0530
Message-ID: <20260722123336.587556-8-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241676

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59856
[2] https://security-tracker.debian.org/tracker/CVE-2026-59856

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-59856.patch            | 103 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59856.patch b/meta/recipes-support/vim/files/CVE-2026-59856.patch
new file mode 100644
index 0000000000..42636161d0
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ runtime/autoload/phpcomplete.vim        |  3 ++-
+ src/testdir/Make_all.mak                |  2 ++
+ src/testdir/test_plugin_phpcomplete.vim | 35 +++++++++++++++++++++++++
+ 3 files changed, 39 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_phpcomplete.vim
+
+diff --git a/runtime/autoload/phpcomplete.vim b/runtime/autoload/phpcomplete.vim
+index 5b4263ae45..ec54352586 100644
+--- a/runtime/autoload/phpcomplete.vim
++++ b/runtime/autoload/phpcomplete.vim
+@@ -2082,7 +2082,8 @@ function! phpcomplete#GetClassContentsStructure(file_path, file_lines, class_nam
+ 	let result = []
+ 	let popup_id = popup_create(a:file_lines, {'hidden': v:true})
+ 
+-	call win_execute(popup_id, 'call search(''\c\(class\|interface\|trait\)\_s\+'.a:class_name.'\(\>\|$\)'')')
++	call win_execute(popup_id, 'call search('
++	    \ . string('\c\(class\|interface\|trait\)\_s\+' . a:class_name . '\(\>\|$\)') . ')')
+ 	call win_execute(popup_id, "let cfline = line('.')")
+ 	call win_execute(popup_id, "call search('{')")
+ 	call win_execute(popup_id, "let endline = line('.')")
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index b06d1af431..b5735b6c3c 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -250,6 +250,7 @@ NEW_TESTS = \
+ 	test_plugin_man \
+ 	test_plugin_matchparen \
+ 	test_plugin_netrw \
++	test_plugin_phpcomplete \
+ 	test_plugin_python3complete \
+ 	test_plugin_osc52 \
+ 	test_plugin_tar \
+@@ -529,6 +530,7 @@ NEW_TESTS_RES = \
+ 	test_plugin_man.res \
+ 	test_plugin_matchparen.res \
+ 	test_plugin_netrw.res \
++	test_plugin_phpcomplete.res \
+ 	test_plugin_python3complete.res \
+ 	test_plugin_osc52.res \
+ 	test_plugin_tar.res \
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
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 008dbdb8df..b9f8e40a28 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57454.patch \
            file://CVE-2026-57455.patch \
            file://CVE-2026-57456.patch \
+           file://CVE-2026-59856.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


