Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48E2F8DFE9
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:15 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28562.1776378787478291055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B5nbz+Vp;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488c2690057so445705e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378785; x=1776983585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D9RfUCZVh+iyh8GhBpyOFsLwX5twyAJhgYJtCgl7aA=;
        b=B5nbz+VpU346RdAYRTj/dVTGV7WwyNiIwTiERMon/4PN/gGFlvNe4c5AGFA/HtflWe
         vUlV0f8WO7HW8Tnqyg/HbQQBUcwxKDbfK5CwC55A0KYDBGOnmNxAnqDapvMajtYt7zrB
         ka8JUGNIW+nMxSfyOYjBu/C8aoeA2B5D7uXp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378785; x=1776983585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D9RfUCZVh+iyh8GhBpyOFsLwX5twyAJhgYJtCgl7aA=;
        b=sZoq+bePMguRrjDiDxn6uWgvlGOelR4KtMPEFsDoG8LHIVh/4Er1hIWTHGcTj/jssI
         b0vdab6b4jYNga4jaMV+4HjOvz3cMAly9WhhadF9bnOPcyb4JlV8CssqUmR4I7d623Ti
         a+X7XBAGIbTY1ii/o0XdQyykAlTDUvU4rhJHEBjCPnl2Rylik1oQzRUuHtK6AO8ISaz1
         HrGSjJ2oteAjEWebgxRG5w0x1cWEmlLT7luZ2oP4O3jd2EMq2WV04rJqEqkouI/gyor5
         iHR+ePJsY3BbxbRNumCRph1zvXDiey8pNQ+gHpLve4MqufrBx7MiW40fzmdB1nO1QIpu
         6V0w==
X-Gm-Message-State: AOJu0YyIth8ZgNVbIDLqJW5f+lEeFQPWXNGMUeo1UtRdK/3haJC5B5Ce
	3xmlHd1743p1fGih56TNRFBKZB4ExRAWvXqbqpbEMhbn3JB9e7szBMm8NC5kdFcMSokvqG3vgXo
	+hj1Wc08WrQZU
X-Gm-Gg: AeBDiesyB4s2GtaprLSeYiQP6dNLMh2Vt6KLCYyrPeRxE3udj9/HAqESqF2j7F3furl
	8zLG4wlwsePYklt3EwTYIGMpPtHJSnv0k9Rp+FAP5RfbNmq+0Tk8FNQ5QaqNIXpPkyIOCaKNCHU
	f32EGJHQd2oTDVO/8xMHwC7+frXuzvmwP/LFlFie9eBc4hhrEZVzsg/Jn7HAnzZiXqTU+pjEEJT
	r+Oz6IMuuEJ2oW8fA0MKQGmHTkisHPxQojOW4dcoU4SRzmoZQgvLGOTFnHgsOArMeYP1TN7AhS6
	jypy3K6ybBCtOpLX8PfW+KlE6nIhH4pveDiF3Db9A0hZqxbOJNZkI9jcxPJTqO2vi5JCBKvysad
	9AzJ2UPRx+1U8uIpPyP7HK4FTT+wCHWh38tEsEhWFNAx7t6ynblA94ltxrsocX0PvyC2Kzs6wfA
	ihPqIjwX6HULU1rgaUEk0mf74cYp01stM4iqXk6j/yH9adXaYWlF4IwsAJE9A3N9rmdmobppcTe
	i29nh+ZIbFt19PQ2PYnl3O0bGTd/uAmYqwrRQ==
X-Received: by 2002:a05:600c:314b:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-488fb778b66mr4613695e9.20.1776378785483;
        Thu, 16 Apr 2026 15:33:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 11/51] vim: Fix CVE-2026-28418
Date: Fri, 17 Apr 2026 00:29:54 +0200
Message-ID: <2c12cdc3442f31038ad64404c6bab4dd64c9a92f.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235440

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

