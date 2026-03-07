Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D035FC9EF4
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 10:42:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6975.1772880171248292819
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 02:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UMUBvTOM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-480706554beso110023245e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772880169; x=1773484969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIohpvrdNjXShAn9WCpBEL3HMqOO19seeBCA0nBhTnY=;
        b=UMUBvTOMl/6ErUqZFmoPjeMLEOq9cal8GNFLf8S/jtwPZQKotkLVln7GW6Ka1tAk2/
         4F475S0ePWmMpR/orETxoxGI+RCESvauMGXNbX+HqPyuMixjh3YUCRD/CirUJxP91bon
         GAO+Zzkiv2gjmFRpdM+3CuGEag2I9qU9oogvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772880169; x=1773484969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIohpvrdNjXShAn9WCpBEL3HMqOO19seeBCA0nBhTnY=;
        b=QrieHLMS9DRIYDmGSIIa9JKHwNCmuSrZzrYRfNHsI/f+dMwy5ROLRHXBOH0rcZC4W3
         0Ht1SKndPxMAi15HvQ+dAUobmSlkJABkrhAj0qOvNAR1g2+/yeeCKFWZ/GQ2XNaoalso
         kHQAyQ6CGj0ru0nZ8ExSm4sVHS9nuWytGu6dB0UZZzs855dsjxMnOjylhB7BqXQy7E1b
         B7dBKqb3XkJMk8YIUNZ7bXQ6VT16Ms88Wd4aioqrtfUcPIgfKUPRrrxcnAWsgbUyywXW
         Yia7ckFxkTTGunRP4+UTmwZJ9EQ6KwQ0IEKnX+/TaZbuptouWSdUWo9sReYeyyRefQFp
         l9Eg==
X-Gm-Message-State: AOJu0Yy2StcZgPSGte5GSD71+Ew43a3EVpjWh5lIK7k98xxV48TqefdR
	FADEXvfMeKuXXR6D4/WHKztzXfttg9jy+dmaRqiAuYqkdhDKBFMIu8RrxzM/Df18nMsd6SRTdOs
	xBV9FEn8=
X-Gm-Gg: ATEYQzzuYlTIBw+r1BtdyAW6cIHspxkFsl+GopWlkg4UWe2W0WO8yFyy3Ncr/D3KqzS
	btiyP3mhKTK7dA6JXk/Fzg05CfSs5jSuHpfa4j3/IdVat4J1XjTGmZ1Xky0wJKIvYcpk3Xsnqj4
	0ZiSXfBbxyVOrDktlyoikpZsIhxWhENZKd5Mu4CYYZ3FO9PNmv3N3ZsWvQoFph0SdBITOrYekra
	NyJc1683t9En2b7HZTZBwmNHQANwD5rcka7yDMaD0rGlNx2fFbpa5aIbW/p+J7Zi3XK0rFsDyLH
	EBfXaujVcpnaATWiq4d2EvxG0gNzCurL3PASLlPSjAMXA0EEOV/21btRNcGtAn0DuDQylagmFFj
	0ScETvqzToYdDnLRCLbbmKBS6CjEhVW6COlbK/M+uOewcP75pgiH2YDj8iSFCHkRYuOqfNxgjVs
	osMhWwZZTrIGuhdgc8ufK7XZscxkhK7AZJjN+SchD+H5sRf9yCIxg=
X-Received: by 2002:a05:600c:c088:b0:483:a922:2e8d with SMTP id 5b1f17b1804b1-48526919884mr75386715e9.4.1772880168948;
        Sat, 07 Mar 2026 02:42:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm11386869f8f.7.2026.03.07.02.42.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:42:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Add fix for glibc 2.43
Date: Sat,  7 Mar 2026 10:42:47 +0000
Message-ID: <20260307104247.2590798-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 10:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232609

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a26a205a160..4d316299033 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

