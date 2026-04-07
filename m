Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4696EE9D814
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:45:46 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75266.1775544342118705525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Z/nBSPSU;
 spf=pass (domain: mvista.com, ip: 74.125.82.174, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ce102afb0aso2959599eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775544341; x=1776149141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3PsNvJJCoaxOsFBIAxStu+7T9lcwAJpJX4ANY8uQ20=;
        b=Z/nBSPSUcnDLL8Kb2BdQT/cALx5aBze7FY2LtkBPDkZTkYJ9EqeS/9RvsbY5RR+DwF
         5cYSUU/ZMqWKvf3B7fugsqQT2M9LE6cHhO7DxLPuoQYXtPs0UwC5JrHX2Ad2uJZ/0Vg+
         l83nsTREm9mnT5ioXWF+cbSNmsaErwGzag6ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544341; x=1776149141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3PsNvJJCoaxOsFBIAxStu+7T9lcwAJpJX4ANY8uQ20=;
        b=Wj52fgf57J09GNTbUPx9eyBDMmS/aW8WJL36azaNHlpjWZLxbx8/oJpRT+a/ldeMBn
         js592IxJZptqxKh4U/PFnKG40fyD9x8/5z/ym34j5dS3Ip/XKVtePmhS2fXkGkipD3pk
         jW2t2Fl8O1caFlYmCN4/pA2HZzvb9uyCBDRJwKofLFBIVrnJdUky2E03AGxXH/VmC5p5
         5Yy5kqybHGl+7q0+qcP4fHMKIG0S7qjrtRU6Sj4/ASrnZ2IG8RjBrZkr3ryVohzwIrGB
         2vmdh8Smlnqac0D/l3VTYZbuoV1PM1PoCptUwjEuJloo9v1ENFlOEkt4NlrzT3u7JmwM
         tv6w==
X-Gm-Message-State: AOJu0YyQPXip5K27A+Iy1X0t9CyuwpWjS14e3UlG1ZD1E3i+ULR6m/eF
	MU7RXgSdW7E2S5CcmnqqtcoaObDGK7/BzHTV3OQYoTL2QrtqVXevAoGNWmONLb+oR+zIFbIF/7z
	hswkNmrE=
X-Gm-Gg: AeBDieslkJUMTW99gPpOKm6HMcojQ/71z6tj4qnIw66RpI7NxYWp7FOSMElDJekoN/b
	Rc6UAZVz0BOGK3ABPM9u82smFX53GkwK3MgTkQHZU6j48Jv5McL8t4cVLsZi91/x49/RB4yc2nW
	IYDAuFhbpqtQGOzjhSnEBzBokST7mKL0oV9gEWHuQ8YfktH+PFjuBQUiSxybPun8sF96vn/yZVu
	S9ylIKh2hWhxXWGQllk4cZOFX8GPZ/4svPPHZGe+DlgT4GaS6TdZEPO9BolLiU9Rhja+Ret7aUn
	Hf/55F/e/5z6d/kqWxvymw3LaRz/UXVs5KmVPium7gKTskadhu6P+Xz/yhnbJqF/0YM1BQorJDK
	cAWYWD154bW57aw9qlclRXL4fX6t9mQrTNY9P5CPp/8IBYUZiu9c7WXrwTzXRpyk+5yZltqNWmd
	YqIXrcT6fiZO40nfK3XNgmXcdgUsV9dzZxrqFm
X-Received: by 2002:a05:693c:2b0f:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-2cf3de7472amr3416665eec.27.1775544340952;
        Mon, 06 Apr 2026 23:45:40 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm20028508eec.14.2026.04.06.23.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 23:45:40 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix CVE-2026-26269
Date: Tue,  7 Apr 2026 12:15:18 +0530
Message-ID: <20260407064518.37975-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234699

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26269

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-26269.patch            | 150 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-26269.patch b/meta/recipes-support/vim/files/CVE-2026-26269.patch
new file mode 100644
index 0000000000..1f9a72bca1
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
index fa63689ef1..2f222c5295 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            file://CVE-2026-33412.patch \
            file://CVE-2026-25749.patch \
+           file://CVE-2026-26269.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


