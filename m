Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4990C531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 14:32:54 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.367.1784989967055198730
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j9L4R28w;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381216921aaso1299895a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784989966; x=1785594766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqx74PRTFDU8HFE5HxRn9VMp/GT5GmJFc0oZxeQ719Y=;
        b=j9L4R28wEIMi28CSluRCoHcBzD23jHEnKX8Gcc7ODbxZGNl0XcpnJaz/66vSvyK5K/
         uCS5q/uNBPQnMcFdqVmdzSqi0V+2Yrco0EUwYj2vWk8HrEllm/P10WjnDE7J2WhXmPhx
         K2WrNVE/PqtGScVqRn5kT+GO2cXdH8Bry2+yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989966; x=1785594766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqx74PRTFDU8HFE5HxRn9VMp/GT5GmJFc0oZxeQ719Y=;
        b=M9uQhIVj9AEV6wGFeDls4Ui/4rr61aCRa3tPiya2PcWhIl1BYnl0JPFJ9E+kppl2iy
         wadBYtlDjSRzp4yrgg0Vu0y0DwsfIGjiQBX/vEuYPUQwrB/QRSxDsY3oE+G3Nl6zixh3
         UnEZeow65rXU/+vSr/CMCGl2JrpTAqwljHkkxNA10rvke6l/Yad6O34rxX6uCOGnoR/r
         U+lPg0k0JwLcOhNBRB1CFBu9LtRHN0aUrKrpTxKktIcQDu/wQkNHcqdyOIcFaH5fiLKc
         Cwx1yGpv+0okeFKeP9lvh2GUte3w2Kla7LWbqYP9SOKaKo4WcjpsgvJ6a86s/FrJgsEH
         w0BQ==
X-Gm-Message-State: AOJu0YzYq6XJPM31Mgs7G3iISqV5P86axcZ4AXpfw8q8rNfPsQIdSfEH
	oNTnI43XmiVH212sbG/p6/R8g9ADp+r28VK+5mx85rqniNnzKZ33Lokvu0sBQakZfcBCZdTArZO
	FMaAyUpI=
X-Gm-Gg: AR+sD13NqxZbw9sh6CbYuRjoOtF1kyzhpCo+x3scSXvXcp2IYeUNJIguTRw9cdDMdy4
	mk8uuFFMLRL7IEl2uoUVV0Z4mSrSlgOJLWZUUbIw0To0dBhQUwR6xZGn4KB7X/rcYZuuCFp2WU3
	MjVZBAtoPMASUQdNtfh2Wal9aeXsCrHufTtbgYZWQoe3ZTs9Bb1VQdj3TpFvyeN/ZU7YNYJRXcy
	vS1MAmKgtkktvvLc6PDlCwtuOI+jZnUH/SrWxnFAT8uBmvO5APEC4jQ6fTBgAANTxUPknUVtNzM
	hlBXQfTk9EziGq+4UJKYfslBjE25KIwnSdfRcfsvSp9NqmsPSPm+TmtVGElS6w9pD9xc7OoAZ4T
	mSOoNCzObL+15F7kgz66gTnhoztPs1n3xtwRMor6YY19rt0FHQcLIzmVP6CpGutgStd/8cOYTG4
	XuYgqM705jTSPk
X-Received: by 2002:a17:90b:184e:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38f2978138amr2060436a91.43.1784989966413;
        Sat, 25 Jul 2026 07:32:46 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e585ae882sm1575845c88.6.2026.07.25.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:46 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 3/6] vim: Security Fix for CVE-2026-47162
Date: Sat, 25 Jul 2026 20:02:28 +0530
Message-Id: <20260725143231.230059-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260725143231.230059-1-sdoshi@mvista.com>
References: <20260725143231.230059-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 14:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241973

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47162
[2] https://security-tracker.debian.org/tracker/CVE-2026-47162

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-47162.patch            | 83 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47162.patch b/meta/recipes-support/vim/files/CVE-2026-47162.patch
new file mode 100644
index 0000000000..69714493d4
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
index 3888c725e0..f70363c4ef 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59858.patch \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
+           file://CVE-2026-47162.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


