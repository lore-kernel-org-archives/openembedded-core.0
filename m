Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EC4C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43772.1785193009263059819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1aD33n0x;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22748035e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193007; x=1785797807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LJDqynC2cQbCjODUICBgQO9nvU1mBlfqq/GWM9XpYvs=;
        b=1aD33n0xeoJKZGWIgqa4o0vg3Y6zHGnF6ZNDWZFREfIqW7izm3iDWQP0E59DT6f5pz
         a3rjU4KE0scviYnF7ozZoZbxsWIBk4bzhhUF07udOp+ZkP2hHxykfMVzkki4Eb3tFMn8
         x007X2HvtePzET6cUjO56nHO5PkqHty/B2aIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193007; x=1785797807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LJDqynC2cQbCjODUICBgQO9nvU1mBlfqq/GWM9XpYvs=;
        b=D0Xhl+ClBSrK0jfhFM4XmVr83M2W6JXEcki1MISUG1Cl3IylVgzh72hlg8LrXFo3Wa
         UHa0GOZvIH3ezORZ/AT1OKHxy8HPXhDKnclf0A7oeVOPis9kV9C/q/xqQuw/BPo3RSSc
         cHgZvsArXTN5Cm6UPb8vwBh916pWufWtjC6vuU/DTAC8VK4LU/OLCw5OtFLxXofJDiCY
         ROXR7VhJ/vOYsDjMXSorYLeOtbvlimh9+vFaXa7N6ptw03tTtGGkgeaqXD01vIq9bw7q
         nF+IWamCl1yoDSDCwuEmRn0Re4jDhCtNd09+glE181Elcbicl3zA04LddKKx12KNmDjz
         rRJw==
X-Gm-Message-State: AOJu0Yzsi9AeybMV+BA5t5bYMkkkg39JI4Qf6hdN/2mTBjJ+5ukc6aJg
	3XV+vXgYEArlpTGH4XbYLIuxOhNKz/TIAG84Pj5n59YcHGwYrFU9hXjqZtNCNpzTs+a4qv/weJk
	cprx7uVk=
X-Gm-Gg: AR+sD12r6znxUfczFXbe169udSJ3nTsM12Q1KKrW8+jV93VZObfsU1jBSRIIsETmiNa
	VFAYTDnPiLi2qze76h5BFrmAGVJkVynfayClmwjHKGgQMENiZOj4YiSbbqzEZCb+TG88KxoXFyK
	xHBy4gEAM2oPIQ6AGK4VFkamUPbDOlh0GpXCIz5jxZs3klunSGc8nfLMhME5CsPcniEzaK5saWW
	D5634oa0gEmAH2oyIqaOEds06/f0jBf8NuPk2L1YrfmQTohkUVqcMy8/HdsKFV7G+v80LH++ov1
	SQZsxve6R9XoyNbSC6XyZhDreFZcwYylQzISgdDPcSDKopFy+JnvoDPV9WTNiITsJYTHlznP5t1
	hwpTGj3GAOclZsRvbiir/RjKGCbANhfcB4rEsxYixB/k1+3dIyCGI3I78HP1xbq3xdOy40qd+PL
	K77T4gTiTCpxMnyhrAFutKRq4g+QIneYsjLR0mRw4NN6R4ie1H1+WWZpckk8kxWLyviFFr+Fyox
	pC0Nw==
X-Received: by 2002:a05:600c:1d1b:b0:495:6f6b:fb75 with SMTP id 5b1f17b1804b1-496b57678e5mr147051695e9.38.1785193007516;
        Mon, 27 Jul 2026 15:56:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/36] vim: Security Fix for CVE-2026-43961
Date: Tue, 28 Jul 2026 00:55:46 +0200
Message-ID: <0e510b075bb664e506c58ba467dd90e21c6e8e47.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242149

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e
[2] https://security-tracker.debian.org/tracker/CVE-2026-43961

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-43961.patch            | 104 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-43961.patch b/meta/recipes-support/vim/files/CVE-2026-43961.patch
new file mode 100644
index 00000000000..e2633ac04f1
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
index 0ad78ab4f08..fd835a3cdbf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-42307.patch \
+           file://CVE-2026-43961.patch \
            "
 
 PV .= ".0340"

