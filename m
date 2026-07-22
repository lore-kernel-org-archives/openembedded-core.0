Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A864C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:04 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46864.1784723636225578277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Lz5Hh9FG;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38deea72eebso10561903a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723635; x=1785328435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqVUNu9Z1VD1AB/CjsNDfHWoZ7YQTbdmSf0C1uGgyeM=;
        b=Lz5Hh9FGoZUm+HteIobFFzp8s4n8a/e1pF7dXnkjnOgyYu/1V5vHYtQYTBVdVrXh6y
         q3dPNV8aP7UcSsYOM9Tlx4ZwtdonkYTXvKv5W3NOMzsLHv4+P7enOlmAxcpIA4Ijblkd
         ur1SlZcnwHUmAyn9btUwaaF9YItgJYzKSqlcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723635; x=1785328435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqVUNu9Z1VD1AB/CjsNDfHWoZ7YQTbdmSf0C1uGgyeM=;
        b=jzFWU6X4FF+5CIDdvfsgGVGVmc+Hw04D2QJwiOE7fHcqv6zAwmnsJbd4B7/V7Ijehx
         hjFLJIsIOonyAezXq/Z4g9pivR985yGMcOaBVnw/6DjFwkJjOciGpPvV0LI5EChGJBin
         wQwlY5mtesL58hWqfzHH18/qTsfpH9izBtyViuGogLGt3S6A19SkuwAvFJYERG0eR7vh
         XOis2yaYcmwnjY610OpQXVCJC/Tq38+zWkQitGhW8a0/oUQ58ku75eXVWPBHAQePQ7SS
         1rY+tlQUFSbNtlaDuYT4joYRchCUAQL4iAx0znOsfkLIg5ZEeye0eVfcL1HOw1/QoigZ
         GSjA==
X-Gm-Message-State: AOJu0YzNtBIQj2RX0eGD96am01O/6GO5xXszgLsf1OMUFyW5ItqDGyD8
	UDxRruQzyRT9NRX0UR0axvUH/clfK7FtXMwohUhEEZjhRJ5N8nKw/vdTERmqFq3wGuX1WDwxPbZ
	vx4fg
X-Gm-Gg: AR+sD13jnV56GLMXv1Ixg2TdZ33kfwIGc8ww7KW2pJK+4CiTNvD7mIHDVC1FQnRC3r8
	1KDUXqGdEX+X91qP1nD7WCPJ+25Dh14pBXKOadTwy2u1kYt9oDzDJkapVN4+YSYJ0qmWAmKVGvh
	lKLU1iuVfal+U307fIq/GmRTzQO4F632tqF+uiQUbXmwpD5nPgNAcjxTNoHiWJ368jbQvk/N/j6
	Lkl98hOSIqbtq16nHVdnRfPjUNM2JKx9HT/GZsDSJJPU5pIGi5cmy8HUeA3DmBf9M6Mvs2wh9RZ
	Q5SyxKtDpVchO2ish557ylk0DlTFvEoAlQUfPkReP39nEx4eIgtLSR5li0aABxD/oQbGsAygwRG
	j3waZQvwKmUuYilBmNy1vlDCYw61Wf85xK8FrU2XR4KSACu3zTStR5zEBQtPK1JoIgWncAkiqyr
	AgX9/91Mm7XUTt1ZHp
X-Received: by 2002:a17:90b:544b:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38e9045bb96mr8709420a91.7.1784723635477;
        Wed, 22 Jul 2026 05:33:55 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:33:53 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 02/10] vim: Fix CVE-2026-55895
Date: Wed, 22 Jul 2026 18:03:28 +0530
Message-ID: <20260722123336.587556-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241670

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55895
[2] https://github.com/vim/vim/security/advisories/GHSA-vhh8-v6wx-hjjh

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-55895.patch            | 83 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55895.patch b/meta/recipes-support/vim/files/CVE-2026-55895.patch
new file mode 100644
index 0000000000..cc335ea2a6
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55895.patch
@@ -0,0 +1,83 @@
+From 55bc757a5d436e59d50fe43f7cda94b118f86cb2 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../pack/dist/opt/netrw/autoload/netrw.vim    |  4 ++--
+ src/testdir/test_plugin_netrw.vim             | 20 +++++++++++++++++++
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 8e5fdb5397..ebb856800c 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -3062,7 +3062,7 @@ function s:NetrwBrowse(islocal,dirname)
+     elseif !a:islocal && dirname !~ '[\/]$' && dirname !~ '^"'
+         " s:NetrwBrowse :  remote regular file handler {{{3
+         if bufname(dirname) != ""
+-            exe "NetrwKeepj b ".bufname(dirname)
++            exe "NetrwKeepj b ".fnameescape(bufname(dirname))
+         else
+             " attempt transfer of remote regular file
+ 
+@@ -8772,7 +8772,7 @@ function s:NetrwLocalRmFile(path, fname, all)
+             call netrw#msg#Notify('ERROR', printf("unable to delete <%s>!", rmfile))
+         else
+             " Remove file only if there are no pending changes
+-            execute printf('silent! bwipeout %s', rmfile)
++            execute printf('silent! bwipeout %s', fnameescape(rmfile))
+         endif
+ 
+     elseif dir && (all || empty(ok))
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index b234670928..4d5fc9a065 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -609,4 +609,24 @@ func Test_netrw_RFC2396()
+   call assert_equal('a b', netrw#RFC2396(fname))
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c0315dfed6..b9f6ef987c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-55693.patch \
+           file://CVE-2026-55895.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


