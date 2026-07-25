Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD35C531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 14:33:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.372.1784989974730067701
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CKgpxOYt;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1530169a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784989974; x=1785594774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHlqxpPPTqdowXO/+xK1yTvOkv50jFE8eXx9/PHLwPI=;
        b=CKgpxOYtPpVlmTK7drMtxYihtv0kuMjzXVm2d4DlemKkjHm8acEQTgbbtyJth7E2m6
         EdZVT8JELA6gNzOgCCsMzhmKb2nH9ztV6TVlA19P6HBEc2w+ErP26bHlRTNTV0sZxTuU
         t6QPOTikmDN+K4SROddK37WfcVYyDrUxWVvN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989974; x=1785594774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHlqxpPPTqdowXO/+xK1yTvOkv50jFE8eXx9/PHLwPI=;
        b=hKJmEWKLYgCyH0I2CX7UucjEoxLN+KHHtPTZfL7+WE7CyVCG4bovkRtRXU3dU1uaGD
         S1TZhjNP7sMfZS/VGX4sdi0rV8VF2Z9Nr+7fyZdTbuYzZQP3M4e3/l0Py+pgiovvK/cv
         PQ187RTiP04TC/nU0BdBODXbEgTLKQVl2EeOS8njW76n8I69d3b6fV+0ZKEocHTcoFWo
         sg8DTfK3ids7Kx+baFAMq99nvMXu3YXfv3VAbS120TraiypT4MweHJJ1SVQzDdFNfSEy
         4KbleoFBrQa9NJ1ioTcaFb16fnB22rTNJb3TPmvTdYv8SAMk69IXzN3972ooTDhIjeQq
         CZig==
X-Gm-Message-State: AOJu0YwgTV1n3/RmSB6xBNcO+XrWadFqpTUbH3w0Izta/jkm/61GDvQU
	sphB+PZ0DGpB3a7VDodc3RGCmbgXmbH875WnyqgN/umR7VydcCtOqxui19IWeKHXrJtO3P+h1rY
	9tgdMbZ0=
X-Gm-Gg: AR+sD10SSe8yIg1uwj89iO81y3fXiDkc+TeSz0Eqq5rJ5XEqlkLokvMXvetR2ZSIkZU
	VBcbt9Fx7s/yQD9qa54YGkzzDbHyDqTi98RMV40SSx5DV5wHst/Oop+MKK5lps40fu3Pjt5HNPk
	rf5XCDHSuaLKGe6QgVuEd9VUalRpWvqwJHXqT5B/Xi/uqXHMpDzN1xrkAcd2G/IxBJs6qarovA4
	YmlQI9WH8eDknTFyXXng06cMkHZhBwYGPgI8jZZ64ZIjUVBTK/RYw7ghvC+M2pgdVl0l1YR1dgj
	oCy5FfkkjcQuG5WrLuHm7UuVOHdUJmktMurUfhQjlvJxSO7LM4VUPeVkK5U3pijDgTimRxpF+i6
	+xGuM8B+ER9Ixe2kButCnGVAy9D0CVzTH4hlrHUrb9lZTNjF7wJ0CX2/qP7bjQwkSuhWIDtVV2v
	x7JUDGybLzamvVFPOx6BWxd04=
X-Received: by 2002:a17:90b:3d4d:b0:38d:f710:63f0 with SMTP id 98e67ed59e1d1-38f298a4c6amr2327900a91.43.1784989974069;
        Sat, 25 Jul 2026 07:32:54 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e585ae882sm1575845c88.6.2026.07.25.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:53 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 6/6] vim: Security Fix for CVE-2026-57452
Date: Sat, 25 Jul 2026 20:02:31 +0530
Message-Id: <20260725143231.230059-6-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260725143231.230059-1-sdoshi@mvista.com>
References: <20260725143231.230059-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 14:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241976

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57452
[2] https://security-tracker.debian.org/tracker/CVE-2026-57452

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-57452.patch            | 90 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57452.patch b/meta/recipes-support/vim/files/CVE-2026-57452.patch
new file mode 100644
index 0000000000..e87007c00a
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
index 445f5ff1cb..e3c6008531 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55892.patch \
+           file://CVE-2026-57452.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


