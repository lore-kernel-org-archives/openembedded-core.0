Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D227BC88E44
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6438.1788939002853215088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KYAoea7A;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843f205a5bso3495820f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939001; x=1789543801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dyvG4cg3331EXUzv1T/fgXjmpd9UVWJ/1V6v+KRRmkw=;
        b=KYAoea7A6SNj2YPlaGN4UpXdBeH0b2dRzkqdzH1NR83KUlDVjJUyz1oqCW2/nZ8Cdt
         4oC47YcpxFY4ZuQtTcX3O9djhLz/PvNqb4lygGxpEJ12FPn2wIPTzQxZuY/G+XhHVXws
         6okln2+auxde2hTRutvEkP/1oiJBA+UgAnqC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939001; x=1789543801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dyvG4cg3331EXUzv1T/fgXjmpd9UVWJ/1V6v+KRRmkw=;
        b=oQoiEAfAxX92jvSSo+8lgQGyW8tZa1Pjabk6+Ux/sgNVZ6xJujq41/YyohBZAop4p0
         Sikx4S//XreSVbrNoQp4sD5CavondFyPjd2njGPJTw7P8jKsknt5QB6/3jzLALHdOnEL
         NS8y68yHPXH++8q213UOHZN737t8TqZ43uVyz5OR+fKvEO/fVc/P6m4DW7TvpXLCSAjZ
         4qgDnNAHIu4pjkNPmRKGf35eombfWPDKpXxajZca5VFJCcNZd3/p0IBvVpYMGjxjVHyV
         NqvzSmyjqoTnuNRwEhP//cLQ0fMsfpIU2jckgLB7DXpew1xT0uN9eYu5cSxQefO+Ouq6
         ud0A==
X-Gm-Message-State: AFuF++nyGdXuTDHZkXhG+PUltdLjL4nPk0B+QsgGNFGjOp+QGhy9kdM2
	QRrfj1F86zf27hKPuYbJgGAvhC5jbjAJmGEQQZS06PwiW5MUD7FUNaSFAo5NME6aiLb3I+6WWky
	h/wMcP7o=
X-Gm-Gg: AYBFou2LEsIMuNhHrbgWI4+quo1vz/basal8+/Hh3AssBKGqLSgPP7ybhK/taEnUgjo
	MBYJZqnqtOwI/Tztpwg6BNNd2fcdiiKu3q2GVt9xReLmPp+NwFv85GR+CJdgoSYrxRO8gn3CT8Y
	RHFU9Kp97ZBB2cHxfNo7GQHcYyNfc/U35F3zktuP1lFIFNvVyM3xw0S6+Mzslzs4ZwRDyinCTY1
	apIenxcycW7R7YXYKmwpVLPPwTWGjzMZvWenaHlsb0HotuU6V6OCECRiHnu64moBd1loOoFUNzC
	okndWw01eIoVx+61Fq/h5OdMNS6MF1xDE8xLZPrvaLyrzOEgdRFL3qk2VE/YsnTL5qagRL66LbL
	v7IJUBvUs5A+loHQEeQox/gdzd0Xyuteq4koR9gujTRdAmkhlayupPqWWQ+7pr5StcbUX6eO2te
	a0vD+lRtqNYjlTqnBogx6A6Awd0suYmB+PyjEwKeVDqChPuKom5Svmo9v7TWfFizx5FslomWO+a
	PfPuw+Ftw5vbgybEhZD7dq5tS7C8vIyNFCrYLH6ol1/akYfk+xPEzQYxQbdT2xf3A1XoJQN53E=
X-Received: by 2002:a05:6000:4816:b0:485:9bbc:ac72 with SMTP id ffacd0b85a97d-4859bbcb102mr18005110f8f.42.1788939001018;
        Wed, 09 Sep 2026 00:30:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/38] vim: Fix for CVE-2026-73073
Date: Wed,  9 Sep 2026 09:29:12 +0200
Message-ID: <25fb2be661d8b6e26f6ef3b146ac9b7607be6114.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245422

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/2f628d8104958fa7421664f792ca6d4f7a39a10f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73073

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73073.patch            | 105 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73073.patch b/meta/recipes-support/vim/files/CVE-2026-73073.patch
new file mode 100644
index 00000000000..5defa7339e6
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
index 34d45079061..7ab7a405ffc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
            file://CVE-2026-73072.patch \
+           file://CVE-2026-73073.patch \
            "
 
 PV .= ".0340"

