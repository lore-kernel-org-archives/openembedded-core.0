Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA23C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2917.1790154695303568339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P13IJ3E8;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso4195815e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154693; x=1790759493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=adK+OfZ+1wPpZJz/FiWRmhy2wHUfcQi3HXF3iy9Dljs=;
        b=P13IJ3E80xsZdGxsBTJ0Nq2rLpLwQon2fs58LFEN9mh701YFHYNDYEl+9bHa4bCDbi
         pNtUXTNtyMpiipo94Br1cQFBkIg0j2xFP0CSpOXoNKb3C1zknno+5wXxNfLk8d6Pksdr
         sF12jR3HjOWYrxvVAQvP/9szarKfXP6LjHk3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154693; x=1790759493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=adK+OfZ+1wPpZJz/FiWRmhy2wHUfcQi3HXF3iy9Dljs=;
        b=kYcC+FKUVYwPCOxPBVBS6kDgMB0zqvY1ffxbZlx8gSTku7B/lKCChTDqP9OZfrQ9Vy
         /aABkw/u5rhMWcwHiIHb7kMfyCB5GwBEHdBVh0gqo/25CdomKt9CLNgIlQn9k/yx2guH
         1nL+QZMlTglHLH4RYVPKCmhSdpdAeokBLCuus5hYdo5icR9V0p3OAl/1v7cu45xO1GNf
         zrX+wfg2bGq0ePnr8UPAFVjo7N7+32l06HRexu08oeSrl6RJ/dOmrf6UmUxOsy3hP3ZC
         RU+pR9wh+SrNa19WI3jcC03GcNQVuWic2Q8ukphPXQVHpkyD9J/gw1gqGdKcdGsfMETh
         o8PA==
X-Gm-Message-State: AFuF++kfbq9hb/oBq6cy12M9X/nKxx4uPUFBVfOwGqN0ABQsrvN83eVT
	L4RaglYqdSlshxazZP/vBZ7wtB+C/65EqdbC0q7G70BtgI2pxsLJFLsXA9Zn03RYz48j0lNLE39
	Cc26wUGg=
X-Gm-Gg: AYBFou0l8cdrELHhHrHCZDu3i/CdnHSHMIw/sPZJNy6A6+X2e8D+PJ1TXlVYBMzk08n
	kYVqaf4rQbgjovKMybg+/fHywSvNc/cU/6OC61qie6h4p5vXnfTZEN6glyfkRJVGRIldHwflEG8
	m/QZTp21WwtwSqCKxmeSSvUcxi6xESVwUu0LNUFejHZG2EUwjQhJK1UMrY7mX2pmMYAi8lcdrgy
	LmkSrl12bbBYKZYCwD+bjpbXtT8Hswvi6eGRlpgpoGzWrYzGJvj/knm22cD241cX2h6Nr9GRVqW
	YvhTqhf97S6Tx6ah3SitdVFHpxNvTVwwZQi5B3nfD5LdOp8N9Eh5rI0N0TPlJNXiPxEDZy/Cz1W
	RIn6fOKAO65+MJ/EOoitwnidP7ldj6xkZ+CIjtble8qqS1B4SYCMY6Ryh30fbAZAFubKzYIwd8R
	vUMsWpq7n4C/uq+OFIUJFIUZ5BHriIQHkJl8TN99FvWcr9VnliEJjLk6kQxgYfhrBoAkwWp22VF
	FGNoqL/5cMWCTb7Rs70NdlNvdpINkoYV1tlBcCx/CLSa5u1EqavviQzznmQNE6l4XYtlZYTcIOo
	KgHR1yI=
X-Received: by 2002:a05:600c:5020:b0:49f:d377:ac24 with SMTP id 5b1f17b1804b1-49fdeff8236mr25413395e9.3.1790154693495;
        Wed, 23 Sep 2026 02:11:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/48] vim: Fix for CVE-2026-73077
