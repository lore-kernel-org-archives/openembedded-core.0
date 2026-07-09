Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4542C4450A
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5808.1783591629565896362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Kuhik+LZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1449245f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591628; x=1784196428; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvOtHD7gkvjKzUfvHyv1Ry1O8WUlcmQJ/V42EA6QyTs=;
        b=Kuhik+LZnZ9mpCDF48Mbpp/F2KUu0Arra030eUJYneSTTPs4mw64Skyp1s0sOIRwQP
         KV+n47qs4eq9A6Y/EXgUPfMjaZjKMV3gR9Ij6RlPP62KeqaQzMvHLagM1/ys1eLinR5N
         Xd62yNF/zuTGq+bJkhTWZzrrxB9kZLFVN4i5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591628; x=1784196428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvOtHD7gkvjKzUfvHyv1Ry1O8WUlcmQJ/V42EA6QyTs=;
        b=kZ+OTpssje68ZwCkAOfc33L2/2kMptIlPsfRjuNmjFx/EOoH799kT4yHdTplp+gZWj
         i8NP3dilgLq0AQo1Y+yOuAZbQvjo4zdzahRe+qeFYklsb9Z2nr9tsvGLwF8T0TUElwo8
         DSuMUyygoSNuspLQRTNIOBtMMRpEuL3t9mt33MgGj1mUPpahjtuvNP+nOZpDOkebhXD+
         4Ke4lg9hqccTil0gQZKnwtz5xPfyPC2vsyZUdP2HOt2ktA+eYnW5MGNKF/TPu7i0owBP
         Zd/7Bmsf+nXY2afAkUX9C/nkRH2I7AhPGkZjNNRox5a1SZFxcql3szO6FvntnDKKYE5K
         M5Ng==
X-Gm-Message-State: AOJu0YzbpskoADUKDC42L24Wq2BoeN0A1nER724/G7KiIbwuO0N9i0Nh
	QlrL980iuZZZn8FR/UY2JcmNkuO9rbjp9bRtnPJvQRL3waElNDNuE5qHnmTpvtXMaVf6pcepKF+
	JlqP48Z4=
X-Gm-Gg: AfdE7ckMeIp1pZcpKkfZB5AUBan2W5/kM8i+sNn3bo8RtaWNQ+AjLFggH0mizGF+fme
	lU3x/vcrkV1LRSoQciGZex6b3JE1xuMFjcLmHNN8gyiYBlHEL0VoDiWV+xHlatGBZ1SRbpFUAgE
	csSzhj35nHBhfM58+XfvVfHHI+IP0j+GtUTBwvyMhJrI+5PUMS/VBEpGjaPzcipsi8gYxFmzZ1p
	+qiHjP3mpjTL7U1ph9y9XCj6PbwzNCtp71ldTItDdUQHUR94K6wmFO+gLDxN+mAi6sACsXSL/bA
	s+LCoR+d8q5zRXfXczxx4O6x8cWa9ht+4riu58tJdchRm9eQFFPy3s8DBSdpc7sv2oqzcIn0D/x
	oWRd3uTmcxnjP2d3R5TB9EoWJNl1MEdI71J8vUW/SVNPbG7nf2vjAqCb5sFgsOru4TUGqxDdAuA
	mzoMdMcd1OlyyE1wlk3yHDpEua5BFtqer20qwmVqYB5S3y8J2cJq+UwzqKTnWNNNUEYo8GdZ3Sh
	StWqy4gRQQ7Vv65xQ==
X-Received: by 2002:a05:600c:3b92:b0:493:e892:f03c with SMTP id 5b1f17b1804b1-493e892f05amr47966035e9.10.1783591627558;
        Thu, 09 Jul 2026 03:07:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/25] vim: Security fix for CVE-2026-28420 & CVE-2026-46483
Date: Thu,  9 Jul 2026 12:06:29 +0200
Message-ID: <17aca2e58563f39ad36bea45fa316739217e3262.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240560

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] & [2] also mentioned at NVD report in 3 & 4

[1] https://github.com/vim/vim/commit/bb6de2105b160e729c340631435cd62f3e69bd32
[2] https://github.com/vim/vim/commit/3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-28420
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-46483

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28420.patch            | 162 ++++++++++++++++++
 .../vim/files/CVE-2026-46483.patch            |  77 +++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 3 files changed, 241 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28420.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28420.patch b/meta/recipes-support/vim/files/CVE-2026-28420.patch
