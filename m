Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A1DF36B95
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:43 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145079.1775776302340420827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MSIxVzkc;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso14941075e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776300; x=1776381100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgRB6mtwS4X69iuWHKU2dnIK3AY7Udca1dpaZwyjjkQ=;
        b=MSIxVzkchRhHK0qyfhaM0aEz+Hka5ao7R3O6VIuZh2U3kPpR1vcClIHMsL1Y85YpRH
         aVDfyN8+Lv/UlpKCcP8P8k/GYLymHS69DY4UH/oiMJoPTv/zHQ5FbhJoRqaQCF2ni+Mo
         zrGoQsSoUY2HRv/DrNHMkqyRuANY59WMSOztA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776300; x=1776381100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgRB6mtwS4X69iuWHKU2dnIK3AY7Udca1dpaZwyjjkQ=;
        b=KamVlOjFznE/FONpligGokhFseCMccgB5j9I6+Hp9zddhDT22P6ciXk0bb0CDTLGWF
         sfBOGcNGnV8qNaRY81A/3lRWHF+rj7NgAhljGRWN/ZKt+4kafSSGeLt9oM5DpgR4fFv7
         XtstR9eRTaSujj8Vab8shbTWSdzNXtkbOf6uOqr5Y9Zr1Q/0sRxluX//FxaMCvnbBu9p
         5Y9SDlZ1wi6j/TRv1NNys9Yt/2lweqg25dm3qYEa1Z5AypSU1k34IauXS8HZbdLwzUfM
         R+8dOq0MBapiLcHZP+YfB1vYw7mx7TWSux2fPF+lfG+pQ33B2qYa1ne42kY/VCP3bsL5
         ZXTw==
X-Gm-Message-State: AOJu0Ywh/81lXUnC6Xq/K42PFTSdjafy8EQZX6ga2W40kZAT85uK/+0t
	sgZ3yRM2mErc14RiVh3ZcydttoVe1H8bKeqvmixV6yaYlfmoEew7HuTfG+ca3o8mdt2KzOwYXKo
	zOX8MgyA6CbXm
X-Gm-Gg: AeBDies2XqolmqWLeCo5OIfsZRoFksy4T7URoBsSLz72Ba8e2tmZxd0ZxAmnY370xDy
	XgFVEJ4QNtU35CGfztXXi8orDHyGcg/bxVjZsN2a++x0rwNuWlFKs9p+W1tAWzbEI8lq/W86sJ2
	bdO4SK362F17rg4qFauI1V/+kIHgw4BFeo4R3vo5UjCSIdDfzIj0LSbHo/hhcGobqAqhCHufH/Y
	PY9FvtThWmzksKQLiPzRStirHyBwoLL44z1WfA0lmIq7XxPIGxx+CWZS6NJ9+2jQxYVMcyvqck+
	alKvv7hZh0gE5I7eSJ9pBQt89drzLQ4SOEAxlRh3qt8L4+mGVWc/dMRtbU7FrvAuPJ6uFOJnp4e
	WF+ZUZvU+Oj+ZDDEetkJ32824DcatPPuoVg8cR0Q9whBSZSYnTPGZsbNcraGycD6uD/hSboQQqK
	3fUGvuOVSp2QsFweq7PDLTg161smUnC2EbpmUEAy7JtTWJttlymXQJBfDvTJ17rd5r2mRWo1SmX
	DLh15xKBRXMb8I4DFZy+18igtQi
X-Received: by 2002:a05:600c:c117:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-488d68af0e7mr5018845e9.19.1775776300389;
        Thu, 09 Apr 2026 16:11:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 26/30] vim: Fix CVE-2026-26269
