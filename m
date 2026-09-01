Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34FBC624CE
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:11:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6560.1788264678710690630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ole9cD2t;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9aea40d799so548525a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788264678; x=1788869478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lg7U779gRVmZoOHiP1tN0XFaNyDUYsrtCnH/rjdWwY=;
        b=Ole9cD2tdd4nI/dDMeF1brWegTRNQfMYi7kemrzOPCG9jOfjke0gLZs9CkIQPNKrmR
         dncxUXuLUNm6jFHmWhGxzgZBeeaE+2WShlD4mdPIk9/lcN7u/UCkebhJFOtUy+rK62wB
         iMJ9LgQVLadJDMoHMjbvE7rVAEcqqE9DtVR34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264678; x=1788869478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lg7U779gRVmZoOHiP1tN0XFaNyDUYsrtCnH/rjdWwY=;
        b=pvVp+H7/DXawLACwI/jAjwaBSVCLF4Vn3B/QAav3mrz+Dn4FLaSXfedyYuoj/TqUoD
         eHpOTdcp4NxMFmEExP0f0Lo8aBRjjl4BA3ZWS1OU+5zEhKWVXUJdiF9LCS20IK/aT0PL
         HjR4X7usp2ldVGUOm16WBBtMkpr7/Zyx39hdq+yoo8uxq/2J62aDxGemrPH3gGwzu6sh
         VUB0N4yY9fVwMw0fls28UbluT8sUkuC/594HbXlO7rEchny5YB0dXHAUGNZ6H0eWVCuN
         19Pr/pzwGg9oJPjX6QR5gmKWYntV5yLkyXq8sA/SSm3ZYlZQALYYHS3MAYizFG9uzeCK
         k0zg==
X-Gm-Message-State: AFuF++k0nAG6J1Lhk77aZLS3nMaCicwenEUhztnXe5VQzLHclI2zRYP9
	378jgCOeesuYQkK9gW4f3nQb4PGi/jAmJvOp7rj5jV6ma2phZKcTDdS1f2lCqF/TDojP5+SzOhu
	XzIIb
X-Gm-Gg: AYBFou2zLLN1vwMVILkFipSl2r+a+b58Yd6lmoXp3XSWyNJjtDn2p/TGTcRZCXuQYg9
	VNdV+Wz46Wk4uTXs1oBK6dDPacq3EmlEdFd1oKssBACHsvzeW9r9zhekkUAjrMC0mEfCAOPCDdm
	1IQgJ95+YZ56QSUhEXFShgD8JPy1i8doFC/uN+Uq30STF1Mt9gcx/bzjDc80uaCpJEWJjWN3n3u
	dUhMmQ8BEdnXBYms76TFzGUSzDsBJ57mRXupANMONcpIANzFBI4lwvt5sxjo4d8HoJPQxQHPXJh
	ogcd5BgEQw8pueCA7OfIOHikFvbujFXQ4r6/Y8TNKpVx8yLtNiircru1QGJBacv0qUYU4caJpkB
	af/Repaqi9DSIbHn484Ngq3o9RVPAr1YEtHOB+Py5xvA5FlYgOEKhS0Ov1dvUywQRz99W4U/GnA
	tN9XbJqrHPJTIHF/2LtNlkfEAXdC8ICpTLvG/2I26MR6TO7ua7tSDfxSNWkQDRuJaIa8o+IIt1J
	Gflw0ZArgJe
X-Received: by 2002:a17:90b:3c07:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-398c0ad98afmr28569091a91.15.1788264677607;
        Tue, 01 Sep 2026 05:11:17 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm42587270eec.0.2026.09.01.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:11:17 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 1/2] vim: Fix for CVE-2026-73077
Date: Tue,  1 Sep 2026 17:41:01 +0530
Message-ID: <20260901121103.83546-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244818

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/c5a82fe013e73c98004ad7cd4f906b1ad1ed610e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73077

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73077.patch            | 96 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73077.patch b/meta/recipes-support/vim/files/CVE-2026-73077.patch
new file mode 100644
index 0000000000..6bf157a808
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
index 82697e68ab..bf18aa7720 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
+           file://CVE-2026-73077.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


