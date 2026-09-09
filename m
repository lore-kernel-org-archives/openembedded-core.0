Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C054C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6440.1788939005096253676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j0dIuz8Y;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so702797f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939003; x=1789543803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gq9CURPHggWNKvBI4dopVrOSTa1T6q7CvaufP0ISClA=;
        b=j0dIuz8YcndZ/hUV8sXxN4I0oCShLM6CTpQsuNsiOEG8TCYuiAsJ8Hzzjqe+GsM3G2
         /VJmRpDCctgFZBWDJw3DUIsBM84t/lJgHi87dFAvtfO8YucmJxK87TtOFtewXUbSwpAc
         uqdsldDXLTPUOPOwFOuAk8Lqpcrx93xvrmfpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939003; x=1789543803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gq9CURPHggWNKvBI4dopVrOSTa1T6q7CvaufP0ISClA=;
        b=E5iG5lv3JDY5eyEa43bU/k4iwLWnDoizF0mPiHpJXQHj18Q/GmFrE8UO4EXnBiU8ku
         syot+8fZ6+Eofbbe+wkojy3HGYQydAs5iD58eLrERbkLBLuDPJULM6whZxzKkCh4ZcQz
         tZzJ7ljtWc0ymi7KR2kQBSxOy8rYVC3sthdwY8T5sDtJ7oQj/+mTyCwDEE0hwaEeHZ/i
         b6BVy+sPc+K8qHxaLjWO2huXT0dP78Tlrc7QsDils4mxkHASS6Dmd48aIo+BWRBz1YqA
         EkQnuUP3CrHZdLHL06+iJL7yYea1mtF4yKnv679vxi3RB+nwe3t9BWDJxT2P7XklyIKD
         kblA==
X-Gm-Message-State: AFuF++l3qMGBhOOnGkmGsiVjFogYlbL4PkKcWT3P/unYXAGOGccgwr67
	VvWGlfWaJGJbEB/e4TzYtiE7IjdyPgj9k+guO3zDkfn9iCWizJlAoHsNbk/pbsaSbKPITKuyCqT
	wGGqj6go=
X-Gm-Gg: AYBFou3ChQlsAgxcasCEaWHIi9T4Q2yV4Vm+y39qFXin5VpNRbDANp72Iuv65BR/WZN
	94SyDDZCSvSv9XuXYTHr7NrXqMLi+w1QX1TZmigTZa0azgFkCC/GJBiVhMlXiD9Lq6xrFiGdnbz
	LAvvLkJu//uZQoszqpfzNDBT7SEqxmGFQ54C7UsG3FYuwjD4BCyQj2Psfnpok7T0gbSTtytzosH
	0fVxZyV7ZZrBm77N7hjdrEkTHHXu55WnMlSJL6kFaXeJ0RXmGSk3BslipzLlVcjDyjLUQ4b5HH1
	v+WcdYO49ZXN7ZXPhh7nURMfZ2wdmmzatdwQTzEKsRXsqVma6HRiUILVztfkpEu84ZmHaGEYfZc
	tn0xKnPesSv2BAiPdC7THdjeojHAW9L2bl5lC78ROj/Wnk/ZmMa6NlHDV/L32IdBp/k0BF4K7zf
	DVb6JMIpghO4eul4fiUxq50iF+gZ47AiJ4Ebm6ks1YuKxzDrQtKEDtq20KKHc/XCpxe90PKr00R
	HV2pwLPoHrLRWlKkhDJX+RX8r7yfZNGSb9cOzbgXczs8tpntlETI1YGkMUhZNfgrXEgYyQGpQk=
X-Received: by 2002:a5d:4b41:0:b0:485:8224:1a46 with SMTP id ffacd0b85a97d-485a2450ab4mr10229675f8f.23.1788939003247;
        Wed, 09 Sep 2026 00:30:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/38] vim: Fix for CVE-2026-73077
Date: Wed,  9 Sep 2026 09:29:15 +0200
Message-ID: <c8a299862ec98eaf5620b17f7136bcb2f1d8bd12.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245425

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/c5a82fe013e73c98004ad7cd4f906b1ad1ed610e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73077

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73077.patch            | 105 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73077.patch b/meta/recipes-support/vim/files/CVE-2026-73077.patch
new file mode 100644
index 00000000000..41a9fdb1586
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73077.patch
@@ -0,0 +1,105 @@
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
+ runtime/ftplugin/zsh.vim | 8 ++++----
+ 3 files changed, 10 insertions(+), 8 deletions(-)
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
+index 850bef055c..8163585939 100644
+--- a/runtime/ftplugin/zsh.vim
++++ b/runtime/ftplugin/zsh.vim
+@@ -2,7 +2,7 @@
+ " Language:             Zsh shell script
+ " Maintainer:           Christian Brabandt <cb@256bit.org>
+ " Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
+-" Latest Revision:      2025 Jul 23
++" Latest Revision:      2026 Jul 23
+ " License:              Vim (see :h license)
+ " Repository:           https://github.com/chrisbra/vim-zsh
+ 
+@@ -25,9 +25,9 @@ endif
+ 
+ if executable('zsh') && &shell !~# '/\%(nologin\|false\)$'
+   if exists(':terminal') == 2
+-    command! -buffer -nargs=1 ZshKeywordPrg silent exe ':hor :term zsh -c "autoload -Uz run-help; run-help <args>"'
+-  else
+-    command! -buffer -nargs=1 ZshKeywordPrg echo system('MANPAGER= zsh -c "autoload -Uz run-help; run-help <args> 2>/dev/null"')
++    command! -buffer -nargs=1 ZshKeywordPrg call term_start(['zsh', '-c', 'autoload -Uz run-help; run-help "$1"', '--', <q-args>])
++  elseif has("patch-9.2.0250")
++    command! -buffer -nargs=1 ZshKeywordPrg echo system(['zsh', '-c', 'autoload -Uz run-help; MANPAGER= run-help "$1" 2>/dev/null', '--', <q-args>])
+   endif
+   setlocal keywordprg=:ZshKeywordPrg
+   let b:undo_ftplugin .= '| setl keywordprg< | sil! delc -buffer ZshKeywordPrg'
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f0524ba7300..c132444040a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73076.patch \
+           file://CVE-2026-73077.patch \
            "
 
 PV .= ".0340"

