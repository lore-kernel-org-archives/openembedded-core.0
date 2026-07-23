Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E12C531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19532.1784798788373459853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=i9vvD7d1;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf27856f9cso4593295ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798788; x=1785403588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSQRraOle1QLrghnX/FCOZLo2LHRjyDSf/hTehF+kqQ=;
        b=i9vvD7d14YnZMaeiaaqaCbVbTpiF/Gh3CmgHySrT668uRqoNvW2XRXQgnn3FpxebnL
         c2BW1joWNahu4htv0KTu6yHZy7abywYUxod0VYj4YS86+9s2wfoj+GsP27U4z5tIDSFq
         uOQ5T9HQ3uPBm1DsAYGGiz0AVXvaZBRqqoDbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798788; x=1785403588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSQRraOle1QLrghnX/FCOZLo2LHRjyDSf/hTehF+kqQ=;
        b=ndtQCU1mpZ2gSXSTNgHXAj4N+QbubQoEnRUsc6A63uMlsJ59lW0W3eNG1WzFkFndl1
         1JVDdYZWRqBsRl1QH+zd5Ca/VhfadAYfjGyAfQdMP7zmu+ftUI4bTO3WzmqtBUlmrLy+
         aTXeHSAkvaGOdMqVf3/e8zVQBFsslgYDXnXqBQA1JDR2wYGyhRCnZbxWM/Sf9ruCo5Af
         oSwtURBhxUjqDqITF1GHnBV+9sIDXG3mpTQXmFzFAFBXfHFkOYibYCKWWHMd5UA1KsDx
         GzyPdm/AhmI6MbnUfrHxgvcfw9NlLgWtkhyMnyR95APJtCRpxuHW9lHd4CxHrLrmELrV
         3a1Q==
X-Gm-Message-State: AOJu0YyVwBVvVjbMizQv+YLpDdaoQ9Coo09pT5IQPvQHyHFrfeuRE1uS
	Da8vfYcgM0e8zmhR/A7soR2/fKPAYuIlRgVefGFgeKfHJ67YISEdMEo6mHYXf/mWIA78CrCA2ks
	DWiBbILg=
X-Gm-Gg: AR+sD11Qku86TEmmiQhiB+9sfUnhRl0U+zXHn2b0r40GeFB/UuBZXr5tzDIAXS4OMbS
	IMwdFZ3ZqnuXrvGO1jYgwa8mBYX8G+T5+cPzpwoy7P7/436NLfjC+hMSzwcSDfpU1/Pp0BrS+2/
	i+1J4aMmtSURyVIrkGNx1gfJtmiCrsvgCOqG82O+uapaeSfHbvKar1Qjhe5TQdcgAx8YkasfDAV
	ICSl12HtuScdePrw3qV2HiSLU1F0kGQYE6eyvOv816pxSeLNtqHFJ8B5DokDqWo+jcASo7EtMOW
	YbSaMhoXWhRsmO2P5Cf1qExNWX8K43Jw9emWrfALxaozcNOvIhPuE1gG7836/rdnMN4nVSnGGOO
	QKSpSLIcdweVJncIU7w7Hh2WbVOlqfoIg8py2sIFEJ7km+KrThWcMETZBIy5TbkZQgA+suX/uOG
	KScvN79bKI00I=
X-Received: by 2002:a05:6300:648f:b0:3c4:2c02:eac0 with SMTP id adf61e73a8af0-3c44b243f4emr2558875637.65.1784798787609;
        Thu, 23 Jul 2026 02:26:27 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:26 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 09/13] vim: Security Fix for CVE-2026-57452
Date: Thu, 23 Jul 2026 14:53:50 +0530
Message-Id: <20260723092354.54697-9-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241813

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
index bd1d52eaf6..567da7be0c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55892.patch \
            file://CVE-2026-55895.patch \
+           file://CVE-2026-57452.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