new file mode 100644
index 00000000000..f5b2f42f6ad
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28420.patch
@@ -0,0 +1,162 @@
+From bb6de2105b160e729c340631435cd62f3e69bd32 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 20:29:43 +0000
+Subject: [PATCH] patch 9.2.0076: [security]: buffer-overflow in terminal
+ handling
+
+Problem:  When processing terminal output with many combining characters
+          from supplementary planes (4-byte UTF-8), a heap-buffer
+          overflow occurs. Additionally, the loop iterating over
+          cell characters can read past the end of the vterm array
+          (ehdgks0627, un3xploitable).
+Solution: Use VTERM_MAX_CHARS_PER_CELL * 4 for ga_grow() to ensure
+          sufficient space. Add a boundary check to the character
+          loop to prevent index out-of-bounds access.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-rvj2-jrf9-2phg
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/bb6de2105b160e729c340631435cd62f3e69bd32]
+CVE: CVE-2026-28420
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/terminal.c                                |  5 +-
+ .../samples/terminal_max_combining_chars.txt  | 80 +++++++++++++++++++
+ src/testdir/test_terminal3.vim                | 14 ++++
+ 3 files changed, 97 insertions(+), 2 deletions(-)
+ create mode 100644 src/testdir/samples/terminal_max_combining_chars.txt
+
+diff --git a/src/terminal.c b/src/terminal.c
+index 921b234..78990ac 100644
+--- a/src/terminal.c
++++ b/src/terminal.c
+@@ -3533,12 +3533,13 @@ handle_pushline(int cols, const VTermScreenCell *cells, void *user)
+     {
+ 	for (col = 0; col < len; col += cells[col].width)
+ 	{
+-	    if (ga_grow(&ga, MB_MAXBYTES) == FAIL)
++	    if (ga_grow(&ga, VTERM_MAX_CHARS_PER_CELL * 4) == FAIL)
+ 	    {
+ 		ga.ga_len = 0;
+ 		break;
+ 	    }
+-	    for (i = 0; (c = cells[col].chars[i]) > 0 || i == 0; ++i)
++	    for (i = 0; i < VTERM_MAX_CHARS_PER_CELL &&
++		    ((c = cells[col].chars[i]) > 0 || i == 0); ++i)
+ 		ga.ga_len += utf_char2bytes(c == NUL ? ' ' : c,
+ 			(char_u *)ga.ga_data + ga.ga_len);
+ 	    cell2cellattr(&cells[col], &p[col]);
+diff --git a/src/testdir/samples/terminal_max_combining_chars.txt b/src/testdir/samples/terminal_max_combining_chars.txt
+new file mode 100644
+index 0000000..a4f508d
+--- /dev/null
++++ b/src/testdir/samples/terminal_max_combining_chars.txt
+@@ -0,0 +1,80 @@
++padding line 000
++padding line 001
++padding line 002
++padding line 003
++padding line 004
++padding line 005
++padding line 006
++padding line 007
++padding line 008
++padding line 009
++padding line 010
++padding line 011
++padding line 012
++padding line 013
++padding line 014
++padding line 015
++padding line 016
++padding line 017
++padding line 018
++padding line 019
++padding line 020
++padding line 021
++padding line 022
++padding line 023
++padding line 024
++padding line 025
++padding line 026
++padding line 027
++padding line 028
++padding line 029
++padding line 030
++padding line 031
++padding line 032
++padding line 033
++padding line 034
++padding line 035
++padding line 036
++padding line 037
++padding line 038
++padding line 039
++padding line 040
++padding line 041
++padding line 042
++padding line 043
++padding line 044
++padding line 045
++padding line 046
++padding line 047
++padding line 048
++padding line 049
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
++AAAAAAAAAAAAAAAAAAAAAAAAAAAA𐀀󠄀󠄁󠄂󠄃󠄄
+diff --git a/src/testdir/test_terminal3.vim b/src/testdir/test_terminal3.vim
+index 218b4e6..cb1946f 100644
+--- a/src/testdir/test_terminal3.vim
++++ b/src/testdir/test_terminal3.vim
+@@ -1037,4 +1037,18 @@ func Test_terminal_visual_empty_listchars()
+   call StopVimInTerminal(buf)
+ endfunc
+ 
++func Test_terminal_max_combining_chars()
++  " somehow doesn't work on MS-Windows
++  CheckUnix
++  let cmd = "cat samples/terminal_max_combining_chars.txt\<CR>"
++  let buf = Run_shell_in_terminal({'term_rows': 15, 'term_cols': 35})
++  call TermWait(buf)
++  call term_sendkeys(buf, cmd)
++  " last char is a space with many combining chars
++  call WaitForAssert({-> assert_match("AAAAAAAAAAAAAAAAAAAAAAAAAAAA.", term_getline(buf, 14))})
++
++  call term_sendkeys(buf, "exit\r")
++  exe buf . "bwipe!"
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-46483.patch b/meta/recipes-support/vim/files/CVE-2026-46483.patch
new file mode 100644
index 00000000000..2fc6f80c257
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-46483.patch
@@ -0,0 +1,77 @@
+From 3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 14 May 2026 15:35:28 +0000
+Subject: [PATCH] patch 9.2.0479: [security]: runtime(tar): command injection
+ in tar plugin
+
+Problem:  [security]: runtime(tar): command injection in tar plugin
+          (Christopher Lusk)
+Solution: Use the correct shellescape(args, 1) form for a :! command
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-2fpv-9ff7-xg5w
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/3fb5e58fbc63d86a3e65f1a141b0d67af2aa38a1]
+CVE: CVE-2026-46483
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/tar.vim        |  5 +++--
+ src/testdir/test_plugin_tar.vim | 19 +++++++++++++++++++
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/autoload/tar.vim b/runtime/autoload/tar.vim
+index 74a5b38..95d2be0 100644
+--- a/runtime/autoload/tar.vim
++++ b/runtime/autoload/tar.vim
+@@ -18,6 +18,7 @@
+ "   2025 May 19 by Vim Project: restore working directory after read/write
+ "   2025 Jul 13 by Vim Project: warn with path traversal attacks
+ "   2025 Jul 16 by Vim Project: update minimum vim version
++"   2026 May 14 by Vim Project: use correct shellescape() call in Vimuntar()
+ "
+ "	Contains many ideas from Michael Toren's <tar.vim>
+ "
+@@ -800,9 +801,9 @@ fun! tar#Vimuntar(...)
+   " if necessary, decompress the tarball; then, extract it
+   if tartail =~ '\.tgz'
+    if executable("gunzip")
+-    silent exe "!gunzip ".shellescape(tartail)
++    silent exe "!gunzip ".shellescape(tartail, 1)
+    elseif executable("gzip")
+-    silent exe "!gzip -d ".shellescape(tartail)
++    silent exe "!gzip -d ".shellescape(tartail, 1)
+    else
+     echoerr "unable to decompress<".tartail."> on this system"
+     if simplify(curdir) != simplify(tarhome)
+diff --git a/src/testdir/test_plugin_tar.vim b/src/testdir/test_plugin_tar.vim
+index ebf74d7..8e776a4 100644
+--- a/src/testdir/test_plugin_tar.vim
++++ b/src/testdir/test_plugin_tar.vim
+@@ -126,3 +126,22 @@ def g:Test_tar_evil()
+ 
+   bw!
+ enddef
++
++def g:Test_extract_command_injection()
++  CheckExecutable gunzip
++  CheckExecutable touch
++  var tgz = eval('0z1F8B08087795056A000364756D6D792E74617200EDCE2B12C2300004D01C254' ..
++   '7480269CE534080A8495BD1DBF3996106C3A08A7ACFACD8157B59A7690BFB4A0FC3707C666E357D' ..
++   'E65BC8B5A47CC8A5D61A522EA5B510D3CEBF5ED679197B8CE17CEDB7F9D4C76FBB5F3D000000000' ..
++   '000000000FCD11D32415E2C00280000')
++  var dirname = tempname()
++
++  mkdir(dirname, 'R')
++  var tar = dirname .. "/';%$(touch pwned)'.tgz"
++  writefile(tgz, tar)
++  new
++  exe "e " .. fnameescape(tar)
++  exe ":Vimuntar " .. dirname
++  assert_false(filereadable(dirname .. "/pwned"))
++  bw!
++enddef
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 53590befc4d..9a4b21f5305 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -31,6 +31,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-32249.patch \
            file://CVE-2026-28417.patch \
            file://CVE-2026-45130.patch \
+           file://CVE-2026-46483.patch \
+           file://CVE-2026-28420.patch \
            "
 
 PV .= ".1683"

