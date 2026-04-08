Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058CA1073C9D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 11:29:26 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104028.1775647758378893057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 04:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CZvxquWW;
 spf=pass (domain: mvista.com, ip: 74.125.82.175, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so15187042eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775647758; x=1776252558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3PsNvJJCoaxOsFBIAxStu+7T9lcwAJpJX4ANY8uQ20=;
        b=CZvxquWWB8vocWVjlEcBQt76mdO+vjbiAtiYj4y0p/j6OYTpe8LoIx6oj+pUpoXCLX
         2oHJRphes1VzI521gX8Se3GuyPvO7GBjKJeBonQFlvbyXQ1LorI4k7rMMrSwY8N/kJ4I
         tmuFR8yJrr9XxhoMkJ9T3ush2WlMs32xyDetQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647758; x=1776252558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3PsNvJJCoaxOsFBIAxStu+7T9lcwAJpJX4ANY8uQ20=;
        b=paSYTqUF0nBcQsdAydvig3bO/Jt0GeZcZZDCtdsPXyXxFP2F8E+ZHCB0NFnd2d4pog
         tb0aPa5zoEzW3RGPJvehmWyTR1YLq3o/wmB/JewkEBnOHr52AoX7myXR1WdL9SMHpVLl
         WP+tHDFWwjNlQRE1T4pLP/QxW8TNXNOude5qRpR1oI5+hzEhdZ1yHFpKFToITBLUIMi2
         sD6YkNrGfK9mtqCVKb6RDMIrrgeh1wScEGQZoDmtpn268K0qxB/4vQpIDUyg85oqjLVX
         obtuMN4b/VqytEk17QDWjcHG/R+EGesgx1rHjoJLMMgRSJnIqIlcwtkAR7PaiCcVvfpv
         Jiig==
X-Gm-Message-State: AOJu0YxbL+qNpPEQIFvWLhFhEoHBNpSgadqlS36YCMnKmIyv2A8fBf4m
	eo5oqgqXnTSxpn4hYTq5cJNN136Q2SfVXWYTCmni8iCCkZKPWfKdvdvuhXSM5o+aVWu4ODCEHKZ
	/DwA5xfY=
X-Gm-Gg: AeBDieua4mdgRcDchB3OI59ZX9JJj6BCIKaAn8v54bHTuYzwJ/uTlLu1qSLgIgAmb8J
	8Ur/RUHqLwxgzcUtgVeyPQMuY3Fen7W+3XtWryHZWPwYWEELFIehN60OINTGhba64D7foawKoOX
	+jlda7fs8Ff8WfEWjwbeA931GkE7imArOLcx7o6zALMZovHlrsu0I6gwvCyuC/7UcFcQypmkl5x
	UkwpLz83dPvgXknzftEFfB2Cz9vqT+9z5U0qy4H8mr0U94aOZqCnfY0PtKdXkj8rkmkgIRRh7q5
	zEop+ZXhbE6tnEk5/LuB0pReS9r7lAsWsp2nRq2gYsTUrw/04no70hr+8YnbW7Y6sC4jHj7T7CN
	uK626xYnYGZaglKXMXAi0Pe+2h1MusHLmrfTs94ioMrBAae0x3a1W99dONHEcOetR7slUQXa+Oi
	bcrh4xQnqD4x+17LSeBogYmENjX4Tmcb+VWwNfcx509U5FRg==
X-Received: by 2002:a05:7301:168a:b0:2c0:d1ad:cd2e with SMTP id 5a478bee46e88-2cbfa5bfa4emr11532079eec.11.1775647757324;
        Wed, 08 Apr 2026 04:29:17 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm21140382eec.0.2026.04.08.04.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:29:17 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] vim: Fix CVE-2026-26269
Date: Wed,  8 Apr 2026 16:58:44 +0530
Message-ID: <20260408112844.1029876-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 11:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234832

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


