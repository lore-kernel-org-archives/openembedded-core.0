Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1578C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:45:24 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2555.1788248720397482565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kMkmkVED;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-396750cfee6so3574097a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788248720; x=1788853520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWGfx+UUNtGpNlLy7RVwYblDdrzeNj9UUGuetIAs6NU=;
        b=kMkmkVED2r5+3Cb/kkROLm+DtRpEZmrpvF6l/LF2/fF4k/HQm1Js+St1B8OXne37U1
         hSMu/SVoLhI5HMTEHGGSfhBOEx2X2vLveMSIYB+PiXBHa1G2nRWAoxw03wpemPUubSrV
         wrh9RmvSGNxIf0kayy0Sh1uzf4Ck4hWPfbXds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248720; x=1788853520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWGfx+UUNtGpNlLy7RVwYblDdrzeNj9UUGuetIAs6NU=;
        b=kIb8ElXdFVY1Vfnxjd2nGAY3b+x1CoBMAUy+O3YjmeJam2MSaUthDofJszvOqqTep8
         /ssWwLX8WT8Qs3FV8ta0396OpTeSxS9bFIkEYqDXjU1/TP+f6frxm3GrcIvcc/HsJaiT
         V1p3LDnShnETWC/ZziIZCb399Qrx21l42tbMjA13jExpKG9hkJ2SMBPKg5vG9p7lpQgO
         uypPk3u5cusWneMNySFBaAoVl4pMGI6YNyM8ygn1LbaFv1tjR8hWkfzfgUyIUB/3K078
         CtGIVDu5MKGOvRWx2aTxrbQBMa/b0JqChtG8TigF5u8nBOZcQjBVTldXUvyj+coK0FH3
         ft+g==
X-Gm-Message-State: AFuF++kyfg+hBCylpgEqto1ljgK6LagM7xMeJIUMuzbrLD/fH90xk+46
	TvF40YlHLN02S5SFHxkfFM9ekJy0yC5IyenT1rz4jefepvNgnHI/mSlu4oTX6/NwXLAQIcm2ulB
	ZubUXyEQ=
X-Gm-Gg: AYBFou37DBjD6j3p7LUJV80+KbWJ1mcSB9gD4O9h51iBNzrObUutTHJc7ywOGInqBlI
	G9K29Knvi6grzq6NMBJMOFHLb00Vx5RlOmAUwRA5p2bpiJ7T/Jwj0rWcYKLT8UAvhGhJQFZYKEO
	XOB94c+Jc5iRAl0NUaXUbM/ivFrDaskDoZa4dqSdZ2ugB5tCz1zhvwHVZhkn/RlG1Zt/SOii6S5
	7gHjvNp3wQdd2Bb8kkWe3IAgN5t5Hri3dRTt3BetNGOMDpb5+KIMYHnB9VLZwBuiH5BIlxgJsj4
	pf1phqUOHsb4qpf5uIf3HNRQnChHC1MRbsg2Xpb+J5wRuvhqpL2YaFxPDdQbckDxH2+/vlbKUwA
	/e/ajefh5gdfn6ipKcdNP6/LpV+/957wWN7ZQEA5FEWtfE800jBJzJjQJtcRcrqswuMNHpeeDug
	QKKQEWpad5irKLiDT5KhGXOaIR32d4qgZWUUl0qNK4uqrwg5Hw1VYa6yfx34ZzVxQjVnTzsRuXS
	Q==
X-Received: by 2002:a17:90b:3c83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-3989bd54c84mr35645390a91.18.1788248719735;
        Tue, 01 Sep 2026 00:45:19 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm47564414c88.12.2026.09.01.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:45:19 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 2/3] vim: Fix for CVE-2026-73073
Date: Tue,  1 Sep 2026 13:14:43 +0530
Message-ID: <20260901074444.59811-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901074444.59811-1-hprajapati@mvista.com>
References: <20260901074444.59811-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244803

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/2f628d8104958fa7421664f792ca6d4f7a39a10f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73073

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73073.patch            | 89 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73073.patch b/meta/recipes-support/vim/files/CVE-2026-73073.patch
new file mode 100644
index 0000000000..932580d3a1
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73073.patch
@@ -0,0 +1,89 @@
+From 2f628d8104958fa7421664f792ca6d4f7a39a10f Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Fri, 17 Jul 2026 09:11:42 +0900
+Subject: [PATCH] patch 9.2.0845: [security]: arbitrary Ex command execution
+ during C omni-completion
+
+Problem:  [security]: arbitrary Ex command execution during C
+          omni-completion (Threonine)
+Solution: Match tags typeref literally to block Ex command injection
+          (Yasuhiro Matsumoto).
+
+Escaping only "/" and "\" left the typeref able to break out of the
+:vimgrep pattern without a "/": an unclosed "[" makes vimgrep's pattern
+skipping fail, and the parser then treats a following "|" as a command
+separator, so the tag value runs as Ex commands during C omni-completion.
+Match the field literally with \V so no regex metacharacter can affect
+pattern parsing.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-cx73-phcg-3j5g
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73073
+Upstream-Status: Backport [https://github.com/vim/vim/commit/2f628d8104958fa7421664f792ca6d4f7a39a10f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/ccomplete.vim        |  5 ++++-
+ src/testdir/test_plugin_ccomplete.vim | 26 ++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index 248d6f2e60..5a48581dcf 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -592,8 +592,11 @@ def StructMembers( # {{{1
+       if complete_check()
+         return []
+       endif
++      # Match "typename" literally (\V): escaping alone is not enough, as e.g.
++      # an unclosed "[" makes vimgrep's pattern skipping fail and the rest of
++      # the tag value is then parsed as Ex commands.
+       execute 'silent! keepjumps noautocmd '
+-        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') .. '\(\t\|$\)/j '
++        .. n .. 'vimgrep ' .. '/\t\V' .. escape(typename, '/\') .. '\m\(\t\|$\)/j '
+         .. fnames
+ 
+       qflist = getqflist()
+diff --git a/src/testdir/test_plugin_ccomplete.vim b/src/testdir/test_plugin_ccomplete.vim
+index a635bd50bd..c1754d17c1 100644
+--- a/src/testdir/test_plugin_ccomplete.vim
++++ b/src/testdir/test_plugin_ccomplete.vim
+@@ -31,6 +31,32 @@ func Test_ccomplete_no_exec_via_typeref()
+   unlet! g:ccomplete_injected
+ endfunc
+ 
++" Escaping "/" and "\" is not enough: with no "/" in the payload, an unclosed
++" "[" makes vimgrep's pattern skipping fail, and the command parser then treats
++" the first "|" as a command separator.  The typeref must be matched literally.
++func Test_ccomplete_no_exec_via_typeref_bracket()
++  CheckUnix
++  let sentinel = tempname()
++  call delete(sentinel)
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:struct:[|call system('touch " .. sentinel .. "')|####",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  call ccomplete#Complete(0, 'myvar.x')
++
++  call assert_false(filereadable(sentinel),
++        \ 'typeref field was executed as an Ex command during omni-completion')
++
++  bwipe!
++  let &tags = save_tags
++  call delete(sentinel)
++endfunc
++
+ " A legitimate typeref must still drive struct-member completion: escaping the
+ " field value must not break the normal path.
+ func Test_ccomplete_typeref_completion_still_works()
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6097fb72a2..c000f5b3ab 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
            file://CVE-2026-73072.patch \
+           file://CVE-2026-73073.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


