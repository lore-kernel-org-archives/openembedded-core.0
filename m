Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24E7C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:57:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43777.1785193016318090229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m8AJfSm9;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954d29264cso16116535e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193014; x=1785797814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/pY15swq9FDDIaGhklN9EEvrA4tmhbHSl26MoI1uTgU=;
        b=m8AJfSm9KyDY9MJUabGyS1nt8mmEht5It3yvT8EK5yi4vTItK6piE/hZ/Miay9hx8/
         MtQpy9gY6tNQxXklUPDkDHpbhRsMRWiegCjOA6UyF2XMd7nrZhqN7ohLG+1VyCuQAq2T
         Ht1yG1oYEZI3haS21tScjDr1b5cSJj3vzBsJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193014; x=1785797814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/pY15swq9FDDIaGhklN9EEvrA4tmhbHSl26MoI1uTgU=;
        b=Djn/49/O1YGFYwg7raK84tEKT4kEbDFSRqLdoV2kHeWGHs69id7uWSP37UNLD4okYp
         +IeObR+dI/O8P774s/dIWyHgZ2bR9oZmOY1OVDCQQA3LlfOqCK5cyR01nG2mEN0eJ9Mm
         llFflky+CwlD3yVqGRTgKbifRSW3sJymX3IASryBEof0exG0Gx4nf82zbkc2XnDU/BmN
         WsgIshQ70N024kUY/DODUyKd71jqvzWoNR8K5yOECvL3DTsIPZKOd8qXGwX8iVqkjiYz
         +odHrOlAVzs7CHgbyySMGNXsrLQ0F8hsc95UyhEj8DtLJRixfi1SB7Eyg0CIgBv+YM+Q
         nJXA==
X-Gm-Message-State: AOJu0YxSS8MR0aQEb0gRXpUdMbvqjquQUN/eDL7HPBz7INmAro5goTNR
	TbXJgBu/3XDQsicw7oBvFe+yfK4BOn3dN3lqq6UqoD1uhh0oNWxN9mTyOkiOSq/7WPOBeBjtcOJ
	3DD9dWEk=
X-Gm-Gg: AR+sD10vBrqIBZO25gD+dqUBJLZ7GYxAUN+VkjR47ThqcjOgVg/IJwvnESt0ENNtOtW
	tlotRKy9I5ESur3N7qwfYK0BjqjtUqpkuQmvD2q0ZBBPyaFGzHTEV0zd7XfbOLtF37/oE70qEFn
	rP3cR6EKH8yxyItwIS2wLSyLvr3zFamHSSgh5WInVTpzey58cERVcE9n5j8zl8rxRYcWTDIXRxb
	79LkN2bU8b6N94FmfchICimgGN9SByXGE6nK1Dg1Y1xEYiehpoEd+a5wqttr5WrcZ9X4HcnALs3
	guocP1JA1GwA4jauteTNlHPAQBOdrSLvMiY9T12gxYNNzOQG7uCEcl4eIQ6OiBrMuKXIbr7NeYJ
	kBJZr2r9ncUZNtmmRVQKnasc8m2Ld/MTZwfpoX1qi6I5uhi8F5ed+tiLWJEleDLMdK16Uz1Gi0f
	eiHKMgkpsyQZRgoFozvWmlS/36pXPHU+UpjpRBCE8/ekpNGm6vQuiNWc35z6jt6IR3fcpRl84wT
	MM6RA==
X-Received: by 2002:a05:600c:8483:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-496c4fc2210mr9852385e9.18.1785193014521;
        Mon, 27 Jul 2026 15:56:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/36] vim: Security Fix for CVE-2026-57452
Date: Tue, 28 Jul 2026 00:55:50 +0200
Message-ID: <d174aa123d5a3e7dab771a060b2d173192e11535.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242153

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57452
[2] https://security-tracker.debian.org/tracker/CVE-2026-57452

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57452.patch            | 90 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57452.patch b/meta/recipes-support/vim/files/CVE-2026-57452.patch
new file mode 100644
index 00000000000..e87007c00a2
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57452.patch
@@ -0,0 +1,90 @@
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
+ src/version.c              |  2 ++
+ 3 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/src/crypt.c b/src/crypt.c
+index 2fade5db9d..879ecbf6ce 100644
+--- a/src/crypt.c
++++ b/src/crypt.c
+@@ -1262,7 +1262,8 @@ crypt_sodium_buffer_decode(
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
+index d540fbbd62..5c9dfe3baf 100644
+--- a/src/testdir/test_crypt.vim
++++ b/src/testdir/test_crypt.vim
+@@ -491,4 +491,28 @@ func Test_crypt_off_by_one()
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
+diff --git a/src/version.c b/src/version.c
+index b40bd9be93..6eac3fc927 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    671,
+ /**/
+     662,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f423e4d5cb0..20a5f7a0546 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55892.patch \
+           file://CVE-2026-57452.patch \
            "
 
 PV .= ".0340"

