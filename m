Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF87C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:20:41 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25233.1785133232843344981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CKNTG+pG;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf50c6f235so27833465ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1785133232; x=1785738032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sW5Z9myf+0s3LdIxRbM14JNy9pC/+InvfBU/v1BXnw=;
        b=CKNTG+pG+hJLpoeFL/CPb9uYDoIsAw+aDpb8YsorBdCQp9JQ9KqqJifD9IWlljXdMM
         imp3Wno8a78gEkPe1gONM1tVOh4ATtO7KH0M8w9Ru64etdZzyvF7Pc11iInLcbK0TbbV
         A1gf0K+WAdy1ksomJH+N0z3g8pMDuSqodRW9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133232; x=1785738032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9sW5Z9myf+0s3LdIxRbM14JNy9pC/+InvfBU/v1BXnw=;
        b=ZAQGlPlLeK6ezx7i/2y10AOWsMaVxek49yrjg8GyncNye4T2ID660x0wJcgo6jfwKq
         bFLH1PhkaK46LkKDD6ArTkpOw6NN/boMCBUl7epxBBUA9IWNT7Z1Fzm77FK8Yj1DmGl8
         XU8osb7ud8awCplr5sUje8JEHXD81KBXFUDY+bC5iYHRUz4GaSfP0W2Q9jCp1iNrKOKg
         GR7q2zL5BWoUmkvD6vMUh8iwmdUqiyOwNswfroGgug/128GcVcwh7Tw3M/wXFvtpcvUf
         9obaJJ+Y2+4huzx2WXhAz1cy/05v3fRdzfBSkJTjm8dOdEiHKp9eurUuGinHwRR1Aimz
         GZew==
X-Gm-Message-State: AOJu0Yz4sZq+eVU5+igIVEAOolpgh4ewjt5uXdtfy/3kFSbMTA01H3Ns
	RXn7i36va+YQw6StpLJjuvLZ4G+nh5zIpiE6VsEDyWeiOiPKUeZoTCNWBLTRhpWugo/oS+O25KH
	RLCUNtcw=
X-Gm-Gg: AR+sD12e9RefgGKTKe0SHZQWPf2k47SwwC1jCeFOVLXJeV8JmxsYAzqS8vyQcMyGio5
	dLY3mqIQPrYCo8kcARA9QEaZ762PP7R5K3ju9qwqJFG8vxO0wA9fKfhgXmlm5cbLnz2rGD8Cb3S
	xWWAR9QX8FOtfZD91N68w0RW0Aae4Lc4ucsxXcgkCCKOWNRuBY638zHyOAwBPzuharPNyxkCspG
	PEyKe5j3IfA2oXlwcVUoBpnT5ybe7OuaSOzlhCXusIFMzKg45DeqLp+ig1Q1UtvUBgZt/ZJlrJp
	+U5cYED+WLB3Qz/FtmsoJeSE1QbcrKGGz8jHMyOY1Q5PJ4TOdaSTwdi4qbpYefTSbIqr+hw4k8H
	t7R1T4ldmpNC+GYcoPhg2B0p7MwfrqTPGnvjXubmmcQmO/4lVFdOILaIZqfwO5hiwLo+KUyoXVC
	YYSxvpY2CSBmak
X-Received: by 2002:a05:6a21:99a6:b0:3c6:3c5b:f32f with SMTP id adf61e73a8af0-3c67e0b93b9mr6779463637.51.1785133232135;
        Sun, 26 Jul 2026 23:20:32 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm42733554eec.4.2026.07.26.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:20:31 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCHv2 3/6] vim: Security Fix for CVE-2026-47162
Date: Mon, 27 Jul 2026 11:48:14 +0530
Message-Id: <20260727061817.8586-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727061817.8586-1-sdoshi@mvista.com>
References: <20260727061817.8586-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242034

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47162
[2] https://security-tracker.debian.org/tracker/CVE-2026-47162

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-47162.patch            | 83 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47162.patch b/meta/recipes-support/vim/files/CVE-2026-47162.patch
new file mode 100644
index 0000000000..69714493d4
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-47162.patch
@@ -0,0 +1,83 @@
+From f08ab2f4d7d2947c8dd6c179ae08ee6146a2694b Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 17 May 2026 18:53:48 +0000
+Subject: [PATCH] patch 9.2.0495: [security]: runtime(netrw): code injection
+ via NetrwBookHistSave()
+
+Problem:  [security]: runtime(netrw): code injection via
+          NetrwBookHistSave()
+Solution: Properly quote the directory name using string() function
+          (Srinivas Piskala Ganesh Babu)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-crm5-rh6j-2c7c
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f08ab2f4d7d2947c8dd6c179ae08ee6146a2694b]
+CVE: CVE-2026-47162
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ .../pack/dist/opt/netrw/autoload/netrw.vim    |  2 +-
+ src/testdir/test_plugin_netrw.vim             | 20 +++++++++++++++++++
+ src/version.c                                 |  2 ++
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 3a460e675b..a04120d5f6 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -2957,7 +2957,7 @@ function s:NetrwBookHistSave()
+         while ( first || cnt != g:netrw_dirhistcnt )
+             let lastline= lastline + 1
+             if exists("g:netrw_dirhist_{cnt}")
+-                call setline(lastline,'let g:netrw_dirhist_'.cnt."='".g:netrw_dirhist_{cnt}."'")
++                call setline(lastline,'let g:netrw_dirhist_'.cnt.'='.string(g:netrw_dirhist_{cnt}))
+             endif
+             let first   = 0
+             let cnt     = ( cnt - 1 ) % g:netrw_dirhistmax
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index 7b34b52562..cfce82f68a 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -654,4 +654,24 @@ func Test_netrw_mf_command_injection()
+   call assert_false(filereadable('poc'), 'Command injection via mf command')
+ endfunc
+ 
++func Test_netrw_injection()
++  let g:netrw_home       = getcwd()
++  let savefile           = g:netrw_home . '/.netrwhist'
++  let g:netrw_dirhistmax = 10
++  let g:netrw_dirhistcnt = 1
++  let g:netrw_dirhist_1  = "x'|let g:injected = 1|let y='z"
++  call delete(savefile)
++  try
++    call netrw#Call('NetrwBookHistSave')
++    call assert_true(filereadable(savefile), savefile . ' must be written')
++    unlet g:netrw_dirhist_1
++    execute 'source ' . fnameescape(savefile)
++    call assert_false(exists("g:injected"), 'injected statement must not execute')
++    call assert_equal("x'|let g:injected = 1|let y='z", g:netrw_dirhist_1, 'dirname must round-trip')
++  finally
++    call delete(savefile)
++    unlet! g:netrw_home g:netrw_dirhistmax g:netrw_dirhistcnt g:netrw_dirhist_1 g:injected
++  endtry
++endfunc
++
+ " vim:ts=8 sts=2 sw=2 et
+diff --git a/src/version.c b/src/version.c
+index 64008e0f37..cf62805e44 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    495,
+ /**/
+     480,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fd835a3cdb..8360b1622d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52860.patch \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
+           file://CVE-2026-47162.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


