Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678D5C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:27:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6853.1788265665939921123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=i1mtbsKG;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so41879965ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788265665; x=1788870465; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHTD60s4wVGXSclRvGsL8l3SIRNkzb1bXrkJNG+7dzY=;
        b=i1mtbsKGH9MCCTfnZhSuOjBp9X/R24G0DfVFFcc42xWJjTdlkeJCBjLvyMl7Ji7vhB
         xBGJzWEvg3tFvJMeO721bW/qglm4HSudY4E/3kYNBCdKNGAOKZxSEMn1gIMfesrx71oU
         skqgaLIeLkVhbB82S7MybTRweQyo2wTq6SMWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265665; x=1788870465;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHTD60s4wVGXSclRvGsL8l3SIRNkzb1bXrkJNG+7dzY=;
        b=V1GNYaUoEtj7CArcLESagqhFOajcyhLnOB2DDasA5z7NcDmAkqP6MZDVZyx2xHmQFw
         FNaHhIqS5d+n44gBLupMY4KU+d1tqLyizLKjPFoc+SJ7YTHH//xp0D8JDMISC61KZoaU
         DiBB9JXiTvw35uu0SsBTEaTRwWetZL40QhqNOakouB/X5upd2DzMXV6wojYDo+ppK018
         dr1q3uy2JfGGjtjiglQNysjHD4kpNk/0/4VWXCEWiaqvjq4pUm7E+Tr3/5mSyoo0nZvm
         EgiTD9WlARrM6tnRW+jZ5LW/dPV/NrivHfzKdSiJrTgAchJNa8hGqtlTPFgYXnYZN0g2
         WmnA==
X-Gm-Message-State: AFuF++nsuHY5X9w9K5wiMtZXEdvjBw+NymVl5CULl2WtvmeJlLo+lJYx
	MrgQ/SIMkbvwIUIV6lIYo00KJGO+u7zJawI63jfTgqyw0UPeCzcVcxTkWS0vmYpaRHBaicVdSsR
	dKE0R36M=
X-Gm-Gg: AYBFou2EaZ5SwimN9s8iSZ2rcjF2yU+u/IXD24vNQgq6rmejtf1tTZdsYLkQnjmAOjs
	EvaA5qs2lMsb1QCnVFwEQMlu5XKoo6Whf5cySoMZXqIp+k/+plHmU5uRyHxpyBIDiUDP++09s1z
	KtynRNZDwpbFeCtbzuGZmAGu7iUkA3bM13KM3jZnBQ56w3v6WY/jI8rGtAzk3BEUCPMZe/TMbR3
	kdSnocRTLqS+Bce9eEApOTQeeSb0WcWngovQnJmNN/BP1T+CyMrgLC3wV+8+QFyN8RmJGBi62Zo
	zmLkw4mqrVEYLIPcKKOij9aEKK95ojAIyw2RWd6vaUXSt+PFoSuHX8apr28tCboGEQA7nRRfYUW
	f2ZNVnC72wvWSBUAkHfVz16qHJQyZ5sGV1Oj06JJEzutC5jQOgxZwRCF9iZQhQiLA9W+WULt6vn
	2Kq7XRooKj1xiJ99gaPayGESmUDEaNIzhkTI7Dlfm4jY34uPZExcTzzG48BWkwr3lLDb/pXBsDq
	g==
X-Received: by 2002:a17:90a:fc45:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-396d0ea5359mr52388354a91.4.1788265665218;
        Tue, 01 Sep 2026 05:27:45 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm42722969eec.0.2026.09.01.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:27:44 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 3/3] vim: Fix for CVE-2026-73078
Date: Tue,  1 Sep 2026 17:57:25 +0530
Message-ID: <20260901122727.85327-3-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901122727.85327-1-hprajapati@mvista.com>
References: <20260901122727.85327-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244823

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
index 0000000000..62d156f568
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
index c132444040..77f681410a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73074.patch \
            file://CVE-2026-73076.patch \
            file://CVE-2026-73077.patch \
+           file://CVE-2026-73078.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


