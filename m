Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F73C531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9353.1784751733496095336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kDEnxu5g;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so163161615ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751733; x=1785356533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N17u9LLjVTN1fYJfvrFsxJerOrXS+NF+DEduOPOQdiw=;
        b=kDEnxu5g2P/3ROC5FPfqsOI+X+Q5S3y8Df8+MIOKRVz5o6PJ5kpEYShESgW5Qf7Qpt
         u7HVD10f4VbJoUDc5CxzPRYr1FubnJ0lB6hd4D9pVJ5YtlmEB/nFcAh4/iaEtbkQ/wq/
         Gq6TOvj50+pQkD2iw5ZDcfGPQbynMGvFDsFhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751733; x=1785356533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N17u9LLjVTN1fYJfvrFsxJerOrXS+NF+DEduOPOQdiw=;
        b=ojoPgfD5KXqn7t7BBw9HGygJEzYY+f/XirGzJ4GKpqrdAn+NkVjni13IclqvB/vOzY
         aObjuNHr06suCdLUPrfMAQu/hYAf+8oavGPFsROg+gvVmh6gNN372jzk2AuTgHSSSx07
         +DwaYE//pY9i4UmPLU2AbDZFyWywZvgWJMY1ws4UCMYhRx4bdxQAAH2cqtJJDqx/Bevj
         Y9lIpbvAdcZQSkS/tagdQwMzwGa5FOyvMW5uBar4f8lkriNoWZW0ZipgDSToGhAd4QFY
         1X4Y9/Ao5Va3V0d0pMywMplwhRiEsE9Op3RLXzcGw75T9xMflU+OY6ux7hpS4kLpfk9S
         VDtQ==
X-Gm-Message-State: AOJu0YzeforQenMQ3EHDW8AxJfiTFG9Nvr8dHEtQRegclX5UmjkhCCWF
	6jzh9SPpjHUnKBDGAVyJHc3cMTT85EEZAvqJQzuYxdSD10qM78x9dSuV8kQ/aroiZ2ACbhpYfmT
	VIliwNWc=
X-Gm-Gg: AR+sD13SDWgeZd6o1eLV5FaUU/MtDSJkR3kvYYDStcR5zt76GKMxx6o/TFKqGWFVZFH
	XI1GsXYrkwwUyVTZbV+jB4CtfFBt8Mf74ANNGt1oLlM4e9gWK80x8/GGi+vL5O0pDQZw55jODw6
	m6CoJEsh0q7jCX8zxfsovUty2rQjgwKLQ+9CN044643+cPm47XaC95oAgXxlxbC30hFi56fO2KQ
	og5FNguZ+6a2qE0TJElxCfZzq1Sn+PNUPWqzbk441ndvhHnl5Gx4D5DfSHie+WF5bxgq5ydr4ze
	De07Fly2yVlX16iwgQaFE0X6bjnaE+MH//NarMwQmDj2bcfnyT3G9if2bgh9bIwPtFAhYfBBZAN
	2iP8SwvuyBkSZ21acdiO6HUInPHmyqcLPCdZ2aXB3j+YiQ1mdx76nl0Tna+6wvO6OasP5w1R5Ey
	YK4EVGLnyaz6QI
X-Received: by 2002:a17:903:2390:b0:2cf:7e56:22c4 with SMTP id d9443c01a7336-2cfa6c667a3mr3855545ad.30.1784751732859;
        Wed, 22 Jul 2026 13:22:12 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:12 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 09/13] vim: Security Fix for CVE-2026-57452
Date: Thu, 23 Jul 2026 01:49:01 +0530
Message-Id: <20260722201905.491897-9-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241753

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57452
[2] https://security-tracker.debian.org/tracker/CVE-2026-57452

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-57452.patch            | 76 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57452.patch b/meta/recipes-support/vim/files/CVE-2026-57452.patch
new file mode 100644
index 0000000000..aaefbe80eb
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57452.patch
@@ -0,0 +1,76 @@
+From c8777cec25dcfae89c42e9aff51af61f71c5745f Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 18 Jun 2026 18:41:16 +0000
+Subject: [PATCH] patch 9.2.0671: [security]: possible out-of-bounds read with
+ sodium encrypted files
+
+Problem:  [security]: possible out-of-bounds read with sodium encrypted
+          files (cipher-creator)
+Solution: Verify that there is enough space before calling
+          crypto_secretstream_xchacha20poly1305_init_pull()
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-c4j9-wr9j-4486
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c8777cec25dcfae89c42e9aff51af61f71c5745f]
+CVE: CVE-2026-57452
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/crypt.c                |  3 ++-
+ src/testdir/test_crypt.vim | 24 ++++++++++++++++++++++++
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/src/crypt.c b/src/crypt.c
+index 55edd6c6de..a11d204e5e 100644
+--- a/src/crypt.c
++++ b/src/crypt.c
+@@ -1257,7 +1257,8 @@ crypt_sodium_buffer_decode(
+ 
+     if (sod_st->count == 0)
+     {
+-	if (crypto_secretstream_xchacha20poly1305_init_pull(&sod_st->state,
++	if (len < crypto_secretstream_xchacha20poly1305_HEADERBYTES ||
++		crypto_secretstream_xchacha20poly1305_init_pull(&sod_st->state,
+ 						       from, sod_st->key) != 0)
+ 	{
+ 	    emsg(_(e_libsodium_decryption_failed_header_incomplete));
+diff --git a/src/testdir/test_crypt.vim b/src/testdir/test_crypt.vim
+index 4a96c30702..151a4dea17 100644
+--- a/src/testdir/test_crypt.vim
++++ b/src/testdir/test_crypt.vim
+@@ -459,4 +459,28 @@ func Test_crypt_set_key_disallow_append_subtract()
+   bwipe!
+ endfunc
+ 
++func Test_crypt_sodium_short_body()
++  CheckFeature sodium
++  " A VimCrypt~04! file with a complete 36-byte header (12 magic + 16 salt +
++  " 8 seed) but a body shorter than one secretstream header (24 bytes) used to
++  " underflow the body length and crash with a wild out-of-bounds read in
++  " crypto_secretstream_xchacha20poly1305_pull().  It must now fail cleanly.
++  " Bytes: "VimCrypt~04!" + 16 salt + 8 seed + 8-byte body = 44 bytes.
++  call writefile(0z56696D43727970747E303421
++        \ + 0zA0A1A2A3A4A5A6A7A8A9AAABACADAEAF
++        \ + 0zB0B1B2B3B4B5B6B7
++        \ + 0z0000000000000000, 'Xtest_sodium_short')
++
++  let v:errmsg = ''
++  try
++  call feedkeys(":split Xtest_sodium_short\<CR>foobar\<CR>", "xt")
++  catch /^Vim\%((\S\+)\)\=:E1198:/
++    " no-op
++  endtry
++
++  bwipe!
++  call delete('Xtest_sodium_short')
++  set key=
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5a4778fe7c..938fdecaf3 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55892.patch \
            file://CVE-2026-55895.patch \
+           file://CVE-2026-57452.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


