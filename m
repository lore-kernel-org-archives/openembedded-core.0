Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C118AC54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2704.1785277333468982522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fHe2y44k;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954d383e64so1997995e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277332; x=1785882132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M7fbWxes3hFz9W759htSbTtYE/1tCHzdzaOl9kV3S88=;
        b=fHe2y44krPFLqXMBv+RqRuJN5PmGrlucDhDnDWToW2H74cFbFZoCfnGBoUXKYS9JUD
         J8uCjVAj5Y/NGtW07c2zLGY+DQSM5oHYqW7Nzv3saDcfOX9EUSud3Wk1Kn7waW6Ky+yZ
         I6sVYbWpK6JHZIYOHLbN4tKLlGnIp7VyuCk1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277332; x=1785882132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M7fbWxes3hFz9W759htSbTtYE/1tCHzdzaOl9kV3S88=;
        b=U577+r3EpMKTlp1TkcHzqRQsHqxSTP/KIdCZzqABehTzApZJm68B/YbC6PWK2s09Er
         +KlmzsLR3DndztXE9zAqOBvZu/0QrLgd45nGKS3IECCZdo/IKd05gnq9ux0H3WqpGFSM
         wV8OJOKUMFgFvo8yhLi7erfAOpVE5jUp9lHkk1c8J8dm85aiO7gpHC7XZU8NaZvc0QOY
         6KRpByh8MweFdeCv32MPC5L5yQw3C/wjhKDoMsFaEwHdubh8qiszLWOHDviwGEw0pJVf
         yY2t1pLpOr5Tphj//mHNahKAmfzlEW10YGq6b8VEZTBENLzoUeMSSVwDWxoGxnHcMl4u
         DJfw==
X-Gm-Message-State: AOJu0YyU5cF7qcCgHdUIIU77Nn1AHz6mAPbw9kRTouZ491lZut0mFOVx
	DZkvxylJh1gQ0kP9Sv/Z+se2W9p9JMS6mKF7uCn9oHvka7N7ZEjTxsz3kZGjFYlSrz9cGfDXivF
	yjSdUVls=
X-Gm-Gg: AR+sD10iSIPduyCx7rK6c14+ycPdKSVN02ps82gG4DfInnHxUC63FnUeSNMA58vLeye
	QxUtADxI3KZLB/BIEtPHq5hyJ7tIv0BH7zqfMAj4doZhDAggqiQ9xtGIRClfBjXoTcclTiHePi7
	MErIrtdRRxMm+t/SniLAxyqjrHYwMBZiZ7Vkjxyj+INqtYniLIj/Hk8g0lXNpR2eqKMPhA/i3eM
	YyjC80tJr4u/8MLBtN0UQ2dl5BIWnGam34jr7VWq9m14FQIHqjcYHVCFHLFOHQ3LJ59aJ5LaqJf
	HUesj3tVupRJwJWjEcHQ1dDP5sCLkW+X6qcd+JcmRdz5P5E9uVULceVHITFyL0abr8wS1dPkJLL
	MOMTkMmY/gH0wuQxUBT5Ouoe1UQkNzsCrPce3TuMdQqzuIn6t2f7N7ItVOKG55Dh7hk7+gxcaLj
	5AiLF+GXj6fb2DFD32SvxB76M2xOWDe+lisHirJEWqRujT+yy71gyCvd7SS/tB1TZHkGBuDmh43
	gTKmewddk0QRHju8S96hW8I4pu/h5bvromAi/d+praapKutbvA+KHpcEpB5DaPm
X-Received: by 2002:a05:600c:4fd2:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-496c6590660mr50953625e9.21.1785277331737;
        Tue, 28 Jul 2026 15:22:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/19] vim: Security Fix for CVE-2026-43961
Date: Wed, 29 Jul 2026 00:21:48 +0200
Message-ID: <333839503766bdb995092b09546922a3f4ec968e.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242216

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e
[2] https://security-tracker.debian.org/tracker/CVE-2026-43961

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-43961.patch            | 65 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-43961.patch b/meta/recipes-support/vim/files/CVE-2026-43961.patch
new file mode 100644
index 00000000000..f9e0fc0df4d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-43961.patch
@@ -0,0 +1,65 @@
+From f38c7cb2fcc9d5839386ea4722463ea921f0bbce Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 14 May 2026 16:43:15 +0000
+Subject: [PATCH 03/17] patch 9.2.0480: [security]: runtime(netrw): code
+ injection via mf command
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
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 805474616d..e484de5c93 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -5155,7 +5155,7 @@ function s:NetrwMarkFile(islocal,fname)
+ 
+         else
+             " remove filename from buffer's markfilelist
+-            call filter(s:netrwmarkfilelist_{curbufnr},'v:val != a:fname')
++            call filter(s:netrwmarkfilelist_{curbufnr}, {_, v -> v !=# a:fname})
+             if s:netrwmarkfilelist_{curbufnr} == []
+                 " local markfilelist is empty; remove it entirely
+                 call s:NetrwUnmarkList(curbufnr,curdir)
+@@ -5176,7 +5176,6 @@ function s:NetrwMarkFile(islocal,fname)
+ 
+     else
+         " initialize new markfilelist
+-
+         let s:netrwmarkfilelist_{curbufnr}= []
+         call add(s:netrwmarkfilelist_{curbufnr},substitute(a:fname,'[|@]$','',''))
+ 
+@@ -5196,7 +5195,7 @@ function s:NetrwMarkFile(islocal,fname)
+             call add(s:netrwmarkfilelist,netrw#fs#ComposePath(b:netrw_curdir,a:fname))
+         else
+             " remove new filename from global markfilelist
+-            call filter(s:netrwmarkfilelist,'v:val != "'.dname.'"')
++            call filter(s:netrwmarkfilelist, {_, v -> v !=# dname})
+             if s:netrwmarkfilelist == []
+                 unlet s:netrwmarkfilelist
+             endif
+@@ -7202,7 +7201,7 @@ function s:NetrwTreeDisplay(dir,depth)
+         " hide given patterns
+         let listhide= split(g:netrw_list_hide,',')
+         for pat in listhide
+-            call filter(w:netrw_treedict[dir],'v:val !~ "'.escape(pat,'\\').'"')
++            call filter(w:netrw_treedict[dir], {_, v -> v !~# pat})
+         endfor
+ 
+     elseif g:netrw_hide == 2
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7a865f122ee..2175c5f9a85 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-52860.patch \
            file://CVE-2026-28422.patch \
            file://CVE-2026-42307.patch \
+           file://CVE-2026-43961.patch \
            "
 
 PV .= ".1683"

