Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBC9F357AD
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21486.1771943125672048107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mAR8LEnC;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483770e0b25so50386655e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943124; x=1772547924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RooQNprvAcFKUWFWf0cHF8LTVpsakvZLn1FckxqmMOc=;
        b=mAR8LEnCQK5B/DcKqLVVBu0u6wI7MJ6M4W8CIv3779vz/7MnpkhEwS4frVHlT2nzFm
         ypNUJ/KS+Ky+fZKEudq3fCC9V2l/8bLEJVJHZ1j9VtQAdlPvEz8LKm66+Tm59w5SHM1b
         th48NGLCgd+Wqb83CmgjMlPddX1EKE7QrTcu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943124; x=1772547924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RooQNprvAcFKUWFWf0cHF8LTVpsakvZLn1FckxqmMOc=;
        b=WwfTJNgR/huKwnVXh+ESpI/8tuU7fcineUasjkZ1c3DMMo6E3iPBmKBcmlfC+2Buh7
         lAkw18SOCD4xrkvY1amYqIiRAIC4/svDzew0/tcRxMZq/uNldLJfLsRanOfEr6HRrOIz
         9nMgVvqdNgZoYY6YP+CO3JHiYdVpQ+FbDbRCOBdbi6njD7PhrjqBa7lgArEcWOvZf6c8
         RiVcfKljs6vJ5JD7zz/hFJLnw5R6wijJQ9YYvPJdsrsFRB699Z+BsyJX8PA0Brow386g
         pOEkaFERBwAgRXem98bBGF7VoS9ridromKKvMJVoPJFJMN5gcCrKroUAAx8uvZFWsCZ1
         a0Rg==
X-Gm-Message-State: AOJu0Yxu1Z32VfTJleDlrz3chNt5+Lkmmo4YeXbf37AZRUJeCyuNNMrh
	bCDZNcEusZhza1aM89+5jtce0a6aE1AuBs/y6QtOWPM2PCIb6DjCEc2TuNIk0TiJFbwjpYaXuvC
	fPQFX
X-Gm-Gg: AZuq6aLYJdbQkn3PvjRFQn4tUM5g71yDNOlMkO6i0xSbW9g6IP/i013L+2psa8FJD7t
	I4h2B7S9MPdYZZYt0uSkDvFjyoY7DOgDe9w8mhdzP1vxfYksV5R0r5YUKPPmBZpMMWSayHye5np
	6OVByy58EaqWZ2BZwk3HXYmMaEMUAkYUiPBQzKo1tdAMvBiNXbEJBYjetjjjeb8OUonHLYt61ii
	UWTsakyr9neFap8Q8/Dj+noti/6czXrFTSw0XunL1YybtmCtMQR7LPKqcWIBZbU8Y087lioo9oE
	/PGaPjMECtTbYsEJqlLLtjgrBDw76msyLvXCy4YEccAd91AXvi/OcDrkN4MHk+LXtk4wIN9BId9
	xv7MveZyKyfpRqyU+ali2gHP6T1LiYtnXlEyB/zLRd1GCrnA7bOxCWNMhxZ6dbLnPu3akbPZ9eP
	6nPSJF2VE563PBLDvQQH7yy6ELPdlRLLwyyvW00hR8tCQG0+Qjd1nFA1oF2KDnrYkFqOYtVInfr
	Xfu4xqC9KdSJhXMdveRX2+j4s+f+2K+uw==
X-Received: by 2002:a05:600d:6409:20b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-483a9637a19mr141635005e9.28.1771943123852;
        Tue, 24 Feb 2026 06:25:23 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/38] pseudo: Update to 1.9.3 release
Date: Tue, 24 Feb 2026 15:24:24 +0100
Message-ID: <1cf8669ee78a77d0e10b975ce8459ae7a767a8a1.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231798

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the following changes:

  Makefile.in: Bump version to 1.9.3
  configure: Minor code quality changes
  pseudo: code quality scan - resolved various potential issues
  makewrappers: improve error handling and robustness
  Update COPYRIGHT files
  ports/linux/pseudo_wrappers.c: Call the wrappers where possible
  ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
  ports/linux/pseudo_wrappers.c: Reorder the syscall operations
  ports/unix/guts/realpath.c: Fix indents
  pseudo_util.c: Skip realpath like expansion for /proc on Linux
  test/test-proc-pipe.sh: Add test case for proc pipes
  ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't exist

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 524f4bbb11f9c7e0126e8bd46af217b452d48f5e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index dae4f4bc84a..8130fb21356 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
+SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
 S = "${WORKDIR}/git"
-PV = "1.9.2+git"
+PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

