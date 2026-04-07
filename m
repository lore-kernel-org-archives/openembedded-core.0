Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72F2EDB7EC
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 10:15:43 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78076.1775556933725486679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ErYthVJS;
 spf=pass (domain: mvista.com, ip: 74.125.82.173, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so12162136eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 03:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775556933; x=1776161733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHbmcmoarA1A2csfjfs1uefV/2Qw8jH3A9ir9yGnmPI=;
        b=ErYthVJSE9efx0yc2SJxz5lSvG/NPNS3aVxXHEwK9vGcrKrX5YHVl4+4Dyoc2fQ5fs
         Bd/NVgi62TBDnQSqURk3Om34FFgKk0h/2wZ19YsELt1vewqEtworI3MjPQcmW4HL/wAU
         j4Y1uBQxyfK1ZFSQaUV8hgii2i5GMJiD2l55o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556933; x=1776161733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHbmcmoarA1A2csfjfs1uefV/2Qw8jH3A9ir9yGnmPI=;
        b=KllaePPDTmaYwcjLE7rGsU2WxRFWYXTBZYwViDWOsCOg50KHNqX/bnXPE75KpaswKB
         2TGFJ1R1CSKUij0UxpvffLVRoeWLA1ocqrS3Qb2RjMDEpiAwjUJboTdi3ucBTvIb5OuE
         PsVclz/34BMe2Tth5K4hDPYPyNzpZXAgtMBS7FSQLp+0fKfq0Hi62zVgon4Itnd2tLVc
         1rrUiy7aRh7vMB3x1x/udZEig5tt2qU2L5w/NHbA8sESsMwoGZ867wfk7q9eZEfAOehP
         eEYTszTK21kLo3tZcNyZGty2hl+zsOlXHBQzPnq3gi9tr3wzZUe5O74YrDZRqJfz1YaG
         Pn0g==
X-Gm-Message-State: AOJu0Yx6iFdwjApr4NBcP2ADm2f+LEu8SHnn0T8NFwA6A7I6W4Y3T5a1
	JNokqX0FLuiWdflURmVGlbgHRNiBTIp2fmsWQaK/jvOZmbV493PkL3F6GCnCV+D8Qmg8nB9QZ+V
	89R6MLJE=
X-Gm-Gg: AeBDietOaS14UmnUyaR7kiCVehg7ekC7U4bv9VmhtEnVH/B/TKeSxP1wqHwBDJx8aMu
	fJZI0v7crubrtDX2+HbOemNeoMFZ3O+G1F0XZzrgsj3CAJ8aqoy4q7sQD8+eW8usDoR2CP4AhXx
	cw8qLlqw2lxaRTzZZSWeISJZVgfKtchPcTZNBH0gCT55x3XlXikJbySN7DHygFJIxsv2fK9fK1P
	Kza0cpid7prlXLozsBkL2rOkKODKq0i/1yi/Lr4wwqbA43B5vM1BCvoHpxpnL0sKCuvIthJI1lv
	dt/C70mIfS8/zdc8EBgtzK5e9Z7UbHqfQYCcSDBvoEhoftx3zUYgoZaRR/ybcsU9JbjvrwAr9uy
	0gpUhEIehMHIDyRxuMmFWBKV4skCAQR9MfXDgy1JnoKQddyaNEO+4pyPfpZE1usFjehWX/ES6Zq
	0+mO4g/CDpwQg0wXm+vb13xI6/H7bZoTjQKMjn
X-Received: by 2002:a05:7300:b54b:b0:2c5:347:e628 with SMTP id 5a478bee46e88-2cbfbf77d5bmr8799649eec.21.1775556932955;
        Tue, 07 Apr 2026 03:15:32 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.5.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca793ea2f2sm15349969eec.9.2026.04.07.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:15:32 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [whinlatter][PATCH 1/2] vim: Fix CVE-2026-28418
Date: Tue,  7 Apr 2026 15:43:16 +0530
Message-ID: <20260407101318.62249-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 10:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234727

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
index c29361cf3c..11200a0824 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
+           file://CVE-2026-28418.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


