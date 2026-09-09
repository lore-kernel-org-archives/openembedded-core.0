Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6193EC79FBE
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6323.1788939005934420540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BysmqlFP;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-485850cf499so3709356f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939004; x=1789543804; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4SqjNdYNF3UgyV0BvL531GgOYR48jRkirnJcvwQQYc=;
        b=BysmqlFPoEmLflib4ZZodtCI4A2tDSeSUkh9MQd6UdVKAQUt+PW0RCblzMbhShR5gT
         yqMLjQnGfuN2uCyG6tZ6A8lQ5fe/SeQtxSrTGtJVyfhwu4ijSja54otSKGb2yz6Knoyo
         CuyQWPr2hielqG8beqpB1B3qytAADON5km1D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939004; x=1789543804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4SqjNdYNF3UgyV0BvL531GgOYR48jRkirnJcvwQQYc=;
        b=bCIoeTFt4ChKqrMglpJhjLlvRPr/QmaIGvKqCsnod7IT+EqYJI93lsx4Z/KtVZlG2p
         RO4iByrCk8tb88OLN50436s2OFk3XkiuRnqwyz52lTLESszs6svaMnkvF2rU28YpZ1x6
         HJ4TwvzHLv7aSd1ymexQBI265BKPFOzYP857e8EJw885GfrMnJ9hrurswNJEux9zRGkj
         cD6bFdWZSQglTL0RnjhIhQ6mHG5E0Hl7QjNCbvG9ciXE+O0WtVMx8VPBsMj7hXz3fT1x
         zwX9Eq5otf4kVSsk/D+XkjJkN9K8ajYo2XF8Y56WNd8AGX123WuA56OTl9X9ze8jPzqb
         9sfg==
X-Gm-Message-State: AFuF++ksTpBlTYVkKK2V1K+YQ3XracDJETjboR2mPu/zRWk33bAvLXOJ
	81SFCwNwO0+GKlRmOQlO6rPpyQEUwZxxBdoDRtGTuvX9yr0RLVA8MGJcZadPsHdDXY2eAXzmgzA
	fy5Za1a0=
X-Gm-Gg: AYBFou2Ag09gH7f3MyKuzzPj7tioIP6GiCyS1BNbYGQl8gdtYzoKtW4xflfmjdzVr4x
	ZTkPUsqMZ2fltNT5GMp+WjaRpuE7sBtJjuO9LEKFpoLzMhRg5KRkIy1hLLTE2pVqldeqEG9RXes
	GfftIM1w1YvnHN4UibgJUMzfliOqVPtfkEQpTW0QvJg2X5BmwmSzjfHxrc0omQZyUplO0x7wh3X
	KxupxW92vahsqXhnsmoiLwT7J2mEc8vJu+oPNGMBvg9gkacfsbVTqrRU1HvwfNlGoo7Pf5XQiCa
	/JVOlUhHNLKzRH55xJ4oigaWH7IzZhRZ6eAVA/iPtDGL9Ou/6KjwdFI/Udy5Rf/y/d3y1tH+JB2
	pBqrIvYTSxE4aeuWTbknsja+1OxoPjL+t1ALxAflGD3gTCHkRVpUvgoDRiNhhlqUbbfExV99rfa
	0Z3cB/pELz7fCuwQZN1dO+4PBF/eEXNSimW0I1dZrpteG7ka5nT8rdPvKD3jzGZGKlWSYWZulGq
	IWyRx6rUNNmZFIdWjyRtxwb649A5HJ6E5I7/UchChquLgTMeWIikhLUuA3uusttMG6VZhQdyp4=
X-Received: by 2002:adf:fa81:0:b0:484:3317:a19 with SMTP id ffacd0b85a97d-485872b896dmr29799512f8f.26.1788939004070;
        Wed, 09 Sep 2026 00:30:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/38] vim: Fix for CVE-2026-73078
Date: Wed,  9 Sep 2026 09:29:16 +0200
Message-ID: <fa91bf0f6ee7da2f5ff6418d1f27ab5a7398f402.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245426

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
index 00000000000..62d156f5680
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
+index d7eca30e45..c240bbd13f 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -398,7 +398,7 @@ if has("win32")
+ else
+   call s:NetrwInit("g:netrw_glob_escape",'*[]?`{~$\')
+ endif
+-call s:NetrwInit("g:netrw_menu_escape",'.&? \')
++call s:NetrwInit("g:netrw_menu_escape",'.&? \|')
+ call s:NetrwInit("s:netrw_map_escape","<|\n\r\\\<C-V>\"")
+ if has("gui_running") && (&enc == 'utf-8' || &enc == 'utf-16' || &enc == 'ucs-4')
+   let s:treedepthstring= "│ "
+@@ -3752,13 +3752,14 @@ function s:NetrwBookmarkMenu()
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
+@@ -3774,7 +3775,8 @@ function s:NetrwBookmarkMenu()
+                 let priority = g:netrw_dirhistcnt + histcnt
+                 if exists("g:netrw_dirhist_{cnt}")
+                     let histdir= escape(g:netrw_dirhist_{cnt},g:netrw_menu_escape)
+-                    exe 'sil! menu '.g:NetrwMenuPriority.".3.".priority." ".g:NetrwTopLvlMenu.'History.'.histdir.'    :e '.histdir."\<cr>"
++                    let ehistdir= escape(fnameescape(g:netrw_dirhist_{cnt}),'|')
++                    exe 'sil! menu '.g:NetrwMenuPriority.".3.".priority." ".g:NetrwTopLvlMenu.'History.'.histdir.'    :e '.ehistdir."\<cr>"
+                 endif
+                 let first = 0
+                 let cnt   = ( cnt - 1 ) % g:netrw_dirhistmax
+@@ -7119,7 +7121,7 @@ function s:NetrwTgtMenu()
+                 let tgtdict[bmd]= cnt
+                 let ebmd= escape(bmd,g:netrw_menu_escape)
+                 " show bookmarks for goto menu
+-                exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.1.".cnt." ".g:NetrwTopLvlMenu.'Targets.'.ebmd." :call netrw#MakeTgt('".bmd."')\<cr>"
++                exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.1.".cnt." ".g:NetrwTopLvlMenu.'Targets.'.ebmd." :call netrw#MakeTgt(".escape(string(bmd),'|').")\<cr>"
+                 let cnt= cnt + 1
+             endfor
+         endif
+@@ -7137,7 +7139,7 @@ function s:NetrwTgtMenu()
+                     endif
+                     let tgtdict[histentry] = histcnt
+                     let ehistentry         = escape(histentry,g:netrw_menu_escape)
+-                    exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.2.".priority." ".g:NetrwTopLvlMenu.'Targets.'.ehistentry."     :call netrw#MakeTgt('".histentry."')\<cr>"
++                    exe 'sil! menu <silent> '.g:NetrwMenuPriority.".19.2.".priority." ".g:NetrwTopLvlMenu.'Targets.'.ehistentry."     :call netrw#MakeTgt(".escape(string(histentry),'|').")\<cr>"
+                 endif
+                 let histcnt = histcnt + 1
+             endwhile
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c132444040a..77f681410a9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73074.patch \
            file://CVE-2026-73076.patch \
            file://CVE-2026-73077.patch \
+           file://CVE-2026-73078.patch \
            "
 
 PV .= ".0340"

