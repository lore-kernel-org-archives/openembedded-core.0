Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF18F36B8D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:53 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144846.1775776303629034090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eKUFMDSq;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso15336075e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776302; x=1776381102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LWViaJVvPgdAmOu1dVWASfhFpDZ0EbLVx1et8ts3CM=;
        b=eKUFMDSqV/n+DoR7ivevw0nNTqrLlssyO5P9YHDMm7dajravBMc1eZ1gBoXPAf4QZK
         8tPBVLt/CsHLf+Kd/jc+F0OG8UyQCAplq1ofDmD8LzyasQ8AnwyiAkjuDOCU6n9WZVe0
         k+ZNBkfn5ROkglETGT46JsOk14lBKFpIWPE6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776302; x=1776381102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LWViaJVvPgdAmOu1dVWASfhFpDZ0EbLVx1et8ts3CM=;
        b=bCAkq3Mp2P1jpnIw01Td5+5+WVBR5MGckg4vReB2KvzzA2AqZqZOcED17ShrTtbnuh
         7DoU6CTfOe0/SWF8blSbDr7PVna88mwc+5dRjhTHEuTiQ/bqMlfleCV0BCFhAXBUQ1g0
         Y033XSpN547WuTZZm7tyasYVAFXQK6R2uov+dmr9TDSnPI5mc+jgTpTDzQUZmtDF9g8b
         xPVzQSH+wa/Re9qNo6aRu1dkaNy5BNq0wwkELeFbLvx8zDdzJUi/jRx0PJEm8WQaP7Um
         qVAXryxOGbUIe9pZUrP4kpAQbMft9yQIdUT+eMTWWFoXNfHj7eE37BqWCMow05Kj5mDz
         y/mg==
X-Gm-Message-State: AOJu0YyHgXsTZOKva0PWycs5RIx2EJT6rMOQoB+jC0XN92+4sV1XR51M
	ZotmrcUtESb/LL4zqTLfXeWRUfOEX6j9VusxiQzTjvez3k5VqPTHS3v2Am/mcjbjEBV1kF2UXRg
	nv4KUtSO6rGwR
X-Gm-Gg: AeBDiesaatCLdvJP3Od+U0TUlaSeaYAmUp9mHWNthH6Rl0WBXIlz+qnKme1PHagtADq
	1WwE3fmC64/rvZBh3p0UY8Igh5qc3jxvBXS09+THuBqKepKrfsYm1qFAcx4xYSfXbc6xUUjQWRL
	OlHzKynhkuql+Jey5hjMUeMzFjqPM9Djd729VGVgf6xOCZpW2ly0sO9T4F7+z3Q0Y75DfE/MSsO
	TJw+vhZwHAkOqtE0ZLPnwda4okXGfOuowpPK3E/xsIn1ejOEZaxsNYxs2JBXSrJRmPNSGRvKh/k
	qfySQsvaPctIMCHpaigRkJRfUG7SinCDKXb9YIJKkSOJ9KU0g0t2t2B9Xlm/mEImqSq6IV2ezk6
	Y48h4qbe7dRT7Nh7sWWDbylR1limG696dK82KKAtyRPoKU8ZvJWvWoX9z7hiVEdNos0Qvywa40N
	PfnqxxnZMX5XBoI7cP+Q1vsOs1iwT5X1tSqduC2GXNQrzzUGzmCbIyew6haRMeCbT592yDK3X3Y
	D8dUZzzmFoi1F3xNZVtVanj76LX
X-Received: by 2002:a05:600c:a316:b0:488:a07a:19e9 with SMTP id 5b1f17b1804b1-488d68688a6mr5282145e9.19.1775776301804;
        Thu, 09 Apr 2026 16:11:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 27/30] vim: Fix CVE-2026-28418
Date: Fri, 10 Apr 2026 01:10:27 +0200
Message-ID: <8cadabb525aa1ea57aa0316240ac8f9ec09161d9.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234986

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
index 2f222c52956..713e2779362 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-33412.patch \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
+           file://CVE-2026-28418.patch \
            "
 
 PV .= ".1683"

