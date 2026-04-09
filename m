Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED02BF36B96
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:42 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144844.1775776300250012882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=e3GdHr3j;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso20436645e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776298; x=1776381098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOA+lcpkkX7qBYMZd0N3H+RNwXUj10llQ4rbfdVFrog=;
        b=e3GdHr3j3I859a2LRqICbAh4O5HmfqVIYFSm7iQpEdU/KR+h8gDFJalKxJig9O9Jlx
         jV7hx+wh7g+ZG6HrKdsdJMGhsYfTBelLe7RPTYWSw2t0GTXdp2BaGR1VzyOJWFYtqNz6
         T9q7UFGuZRibXdyiHANmCFYxj38Cemf45z6n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776298; x=1776381098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOA+lcpkkX7qBYMZd0N3H+RNwXUj10llQ4rbfdVFrog=;
        b=TykTjx83ACfKiMPetTRjA0T5wmFmhCusz6pmcGhbaeYDwfWUnE93/0UC7w6LxLxCNm
         iveH43rnN3p/EZ2c7gKh5hyrsFuylIGSM/fiqiWWwtTau0fillcIvBgzTmOEhQ/9FQ1y
         i4GOStZhNPs9edHqJmexa+4RzysElqESp6CDxapAAjr+i5pV8mS5bzaSbpLKTUEYAtnR
         pu2PLsr3pC7QMTMC4cnzQ9ldmJK5lK2r3Mc44VXcYNizgn2l3mbsUujyP5WEt7AvU3+R
         G2iFR6irSKUODp8RTZQrxGwg7UbojoMfF9Pyguci1MunwgI17aTuX4kkYFr2BrwksQXZ
         morg==
X-Gm-Message-State: AOJu0YzNyZIhe67BPzi1hbIWPXfCPBPeLhVt9UnMJ5d1Mg8sv0ZMh2wk
	4C9idm/xe6IZannadmDP/S+QVG3Pmkjt29BJCj8M6VF4rxhmMdCDTy/XnU/a7QFY5hgNBNJ6Nz1
	tqSegUC62kMXT
X-Gm-Gg: AeBDievGe3Fj848QrYVcX/9a6CIaFPIZVp9ToO5lTAxMQK/TkqPufuj0I7ppzq2+idh
	BJ2KcjXvz2rJAJ9rDBHw7/pv7eJC7bU7uIUC7cJVvuvxViR5xhGvN0WoXH44fUb3FxjmwhGcxij
	b+xFI4DckgV7XjAacxFUl9tQPOnarYh3a52Ugl/RhoNzrpBPpR/P3V+XTwP8de4ZA4aXkvQm7qQ
	M3Y+2Tj2dh4Z/3HYhs1da4oPOQWfGuAN1Otw28YS0r/KThQB6/MhkB6gveZoCLuuDBixSwd7azx
	hPblikliRjlOksgiTyMhzk9sW6soPgTzNohdwSH9vH++hFn6FqXtZkQ7sU/fhAkXl7DTB2Zxi//
	t/VnK8iX/FJ1wkiiGFeUUsPQo46GCZlQXPu+ubkDcvPzTSKUYdE8j265QB6CqaIVoBAQOzZ48sC
	B0qTGqWFWcOfSle5/bnNKFuzHJw4UeMYGQaTUNRp4dG2z3q+6oA0feiMOVA9Xmfzi32h99QogDZ
	Asd54dt8NjMPF7SkqVa8y8sirI8+a/BWlk+ApU=
X-Received: by 2002:a05:600c:3150:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-488d67f4c4dmr8818185e9.13.1775776298462;
        Thu, 09 Apr 2026 16:11:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 25/30] vim: Fix CVE-2026-25749
Date: Fri, 10 Apr 2026 01:10:25 +0200
Message-ID: <ee5c47fdfed865ef7ddc18054cb6cebdb7b0e4cb.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234984

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-25749.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/recipes-support/vim/files/CVE-2026-25749.patch
new file mode 100644
index 00000000000..8b04379b9b7
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
@@ -0,0 +1,64 @@
+From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 5 Feb 2026 18:51:54 +0000
+Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfile'
+ option handling
+
+Problem:  [security]: buffer-overflow in 'helpfile' option handling by
+          using strcpy without bound checks (Rahul Hoysala)
+Solution: Limit strncpy to the length of the buffer (MAXPATHL)
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
+
+CVE: CVE-2026-25749
+Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9]
+
+Backport Changes:
+- Excluded changes to src/version.c and runtime/doc/version9.txt
+  from this backport. This file only tracks upstream version increments.
+  We are applying a security fix, not a version upgrade. These changes
+  were skipped to maintain current package versioning and avoid merge conflicts.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tag.c                 | 2 +-
+ src/testdir/test_help.vim | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/tag.c b/src/tag.c
+index 6912e8743..a32bbb245 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -3348,7 +3348,7 @@ get_tagfname(
+ 	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf == NUL)
+ 		return FAIL;
+ 	    ++tnp->tn_hf_idx;
+-	    STRCPY(buf, p_hf);
++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
+ 	    STRCPY(gettail(buf), "tags");
+ #ifdef BACKSLASH_IN_FILENAME
+ 	    slash_adjust(buf);
+diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
+index dac153d86..f9e4686bb 100644
+--- a/src/testdir/test_help.vim
++++ b/src/testdir/test_help.vim
+@@ -222,4 +222,13 @@ func Test_helptag_navigation()
+ endfunc
+ 
+ 
++" This caused a buffer overflow
++func Test_helpfile_overflow()
++  let _helpfile = &helpfile
++  let &helpfile = repeat('A', 5000)
++  help
++  helpclose
++  let &helpfile = _helpfile
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fc9b4db055a..fa63689ef16 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://CVE-2026-33412.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"

