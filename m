Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3A7CC6B07
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9315.1775107336033534554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d0zW95XD;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso10085965e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107334; x=1775712134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mwunJAmHykz+auJaEzaPIz9nFbvmPP0XgQ3ujZ5hbw=;
        b=d0zW95XDjEqii/gXRMZEOsaFhFxJeXYkY1taVWtnrpICDJNvvcbseqD7kWymFTfI0/
         d1NYYjFreyWROgDtYZn8zNU/QlkH+VgUqgUwsP1GpFW/pxFkzfu7GX4UmpGvsI+DQYMf
         IS8szbtttnFTnDymd+VfTqQjBmVRJmr0IaqoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107334; x=1775712134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0mwunJAmHykz+auJaEzaPIz9nFbvmPP0XgQ3ujZ5hbw=;
        b=HBGKUtN46t/RtjC3bQTsSsU71z+RawmXDFQ6dKuulLiOOCDuggftnSDuZrLC9/u62L
         JxdeWgsDD+i3plKCrdEQIFxzE38kYNR6NGoY0AYHU1wnon/J6b/w7qRjQF70+rRytvFx
         S+RYt7xhw/roLTWFNijBEogyknY2fsN/G4MJZazu3vWNm/s2/T4dFjD3NX1oOwxKB4Z6
         QUzwq7Mpsqa4X2RwomTwjMrMi8hBBDtvDbGzlORjmSfsaF/ZBF8/sl7Cinnwfnhqxe1q
         yRrAgaFUH+DiQ1YdZPQh7nLEYF2JgQGvA9nsGJd0A8c1z3p/xi7xRSofJTsyVhMHGClK
         DIcQ==
X-Gm-Message-State: AOJu0YyzLLsSdODCKdvKrySKLfGaXkPTCExC6OnSu1YWPJATh2M0UPWZ
	9jTzh9eLW0ta43uBkfG2feChzYwpAWOflFycUjr/8uV5wCdOyHgpYC1dKjExHLluQmmNyG7i779
	ZaV2K6rI=
X-Gm-Gg: ATEYQzyfi98xbi3mXm91dnx1pIH9thPtP28YNmaE84BIxaceAWiFjy5B6AyyujFy4qa
	Jy9WOm26PQWWzafwLZMMCXS4esnGGma1JTvT13QPpOc8QgTEkmFvX/VgZWHQDOZEn4zqri5GY20
	GesfWXqSyCnF7ldwy5RDUBEGz0t8WXa26NvMDogfqQtEl52XsB9uu5A8WPaIuxNjD6yfJtAR43s
	V1KOUA4chGYkulRCudEs7URbnai9NFUvDp+mZQ11lxKW2QdErewSX3LySoU8ZfX6KjDrzdt69lp
	sHYQqSPJkOREixTPfnYjmJoRr1KdVjFUVtHUy3zUJFYGJx0dsZuScHh4ocrI8J5VPn8ewVSm8We
	BF+tqzJM8Dc4QtPTPmxeAwlWD70JVLOVBZ9dpHcRD2KZkSLRiJHFCFqevMle6hJV4dSuIa/G+CA
	5peWfkQxvxGGia81YrSxIxtv8KrJtFWQQ7DlqCA7ujrHy7RIsElEpxOUrH5A8wZM3EiqV0zaEXX
	HyEFyGSUY/N3UccsrhPOZxIcZvNELafpO5VIA==
X-Received: by 2002:a05:600c:a405:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4888e078f42mr12566945e9.8.1775107334127;
        Wed, 01 Apr 2026 22:22:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/15] ca-certificates: upgrade 20250419 -> 20260223
Date: Thu,  2 Apr 2026 07:21:24 +0200
Message-ID: <8c3981fbf6bbbbe1b54ae2a57035ab786e6b0595.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234479

From: Andrej Kozemcak <andrej.kozemcak@siemens.com>

Changelog:
 * Update Mozilla certificate authority bundle to version 2.82
    The following certificate authorities were added (+):
    + TrustAsia TLS ECC Root CA
    + TrustAsia TLS RSA Root CA
    + SwissSign RSA TLS Root CA 2022 - 1
    + OISTE Server Root ECC G1
    +  OISTE Server Root RSA G1
    The following certificate authorities were removed (-):
    - GlobalSign Root CA
    - Entrust.net Premium 2048 Secure Server CA
    - Baltimore CyberTrust Root (closes: #1121936)
    - Comodo AAA Services root
    - XRamp Global CA Root
    - Go Daddy Class 2 CA
    - Starfield Class 2 CA
    - CommScope Public Trust ECC Root-01
    - CommScope Public Trust ECC Root-02
    - CommScope Public Trust RSA Root-01
    - CommScope Public Trust RSA Root-02
  * Use dh_usrlocal to create /usr/local/share/ca-certificates

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 738e08718e31de19c1c8db5e162a4a00e2b0c0e6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...{ca-certificates_20250419.bb => ca-certificates_20260223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20250419.bb => ca-certificates_20260223.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
index a11433c9daf..41690d1d088 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
+SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

