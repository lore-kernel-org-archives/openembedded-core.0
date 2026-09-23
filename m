Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DAEC9830F
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:45 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2918.1790154696863680139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vwZfBL26;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2174415e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154695; x=1790759495; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdCCJK5YEaCHUnOjYzU8jACNSzVRD93EJjYJ5covCb8=;
        b=vwZfBL26GBTP38e+46hqWwyoUEZa31oUE0vFUWNvkwEzK0sd5SN41jI9mzLoBEPEDH
         fGwX7x+uA1eKFgMiNjoj397Kt4pd0oprZnYFdhrUg87S2OPSiA9VLWh1tRXQwmJaKxdM
         b9KhLUSMN6/383I+IcKGUyDX+MDMzoY5OoMsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154695; x=1790759495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdCCJK5YEaCHUnOjYzU8jACNSzVRD93EJjYJ5covCb8=;
        b=NSBMAOJt4+S9O24OSS+MsE95bTg2qVRFTjM1I7ddn1U53jC+z7NH83Rp8PPj0SgM2X
         Sp76HriLJgq9es8M+0o7tWErraduyQ2oF5mHa9iCKdbSpFkKra0iyJL3QmFoeJW7BLuL
         g5Q9ajekksyWf47PGjL81z3I24CK/INYW9awfxWIs7LS/DsDHqnVmK1aQFiYcWtMSNzC
         VlP/uOSYEY3M7B2aAsiZvKir3Bzgf44emQhSHCgcVKw2KYP0JzyU3CUrRZ3CAq8c+3YI
         s16TxWcHd0JFlLox5yLkQ5TDUA24uB/NlM6cofhuWLEj7++nHSmLBcwaFa6pL1nb7nrS
         8woA==
X-Gm-Message-State: AFuF++lNHQveuWaJLVRT34+ww1nIYYjJ2IuhUneboQBwMU0o2FP1x+Ej
	U7/dLbefKG8kFdA6I633m/ymaTXROA3OY0UQ95NJzugQU1v8HaEKPnRX+FZm//WhqX6OUcukl5p
	tRw+N1qk=
X-Gm-Gg: AYBFou05nZC3nr7QP3FlNq05xBe7lsNVlwwE/eNFVkojfLL3dzBsR9A1PWVd4ONSoeD
	eCdIQcGrXvveBK9sPnW5t+zH2VKJTe7MllpVh3KZUQyL5FZZYpohAgzxtYTtRfjbg4YvDT64iFH
	r1hAAVW5ShPeSyAKW3dqmSm7mcfCS6D50ANUlecr2jtXh/qj9cHusBoeXWPkCjGQCXaIxB5hH+T
	P59RXMx1pcSiTvJms42w7GoG+ig9Ezmof2yLMqCTLDpqU5BLTfFQeJ0QljGw7G8J7TE5tdfcWUj
	5uAhEwpsxjHMky36hIMn0QVOeMeebnN9AXN7VgxlZZPRTxbrPdtB8NEgINP2EUP2fu4cYzQuiS3
	MnGpb0yl2DxRbuppcclDi6sIG48ywoHvEbiLz/QbjtunX/803velYBUiy5OdTyYlzOO5vL2Md7r
	4VNBD3GVtUvl+H6SmyHi4MZfx4ddomfWB6H8GGaZcAL2lRtmGraagkZle32xKCJFdd3y08uxALt
	+oCYemUwZ1Bu2Hw/VvP4hG/tMhSViB37u6TRcmzyQbCP2d8I9tont/ojTVh/gWnKaa9ZjHt
X-Received: by 2002:a05:600c:6087:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fde360163mr33509925e9.1.1790154695053;
        Wed, 23 Sep 2026 02:11:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/48] vim: Fix for CVE-2026-73078
