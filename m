Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37589FE5209
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31964.1777064205709649009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FI1h7RlW;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so68176055e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064204; x=1777669004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCyOJp46iP7V4VfchF1AzJEyNlstjdhm455p98Do7Hw=;
        b=FI1h7RlWQOIgyyNzM//HTMt4yjSOtygC63LxQD0sOTb/Hfv6EdIWSxV2u3bnrAUJFV
         UqH5wJADLrKLPGPEVIejtakbpLRV9jdO6VOiD3buCf1aBF8wj0l1pS/tOmBNs/FSl7x+
         9+VFDUhlXbDtwPSLiPnAW5q1iuIbHutnNIQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064204; x=1777669004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZCyOJp46iP7V4VfchF1AzJEyNlstjdhm455p98Do7Hw=;
        b=REmQfkXoBFnjuvlKk18eCGh4t8ccePCq7cvewytkiKxqLTYWnHDEPIpi5M02mSWWUg
         ex7ujC97rso6FvuubsKL5HdtdJosQa6yunTJ1Y4FB3rbxNmzAXHBI4mn0jrSJ01rlipd
         +dUE1Ck9upoRA9uvHfWQCr0hCCMXy1Ct7IymqY4C5XAeFRi7aeHWG7opNTBq4N2dmyOD
         x7k06HdrejqUHL7YfD00nHcQLyuCfZbgR+9Wm4bImSd3Gi6SLMMmkGuAes+ZzMnGLXFy
         do7FNLYSAnAp5t43XsWeHuqjiqBoZC2PApM+4vgW/f2bobNwBtpFvhsWJim7dNdKeuRo
         A1rw==
X-Gm-Message-State: AOJu0YwHWx+gVWXuPZxzZ5YR3dlem4pmLXl9tPmI5PKxujLRFc8YaHLO
	YupwKkrAZ5U8Y1PI4b19U0/DyItVmnHLz1nWeNDq1rqI/8SG1F1M/kyMqxM7BcEEHbdwL73NE4x
	ZgYKn3R13rGGk
X-Gm-Gg: AeBDieu/3c8VprRz14t5rjlR8OkJWy2lHxrvnDYqQItCDhGFI9EaQsDSLF6DjWfS4Ec
	6a52f1PQs/yVhXNU5U0cLmdHOz/d4reyL05dg6Fvu6MKrlc/hofG5oadxEbPi+vY8IYMhQfwRZe
	uDd1UDTO7Wa0/79zeAnmZptUUl1A53n+jJtLXYilZircpGZWoF8dTsvuThwrbY37qGanMv0L21t
	EdQKcLboGg5QkR/+S2ffZx+aMVsdoC4inzqYOO5epFH0ce3VO51qkirCtby9PEpiLfF1i2bX6Ub
	yLgPcoqkoaMO/BnYe4s8Pp4xsVB4Zc4Run9+9nQuLZxq3MSsueR2PyKzg1RIce5AsibEvCPgHE9
	damfKoRod29GpE6fOviaa54OjBmvgHCnOXaikpWocBldK+vlN9B3Uwjhzi+8ngtznC9Cd6s0wYF
	i4h9pW9WxjQA1VN23lai72URDAjQW8LRNlnY2NhNESXMXZnyZeW2jau7q1t50KZCpOEV5dPJhJd
	WWnAAeC9JkniUrDZZDQ9kz6eiH5TRPea5+6hg==
X-Received: by 2002:a05:600c:628c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48a52d48985mr300082325e9.3.1777064203791;
        Fri, 24 Apr 2026 13:56:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/66] vim: Fix CVE-2026-25749
Date: Fri, 24 Apr 2026 22:55:10 +0200
Message-ID: <ce685e18a6dd7137094a10a9051aefc123a0f2e4.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235884

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749

Signed-off-by: Anil Dongare <adongare@cisco.com>
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
index 289f31be707..ae1c95973dc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"

