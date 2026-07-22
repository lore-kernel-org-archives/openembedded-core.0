Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CDEC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:23 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9353.1784751739633965142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dYqTL2Mm;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1502093a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751739; x=1785356539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+8PYm7JkNVL8AfkNIe/0OqGlZ0HzSvCmex1Gyv1dCA=;
        b=dYqTL2MmUgwrg/LAXWZlcM87DvhTrZswkYM7ZH8L1LkCaKo5wTWRQWbUpEGlz5wRmV
         yFsRltMM1ILIl65A9hiP1bc7uFwgNhb7e19pZD1zwM+rCumTZBl91Mm0wFOM7h97IEw6
         ULhjxL3R/avG/peUX7HXmCW6hzkfvVkbKUTug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751739; x=1785356539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+8PYm7JkNVL8AfkNIe/0OqGlZ0HzSvCmex1Gyv1dCA=;
        b=eRW/pLFBbWNSRIATxJ8xooJgeGggwMl7+40EHyPPs/BmPL8crmOAHXboiDvf7sFx8D
         44JVkz5ltQAAwHqK8W1qtL7rxtxZaV3oeaeOHV89XdEKUffSnjLWxCD9F71JlHJTCJLF
         qjwgZWrpB5FpxspO5sq/4Ym1cIuYQPFql0wItmv9PgpRPc+fB7fjFF4k0rMEEf9YnNXP
         0g9xiKqHd8LcpY9clcJM9vvje3Fw+Q/xGEJ60HF9nv15fxYF1r/ndwi2kHayBENddNag
         jITkHvS0yAsh+o5BtHYCeX4v/LqagnorKO/V+rmpIyxUUeFM9zX0fo7jj3FVc/+YfwXD
         nk2A==
X-Gm-Message-State: AOJu0YxLAnPKyXfVaTYkKWEwZnU04asjvHo04kl8SID1R7+ZGJAMsYtN
	m08FAj6hXVIMNHUBZFHgyGJcfQe52dWIGFlvz19XpYpbBX1T3r18excflveZE//TBL/w2FU2BzO
	E5fqD3TE=
X-Gm-Gg: AR+sD10yErpirxxMeHrIRUKI9QuUdaQ8fK8v1t7akaaeLsfuGUFSWdB6KROb/nHKf01
	aweVZD1lVjF7mN0HFUyAEvKpYd6kmVWfi363mLGEOi30r1myPlERTC7L9UUZS8FjkQOEOBcFIi7
	1ngB61SIE+XIjkso4HG3p4FAt/fEcswg5qfbedt/EPhJa8qEcdj68JMC5sbzP7qIOR/dTcmZNK0
	tHyzLjWNpLHHkB3aPVwHDu1pY2YUyTqxKtFh0EtdWKSjVufuc0lp8AJBECWfyFAJtvxqaRbJRAx
	4mYBBHmI2EPvQn11+OhbSo2Ub8fT0PXHOKEx153z8aHZWcNfQ93LjMxZ7BBGUYo0lBuJ437HHBk
	KAkLkFj5s1Y1PV/x8sw2O3usKunoHCUbAZyYU6GOnE54E5tEqRwrvFJWqMwe1eVBeCxC354ESKy
	R/qx/KvoExUZG5
X-Received: by 2002:a05:6a21:7111:b0:3c0:9c1a:8953 with SMTP id adf61e73a8af0-3c44b2627b6mr2524637.75.1784751738858;
        Wed, 22 Jul 2026 13:22:18 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:18 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 11/13] vim: Security Fix for CVE-2026-59856
Date: Thu, 23 Jul 2026 01:49:03 +0530
Message-Id: <20260722201905.491897-11-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241755

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
index 0000000000..de12e5c4f5
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
+@@ -247,6 +247,7 @@ NEW_TESTS = \
+ 	test_plugin_helptoc \
+ 	test_plugin_man \
+ 	test_plugin_matchparen \
++	test_plugin_phpcomplete \
+ 	test_plugin_tar \
+ 	test_plugin_termdebug \
+ 	test_plugin_tohtml \
+@@ -520,6 +521,7 @@ NEW_TESTS_RES = \
+ 	test_plugin_helptoc.res \
+ 	test_plugin_man.res \
+ 	test_plugin_matchparen.res \
++	test_plugin_phpcomplete.res \
+ 	test_plugin_tar.res \
+ 	test_plugin_termdebug.res \
+ 	test_plugin_tohtml.res \
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
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a76cdc53ae..770872df01 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57452.patch \
            file://CVE-2026-57455.patch \
+           file://CVE-2026-59856.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


