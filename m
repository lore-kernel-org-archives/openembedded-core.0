Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00639C624CF
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:11:22 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6561.1788264680981546705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VWq0D/Jp;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca80d708489so753720a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788264680; x=1788869480; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svLY6Sfl+5NSlM92IHvzpyl4+uAOK1c4Eb8DtQ36S/o=;
        b=VWq0D/Jpkugo7EEiuvNyOkJKKVm+dcPKBkCBb7UwYS/ViyOQzP9YrlIbZQMxXSi74L
         yQbcWzsRskWo5OhQt47qnJJWYBhpV4XnSsgYSokXmhE/T0udZgbdPS5teMwhZoyw8FG0
         2b3St00EHGisz//YEAtvqpzd6jOF4CZJahi5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264680; x=1788869480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svLY6Sfl+5NSlM92IHvzpyl4+uAOK1c4Eb8DtQ36S/o=;
        b=PMVa4oMfP/k2q6/QZuorJW5nK+qwAkbI1UDn01KdeLX7p8O25BauAjK9OoTlWhwDhs
         HAikpg/AN+EGnWUMGX3RfeL6rT7W2YjVCrrBGe4Xt5InVW1jTk+TgO2wli3ppry7gQcz
         AEGRPvxiandrTRPjHbPvlxU9yVnAlOWpZ6UlkZXGi1QonPdC2YxkDzC3Wd0NsYXfXOTK
         GYOSaC59dTQbU1SarqfhhvCiHiCi7Jc0b7+ZbfBTMFWathV1oUbdpTT4sJzIDJO8Ofl/
         jo5tRcqE5gdmhNP+B5mSlbxn3Om6NzWoYCrFKDFuwS6Hiyrc0iu8Omh9u7icN+TjxhnB
         dhVw==
X-Gm-Message-State: AFuF++la/zgVnvyfF+516oHB5PxGsebSFA4h7OdQjOuRHEUOh9kfLf9I
	Rp3UTVFntO6sCALJAdoBPo2l1DvtpGBtgjP/cGCyMEDyA/sVtUd9U5nmT3BOvXXVw/tEg5lhde/
	dy/Bk
X-Gm-Gg: AYBFou1W+T7SeiIOQEWTe+qus5UF5C3C1j4oBfPhjJb9KUGZ9xzu3E/Gh1ok06Pt3l3
	CWnFsrRCm+YjSv7+RKNOQcRAhu7GSa4r096ozEUPGWLE5A0wcZ7pJOw9u3xuyTF+La3JBR8pSFJ
	QBfkWCdBayVa9oDlPTHT/XpzL3NrIRru4UvFnFa+BvC5wzToZF6Ga4A7Ieyj4zHP/QSnIyFBgrT
	FEuuYsEFPJHeYGLKAEIQE7cUIOBcKy82KL+foF6vDQGLNsmq5Mo6Wr4DFtHNDHiCbTyB2p0Qa06
	FKlJkXuMMtv7DZwiaGmulQl1K5dsTIxB2WEQaojfMDlnheNR3fQUm2Lyhwf7SPkeXu8NZbZyMXo
	Sa4B6agYNVr1Ta4NPt3/z24O0sVKJx2iHkufIOI4nZwv/vs9oSfCIocLvwIbcBTEEzxyktLnfJR
	/floKBh6g2WzAX3VvxX6GRn5k1wNHj0rCfacDoFRY7u4rH1ObDOdz2G+zcYEXvm2StuqMPKHM3S
	Q==
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr5021943a91.16.1788264680162;
        Tue, 01 Sep 2026 05:11:20 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm42587270eec.0.2026.09.01.05.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:11:19 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 2/2] vim: Fix for CVE-2026-73078
Date: Tue,  1 Sep 2026 17:41:02 +0530
Message-ID: <20260901121103.83546-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901121103.83546-1-hprajapati@mvista.com>
References: <20260901121103.83546-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244819

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/29c6fd090d4520592f8be7d9ec81190edf25ef69
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73078

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73078.patch            | 94 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73078.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73078.patch b/meta/recipes-support/vim/files/CVE-2026-73078.patch
new file mode 100644
index 0000000000..48b561d9e7
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
index bf18aa7720..4c32035456 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -55,6 +55,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73077.patch \
+           file://CVE-2026-73078.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


