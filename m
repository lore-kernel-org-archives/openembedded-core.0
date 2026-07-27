Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5462DC54EFC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:20:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25234.1785133235269689601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cs6P2rKj;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceae1ed204so23496925ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1785133235; x=1785738035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebJipnB3B25wYqBUeVYS2HrqWXtMD6lMMAAB7ASitIo=;
        b=cs6P2rKj2sIDT/sItdR0c2JWCCxHsbVrJbuG/riU+W2LWcfBWbyMAmjH4rwdpiHL3S
         8DMh00+Iyy+YTOtfIsRE3bZG7Ua1tpYgn1ZLfU5mWSiGXqiwA4d7G8E3KdnBY8NsbV4K
         7Q4C6/wSzD/v+Xb8GC1jp6Th38sXWi/RKu31A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133235; x=1785738035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebJipnB3B25wYqBUeVYS2HrqWXtMD6lMMAAB7ASitIo=;
        b=mTm/sbGBBOIqRp2G9E+PkKqf/W9ZK1PBWUCZGgcpDCMhgdJCbU9pog6rLhiTIAKi0o
         HycQw/5ao/jjwkZ7F+WqaINW0FhhyWo5cZNiwph866dERKwVTsRLSdip7oK734Y/my8+
         QLlWeRKEmw+UP0gnoMRpG+dPU/Fi3F+7AzeiNvho7JXAEWZxXfKWCvMpp1Ry/HiksIj8
         1elkugWaVMN50NOKnEUsXIWp8NMPdnxbPCO7tFAc5jUlTKSyyqXXiql7Q3wzpB9zYDXl
         OJqepks4S6oAwCFcFUg+TVnAa9R/vF3N4ta5GCoVbUkVXWA1vjFrUhs0Sjt9WuQQQmzn
         sfJg==
X-Gm-Message-State: AOJu0Yz8H675fDaMMq7QlkoUwdAjBeaNkE1sp20peuX9ENfly6CkTLpu
	ksCNWcOjuZwaPSmXcCqPg4HBAk6w/pss+HVEcbQzGLAvqt7uL3wa4ZfIXgtF/dBnWLTiAT81xqj
	Our1XfDQ=
X-Gm-Gg: AR+sD12clGdKN68jH1JXt//S3O5dYmNUWiZEYnuNIoGt69aS1qR8B1zaVdBnB1816iO
	ngeUuFXZuDibtdiJnJdM3cF20K2nttmmJzErW7w6D8qS7/63HRfZdP0+gHB2W9zzCoNyYwpmIeO
	H2jqkO8jsopAZjJc+LDr8EtrU+kwEhIaPqTVygOAaQdcpCyqQPcLwGWV21Azpb1xX5fg7L+z7ZI
	ZKmwh0StSWsj7vmwcIdvqF+eOsJFdtJq83hs4YyxQj/P8am3X/daZAJUAM29cwVmA+nw0AAkOro
	huMPgydotoAdD8GXDWiIW4mwVDYHVbAQSnu3qkhSnDDOl3OYY+KAYNLNrTQ+zn01RQI2QQd+lBD
	xWmXAVm0Xu619cWktTqkfvyMDkoBx55CRjzzGvxtURkf4+inerE9bq70nECAJ/0gZ2G0wf4AuMF
	PH26ctaj+THidN
X-Received: by 2002:a17:902:f542:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2cfde8457bcmr66082925ad.31.1785133234648;
        Sun, 26 Jul 2026 23:20:34 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm42733554eec.4.2026.07.26.23.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:20:34 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCHv2 4/6] vim: Security Fix for CVE-2026-47167
Date: Mon, 27 Jul 2026 11:48:15 +0530
Message-Id: <20260727061817.8586-4-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727061817.8586-1-sdoshi@mvista.com>
References: <20260727061817.8586-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242035

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
index 8360b1622d..7a4a0bc932 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
+           file://CVE-2026-47167.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