Date: Wed, 23 Sep 2026 11:10:16 +0200
Message-ID: <62b60951830529d58bad8f64c9d0d217aa432c98.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246476

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/c5a82fe013e73c98004ad7cd4f906b1ad1ed610e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73077

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73077.patch            | 96 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73077.patch b/meta/recipes-support/vim/files/CVE-2026-73077.patch
new file mode 100644
index 00000000000..6bf157a8083
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73077.patch
@@ -0,0 +1,96 @@
+From c5a82fe013e73c98004ad7cd4f906b1ad1ed610e Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Thu, 23 Jul 2026 19:13:15 +0000
+Subject: [PATCH] patch 9.2.0839: [security]: arbitrary code execution via
+ keyword lookup
+
+Problem:  [security]: arbitrary code execution via keyword lookup in
+          sh.vim, zsh.vim and ps1.vim filetype plugin
+          (manus-use)
+Solution: For powershell, quote the commands using single quotes, for
+          sh/zsh pass the argument as a separate list item to term_start()/system()
+          (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-r5v6-q6j8-8qw2
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73077
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c5a82fe013e73c98004ad7cd4f906b1ad1ed610e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/ftplugin/ps1.vim | 5 +++--
+ runtime/ftplugin/sh.vim  | 5 +++--
+ runtime/ftplugin/zsh.vim | 6 +++---
+ 3 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/runtime/ftplugin/ps1.vim b/runtime/ftplugin/ps1.vim
+index f1fe78df4c..9ff764a282 100644
+--- a/runtime/ftplugin/ps1.vim
++++ b/runtime/ftplugin/ps1.vim
+@@ -6,6 +6,7 @@
+ "              2024 May 23 by Riley Bruins <ribru17@gmail.com> ('commentstring')
+ "              2024 Sep 19 by Konfekt (simplify keywordprg #15696)
+ "              2025 Jul 22 by phanium (use :hor term #17822)
++"              2026 Jul 10 by Vim Project (quote K argument, prevent command injection)
+ 
+ " Only do this when not done yet for this buffer
+ if exists("b:did_ftplugin") | finish | endif
+@@ -52,9 +53,9 @@ endif
+ 
+ if exists('s:pwsh_cmd')
+   if exists(':terminal') == 2
+-    command! -buffer -nargs=1 GetHelp silent exe 'hor term ' . s:pwsh_cmd . ' -NoLogo -NoProfile -NonInteractive -ExecutionPolicy RemoteSigned -Command Get-Help -Full "<args>"' . (executable('less') ? ' | less' : '')
++    command! -buffer -nargs=1 GetHelp call term_start([s:pwsh_cmd, '-NoLogo', '-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'RemoteSigned', '-Command', "Get-Help -Full '" . substitute(<q-args>, "'", "''", 'g') . "'" . (executable('less') ? ' | less' : '')])
+   else
+-    command! -buffer -nargs=1 GetHelp echo system(s:pwsh_cmd . ' -NoLogo -NoProfile -NonInteractive -ExecutionPolicy RemoteSigned -Command Get-Help -Full <args>')
++    command! -buffer -nargs=1 GetHelp echo system([s:pwsh_cmd, '-NoLogo', '-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'RemoteSigned', '-Command', "Get-Help -Full '" . substitute(<q-args>, "'", "''", 'g') . "'"])
+   endif
+   setlocal keywordprg=:GetHelp
+   let b:undo_ftplugin ..= " | setl kp< | sil! delc -buffer GetHelp"
+diff --git a/runtime/ftplugin/sh.vim b/runtime/ftplugin/sh.vim
+index 18cd219cdc..45e6f44fcf 100644
+--- a/runtime/ftplugin/sh.vim
++++ b/runtime/ftplugin/sh.vim
+@@ -8,6 +8,7 @@
+ "			2024 Dec 29 by Vim Project (improve setting shellcheck compiler)
+ "			2025 Mar 09 by Vim Project (set b:match_skip)
+ "			2025 Jul 22 by phanium (use :hor term #17822)
++"			2026 Jul 10 by Vim Project (pass K argument as a list, prevent shell injection)
+ 
+ if exists("b:did_ftplugin")
+   finish
+@@ -54,9 +55,9 @@ let s:is_kornshell = get(b:, "is_kornshell", get(g:, "is_kornshell", 0))
+ 
+ if s:is_bash
+   if exists(':terminal') == 2
+-    command! -buffer -nargs=1 ShKeywordPrg silent exe ':hor term bash -c "help "<args>" 2>/dev/null || man "<args>""'
++    command! -buffer -nargs=1 ShKeywordPrg call term_start(['bash', '-c', 'help "$1" 2>/dev/null || man "$1"', '--', <q-args>])
+   else
+-    command! -buffer -nargs=1 ShKeywordPrg echo system('bash -c "help <args>" 2>/dev/null || MANPAGER= man "<args>"')
++    command! -buffer -nargs=1 ShKeywordPrg echo system(['bash', '-c', 'help "$1" 2>/dev/null || MANPAGER= man "$1"', '--', <q-args>])
+   endif
+   setlocal keywordprg=:ShKeywordPrg
+   let b:undo_ftplugin ..= " | setl kp< | sil! delc -buffer ShKeywordPrg"
+diff --git a/runtime/ftplugin/zsh.vim b/runtime/ftplugin/zsh.vim
+index 65e9f377bf..8ee71c4e17 100644
+--- a/runtime/ftplugin/zsh.vim
++++ b/runtime/ftplugin/zsh.vim
+@@ -22,9 +22,9 @@ let b:undo_ftplugin = "setl com< cms< fo< "
+ 
+ if executable('zsh') && &shell !~# '/\%(nologin\|false\)$'
+   if exists(':terminal') == 2
+-    command! -buffer -nargs=1 ZshKeywordPrg silent exe ':hor term zsh -c "autoload -Uz run-help; run-help <args>"'
+-  else
+-    command! -buffer -nargs=1 ZshKeywordPrg echo system('MANPAGER= zsh -c "autoload -Uz run-help; run-help <args> 2>/dev/null"')
++    command! -buffer -nargs=1 ZshKeywordPrg call term_start(['zsh', '-c', 'autoload -Uz run-help; run-help "$1"', '--', <q-args>])
++  elseif has("patch-9.2.0250")
++    command! -buffer -nargs=1 ZshKeywordPrg echo system(['zsh', '-c', 'autoload -Uz run-help; MANPAGER= run-help "$1" 2>/dev/null', '--', <q-args>])
+   endif
+   setlocal keywordprg=:ZshKeywordPrg
+   let b:undo_ftplugin .= '| setl keywordprg< | sil! delc -buffer ZshKeywordPrg'
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9ea050650f3..91250ddc68a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -53,6 +53,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
+           file://CVE-2026-73077.patch \
            "
 
 PV .= ".1683"

