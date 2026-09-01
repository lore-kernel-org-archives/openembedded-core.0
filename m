Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D4EC624D2
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:27:44 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6735.1788265663662888564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HNQ2uMNW;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1135679a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788265663; x=1788870463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dek6GTYrf6YKqWeCVo/4ZrQlh46kehodLEK+t5sjvXM=;
        b=HNQ2uMNWxCCtzGuWIcoOXvqkXo2ZUeZ76dD7Q5MVAvO793m3wrfyJ3qTsZOxUBMCwr
         VB/hIDa88dvLhT+JQZ0yVE79Pl1y/NnORjihVCmJg8hUWKW+HgEOOCTx9gctkgQAj98+
         FYGm+6Vtuf/zmbNxFAlCdd/RIn61s80S0gj+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265663; x=1788870463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dek6GTYrf6YKqWeCVo/4ZrQlh46kehodLEK+t5sjvXM=;
        b=gqK5SYQOFtJIPfSszdcesz47lVLauxYlU7Sb5SLl55Rj/sOKD3Fzso5fitAftBng34
         nh8Jbk1gppeNmWEKx5A3n3nDam7dil2ROA1dllIL5bTRE0wgL4FCuQeWTV8gL724cpha
         jbFMqJZFKPVNLD70l6DarB9RH1qa3MwBDANjjXu2CSkPc3h01kzTgpl/AVgsnuCMO0LZ
         hJ72jKSrZqIUxU4pabqXvs05DqP0L3xSvQYbpEqQCObw9JWQ0h6mWey/2+sIZPX50Hr4
         9cWd/qRv61x5PX9JG4kDsMzO8LhnWXMxuTlLKjRJ1nfCuXXPpu1nPmdTVNfgUdZHc5xW
         P0MQ==
X-Gm-Message-State: AFuF++lJm0ia4NNvq9tBWyz4xlAK7IbpdfD3L0QsBNucKLigNtsYImao
	D/WbZkvYgi42fVt5DB5GfbzSo4TPzTF/+ZIzwL7Yl2IF4L9ssqLSQcIXJ5JZaFAOmDMmpeGnHrV
	iOe8GL4I=
X-Gm-Gg: AYBFou2a3dY4xCS9kINk8OAkzKPpswGYi+B6QmoCjXPfS03m0PILpkf/TFvOTy+FxMh
	gEKOhaWC1dmrHLig/d8lNjbBemWMQRuVfWAd2HyMHjT2bA/r7iRA98lrWyhM6OeW7bsaonjQJ/+
	nz0FntBWLzX4/2ILGeO+wdELjaa2wrM4tI8gsoZOL3z5EMNJGy7sj5DJJMwffjrWYFINNwrpV31
	D/TAdIKOdW/c+zAyu0pg6qt3VnF6AixQJejHeqm5Y7YlPr4gb4zB68sNCoCm/3/PLS6GAtvMfqg
	5rKekVn7VoZoJ2/UBYOOggK4oa7ggRVP04g4rhtKk0QErXZETa3ECWpvRNDwVXMH0koOeull3GT
	QMVcmnsLMEfMP0LhT+m4kvJQm66NFDtFviDrbIn0tmTBPtqvJE3oyXCROksVEnwKG+CIqcj2Hdx
	XPCYI95HwouUZfJX5TOHQ0skRoFq8dX0tcefX+z54yEZRqtRm1qHRlTEALpUIyqrP3jAsk/a+Ws
	Q==
X-Received: by 2002:a17:90b:58c5:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-3990f94ee10mr5095335a91.32.1788265662885;
        Tue, 01 Sep 2026 05:27:42 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm42722969eec.0.2026.09.01.05.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:27:42 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 2/3] vim: Fix for CVE-2026-73077
Date: Tue,  1 Sep 2026 17:57:24 +0530
Message-ID: <20260901122727.85327-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901122727.85327-1-hprajapati@mvista.com>
References: <20260901122727.85327-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244822

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/c5a82fe013e73c98004ad7cd4f906b1ad1ed610e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73077

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73077.patch            | 105 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73077.patch b/meta/recipes-support/vim/files/CVE-2026-73077.patch
new file mode 100644
index 0000000000..41a9fdb158
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
index f0524ba730..c132444040 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73076.patch \
+           file://CVE-2026-73077.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


