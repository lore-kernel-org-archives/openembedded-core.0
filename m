Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCC8C531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 14:32:54 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.368.1784989969494806605
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Vv8koTNY;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e347638adso1181290a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784989969; x=1785594769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KPFGbWL4fN/AF2FWOPPqj3kAKd2VGKpnK0CKbs4BhU=;
        b=Vv8koTNYRCro4tUM98aSuyEyo+PVfsfj9r6P54TZAgat3lrIOKv+1QE46TURujbqcq
         eoyoH/IKlXfGr9CzWatJ5ISYfrFv3oDjCIeQqZmsjMlEHQSjgoMFEra+6HDhRmovRgfW
         hmVTDSbjlSo4NhBxXapM4E8RL9HQKbo7YYEW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989969; x=1785594769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KPFGbWL4fN/AF2FWOPPqj3kAKd2VGKpnK0CKbs4BhU=;
        b=DTF57AkkqGkBAWdMmAOqglJCs82//E4DQBbohFsn57cUVBJpKUmmqtHHWPu5XqWqIv
         RJti7OP41rmKq2OkFNDuDZ8TXVxfFvApfym9hNjPZGNnUSYNoKrEOhRIqyFLMDPuaNmG
         aJ4sHp1MtJLBKzXwolniv4uzGUrTOkKmc7cgaLlIncgtsjaY24PL1m6c9ft395n1Aku7
         vbZsXGo5D52Y+iA8httIoDfK0MzZrbuR8lvizLCtJZgxNwfI+FnmYIeuHqkuzFwLulCS
         eKQwI8l9oYNe0kB2gemUm5ThODY5NzOKz0eLG9ooRb63e6xkt/VKpe8evO96WvGC9l/W
         HhyQ==
X-Gm-Message-State: AOJu0YyofvIqxXzRCgAd3WNHJMKKgh4NVMNisC0g4lLbONTkf1BbVAon
	mOPLgV616RIc37Bnf4zBMqu2xdKBzCPsYvZ6tAvXoIWF97TsYt1Nv2SGgod7AepHc13P7zwK1Kc
	W6P0Vqg0=
X-Gm-Gg: AR+sD10TAsiZP1FS0QrBfKw7tbfyuhQv9iyRKqsB8uVD5nZu172kZuue3HEJluUFcNM
	V/Tj1i33SgosCjBkpEz5NOS8g2BCUQXFP5e3uurtjHPi+t9rybvmex1Xy29glD+DHNU4CoRViTV
	RvotoAVxpvHHCQk6Wcem75TfxX8s1FYXMmPgKkf+eBdxJ8ufAy2eb19s0aCR9rsHRPiJaXuRmCD
	CG84xD2hkbSd1G1m29uh7IEIX1VzT+8cjrzFGfC1O54nTboQQLA9VPJ2lMNAFaPfwYsnMXho+QG
	oowBxN69HaRShBLEs42EzWFJG2zN8JvHzBmRbxLwO9QNfy75KId194jcCF/NVsFxmVZuSmiFivh
	2HsUW8G5oGW9p57Y1mWrnHXeqIUTmnH1VYw+VMW7fr2I7c3e+9FqNBnsEmqLKu52EiIuVRm6uGH
	CE4BkJJUhyme4Q
X-Received: by 2002:a17:90a:d00f:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-38f293cf348mr2371107a91.5.1784989968809;
        Sat, 25 Jul 2026 07:32:48 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e585ae882sm1575845c88.6.2026.07.25.07.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:48 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 4/6] vim: Security Fix for CVE-2026-47167
