Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8FFEDB7E2
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:51:52 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77609.1775555508119586991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YBrPCzI4;
 spf=pass (domain: mvista.com, ip: 74.125.82.54, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732e6a123so88743c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775555507; x=1776160307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETaYJ30k2D4A97F+CKEtSBN4VHbIIWhxAQLmTEkMQuE=;
        b=YBrPCzI4wfmtc9PgAkYHdMJk+xm3SuQJj4U9nEEWxaY6rImyycZoGMnwfYQ3ZWZMTL
         eN3aep7/kiCsdIBqZF64CO2+jLsEZkOklJryb7MH0onKJK3jgjqvd+XB0KWfp+/G9qcp
         SVoMPuRIZxvVO08rUXN3/mCpvFN1vnmnupd4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555507; x=1776160307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETaYJ30k2D4A97F+CKEtSBN4VHbIIWhxAQLmTEkMQuE=;
        b=kyRjwHj8lzJb8+1iaOXx8CcOEiP2TSGw2SF4+sZzzxwWDHABwE98DZYtOfpvBDb0rr
         pFq+acmjeqdPIpfm82f95K0p7D3y8Sg/qyaBPx30Xe7lo+fEYV6uRpPOl+sIaACiHrGb
         rzm02U3JxMapXxGsluPzPFhM069bnKDTbN9RoZ8c80OE2QGgzLTxUhbSlv3nrs43+qPA
         HyLFbljO+mtPQY/GJhU8o1uSkxDMlN2nVzGyVW+ea7wMJca6MFsMGAIfo453l8wllhxQ
         5AL7r0qP3l+0s66XpxlyabSKgbL2yoFeVOghfZd4g8/3Di0akpw65v0w2kL02eA6+Vy1
         M0EA==
X-Gm-Message-State: AOJu0Yz2ipBA8ZuUTZZmZesEP12ZHMF9vS2+7RaQNicNuAAAmq0LWxWu
	GmVutwfrixGVxRBnQqC8AJYRGVEzblfBBP6cK+8usRqcb8ULXVslAFq6pFQEB+VzRT3CGCMZvM5
	ParbcVqI=
X-Gm-Gg: AeBDievMOtIQYjjOe1WSgzpm6fOqiHNX0VvOQbWLlPbNjH93SVlAUUPSl8lndMobiG0
	oRlAK7tfeZ/VDklliumSZ7/cQd+sXXaRpXW/BV9sPZiAeF7gOvNRAwG737pO6mvauoSX3KcE0Q1
	KMHg9w/RvCE7UzvnfOyabaoldsWQiyp/wGpJjqTk13lu1MZdIDesdXIEgDlX5T2cvAByyss1xOB
	lHsngZsMLvR3gQlwo0AvXqEELUSBvwcjyrpcgVJZKQS/jjoL9ggirqs0pZcw70pU6xwYa34QfQj
	QgjUHEf5Y5i2Y8ckXaEhH/0Ta8/3MY7h4sxqar5MOhsWpqe9YlNGFJMqiIWl5Rl+vyO2tuuW8SR
	OciWBW5xUJeEMabivARPw91q2dOgTOv2Of68/QUpJEwFykaZjeKGu8cq51ZyFfZQql3tTuQGxWr
	+OpVIj9/LyrmFPo75GmOedFvXsEUADoNmEz7VB
X-Received: by 2002:a05:7022:fe04:b0:128:d24a:a5c1 with SMTP id a92af1059eb24-12bfb75f067mr8779492c88.28.1775555507222;
        Tue, 07 Apr 2026 02:51:47 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.5.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm13178393c88.1.2026.04.07.02.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:51:46 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix CVE-2026-28418
Date: Tue,  7 Apr 2026 15:19:37 +0530
Message-ID: <20260407094937.58526-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234725

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28418

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-28418.patch            | 78 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28418.patch b/meta/recipes-support/vim/files/CVE-2026-28418.patch
new file mode 100644
index 0000000000..3a80ba77f7
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
index 2f222c5295..713e277936 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-33412.patch \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
+           file://CVE-2026-28418.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


