Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C005CD8C87
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6279.1780698870076973152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GqYYypOa;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b7866869so28568985e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698868; x=1781303668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgJ1Uee7bmO7qaUgGzg7CJjh0JlKlH9B19SRFAy4830=;
        b=GqYYypOa9oHvSaDb9z2s0HgGBbQACT+kFtKS8d6q7jg5xV/W845rMdcv2Wbo4PJzX7
         q8pwm1sTtvmm8DOqL6lskwf4NfSOpQFBPfDoasz9HIdGsjHE09f07Adl1scTzkmBnftl
         azr8//fXVCDy2CbZIpyHM/F+yB52CRumeQm6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698868; x=1781303668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QgJ1Uee7bmO7qaUgGzg7CJjh0JlKlH9B19SRFAy4830=;
        b=q++IJ4NkNr7yncE1LnoNQUBIoCy2mAZkXh5xOvbGuZBCC5nYvkTlLrjoWBqPWcVOth
         LTvHH13YewakiHzqktEKZP9LomWCxAfvikbqynobgcP5oKQt1X4jkWvJDbDFDbQiHwU2
         OBw81TgZjBCYi9S2DjDIm5qxzMkNXANxMb9J1D/59K9GtUPO5b2doqVaGvBJ1gY9Etw0
         IbKf8Uui/V+zPHYSLw+S5H1FpMJos1wXUh7nixVSP1SmM9jcUpCctLV87kOjh8BywaCr
         4yxaXOJugADr60zIp/8oPWMLze6yAM9/DHY0kogVzPDoa6HRI9LedEanzGzWrEIHF1zI
         uB+w==
X-Gm-Message-State: AOJu0Yz5yuY6yczPZMWiNSseuk1pdWmeaFAGMSuzj41bYWesXoluxY5E
	bvW8gqglcodDqiND7pxjMd7lzqSh6IVEJKbJa9kn+KCNxvCPn/uO04HI4TuUlEJhDBojjbdwAGQ
	TT6uT
X-Gm-Gg: Acq92OHdsRDLyVC9mkjKSHHBp1AJ/zYGAlESoQArD7QB1B4+VhKzUrpkR6HfP9GpJw8
	uKkM5b+o4rP7XXoFPsYGWfoXreFagsAGV7Gk0AitPPQyiDAYQsWlZV7S5G9rmdpD1DczWr8wz9v
	Aa5PPddGAPk24vBDK2iOW6WNK9aoc39p7TIPef2Z6hAzPQ5SUfSjV9RcEjd8kz1F3Vsagl3c50M
	XDL3Ik5gvRDkD3iyIBfJaCa9N3dDspQsFEQnifRLtU8thKX1SAOz9d59vt6kMiDINoKI8uz6BSd
	RA66+lNR8kP1brjwWmTC+zwmdGadoTIZccFlxyKEKwfFF2pZTeXOH/kkQnTuPqRjO2VYH/vUWZG
	3r7qH/ZjlH49IebeHDTfhUHgIE3N3qhtgxHTSiXhaWXse1Nk2fe3PSRTFbw0tlJf1Cttax4pK9M
	yGbCyXIO1sCk4sPXQioRjMXx0BhmOerY5W1b5HuM/Px6nJMBa7Hqv92JPKYKxhe1ZLx0R0xYX4+
	h9GPDabKQCXL5YwMlCdZ84ZwQwrPnR6NsfZosw=
X-Received: by 2002:a05:600c:5246:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-490c25d800dmr91596405e9.9.1780698868415;
        Fri, 05 Jun 2026 15:34:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/25] pseudo: Upgrade 1.9.6 -> 1.9.7
Date: Sat,  6 Jun 2026 00:34:10 +0200
Message-ID: <e2864ea1ac022e43af92badc701fa1e2a9571f46.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238212

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
index 839b68d1b72..1ca1ebd6bf2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "7109ac1b417cd31e0100f6e1c4f3e5743541b9ed"
+SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
 S = "${WORKDIR}/git"
-PV = "1.9.6"
+PV = "1.9.7"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

