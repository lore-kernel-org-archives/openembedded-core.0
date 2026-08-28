Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416FAC61DE4
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3043.1787945893695011378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1Ue6cnlx;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so9680045e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945892; x=1788550692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=II8NDEwDTeRqGHU6k9PvXxUeesOHjKFjNp56EzCEblc=;
        b=1Ue6cnlxR8TcrOUdX+lbJpb5rcF8wWkp2OLXQ3+4WNws6J24P2uBRii3xyhXZvJpwK
         w4wX5mLFx/Y2nsm5AorBn9orfiE6JwEpxoXUwzMhMqZandtiZGSL6k6nEGtYjvh2Vs/w
         InUecCVATnPNz4xNPvHLyrJl1Crosf41XcjO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945892; x=1788550692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=II8NDEwDTeRqGHU6k9PvXxUeesOHjKFjNp56EzCEblc=;
        b=cwyPkkN3t9ey/fPrFi/4/jFZRwkahu7v9Ei2gE1hH+8P2kXzD9Q9+HgPyXFqZpAgR2
         KvDYdSU0fkmRhAuHr2XacY9pRUspwz1WgSLAgKmwO2gCnd/hgPz+JYJ29wSuuTmbufpW
         GmvF+gzCd01aIHE8wv64vdVZex02YGcNJUVlRnNh95G/6XolrNE4CpHYnLZqKcEtXn7F
         GwEGjZr2YknkicXoddGmMzG7byjvthkEthQ1vzoBueAaJ6gnw9fTvSRsn4QGWEf7WC1r
         APNYU8b4JbVnYk+gd4j/mwS/yPeu3+VnEcf7WGa79Xv1/EVir5jnx7j07IU3ODvh9jtv
         a/mA==
X-Gm-Message-State: AFuF++msQIco3jt/Vjwgf16A+RNeNDnOknoPk2M+otLXPTOesCCqmpq7
	c/MDAJSWoLs6n9uLUnucLnesB9oCMq5t87mlS4c+xdu6iUoRNmFbEzd96cjg9P0pVozSZK94TTd
	DDpkoIHc=
X-Gm-Gg: AR+sD105PqxfY1RXTA8kkZzL7tl89li/tS3w+kSyMo6DBWZUXkc0ByL/azutKLCOofR
	AGFu4LYc1pBrTgG2G/H+3aRzNaX0qxlj1awLKPUi0HMomSHSaX/JSf8CB85vgI1IKIie0NvN6D2
	s8Zn3JyE6/gWW+2hfAQwenzJ5cugP5BGClIzWB7dT54UrOCUCBBU2/56lBsdunx2J6O1am5IhbI
	JfklAl2A1f/AKjmtGy07Ujhs5JT3H8xUlFVBfGcTA1T1OzjTym0HJnPiF1eIe2OmE7KZbrlAJNm
	B8pWzxtLVhfUvifIF/BLNG6r+FCtebc3PPbydjkrZHniptEP2K48UP/piAZ608hQ0C+6uiCLm1n
	8pHysASxV5BO9I5CIeVM6wx9tFWh9wQd0zd9027tJ9CEu+UXQaRgNTJf/myxrIJNqvE/g1lBXQi
	qby5uWKyZkjs9nPDGSdDwSc1qsnkeMEUyU0YXNw/fBHded30FJ72Z5FgLd03p91v0AOSmUS43TX
	fYPSX8vGwkjxfEsGcUFeeff4ymnuU9rGAKOGE+beLS/VPeZOQvL8Bedt2LGhjx+
X-Received: by 2002:a05:600c:5299:b0:49b:8e8f:a409 with SMTP id 5b1f17b1804b1-49b91c6481bmr143067715e9.13.1787945891923;
        Fri, 28 Aug 2026 12:38:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/56] vim: Fix for CVE-2026-55895