Date: Wed, 23 Sep 2026 11:10:17 +0200
Message-ID: <60254acd1a9ca4ce984bf4006b84e46f9727491f.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246477

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/29c6fd090d4520592f8be7d9ec81190edf25ef69
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73078

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73078.patch            | 94 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73078.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73078.patch b/meta/recipes-support/vim/files/CVE-2026-73078.patch
new file mode 100644
index 00000000000..48b561d9e74
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73078.patch
@@ -0,0 +1,94 @@
+From 29c6fd090d4520592f8be7d9ec81190edf25ef69 Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Mon, 6 Jul 2026 13:54:03 +0900
+Subject: [PATCH] patch 9.2.0840: [security]: code injection in netrw via
+ bookmarks
+
+Problem:  [security]: code injection in netrw via bookmarks and history
+          (David Carliez)
+Solution: Escape the '|' explicitly (Yasuhiro Matsumoto)
+
+The bookmark and history menu builders interpolate paths into :execute'd
+:menu commands using g:netrw_menu_escape, which did not escape the Ex
+command separator '|'. A crafted path could break out of the :menu command
+and run arbitrary Ex/shell commands when the menu was built or triggered.
+
+Add '|' to g:netrw_menu_escape for the menu names, escape the :e right-hand
+side with fnameescape(), and quote the netrw#MakeTgt() argument with
+string() instead of raw single-quote interpolation.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-rcr7-f3wr-22r2
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73078
+Upstream-Status: Backport [https://github.com/vim/vim/commit/29c6fd090d4520592f8be7d9ec81190edf25ef69]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 49ccebc07a..a3198dc689 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -380,7 +380,7 @@ if has("win32")
+ else
+   call s:NetrwInit("g:netrw_glob_escape",'*[]?`{~$\')
+ endif
+-call s:NetrwInit("g:netrw_menu_escape",'.&? \')
++call s:NetrwInit("g:netrw_menu_escape",'.&? \|')
+ call s:NetrwInit("s:netrw_map_escape","<|\n\r\\\<C-V>\"")
+ if has("gui_running") && (&enc == 'utf-8' || &enc == 'utf-16' || &enc == 'ucs-4')
+   let s:treedepthstring= "│ "
+@@ -3734,13 +3734,14 @@ function s:NetrwBookmarkMenu()
+         if exists("g:netrw_bookmarklist") && g:netrw_bookmarklist != [] && g:netrw_dirhistmax > 0
+             let cnt= 1
+             for bmd in g:netrw_bookmarklist
+-                let bmd= escape(bmd,g:netrw_menu_escape)
++                let ebmd= escape(bmd,g:netrw_menu_escape)
++                let fbmd= escape(fnameescape(bmd),'|')
+ 
+                 " show bookmarks for goto menu
+-                exe 'sil! menu '.g:NetrwMenuPriority.".2.".cnt." ".g:NetrwTopLvlMenu.'Bookmarks.'.bmd.'    :e '.bmd."\<cr>"
++                exe 'sil! menu '.g:NetrwMenuPriority.".2.".cnt." ".g:NetrwTopLvlMenu.'Bookmarks.'.ebmd.'    :e '.fbmd."\<cr>"
+ 
+                 " show bookmarks for deletion menu
+-                exe 'sil! menu '.g:NetrwMenuPriority.".8.2.".cnt." ".g:NetrwTopLvlMenu.'Bookmarks\ and\ History.Bookmark\ Delete.'.bmd.'   '.cnt."mB"
++                exe 'sil! menu '.g:NetrwMenuPriority.".8.2.".cnt." ".g:NetrwTopLvlMenu.'Bookmarks\ and\ History.Bookmark\ Delete.'.ebmd.'   '.cnt."mB"
+                 let cnt= cnt + 1
+             endfor
+ 
+@@ -3756,7 +3757,8 @@ function s:NetrwBookmarkMenu()
+                 let priority = g:netrw_dirhistcnt + histcnt
+                 if exists("g:netrw_dirhist_{cnt}")
+                     let histdir= escape(g:netrw_dirhist_{cnt},g:netrw_menu_escape)
+-                    exe 'sil! menu '.g:NetrwMenuPriority.".3.".priority." ".g:NetrwTopLvlMenu.'History.'.histdir.'    :e '.histdir."\<cr>"
++                    let ehistdir= escape(fnameescape(g:netrw_dirhist_{cnt}),'|')
++                    exe 'sil! menu '.g:NetrwMenuPriority.".3.".priority." ".g:NetrwTopLvlMenu.'History.'.histdir.'    :e '.ehistdir."\<cr>"
+                 endif
+                 let first = 0
+                 let cnt   = ( cnt - 1 ) % g:netrw_dirhistmax
+@@ -7104,7 +7106,7 @@ function s:NetrwTgtMenu()
+                 let tgtdict[bmd]= cnt
+                 let ebmd= escape(bmd,g:netrw_menu_escape)
+                 " show bookmarks for goto menu
+-                exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.1.".cnt." ".g:NetrwTopLvlMenu.'Targets.'.ebmd." :call netrw#MakeTgt('".bmd."')\<cr>"
++                exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.1.".cnt." ".g:NetrwTopLvlMenu.'Targets.'.ebmd." :call netrw#MakeTgt(".escape(string(bmd),'|').")\<cr>"
+                 let cnt= cnt + 1
+             endfor
+         endif
+@@ -7122,7 +7124,7 @@ function s:NetrwTgtMenu()
+                     endif
+                     let tgtdict[histentry] = histcnt
+                     let ehistentry         = escape(histentry,g:netrw_menu_escape)
+-                    exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.2.".priority." ".g:NetrwTopLvlMenu.'Targets.'.ehistentry."     :call netrw#MakeTgt('".histentry."')\<cr>"
++                    exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.2.".priority." ".g:NetrwTopLvlMenu.'Targets.'.ehistentry."     :call netrw#MakeTgt(".escape(string(histentry),'|').")\<cr>"
+                 endif
+                 let histcnt = histcnt + 1
+             endwhile
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 91250ddc68a..0acf8247b72 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73077.patch \
+           file://CVE-2026-73078.patch \
            "
 
 PV .= ".1683"

