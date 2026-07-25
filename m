Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F623C531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 14:32:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.366.1784989964108207545
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GmrMzXWC;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1289677a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784989963; x=1785594763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbpCPZ1inzN5h6L0jtSUls8KZloO8KjZy9zpfh7GFLc=;
        b=GmrMzXWCLBVfm51sRxtzTtfVLgCk5qNNdr9qVemkB24rHe7vdVaLphFiB2a/HKpbAy
         WpUVxkXDMK2/UbUDtNcgK4Bwzoui2+x8YfWK6fIDThPM+bmL15bAGXDtvumddJix8LQj
         CEDlNtsEpX4rzRIvqp4XL/cn/JIUh/5gFIENU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989963; x=1785594763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbpCPZ1inzN5h6L0jtSUls8KZloO8KjZy9zpfh7GFLc=;
        b=qmXe+eQnyZEjQkk0IaStOU1hn8jqB9NONaxtDaNcZp9h7JBMYe2hzacJv6DuIndwYM
         sU/68n1EJLQAx383JFSDs2rylOllUqxjXlQUf7t6VMd3sr1IEUZRBRW+YnnTDEE2pOw0
         umhqh2kCNBcRugDRVArUfonc6arEjx6Aggaq+tSHSBOB7WDuNNk1rnwNsk3AWtpa61Ld
         HnQWuOZohKtPCuLiIsvVX6mmS4ac6gfxvqhHUK5e0cwic+wEjQmpQsXGzVaKL9cClxoG
         j07RziccepUnyxVhnw7sYvWs6ZPaglrAc1Cawc3GuQK9sa1tDjrDyfVHtXSt3lP3SmfF
         IPCA==
X-Gm-Message-State: AOJu0Yx62Vjuqu9ZUyYGWXX6Y83T3xokyQUaelXOCAl7GdfJ5ClqdQcI
	nXMKjIfA7jRceMpqYatSGyIqkmw2YP7T6kHx9pSnHQ0MTLXnms3fwboQIoXwYX2no1siz2ramPl
	2yBytuT8=
X-Gm-Gg: AR+sD11Vp3q2qtDPODqFRo8koQFPMGM5mh13+1fwBXTXrT9nr9rkThagGxg7fnyUj7A
	bsCR8gdo/0x0bWOHVPmLkqrYd6dURKX4z4iEyDJ0/dp3ZVK2r9M9alhC+uW4US9CCxfHn5yKqeG
	sRiVZlFgJ/pLxgqCql/3IPDYWdhwig+hi2jZgsJcJJzakAN3dGEYu0gHxygoxJgn9Ks9tPmba+W
	W5y6LL+UJJHDnBPEmNGEKJ0bfLR1qY87VowrQZdoaefqQUxh0lFlTe2rq80G03Ml0KRCz/78+5u
	T4agE4wh+rBWyPrk2WhdFEdTZQK2lNZlCEPHf0WvkoiW+nIHw6siyCuqQztngFbYxerhW0MY8uv
	DWh4vlDFEmySgREPj0/eFgnrFgn5Oab+Ik0P+JgdU7bp/6K/aBUDhdx81YpJhHR8xRQuaNEXOHA
	OvnR91mCbAe1Py
X-Received: by 2002:a17:90b:4a08:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-38f2963d61amr2567471a91.20.1784989963302;
        Sat, 25 Jul 2026 07:32:43 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e585ae882sm1575845c88.6.2026.07.25.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:42 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 2/6] vim: Security Fix for CVE-2026-43961
Date: Sat, 25 Jul 2026 20:02:27 +0530
Message-Id: <20260725143231.230059-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260725143231.230059-1-sdoshi@mvista.com>
References: <20260725143231.230059-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 14:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241972

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e
[2] https://security-tracker.debian.org/tracker/CVE-2026-43961

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-43961.patch            | 104 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-43961.patch b/meta/recipes-support/vim/files/CVE-2026-43961.patch
new file mode 100644
index 0000000000..de4ece7bda
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-43961.patch
@@ -0,0 +1,104 @@
+From 8af0f098c3a42a28661d0295364e6e0fd7dbc92c Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 14 May 2026 16:43:15 +0000
+Subject: [PATCH] patch 9.2.0480: [security]: runtime(netrw): code injection
+ via mf command
+
+Problem:  [security]: runtime(netrw): code injection via mf command
+          (Christopher Lusk, Zdenek Dohnal)
+Solution: Do not use string concatenation inside the filter() commands
+          (Zdenek Dohnal)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-66hr-7p6x-x5j3
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e]
+CVE: CVE-2026-43961
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim |  7 +++----
+ src/testdir/test_plugin_netrw.vim              | 15 +++++++++++++++
+ src/version.c                                  |  2 ++
+ 3 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 78ce0cbc3c..3a460e675b 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -5175,7 +5175,7 @@ function s:NetrwMarkFile(islocal,fname)
+ 
+         else
+             " remove filename from buffer's markfilelist
+-            call filter(s:netrwmarkfilelist_{curbufnr},'v:val != a:fname')
++            call filter(s:netrwmarkfilelist_{curbufnr}, {_, v -> v !=# a:fname})
+             if s:netrwmarkfilelist_{curbufnr} == []
+                 " local markfilelist is empty; remove it entirely
+                 call s:NetrwUnmarkList(curbufnr,curdir)
+@@ -5196,7 +5196,6 @@ function s:NetrwMarkFile(islocal,fname)
+ 
+     else
+         " initialize new markfilelist
+-
+         let s:netrwmarkfilelist_{curbufnr}= []
+         call add(s:netrwmarkfilelist_{curbufnr},substitute(a:fname,'[|@]$','',''))
+ 
+@@ -5216,7 +5215,7 @@ function s:NetrwMarkFile(islocal,fname)
+             call add(s:netrwmarkfilelist,netrw#fs#ComposePath(b:netrw_curdir,a:fname))
+         else
+             " remove new filename from global markfilelist
+-            call filter(s:netrwmarkfilelist,'v:val != "'.dname.'"')
++            call filter(s:netrwmarkfilelist, {_, v -> v !=# dname})
+             if s:netrwmarkfilelist == []
+                 unlet s:netrwmarkfilelist
+             endif
+@@ -7235,7 +7234,7 @@ function s:NetrwTreeDisplay(dir,depth)
+         " hide given patterns
+         let listhide= split(g:netrw_list_hide,',')
+         for pat in listhide
+-            call filter(w:netrw_treedict[dir],'v:val !~ "'.escape(pat,'\\').'"')
++            call filter(w:netrw_treedict[dir], {_, v -> v !~# pat})
+         endfor
+ 
+     elseif g:netrw_hide == 2
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index 6be32911ce..7b34b52562 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -629,4 +629,19 @@ func Test_netrw_RFC2396()
+   endtry
+ endfunc
+ 
++func Test_netrw_mf_command_injection()
++  CheckUnix
++  CheckExecutable touch
++  let path = tempname()
++  let fname = 'x" . execute("silent! !touch poc") . "'
++  call mkdir(path, 'R')
++  exe "cd " path
++  call writefile([], fname)
++  Explore .
++  call search('^x')
++  :norm mf
++  :norm mf
++  call assert_false(filereadable('poc'), 'Command injection via mf command')
++endfunc
++
+ " vim:ts=8 sts=2 sw=2 et
+diff --git a/src/version.c b/src/version.c
+index 4508ae3f18..64008e0f37 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    480,
+ /**/
+     383,
+ /**/
+--
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 2a9846dfbb..3888c725e0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
            file://CVE-2026-42307.patch \
+           file://CVE-2026-43961.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


