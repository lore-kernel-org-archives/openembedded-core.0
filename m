Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A111C531FC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:20:31 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25231.1785133230122747186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dnzHMACQ;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceae1ed204so23496065ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1785133229; x=1785738029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPIThyWG+Q6GQl1X7bhA60cOH+S1041+ORS1QAMzjj0=;
        b=dnzHMACQEP9ww/TTDJaX3F09WUsrtW3l/WMScgzbKIf4VHjenEQ3I/0Utv5aqKZEUJ
         lAlDidj6vMyuAQzUNgiWG/DVOeBfq4X6mc57t6ZT2w3MiNAxhgr3KVbPbbPFt96Qh32o
         rWq0GYAEi17WBUfI0K8uyDUac0OfweAi1G730=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133229; x=1785738029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPIThyWG+Q6GQl1X7bhA60cOH+S1041+ORS1QAMzjj0=;
        b=Ap9FGNB9PBDkb2f0gGeEKlzqhYtL2gBL1ut2cw7pFPDnhF025BZx/rc9B9Gojcji39
         c7hnwg3i3JuTap7wsBvZOy1nCpIyN7m83ACcn0LAFrlLVlfW7fJXV5pESrmBeIFVwHer
         w5H3/5Qkw9Hzg1Kw3JD4flNEYxoTfB035w6VCDRfXdIezGlIUhGJ02cIiNq4/dd6SnFw
         XI7L8lF7MqrcQGdPL6g7Qt0Q93aOD1UIT5X+YQFyaObL9cK590VJ7IRSSj8OJ29AR8kv
         byShMcM6CnELcYvtMd4fNuduQl/HJ9sPUtYphDE9x5mIac9mwNnubbMLCNyREmKXSG0j
         Pfww==
X-Gm-Message-State: AOJu0YwiTZIySlR2mv2AY90RmmtjZlWFXGurkr77wu98Duae59jvmKuN
	BfNpKhWk3zhSC80j0tIXdTgVkXgKOgBuRGD50V2GgUULAyVUqnyIVxEdsbZ7Sn7iJttXcRT+MBG
	ydUwz1ZM=
X-Gm-Gg: AR+sD113PSYCTZgaxiMAsE4OqKsde171P++nAX5SEIl7YRzqePlkHYTM2NCA4Wkn6mT
	mmZBj8YmKOD+xOhRskSt9rBYCEwEP83qasnp0gkKzwM0MDUwZWq/CRb2a3hMiE9t/bJLPUYtJ/G
	MvH1zT/F7ZgjEzSCgJgl0Ap674CV13ixibuSOVvsbwXMbKi42QicUxmkQ3jaYwnDIdl8/yMuoz4
	q719mDFyY32cqWJ9HbwI+keynDeO/WmxGQYVAeYqHHaRp6ozpHccrqiv8dY3PH9tLaXV3atatJ8
	WLlTiWQZ4mm3nGQjW8WC8PmxomwkLuVECST84r5LK5QD/h0Nh5UJ3+eqE+zDfBQzsif28el3slu
	7iHwz/MoP/2tL7oJ9twSsMAmzyC1KkmCSYF9ioM5AR5ZSz4k8GAFf0eA3uYOEeaOfxc9I6SaIXX
	nDPMIKs5pgMFSh
X-Received: by 2002:a17:903:2d0:b0:2cf:7ffb:82aa with SMTP id d9443c01a7336-2cfde899299mr63564705ad.45.1785133229364;
        Sun, 26 Jul 2026 23:20:29 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm42733554eec.4.2026.07.26.23.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:20:28 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCHv2 2/6] vim: Security Fix for CVE-2026-43961
Date: Mon, 27 Jul 2026 11:48:13 +0530
Message-Id: <20260727061817.8586-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727061817.8586-1-sdoshi@mvista.com>
References: <20260727061817.8586-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242033

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
index 0000000000..e2633ac04f
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
+@@ -639,4 +639,19 @@ func Test_netrw_RFC2396()
+   call assert_equal('a b', netrw#RFC2396(fname))
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
index 0ad78ab4f0..fd835a3cdb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-42307.patch \
+           file://CVE-2026-43961.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


