Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE21CC6B03
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9234.1775107340539097548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ec1bqIbb;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48541edecf9so5069555e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107339; x=1775712139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOM8DlljZorlmNPL4S2F9nuXnHBtl1wOWkPWzkQ1KaQ=;
        b=Ec1bqIbbYiFP1UoUj/WT8yU9AZpc4lXBInlEW1WfLwAEyhvuMy53iMb0mNgpImfrxB
         gti2HBKPLzI0QGG+2hvdBV/fZbT2zgErZETylSoAONRFClMM1WQPeBcc3gRItLywMH5O
         DIfSJxOmGnYGumvKzmXMhHO0glPDAW9beTF14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107339; x=1775712139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOM8DlljZorlmNPL4S2F9nuXnHBtl1wOWkPWzkQ1KaQ=;
        b=IioiMAa9XFG6VmpaZ9syG/8bFK4AqC9H92qRjDxp7TDoPGKCUOuZ5P+DRTXzbpwmRL
         ESsoY/7ShvCsKhXcntuFAGFFTMYvs22stCoK/Ta5oUZSoJsxhfWaPIzOgIDgVY+yfZtM
         cV8H06vEyXFVE/uzUboGnBCH4k17sCQAtjEjiVmMsUpWC6GZ7GcsPdwZbKBmWnHkCbDq
         oM+q8xFCRZzdN1zkJnb2ZZLJogcWrw5J3i1c+jeJ8UK24XByTxOGPF/6KeCGO717MdnR
         XtgNL39m4rhzjWCpGNsOdyXHlxglDly6AL1ITmj8dVSw3DVXPJ45xg5h1NOIR/hR/Kgw
         B1sQ==
X-Gm-Message-State: AOJu0YwLHKcPb2A89VGGrVs6ZX3Vxxecc47SrzZPmVQuejvBnaFsICWo
	bCrZQiBKHbEEhUwY3+uhDtc4lHRmTXw72u565WlKi97z+cF1q/GinkOOkoL8llam86q7zUn3PnK
	FjelLx0U=
X-Gm-Gg: ATEYQzwDitt5a+T2FT5j/rD21XojqLxa7qDREnyqxZk6Q4ubMDxkFpjYPDB5DJBqYPp
	Jsrqv6aS5KF0AqKaS/GuLoBgM4ELuEBn92dwJ48JxKZnCcDw8OJsAEXL2ha1KA1zwQak2jWdac1
	iR3gik978AymkxDf7SoktfvOh1rwwV9LGjALIpVmo66U5VHTVc/INVF1HLWIDvd+PqJue5Dv4Jl
	IhZLOg8hzAycTV8iH8sTnGHKhTQUFautVV5530tgIJQl0B8LB7M2/fTb/T43EJkcgB/41hWQLty
	2FnxYZfEU6FkI76V4WkI6TePc8ARYbXD+ZB+77S5FLXk7fyBRRg4jqV8WbcP2uSGBnatqLzfWd3
	gT8lyfylULawF2idualw3dQ8K37LDpwlyJF6KSSTYHRVH05u1qzeDnxDBWGCVQTUL33wzZWXvyi
	8BWLrztVbHG4ZX7Tfp0U0nUAsGRLAD5n2IKyGk9jwyrDS+4za8zhMGd6igbZks+u3pcbQNeP5iz
	3Ar2xAbyPSiRudfEEMpzFcJhiQ=
X-Received: by 2002:a05:600c:c04a:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488835b2f54mr75249935e9.20.1775107338521;
        Wed, 01 Apr 2026 22:22:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 14/15] vim: Fix CVE-2026-25749
Date: Thu,  2 Apr 2026 07:21:31 +0200
Message-ID: <0542f6fa58e7627137d61416eccfa4f5bed950a7.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234486

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
index c730f1d0cf9..044117a57ff 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"