Date: Fri, 10 Apr 2026 01:10:26 +0200
Message-ID: <a0a559aa8f3f556eec648f8f0fe3cb167011e0b7.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234985

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26269

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-26269.patch            | 150 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-26269.patch b/meta/recipes-support/vim/files/CVE-2026-26269.patch
new file mode 100644
index 00000000000..1f9a72bca1d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-26269.patch
@@ -0,0 +1,150 @@
+From 3cc246980b800454dda0603af410c77a8c1926e0 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Fri, 13 Feb 2026 10:27:12 +0100
+Subject: [PATCH] patch 9.1.2148: [security]: Buffer overflow in netbeans
+ interface
+
+Problem:  [security]: Buffer overflow in netbeans special_keys() handling
+Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out of
+          bounds.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
+
+CVE: CVE-2026-26269
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970]
+
+Backport Changes:
+- Excluded changes to src/version.c from this backport. This file only tracks
+  upstream version increments. We are applying a security fix, not a version
+  upgrade. These changes were skipped to maintain current package versioning
+  and avoid merge conflicts.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit c5f312aad8e4179e437f81ad39a860cd0ef11970)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ runtime/doc/version9.txt      |  5 +++
+ src/netbeans.c                |  2 +-
+ src/testdir/test_netbeans.py  |  4 ++-
+ src/testdir/test_netbeans.vim | 57 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 66 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/doc/version9.txt b/runtime/doc/version9.txt
+index b82071757..b32400f17 100644
+--- a/runtime/doc/version9.txt
++++ b/runtime/doc/version9.txt
+@@ -41899,4 +41899,9 @@ features, but does not include runtime file changes (syntax, indent, ftplugin,
+ documentation, etc.)
+ 
+ 
++Patch 9.1.2148
++Problem:  [security]: Buffer overflow in netbeans special_keys() handling
++Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out of
++          bounds.
++
+  vim:tw=78:ts=8:noet:ft=help:norl:fdm=manual:nofoldenable
+diff --git a/src/netbeans.c b/src/netbeans.c
+index 4f5378512..8a341a20b 100644
+--- a/src/netbeans.c
++++ b/src/netbeans.c
+@@ -2302,7 +2302,7 @@ special_keys(char_u *args)
+ 	if ((sep = strchr(tok, '-')) != NULL)
+ 	{
+ 	    *sep = NUL;
+-	    while (*tok)
++	    while (*tok && i + 2 < KEYBUFLEN)
+ 	    {
+ 		switch (*tok)
+ 		{
+diff --git a/src/testdir/test_netbeans.py b/src/testdir/test_netbeans.py
+index 0d6b09680..585886fb4 100644
+--- a/src/testdir/test_netbeans.py
++++ b/src/testdir/test_netbeans.py
+@@ -112,7 +112,9 @@ class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):
+                   'startAtomic_Test' : '0:startAtomic!94\n',
+                   'endAtomic_Test' : '0:endAtomic!95\n',
+                   'AnnoScale_Test' : "".join(['2:defineAnnoType!60 ' + str(i) + ' "s' + str(i) + '" "x" "=>" blue none\n' for i in range(2, 26)]),
+-                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n'
++                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n',
++                  'specialKeys_overflow_Test' : '0:specialKeys!200 "' + 'A'*80 + '-X"\n'
++
+                 }
+                 # execute the specified test
+                 if cmd not in testmap:
+diff --git a/src/testdir/test_netbeans.vim b/src/testdir/test_netbeans.vim
+index d3d5e8baf..d1be5066e 100644
+--- a/src/testdir/test_netbeans.vim
++++ b/src/testdir/test_netbeans.vim
+@@ -958,6 +958,58 @@ func Nb_bwipe_buffer(port)
+   sleep 10m
+ endfunc
+ 
++func Nb_specialKeys_overflow(port)
++  call delete("Xnetbeans")
++  call writefile([], "Xnetbeans")
++
++  " Last line number in the Xnetbeans file. Used to verify the result of the
++  " communication with the netbeans server
++  let g:last = 0
++
++  " Establish the connection with the netbeans server
++  exe 'nbstart :localhost:' .. a:port .. ':bunny'
++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
++  let l = ReadXnetbeans()
++  call assert_equal(['AUTH bunny',
++        \ '0:version=0 "2.5"',
++        \ '0:startupDone=0'], l[-3:])
++  let g:last += 3
++
++  " Open the command buffer to communicate with the server
++  split Xcmdbuf
++  let cmdbufnr = bufnr()
++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
++  let l = ReadXnetbeans()
++  call assert_equal('0:fileOpened=0 "Xcmdbuf" T F',
++        \ substitute(l[-3], '".*/', '"', ''))
++  call assert_equal('send: 1:putBufferNumber!15 "Xcmdbuf"',
++        \ substitute(l[-2], '".*/', '"', ''))
++  call assert_equal('1:startDocumentListen!16', l[-1])
++  let g:last += 3
++
++  " Keep the command buffer loaded for communication
++  hide
++
++  sleep 1m
++
++  " Open the command buffer to communicate with the server
++  split Xcmdbuf
++  let cmdbufnr = bufnr()
++  call appendbufline(cmdbufnr, '$', 'specialKeys_overflow_Test')
++  call WaitFor('len(ReadXnetbeans()) >= (g:last + 6)')
++  call WaitForAssert({-> assert_match('send: 0:specialKeys!200 "A\{80}-X"',
++        \ ReadXnetbeans()[-1])})
++
++  " Verify that specialKeys test, still works after the previous junk
++  call appendbufline(cmdbufnr, '$', 'specialKeys_Test')
++  call WaitFor('len(ReadXnetbeans()) >= (g:last + 1)')
++  call WaitForAssert({-> assert_match('^send: 0:specialKeys!91 "F12 F13 C-F13"$',
++        \ ReadXnetbeans()[-1])})
++  let g:last += 1
++
++  sleep 10m
++endfunc
++
+ " This test used to reference a buffer after it was freed leading to an ASAN
+ " error.
+ func Test_nb_bwipe_buffer()
+@@ -967,4 +1019,9 @@ func Test_nb_bwipe_buffer()
+   nbclose
+ endfunc
+ 
++" Verify that the specialKeys argument does not overflow
++func Test_nb_specialKeys_overflow()
++  call s:run_server('Nb_specialKeys_overflow')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fa63689ef16..2f222c52956 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            file://CVE-2026-33412.patch \
            file://CVE-2026-25749.patch \
+           file://CVE-2026-26269.patch \
            "
 
 PV .= ".1683"

