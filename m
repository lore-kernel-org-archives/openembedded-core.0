Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCDFC61DDD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3046.1787945897116719011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vlnZpLoQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b9320423cso12423335e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945895; x=1788550695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vdSTS5xEkEwDA7tfNIwAXeKWgjMgQaYkSqQCWIpsy3M=;
        b=vlnZpLoQ+AUeB6xh4USwgywu4uB7yTEricywzlk8tasnTLEtnweHfkZnpV7GFbwlsA
         UgeDxyTNcGVKqEOT0TXo55qpTPNtR0ATVlwaAZhgbxIOKMZYRBVmLK5qqclkZ+gvcm/L
         Zn8WXRs98J/cOAYbcibFDvPmVekn7MHG0in0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945895; x=1788550695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vdSTS5xEkEwDA7tfNIwAXeKWgjMgQaYkSqQCWIpsy3M=;
        b=FD4yQw6uYeSujRrZZmagLfT4popnlHYMX2jX+HG9W07NFd81eUm137pgtVCabc7gJu
         aVCuyV3JI+AlaQ/A82C3z3/3pH9C6pOw9ehj46y3wrO2GQpoZK8qQR6YuxgsZNGvzvmg
         uCzNcV9ERX+RgB/XUbpFmBv2oMd9axlmejPU7JE34ydS0VHYwq9ssGHYo6xxVX8YUIxq
         h8dVJpyt270/g7oczkQyHoR7GUHegZ3ODsWHH17OH+AB0m3V5Dn13N9uYhXARfV+0flx
         jTQVVh5C89auzWr9Lb4f0NzKy3kcoxlWA+ZHZwC/IEubIvUg5Z5XdOcCVlAxCuef52JH
         kHEA==
X-Gm-Message-State: AFuF++k+41RovlRpgmflM+mIv9sr1VLCjaGx8EkZpwHZhDtvxHBSe6Rn
	JJ4Q4bb8U4hdXZhtzCP2z+JSWcXarHY+JXkSqfXh5gUShYXubcd+gRLOzuf5oNkBb/Hn/Mwq0zW
	u/xZxgkM=
X-Gm-Gg: AR+sD13xlMjE/UktCP87oD8vl/PdcMcJFo+7Ele1KbhDB/8mT+kkAfjlMIYhWKSFw40
	mas1yaSB0BR67C8zoZx2fGgLqyN5FrUIkX5Er2LPuuysyiA+3dDoh0iFhot5XgdFWK3jcOZalmZ
	uEMbFzwlefOjS4Lla7Qnc7dHGJB+wwLWM3zmiA8rNVqFRF+QZpKWgiMCoUuRETOii51Pr/gvlo0
	qDpQNjYJCiaB+hRIXGQtWp68Ua+9HIOiSPpfdfx10otNpLf+vAivAvcIYXYDN4gAbPvqat3qiGT
	NcbQcG249b89FQerZN4im1A1BN8MjXdGlv4iILMXYOSBSMxND2Ue9mOliiXq5mp1Cbc17K5ZUDt
	IvSodAEy+6Rcm/6EsqTyXipl9ckrAiYLJS7ppeFwHA3Mwn6ecls2O+hWXfKZ2dnvkKX/M7Wey24
	tVmQV37NMPtaQGy0JXGgBFAaC4unwQn0v1UnAxk9W3KADmP2EerFqoyIzthlZbfr1Qh/QV1UQxz
	ruUBO/Qo4nV04dcZxe48nesMEU8b0qLG3yHZyR10/h7+xXpvd/9P7WTYnZ3L1L0
X-Received: by 2002:a05:600c:4f86:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49b91c4faa6mr119851165e9.12.1787945895299;
        Fri, 28 Aug 2026 12:38:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/56] vim: Fix for CVE-2026-59856
Date: Fri, 28 Aug 2026 21:35:30 +0200
Message-ID: <3dd9d05f763c278239202fdfb26a647ab5b3810d.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244581

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/43afc581a37a35762dd0ef292f038b9dc5680a24
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59856

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-59856.patch            | 118 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59856.patch b/meta/recipes-support/vim/files/CVE-2026-59856.patch
new file mode 100644
index 00000000000..9e9bdf03c54
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59856.patch
@@ -0,0 +1,118 @@
+From c532c40015db331fbcfdf4ef9dd717b13fc54d2e Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/phpcomplete.vim        |  3 ++-
+ src/testdir/Make_all.mak                |  2 ++
+ src/testdir/test_plugin_phpcomplete.vim | 35 +++++++++++++++++++++++++
+ src/version.c                           |  2 ++
+ 4 files changed, 41 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_phpcomplete.vim
+
+diff --git a/runtime/autoload/phpcomplete.vim b/runtime/autoload/phpcomplete.vim
+index 5b4263ae4..93f7d8b45 100644
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
+index b06d1af43..b5735b6c3 100644
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
+index 000000000..7f66be47b
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
+diff --git a/src/version.c b/src/version.c
+index bf680c656..fbc2c8b15 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    736,
+ /**/
+     699,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0f1355f0fcc..f0e54d71e08 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57454.patch \
            file://CVE-2026-57455.patch \
            file://CVE-2026-57456.patch \
+           file://CVE-2026-59856.patch \
            "
 
 PV .= ".0340"

