Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18AAF88067
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:31 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7575.1776322106289775599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rdUwcL2Y;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43cf7683a28so5119418f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322104; x=1776926904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D9RfUCZVh+iyh8GhBpyOFsLwX5twyAJhgYJtCgl7aA=;
        b=rdUwcL2YHDPrHjet4hhgolvyMEc1r0vEWb7uuBGgXoX3OLGf5S3TRysUzwQoimy2GX
         FL1b+Q0hFfQg7BSlFmdDAoC+g1694YpVGAVt/pGmsVh6TeRV+I9yXiAqf1hN/+J8Qqm7
         IOdcnm35GJ7lrefxM8z6xaTIRYR7mQPHhoMSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322104; x=1776926904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D9RfUCZVh+iyh8GhBpyOFsLwX5twyAJhgYJtCgl7aA=;
        b=Q4GtGSAzW5Nfib4UGQjpC4RGORxUmTPpenGftQJkGushQXbzm770qC2KkCkZuyqDFK
         o5i2CRcuwddkNRyXM/IoutQ7KgoGZuyMPArhFvSHRP4RpTwHpCrgbqBh+vgycWwRrZ/V
         yvWQcSyBumxcsASUQxSvpLOldFuZkU5TTBv2uB4BDwoKN5yc/zKYUDfpnktOL0JYqd7E
         831vvDNUpQ5DkHG0R2JGWT1x9k9fPEnRN/khkdZ1OsYls0bHEF1Ti/AIssssW1QvVAPO
         McfYM3kji6pCc1LvXOysrgARkW0/JS1qDgmB0lRWUwjSNfbTeH+5qT1LJATCmHMxNhvC
         PjIg==
X-Gm-Message-State: AOJu0YzAt7vikg+8WL1u9nLgPBh94msSW69i/8iwgMg6OMHSbRBszjrl
	23gDALTVM3ZMDr8NNaX1waGDUTXyL77LL5fuPG92uomcIwGUvoZ9G3YvjHhnq1756S6GL/nMlod
	1e4N+UazUS5HC
X-Gm-Gg: AeBDievbpPCJi4Qee1Ng+elnVu3mETknqJceq+zTlHb42VgpJlxTbL19zA6F6yB/3FC
	Tto/vE2qY/b8I6bztbRLoimDqd5M8YMl/Cc0Rcace76drpnfeBPhWM6T/RDZX9dQ3HpIKTSputa
	PEOWfScWDCf8UieDbn8ArfXVxcy6ycbGb2ktiRNJ0IWlNTNCGqG9nMkBfUz778uYSYhkl7x9rIa
	NZGxVsA0IhebU3RDIm5YFrmEYV20QBUArl2KRK/RRpofK865AHu21uEogeOHsyTWHN2JpK3ipFJ
	iCGyqrwcgGyjK0EIJwXCePrPqVHVLUUlCr51ySqcehSLq+Ldwuyzo0hk8xJ2/Nz5afXT0qX/LdG
	KHf2FcTq4J1VrRoni0ZmK6w7PEv8nXJHQ8WYogd/yASkeCDZ/Qjfxc5qWMnTic2cleccJG5796k
	z3P6beoWAgbb6nswe5hrKeGDQJMod1i3XBZggYxM+ky5G6dce1ZfcyYb+mop8v58dA2jtsh0oNq
	ci4kWPJnhbiDUfyVxdXKS9uo6T9Fb+bzL8fOQ==
X-Received: by 2002:a05:6000:1acb:b0:43d:7a97:78c6 with SMTP id ffacd0b85a97d-43d7a977a20mr22225643f8f.35.1776322104311;
        Wed, 15 Apr 2026 23:48:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/47] vim: Fix CVE-2026-28418
Date: Thu, 16 Apr 2026 08:47:12 +0200
Message-ID: <2c12cdc3442f31038ad64404c6bab4dd64c9a92f.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235353

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28418

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28418.patch            | 78 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28418.patch b/meta/recipes-support/vim/files/CVE-2026-28418.patch
new file mode 100644
index 00000000000..3a80ba77f7d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28418.patch
@@ -0,0 +1,78 @@
+From f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 18:30:11 +0000
+Subject: [PATCH] patch 9.2.0074: [security]: Crash with overlong emacs tag
+ file
+
+Problem:  Crash with overlong emacs tag file, because of an OOB buffer
+          read (ehdgks0627, un3xploitable)
+Solution: Check for end of buffer and return early.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-h4mf-vg97-hj8j
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-28418
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/tag.c                    |  3 +++
+ src/testdir/test_taglist.vim | 15 +++++++++++++++
+ src/version.c                |  2 ++
+ 3 files changed, 20 insertions(+)
+
+diff --git a/src/tag.c b/src/tag.c
+index a32bbb2459..45af67f20d 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -1902,6 +1902,9 @@ emacs_tags_new_filename(findtags_state_T *st)
+ 
+     for (p = st->ebuf; *p && *p != ','; p++)
+ 	;
++    // invalid
++    if (*p == NUL)
++	return;
+     *p = NUL;
+ 
+     // check for an included tags file.
+diff --git a/src/testdir/test_taglist.vim b/src/testdir/test_taglist.vim
+index 5a946042be..506e64f7ae 100644
+--- a/src/testdir/test_taglist.vim
++++ b/src/testdir/test_taglist.vim
+@@ -301,4 +301,19 @@ func Test_tag_complete_with_overlong_line()
+   set tags&
+ endfunc
+ 
++" This used to crash Vim
++func Test_evil_emacs_tagfile()
++  CheckFeature emacs_tags
++  let longline = repeat('a', 515)
++  call writefile([
++	\ "\x0c",
++	\ longline
++	\ ], 'Xtags', 'D')
++  set tags=Xtags
++
++  call assert_fails(':tag a', 'E426:')
++
++  set tags&
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 712a3e637c..7d265ab641 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1685,
+ /**/
+     1684,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c29361cf3c0..11200a08240 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
+           file://CVE-2026-28418.patch \
            "
 
 PV .= ".1683"

