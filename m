Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30639C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2915.1790154693231127143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nI39h4t+;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2338765e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154691; x=1790759491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gECP0vMTob93gU6XpFcMbFFMb1herD1anlVWTXPP00w=;
        b=nI39h4t+Z0yuVPE72sT3SQJ+WIEiMH4kteN1kgJ6zLn91aurSNt5MyHCoEKHAKKfp0
         F3E24UF6tzbSiS+XhZMeqkzDyj143DX4sRLSKLg61RfdrjVoUNAM8/lviXbn/wkbr+YG
         dToF7IknTtIUkkqFj/HctaMrXjCYNyHycIG9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154691; x=1790759491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gECP0vMTob93gU6XpFcMbFFMb1herD1anlVWTXPP00w=;
        b=FX1OHhcVHHy4+LZREsysd+EZySl89YVprvcmOq5fuh21SEJyIVxQifxq5VvwEdodvK
         eKhB0YEGBcs4jngCGM+ZxJPZioYz3OTRvt7U15SQ7aGy2BFXZZVYXr8YdF2mC/NT6f2U
         TPjjkOm9KUkeCvjMK5XXSNtFcudbtBg7G6BS92J17vE20Z7bVHT2XLY/UIoF4hxp5Q0A
         LD0HjHbhG72KxX5OEnXQaRsqfpAHSZ3+or1BABXwgtHH5BK6LlAZrY/iJLWo5j7ApaGp
         qRa7SzvKnrBCZPkFLNjspTLiU20vVUrd/qsVNxvfOCsBM0D+q/DryMjJIMip5XZAnQvy
         MPsg==
X-Gm-Message-State: AFuF++mLl8j0P6gs59f4XiwIyYye7B7rgpP6ZUkICjAr/9HmPB5jCr5V
	GyYF+Ta2LP8GDV/Jt7T/b530PrApwgcNP3iYct3cIJayvr7iTbtWYBiVrHqjDIgYCdQi3wD1CZO
	GBNQV4aY=
X-Gm-Gg: AYBFou3v2/Wc0wej5f28AuQYN6vOBA2/05vzS5L55FQ4TY+7T/cHScrm959WvF7apoN
	Wi511XGKo80cvonV+ocqbu3uFQBY8cb6HVAajJnsRqyMSaxQi3gN7tKX/sALcp9qwKbCfIuBDgY
	NCXRmDjH6M6T74i0H9t2sEVxxtmWY1bGwvhHhPHeX2k4LTPJNq2WQ8NQu2LkMqs/z4gkEk6+lWW
	ZDFWhWRLok2nv454sfBGrkrtzaxbPvtdju4MRvgJHBCIhdm44ixzmacsMn4KdhzEd7yo/YZ8vHj
	cP+ocYCrrqgwo4zMQsiOfLDvDGPumB4MHDwWKBrn5WABt0FqZ0/SFShK5PPXKafMZoIuKanpYiT
	xbcDb07gUn8neC3Xc4hb0urmGtif3OE2P730JI7fEcH1cmEqdZk5D5/AKn7x1r/2C23XZFPWVGe
	RBmcyzn8GGn1lCTolUWIdkB4UEezHLCb0K84kQATpdu3XPTgHGPvtWLtxTmMwu1/ePKE4PJS3X/
	Oc1L1y6sOoRSfZpQYjOOX5Cw138ur2NM8GqeNdh9q3vLpF2a0pDRj5WYTBYqJeV6TjAyyTk
X-Received: by 2002:a05:600c:621a:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-49fde4a12d1mr31396045e9.16.1790154691426;
        Wed, 23 Sep 2026 02:11:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/48] vim: Fix for CVE-2026-73073
Date: Wed, 23 Sep 2026 11:10:14 +0200
Message-ID: <a95cfa08584a3b7fc464326fdb382a84ed793034.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246474

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/2f628d8104958fa7421664f792ca6d4f7a39a10f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73073

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73073.patch            | 89 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73073.patch b/meta/recipes-support/vim/files/CVE-2026-73073.patch
new file mode 100644
index 00000000000..932580d3a10
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
index 10f4ce15999..3e90908264a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59858.patch \
            file://CVE-2026-57456.patch \
            file://CVE-2026-73072.patch \
+           file://CVE-2026-73073.patch \
            "
 
 PV .= ".1683"