Date: Fri, 28 Aug 2026 21:35:24 +0200
Message-ID: <f4b2e03f098b214d4ec8575c67cef60bae40d6e5.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244575

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/55bc757a5d436e59d50fe43f7cda94b118f86cb2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-55895

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-55895.patch            | 106 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55895.patch b/meta/recipes-support/vim/files/CVE-2026-55895.patch
new file mode 100644
index 00000000000..6bfb8ee1245
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55895.patch
@@ -0,0 +1,106 @@
+From 7c320315fab914a26bccfbbe6caf1a721897aa9c Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Tue, 16 Jun 2026 21:00:28 +0000
+Subject: [PATCH] patch 9.2.0663: [security]: runtime(netrw): code injection in
+ local file deletion
+
+Problem:  [security]: s:NetrwLocalRmFile() escapes only the backslash in
+          the file name before passing it to :execute, so a name
+          containing "|" injects arbitrary Ex commands when the file is
+          deleted (cipher-creator)
+Solution: Use fnameescape() to correctly escape the file name
+          (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-vhh8-v6wx-hjjh
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/55bc757a5d436e59d50fe43f7cda94b118f86cb2]
+CVE: CVE-2026-55895
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ .../pack/dist/opt/netrw/autoload/netrw.vim    |  5 +++--
+ src/testdir/test_plugin_netrw.vim             | 20 +++++++++++++++++++
+ src/version.c                                 |  2 ++
+ 3 files changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index a04120d5f..d7eca30e4 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -24,6 +24,7 @@
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " 2026 Apr 01 by Vim Project use fnameescape() with netrw#FileUrlEdit()
+ " 2026 Apr 05 by Vim Project Fix netrw#RFC2396() #19913
++" 2026 Jun 16 by Vim Project Fix filename escaping in local file deletion
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -3061,7 +3062,7 @@ function s:NetrwBrowse(islocal,dirname)
+     elseif !a:islocal && dirname !~ '[\/]$' && dirname !~ '^"'
+         " s:NetrwBrowse :  remote regular file handler {{{3
+         if bufname(dirname) != ""
+-            exe "NetrwKeepj b ".bufname(dirname)
++            exe "NetrwKeepj b ".fnameescape(bufname(dirname))
+         else
+             " attempt transfer of remote regular file
+ 
+@@ -8770,7 +8771,7 @@ function s:NetrwLocalRmFile(path, fname, all)
+             call netrw#msg#Notify('ERROR', printf("unable to delete <%s>!", rmfile))
+         else
+             " Remove file only if there are no pending changes
+-            execute printf('silent! bwipeout %s', rmfile)
++            execute printf('silent! bwipeout %s', fnameescape(rmfile))
+         endif
+ 
+     elseif dir && (all || empty(ok))
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index cfce82f68..a0a3915f5 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -674,4 +674,24 @@ func Test_netrw_injection()
+   endtry
+ endfunc
+ 
++" Deleting a file whose name contains an Ex command separator must not let the
++" name inject commands into the :execute in s:NetrwLocalRmFile().
++func Test_netrw_local_rm_injection()
++  CheckUnix
++  let dir   = getcwd() . '/Xnetrwrm'
++  let fname = "x|let g:injected = 1"
++  call mkdir(dir, 'pR')
++  call writefile([], dir . '/' . fname)
++  try
++    call netrw#Call('NetrwLocalRmFile', dir, fname, 1)
++    call assert_false(exists('g:injected'), 'filename must not inject Ex commands')
++    " The file is removed before the sink, so its absence also confirms the
++    " vulnerable code path was actually exercised (not skipped on an error).
++    call assert_false(filereadable(dir . '/' . fname), 'crafted file must be deleted')
++  finally
++    call delete(dir . '/' . fname)
++    unlet! g:injected
++  endtry
++endfunc
++
+ " vim:ts=8 sts=2 sw=2 et
+diff --git a/src/version.c b/src/version.c
+index e7f323854..16a8b140d 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     671,
++/**/
++    663,
+ /**/
+     653,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4189817a8d7..48edfc694f0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-55892.patch \
            file://CVE-2026-57452.patch \
            file://CVE-2026-55693.patch \
+           file://CVE-2026-55895.patch \
            "
 
 PV .= ".0340"

