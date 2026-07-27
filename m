Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B6DC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:20:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24932.1785133245629802987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GKTCDk19;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so29185675ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1785133245; x=1785738045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8ssfdKECoKCR1PLLocuG0vKVF3QjDnK+ITIC1VABm4=;
        b=GKTCDk19TNsIdrWxr0diEFS+G2Gdnye0TvtTeUtgjj+84QHp9YDGKu6ugFY4rstawg
         85Pzf1bo53kJBBrlLmLAkilNwy+Tbe0SBw2KTQ2MoYdpxKGNVfiaOFvjhUG8F0KEWsAh
         nrJvYByoBQoGFulMa7RuJ9p23lwRI4dErHE2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133245; x=1785738045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8ssfdKECoKCR1PLLocuG0vKVF3QjDnK+ITIC1VABm4=;
        b=FnuxCsQ179wQRSVFgGS2DS3tF2xNQN6875sD8o7HX9zrdGFXN+2q82Z741XvxCA/WR
         qmY9h9KKganmeIuBD3AnMI+VP12nUPrj4Eo26oftpy2u2yM8TDadtcGcepq9IJU3JRJL
         xr4IoHqf7YMpv8lpTRGcyZBw8RGGTfVLT4b9Z8NZ4cblKvln+fRK9ChiM5mrk2bGZ6rg
         zcFwNJHqoX/oheAdCeYwEPh16HNXd8F5FlU8hapnGflBXmG5p724x57V1XMzmXz8xCDO
         Di/oGde8swtUNQnDwYc/PNcAApGYaRy+vRgDDJZSzojNTJ4us3Y9TtpI24EgjdcNB2B3
         KKZg==
X-Gm-Message-State: AOJu0Yy8ZF2rI6Gtqs+o4FfilCU/5ZtTfrBqtfglunmsiVVSS/6ZW03e
	zteKT87m0cXwK4s+yC6yCQq6HJ/aSchggOlmLSfNfrtM3TaAtxfWHuIrgFiTLeyO5alIzm/00cf
	sXL/h0PE=
X-Gm-Gg: AR+sD13WG2HRRi5L6EPeqorRVqqhkoJla5mBEJpqD8SiHxvzVjs3L16bTnkXM/4BB0+
	t+1kSr5GYxxvQ8oeqphzn9tMKlg0SRQGlo4msmgtu3hwjYBQ0gf+L5Wb/IUGOVAo11misC04aic
	fdL6oinyGiaiZk2zQVnMgedA2E9XcBYmaCZWzo0vfPkMPjGA+d6/q1vwCXVjmIk6sNjws7GtKtP
	7d1LzE0iHSnDTWswf3twj589Vd04c7DP1R8Ty1LVNGDWAX8Lo2YWpzua+SV5/mvS+wqFzF8yJGZ
	eLKfqUVK+GIPUDuzyVDphg+MD9hiEPoyeIfh6gD90s4hbkwQ9HHCiYRo3eWRXbTi4BklYD6i88y
	i/IBr+g/L0Q+aowEFsBXyucsebasMmTiodjuTbXSc7qSR1a9et7mKUv+VpVEz+XhybRVkPQ6mC5
	SMEQTDiHl0+9rwvD8xOwl/wMs=
X-Received: by 2002:a17:903:1845:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2cfde78b647mr64257845ad.10.1785133244954;
        Sun, 26 Jul 2026 23:20:44 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm42733554eec.4.2026.07.26.23.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:20:44 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCHv2 6/6] vim: Security Fix for CVE-2026-57452
Date: Mon, 27 Jul 2026 11:48:17 +0530
Message-Id: <20260727061817.8586-6-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727061817.8586-1-sdoshi@mvista.com>
References: <20260727061817.8586-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242037

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
index f423e4d5cb..20a5f7a054 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55892.patch \
+           file://CVE-2026-57452.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


