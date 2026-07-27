Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132EC53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43822.1785193010794134214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UVbXa9eQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so17166415e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193009; x=1785797809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fiEdpvYtOA0lQVCLqH/Df/8Mjqfwh4H7EbeDIqIEtdA=;
        b=UVbXa9eQOBNIDYvnKE0IS62shpfVFos4SrmoqYuG3oTudtChd/MN51ApNfQWmcUchc
         Ed/TIuqGOhEk+jFcwZMFoEhcHhhuZhZe8cPruS6xfPFZywWeYsAJtJSWh1IspEXiSK1R
         EaF8kfyJjlqmO/JsMuSne3LQXs4MJUZLCGJZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193009; x=1785797809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fiEdpvYtOA0lQVCLqH/Df/8Mjqfwh4H7EbeDIqIEtdA=;
        b=Cg/yyeaSFtDJJaJF4SQhbZOvp1V6mQN22hn3MZYedonDPk+dMITK+FNoC4v624SbGQ
         cDfRPoWWfuzBdHZaxSDWsFlh/NFoANOUg6+fYxt/3ZYkwLvrEDxP+2NFq31Q7sxOoZ1s
         Upql8LL/7JvS1pdGEIjg20Lb8FRpusBUUBmxG0TnBN7DxPuCg9I1JJ6XDx8OnQA2xTtY
         knD72sMbsNSqnxs/YCJt+2l1r3sw7ILskJHTmqn440HAffEge7ag5srhHWWDKeP5cLb1
         636F263UwScvwtfb41/LXux9mA3g7ydQJN96ar7ZtvZBU+RqHDO/ppmnrZCLajf/IkhJ
         LBSw==
X-Gm-Message-State: AOJu0YyT9g+1vP/VO1vQoKrN0jto5IsIoC2Gr/OHhSeSiD5tuG33DY8t
	E1uHHCB19HNBDeSP2w/jzdGOjhRvVR9LacMKJkliE+2pSpFA+rZxmjwF08obm5cMGm6mia7PZf/
	Uo8BldiQ=
X-Gm-Gg: AR+sD12IW8rf4yUO8+Nl/EYnwDx9HNrIv0O967EBqYPWL1evRhOrZhMEryveNlaDx0q
	RNHRNoiCQGTjm3s65aqMZuDRgvqp6hkIEljQNB05VIm/1bH7uFoh2jPvll9f5X92FWdQx82RBBk
	HTIYAPHuqLfcUAgDWbtWqvU74HOAqevccScnsgPSFx1dRw7EIyx3nnGG5yXSiPlkeGyUbY150d1
	I0Hes2pBYtyR4Xs4qGH9hYwH45Z/bQnqscT2J4KSDJVuzWXbV9XRFXvXwtdqV/K2gZm5vOFl1pM
	r2olb5zYIGEnRM1RKe/chKgvCOPPOaZzQEC/EFmuoZGpr06yZfYU0MUlGmrQvIkxdcYZ7mbnPoR
	2LyGaWyhRZp4c6uUgVGWBnJkAvI7fD33hxoh8BbgR+gQ3GmzZEcTTIIlc+0mil76CIytzK7/3XL
	dKyxNE8Uv5xGdfHbfGV4vr0jHr59A310wWGccNs+RAOGzrXpaK/Kq8idOvKqulWQEzZPXMFCCw4
	wZqWw==
X-Received: by 2002:a05:600c:5801:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-496c4fc3eb2mr5728315e9.25.1785193008964;
        Mon, 27 Jul 2026 15:56:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/36] vim: Security Fix for CVE-2026-47162
Date: Tue, 28 Jul 2026 00:55:47 +0200
Message-ID: <4cadd4155f05e4c6a1268045ef597b9081dfcc0d.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242150

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47162
[2] https://security-tracker.debian.org/tracker/CVE-2026-47162

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-47162.patch            | 83 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47162.patch b/meta/recipes-support/vim/files/CVE-2026-47162.patch
new file mode 100644
index 00000000000..69714493d49
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
index fd835a3cdbf..8360b1622de 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52860.patch \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
+           file://CVE-2026-47162.patch \
            "
 
 PV .= ".0340"

