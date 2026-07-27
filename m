Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43FCC53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:57:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43773.1785193012388092797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PjUsFf6p;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so16562665e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193011; x=1785797811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mh2E/BaXX6Ww6jkY+pELSdt1Jk0PpoAhpGrY6CuQwfc=;
        b=PjUsFf6pStUvnKGvEusgH9ynATS/MlU9YKW1g9Z3ZNxFP2FD0bs30iOlRR7m2AFId0
         saGXfFd0gHvIolQv3c2u+Ywz/fUWqILzskQRvviIaFtfnp0j6zGBvmvc1maY7hoWR2yK
         5PIqVzIQHqdwDmSG5gS8cEeBBvpH4ZAzzF6Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193011; x=1785797811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mh2E/BaXX6Ww6jkY+pELSdt1Jk0PpoAhpGrY6CuQwfc=;
        b=eJgqLhos8SvHvHZNQ6/o7W4nT2L5irrprQK3JjG/9YxL5q7PU8q3yUk2PpiqXvKcYZ
         0WTMQr8bkFR6JG7DERLSm2Go56zKmfKJ5XEvLPmW1WzBtpQtjPJAfgOOaejgUFRrRMp/
         po2N6Xnp+vXAvHuCoi1saCn1+u36GmrTq6i93iZFjoB6MlauEXGLN59GqVY9N27fSRfQ
         ZWv3fkyscxW2JJ1DVoUymJ3s7j0GByQ/TqRYBdyUBwVmUfgeZ2U6mhOwhav+kKhLWeyj
         pqrkasUSAsI3b5Kam3w9vgrMvKWpyfTT2K+zqgFtYfYyBL0hzXHRLYwH2p2nwNIedw13
         bqKA==
X-Gm-Message-State: AOJu0YyI1stzBRyHazzuBBiWjcyozbzI/SCdOH7esQLRoscRSQDKBePI
	c2uGux97OOe0okkd21jXFtmYpxplmtp9u+1yWTiUxUvoe0xWHqeijS2FIvjdqnMrNtB4th8jhHu
	4/wqq2qQ=
X-Gm-Gg: AR+sD10zbNNRQm53jGS50vNADkQyyBucAr/OE5qYJiyHge0ebc9wXTnmACst5aHzTLj
	BWXD3qvLiOCVaNJa4pKvOXCeXbFhQwe6m3oRPcBQ3Vw6nvwNVd1Zf7qj4PXyC4FvPU0M1LwkeM+
	pHHKRlB9HIajMg1FzC8gJ0WABWo4X+POXLKu0T/mV3K7ZYohAlNrj9DNZBsczKNuOLrfB1FxLh3
	4UCJbh3FmJXpjsafyAW+2zyPD/HRaiDrh88gs6ceQhr0heCODAHLBMir0bkaP8ZJ3MVkud89Gy1
	54DsokbErnirVVClRe7JqcSCMPVCVW2sSAuKK2P9GwH+GU2ecUkkuUBybeIB0eI95w5aDnICiDs
	+Q4OswQtPpt4W62AalG0a9Xm53jj8mjnYxmggTejTZSXlLMSVW20BPIhPlkJdkIOODjAHX4fp+Y
	DZ94JFEnX1mzRJebei9maiR53bwoGsrYGbj4xvPI7GefprbkOBNprQyrbMdHmgrwtFaSz6aXbCd
	af+Cw==
X-Received: by 2002:a05:600c:6089:b0:495:6482:9d8c with SMTP id 5b1f17b1804b1-496c4fd630fmr8108095e9.37.1785193010609;
        Mon, 27 Jul 2026 15:56:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/36] vim: Security Fix for CVE-2026-47167
Date: Tue, 28 Jul 2026 00:55:48 +0200
Message-ID: <4f3baf03aaa48fa864edd9a30fb9828c655159a5.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242151

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47167
[2] https://security-tracker.debian.org/tracker/CVE-2026-47167

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-47167.patch            | 102 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47167.patch b/meta/recipes-support/vim/files/CVE-2026-47167.patch
new file mode 100644
index 00000000000..f9a989cf3af
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
index 8360b1622de..7a4a0bc932f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
+           file://CVE-2026-47167.patch \
            "
 
 PV .= ".0340"

