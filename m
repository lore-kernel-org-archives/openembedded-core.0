Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A5AC83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5340.1752611791941985720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nLRlXqBr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23508d30142so62545405ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611791; x=1753216591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nR6b15jfYo5E0aOMA/e+d7CfC6WB4fzDB0fFYHCK+n4=;
        b=nLRlXqBr1lXoBandq03jcRbYGnlqHhp2v7vzxSwGlwxpuK7mTAiQGlQpV0lPr0j/Mx
         31lANBACXZZXc9ysnI8lUdcXkeb+MJGbjNGiPCepfCD5oiehnEn2Q6MCflGAtxJrkuLG
         uJ6aqJz1nMTWvTTupA9OaPe1gtzEs8IMYNEDWH8y6HSLuGCE4hbzA00QjpT8vU9t2KR2
         OLtf4e7bGF2BpNJH0i7Q4DrNEaI1OIZRjzRdYgcEELD5Ix4PFcJYbbOpjQiFIOSTjaFx
         HhiD5aL+5d2vFhlZZVWWpwDFU0SoUiE38IDU9W4BnBQy94szAMvtK3EZxPn29iFUHyN6
         vWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611791; x=1753216591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR6b15jfYo5E0aOMA/e+d7CfC6WB4fzDB0fFYHCK+n4=;
        b=RmK1+HA5hPJu60hHp5XMiRNtEsbDUshtsDbshDqbS+ZpoDfJg3uBDmC5pwASinZNKB
         RiuqOdEAt87uYFb8veGa+FnlTmlnSIKPKGZ/xOawQQhpbJ5ooRjHlF87fAoLYXP+OHcy
         UvlA66Hbr3s/cC4V+RPj4FZdnrKbkaRFxTCzV8wnVC/MfpEVcHQO+kxWH3Vy/OPY2O5g
         aBg8blZlMUPa4n0bTLxt13XECBAMc2NalzlnONDlHKJMC4R8WBVP2lwXgXBv3vr9rRXL
         xpF1dh37h6YiskPHvbmHbvUIflg2+RyIJVuE9kHBNx476Q4l2N7jhJaWemDiqWB7VO+C
         s6eA==
X-Gm-Message-State: AOJu0YxODBQULpk1uc1yX85OLm/Qt02u2+YEnMTylu5/H75Cu26yTL5O
	EOEosZ7AFKq/PWv/6WFsc1qeTMfrffLTZiIwSp+wl/KhTPVgWTxL41gQV0I3H3h/05YoxjXSCAC
	HnqaE
X-Gm-Gg: ASbGncsW3kA+8ffQL/7zHHwKQfAEvGgLqCcL15Nevs9m3jFWZafy+17O1XVOHUCvjQF
	rEoVUuCUzy0wmbwC/udITj9zmcWXCV1w1uvigPKIeq1quEar/d5iRdYiw0yG4JMYdepTSnPxdmm
	3ZrCYtUWXqznoEFaXC44gPLEC1ZJQxTcIOM2ad51nOpkDksCy3xiIwpOzzIMurQxmuvlLDEFcvb
	MABhWbosFdGpz5oeWV89JnMxVARK6344RFrcfPZZJf8GQDdzjKFLeMc+HgUf8REAu9LVGwdzc1E
	rX82OYgfeITzbtdYMouB+7x1SBNFdISP49Rk/SIeJw9hC/n6AePh/JSXS79ss9g7+HQ1jbAx+U0
	mg943RsaC9rhPiA==
X-Google-Smtp-Source: AGHT+IEJL718QTV6LnUKxOouZdCHGWju8YtH2oweHfGqg1arlKtlWxJx3LNn6Rma/GrbBObyCe8Ytg==
X-Received: by 2002:a17:903:2412:b0:237:7802:da30 with SMTP id d9443c01a7336-23e25729befmr2091555ad.31.1752611791154;
        Tue, 15 Jul 2025 13:36:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] openssl: upgrade 3.0.16 -> 3.0.17
Date: Tue, 15 Jul 2025 13:36:06 -0700
Message-ID: <678f4f98f145c887a220b846babc9648ea6ff974.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220414

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3016-and-openssl-3017-1-jul-2025

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.0.16.bb => openssl_3.0.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.16.bb => openssl_3.0.17.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.16.bb b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.16.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.17.bb
index a9fffd18ba..5bc8801b98 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.16.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "57e03c50feab5d31b152af2b764f10379aecd8ee92f16c985983ce4a99f7ef86"
+SRC_URI[sha256sum] = "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.43.0


