Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC36C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:21:54 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2348.1788247306394389367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=S/xliFO0;
 spf=pass (domain: mvista.com, ip: 209.85.215.169, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c7364550so4685932a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788247306; x=1788852106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMecLdOV97lULOAoUu7raMy9GF/noImRxfEyvnt2VkM=;
        b=S/xliFO047qymtex0UFGZK0J/VAXQtRScgHdEKJIWBtYMY1W7xiGBF9MkcgVXNVbEH
         aTi+Iy6C5g+qIoAFRST4cZicjKHNBgttzB1eGRKwFk761WJv9iG+axYZVKtMcCiyqZhO
         2B9IIocltgRrLKp8+xO4xkxbta99VQKu7ppVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247306; x=1788852106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMecLdOV97lULOAoUu7raMy9GF/noImRxfEyvnt2VkM=;
        b=qY9xYqO3GPX1o3bHpCkwAFJsCL7xmqdo+xyHx5ePgGS9ThW+wRanppM8iLpD+hlY0+
         Swn1riq7NUA/KY6LKtHjQ/QoHeGVZErLwBlLCJgLyj2JfKUiBa9Xan0JY72d4rzL0+lr
         ZNiuebtSsXTfTIp/XY3/c6ZdqRDVcPoJm1QEmo5ROZ6/cMyc9kQyFlkPGppfyZELft9p
         bbfIpLug6HWajFq43Sw5YRTvpUuubEGwRCfgQfQ5zpwu7nk1EVMMIX+qfXhUGoRk5rII
         vjKVRWUIpOMLJlt3jGYmG6UelVjtepXSsg1fYX+MaKzj87QatcVrzum5/CCUIw+DNnDQ
         JW/g==
X-Gm-Message-State: AFuF++kkOoy4evpU+oBbeC2DrcmUYqwRywVdDjg6LwHE6ZLV2Ae+mRNc
	tnYtvWGJ/JwArel5YbtwTy7VWd0tqswtKoRUbb/lgy08yPWgz3xu42CN/Xjdy3GL/L3p9gPJjvB
	RYtp5Mps=
X-Gm-Gg: AR+sD10VgP38JRaDT3o6GhUV10OI9H5/d7enqDnWZRT1ExjIjMapgci6/gmOXHdacAx
	XZrRPrDOOLxunQ9Xv3AnaQRGQfuwAEjnT9nJXIlXMjpYAwqDUiB0vHQJSNJqthAgAOp9WTr/O6L
	hXgA2iHyZvuwUQ5MFLCx8vIw912HfDrc0ib13fUxG4LH/2CMNs8Z9ib3Jfc5xQghBl7CQXBYf33
	4d6xnnGNDYawS6yUm3l18KGZbeojNQwD4Ykj4XnDpArRLf9VouJuAyx47FoJ6Mkb6nEUS0HPURR
	rTnrkNzohi+aZELUBX44Y6NQLzLVhDm+sGl5uAwiV7ODV551sAjmRLt4rKecP6vHwLtscibBbgn
	rZz4IdZmW8kMHwaqyCmBHiSpEMHgOGRcfmmP3YK3ebr9sMJwC1yW8NcC5stH5bhMKcv/bf+znMq
	n7D8W8WAPLUhM4I7VWjL+/AsiR6MtnNNCm0TufHb6fN+US92W3TVk8SvG4vDSRyk3UzC9SDfgmo
	Kdm/I6V4iaO
X-Received: by 2002:a05:6a21:3a42:b0:3d0:d1f1:6ec5 with SMTP id adf61e73a8af0-3d7adeb6816mr9582366637.4.1788247305730;
        Tue, 01 Sep 2026 00:21:45 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54200607c88.4.2026.09.01.00.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:21:45 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 2/3] vim: Fix for CVE-2026-73073
Date: Tue,  1 Sep 2026 12:51:15 +0530
Message-ID: <20260901072116.30784-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901072116.30784-1-hprajapati@mvista.com>
References: <20260901072116.30784-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244800

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/2f628d8104958fa7421664f792ca6d4f7a39a10f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73073

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73073.patch            | 105 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73073.patch b/meta/recipes-support/vim/files/CVE-2026-73073.patch
new file mode 100644
index 0000000000..5defa7339e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73073.patch
@@ -0,0 +1,105 @@
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
+ src/version.c                         |  4 ++++
+ 3 files changed, 34 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index dc3388b524..593789a84f 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -599,8 +599,11 @@ def StructMembers( # {{{1
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
+diff --git a/src/version.c b/src/version.c
+index 92cd53129e..26e4e026c3 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,10 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    845,
++/**/
++    846,
+ /**/
+     736,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 34d4507906..7ab7a405ff 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
            file://CVE-2026-73072.patch \
+           file://CVE-2026-73073.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