Date: Sat, 25 Jul 2026 20:02:29 +0530
Message-Id: <20260725143231.230059-4-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260725143231.230059-1-sdoshi@mvista.com>
References: <20260725143231.230059-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 14:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241974

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47167
[2] https://security-tracker.debian.org/tracker/CVE-2026-47167

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-47167.patch            | 102 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47167.patch b/meta/recipes-support/vim/files/CVE-2026-47167.patch
new file mode 100644
index 0000000000..f9a989cf3a
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-47167.patch
@@ -0,0 +1,102 @@
+From 5eb4bd1c12801f9ffb451f22b4d459ff2b7ff962 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 17 May 2026 19:39:24 +0000
+Subject: [PATCH 4/6] patch 9.2.0496: [security]: Code Injection in cucumber
+ filetype plugin
+
+Problem:  [security]: Code Injection in cucumber filetype plugin
+          (Christopher Lusk)
+Solution: Use rubys Regexp.new() with the untrusted pattern
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-4473-94jm-w5x9
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a65a52d684bc58535ad28a4ae824d22e76399934]
+CVE: CVE-2026-47167
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/ftplugin/cucumber.vim |  5 ++++-
+ src/testdir/test_filetype.vim | 30 ++++++++++++++++++++++++++++++
+ src/version.c                 |  2 ++
+ 3 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/ftplugin/cucumber.vim b/runtime/ftplugin/cucumber.vim
+index f4848d1c60..9723898d15 100644
+--- a/runtime/ftplugin/cucumber.vim
++++ b/runtime/ftplugin/cucumber.vim
+@@ -2,6 +2,8 @@
+ " Language:	Cucumber
+ " Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
+ " Last Change:	2016 Aug 29
++" 2026 May 26 by Vim Project: prevent Code Injection
++" https://github.com/vim/vim/security/advisories/GHSA-4473-94jm-w5x9
+ 
+ " Only do this when not done yet for this buffer
+ if (exists("b:did_ftplugin"))
+@@ -96,7 +98,8 @@ function! s:stepmatch(receiver,target)
+   catch
+   endtry
+   if has("ruby") && pattern !~ '\\\@<!#{'
+-    ruby VIM.command("return #{if (begin; Kernel.eval('/'+VIM.evaluate('pattern')+'/'); rescue SyntaxError; end) === VIM.evaluate('a:target') then 1 else 0 end}")
++    " Use Regexp.new, so the pattern stays untrusted data and cannot inject Ruby
++    ruby VIM.command("return #{if (begin; Regexp.new(VIM.evaluate('pattern')); rescue RegexpError; end) === VIM.evaluate('a:target') then 1 else 0 end}")
+   else
+     return 0
+   endif
+diff --git a/src/testdir/test_filetype.vim b/src/testdir/test_filetype.vim
+index 70e269ee63..f6956795da 100644
+--- a/src/testdir/test_filetype.vim
++++ b/src/testdir/test_filetype.vim
+@@ -3433,4 +3433,34 @@ func Test_app_file()
+   filetype off
+ endfunc
+ 
++func Test_cucumber_code_injection()
++  CheckFeature ruby
++  filetype plugin on
++
++  call mkdir('Xcucu/features/step_definitions', 'pR')
++  call writefile([
++        \ 'Feature: demo',
++        \ '  Scenario: trigger',
++        \ '    Given xyzzy',
++        \ ], 'Xcucu/features/test.feature')
++  let marker = getcwd() . '/Xcucu/MARKER'
++  " Malicious step: terminates the regex literal, injects Ruby system(),
++  " comments the trailing slash.  With the fix, the pattern is passed to
++  " Regexp.new() instead of Kernel.eval() and the payload is inert.
++  call writefile([
++        \ 'Given /xyzzy/; system("touch ' . marker . '"); #/ do',
++        \ 'end',
++        \ ], 'Xcucu/features/step_definitions/poc.rb')
++
++  new Xcucu/features/test.feature
++  call assert_equal('cucumber', &filetype)
++  call cursor(3, 1)
++  " Triggers s:jump -> s:steps -> s:stepmatch on every discovered step,
++  " including the malicious one.  Suppress preview and error messages.
++  silent! normal [d
++  call assert_false(filereadable(marker), 'Ruby injection executed')
++  bwipe!
++  filetype plugin off
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index cf62805e44..03a520b146 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    496,
+ /**/
+     495,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f70363c4ef..50ef18878e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
+           file://CVE-2026-47167.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


