Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85859CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7389.1779265285129619272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M6C8bj48;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so3701609f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265283; x=1779870083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SQutjT6Kj1LbQ1z6XYvFMbgjD09nVFJ0GOZONM7QU4=;
        b=M6C8bj48hJccJ2IeJwi3Irso6coJSPL5kvgCX1tCMRqkD5yptkBJaDxFtJigyNjZ/X
         lYGKkhv2KGvxxWb227iGMvLsYjG5n0qDwuXXckUnNExfcXrjqP+frfVMP0P28XE5Rzce
         vP1wJsOcw5SfhDu1v8ns1rzNn6DrbCAEfBnPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265283; x=1779870083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SQutjT6Kj1LbQ1z6XYvFMbgjD09nVFJ0GOZONM7QU4=;
        b=PJj+NyHvK32rKI9k854P+Vb/tNwt5RloKKHVtFs6WNn+Hm+BvYqiMq6hsgxXXlkerC
         LtBzqn6Plnho+bRpMfZsUPQ0189fUfIa47v4Y5yZCRE9K/P3h5Z8GCa2ily7p1YLmLfD
         BIegxrJONswB7AQy3nhCotQekBJlpoZXsNGR3BPFRB4geXUFv86ytYCaeQC2Dv99CEa6
         9+MZ2Tsq98paAPBBdY5khQW8qRsc9kNwl7LyRgQzrwzvcpepxsJfN3Wrc2TAuE9WNAM6
         A0WdEGjy0Qch++4GjW2DfasqT5Idz/NW5dgCbKGtI7IsFp4pHnff/87Bey8b35ggsl/M
         MTKg==
X-Gm-Message-State: AOJu0YxOQ0sbj4twtnISpweyMyXjm8oDfvH0HWnrQrPrdv2n6k84bMuA
	vaCOat5d2/gPFCL8yZ/6Fr0gBNNvHTKqUQd11idKHjPtoMQJLcyn4py5Fmc0nZauP2FqhzPYiRx
	MFOkI
X-Gm-Gg: Acq92OHHwx0qp9F79yj42Gehy6MWZMVwDtsvQdvukXWnVZFD8o7aRtbPYPNHNoeoYqU
	WEoHInqg3qiuov1Qhp3KSiIEHEi8eIuO/wbVW1a9c++HquKOa5VyYpUBsbxYgCAN8PhzYm/9dPV
	jbdJCjWPDSZnLBMUCjX0fpCahoNl8/ntFihDSkepEnYtD1A9sli/y7RnsaSubmdc8LE/73ANueU
	l38FsiV3TKWA/JWjjoBpQPOBts0eHRH8GvaqxjAvgFlTQWGId5QvVt6DLtftH0qMcEkEp6wd3+i
	Uy7V8pQ2dIItkpkVtyRamr3F/wBLj330riY5JJIxuNbX8uw3NWawkL2fAvMpO9MNyxiasY09vGc
	ear6vaTvPyxPRQ7WdYDBcV2vtfeVkn8oTdtNYowmE3u17Nh2fmTf0Ugxxx2S4h1tnT6Y31lsxiv
	UDb3411DSooqoH488D0mL4Q5Ap7/NXKjB+a2YueEkmlUNJk3VkXuph1hgJK2oHqBCyJdGGHamqP
	GmiIebQ3/rzcPSPVXzT3+VKgp8K
X-Received: by 2002:a05:6000:4308:b0:45e:8ad3:86a9 with SMTP id ffacd0b85a97d-45e8ad388bemr10045930f8f.8.1779265283259;
        Wed, 20 May 2026 01:21:23 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 28/28] pseudo: Upgrade 1.9.6 -> 1.9.7
Date: Wed, 20 May 2026 10:20:29 +0200
Message-ID: <42adcd87a15f5921f0cc95424efd930876743824.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237427

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in fixes to rename/renameat/renameat2:

Changqing Li (1):
  renameat2/renameat: only ignore when both old and new path are not in PSEUDO_INCLUDE_PATHS

Mark Hatle (4):
  run_tests.sh: Allow the user to specify specific tests to run
  tests: Add mv then hardlink testing
  rename: only ignore when both old and new path are not in PSEUDO_INCLUDE_PATHS
  Makefile.in: Bump version to 1.9.7

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17567738711d525d9f2b85e54ace2048901e4c34)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index b118f436db8..22bb938cd1d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "7109ac1b417cd31e0100f6e1c4f3e5743541b9ed"
-PV = "1.9.6"
+SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
+PV = "1.9.7"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

