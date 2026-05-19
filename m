Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72865CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1021.1779233444572736263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nZ/Kbbrc;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490229aa522so9065455e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233443; x=1779838243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SQutjT6Kj1LbQ1z6XYvFMbgjD09nVFJ0GOZONM7QU4=;
        b=nZ/KbbrcgjOqSt7stxA0VK2jxtzcxjAH8ARhlfMEfcF22VCvvlcaYJ0325khwhmtjG
         o+LP0kIi22u8RIyHdXeLYLa9WZ29l1Eg6kTJm+84qSYUTOfy46HW9LPRrgVVZTo1EFKG
         o10jJHLaAkvmvjZmkHIJ5XcVgBoq5RZfjdys4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233443; x=1779838243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SQutjT6Kj1LbQ1z6XYvFMbgjD09nVFJ0GOZONM7QU4=;
        b=qUNkbnHes646KbT4MDqbNMU4EfacDN64WXJVoFZCXZbLYCLaxI9cgOae/2eA8Eiw9J
         jvWoytp0dz/dY+yIW+d5sqU72TKU8Andl6T3Y9VyPc0lGFmlSj5dn7zJulXKqpJ3dtz0
         32fEpv/V9dH50S3/4/RB+LqiFziLz2q0sNobdZKF/P3zh7Uyzmur9cKduGH/uSlojAOb
         4Q7gnysyZwTF3eRtP7aQGzOY0UXiAXGtYqWmpXN3Ye43Tk3wJi3XnsFBApNjww0Pgqoz
         H1xO4wMguUjbyQgEaGccBEeS0Y648RX+LFfprtaNQp3ZSkXOZt4Jnz+JCVBOUIzDRtke
         ttgA==
X-Gm-Message-State: AOJu0YwlSbiJLRBBKDlzvhdD80uNYEszyuCjjNgKi/xEeBKPCvgv+7dM
	EtSMnID66vE6aHnsYxtgNUAYyLhLTaLf2JSmnbyz19pC//2tEBsXK4EI9q4jzyP8o7BUOpZTElH
	ChsSU
X-Gm-Gg: Acq92OG8Q9FjXVuos0MI07HK0xRIlZ3w9sLF3Tm8ss5prQ6SsnfZ6Uu0hHmqpXEzI06
	GrRDzYIoDVmvNz2wmKshu2GyliiWBDzNzbu5O1qx14u8vSPbjZJMLl4VEYHe9JL1R33Zn41LhcQ
	hmK+Ns74wtWR2Vw8UeOHybnmTrIh2pHV47oHtogNeQzkbupX7rQ1D1dcIyVPlSouvzzuEuk6c6h
	47JVOuXDZjk44SPSz9SKCDPmF7CJRMljcOpMouZu6zevKqWkjAvW4Dtf01nno11l/Q4hFxY1eGZ
	1c6MLiEB5JpwfXQyiaX87x33kMjant2TsHVny0tk1JJVORHEr04ZIerP3PAXj9lXQpVVf4hQtvy
	f1uRVrxpd3dYpMK6rgOORXrek7v3Z7oU/oRKj9M3IAXlw8XXkx1nDPpTlOER9JG3IfDNSRIRbBD
	NZyi/F0xLfs20M7wu22Q7Gq6es26FsBrJOo5064AGqSNZyS2vXbhr+KcKdSDt8lg35HwU2Dz2Gd
	TWqK1YZbLLgBYIdYw0qr9T0IvgdQ3OCYJMopw==
X-Received: by 2002:a05:600c:a11c:b0:48f:a75e:c21 with SMTP id 5b1f17b1804b1-48fe5fcdee9mr248507315e9.6.1779233442803;
        Tue, 19 May 2026 16:30:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/28] pseudo: Upgrade 1.9.6 -> 1.9.7
Date: Wed, 20 May 2026 01:30:05 +0200
Message-ID: <410768131f4a95394f91cfe32808f56c99c660eb.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237375

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

