Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E155FF8845
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31982.1777064219030100877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ULe6zXkA;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so135467625e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064217; x=1777669017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/K38mJJ09qxqUWvl7pztekP2LbYzB6UvwwUe8d6IKI=;
        b=ULe6zXkADZTCuNfx+zEVa+4xGUIYTwOEvE7yO+XusEJZbOy2bsAHgXVA5g9Q17ao6k
         bERzVIebtcF3EXVATwbz6oAqRU+qu+pekOB3/iJbPHAX/NYROPbyenmjPQ6x4Wc5a+ar
         VOle2li/s/FboSTk0IqqdjZVUlRYnqHPUL8ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064217; x=1777669017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/K38mJJ09qxqUWvl7pztekP2LbYzB6UvwwUe8d6IKI=;
        b=OAt9e6awW8DeU/kB0AMxtvQA2npaWwh/+I7DSRWF3PYiudkt6RUYf/QituyxAYVX5U
         x35oIAIqI20sxJL74QuDDciQhZWDPKdIWswrQRE7xasAgRYGvIgIHH6d26HtQU+W6MKP
         W7I9BihCZUb7gOQEvkxQ3rwF2u8k5F6RhXVwfLpFkk7y6e0dsiXEYfnRMo6rQxHjQz4c
         0O+pvk95BaSNuUODmma1EMsyo3PhQAD/icRWaSIHmkMtnmGvXW1qfo3ZdQO4g0Em7fRg
         L/umFJsq6/PFHd5uuI8SiyNCo+emOsZMFYFr7tsP9TquLv+Bs9z6uEJY8zpmkDlsxFCM
         PQPQ==
X-Gm-Message-State: AOJu0Yz1D/+zKaxyXgJiTUtgDqJf+LnDj0g2u+s25SIjG4+gUv5a9Trj
	4mzg4QWLaSVkARt+R97G2HCxGhH10udgb87xpBRXp7Zxkwe2xqcK1b1pMeYqOPQCrYdZhlzBYzO
	kbsU440oEtXg0
X-Gm-Gg: AeBDiesR1YYlXz1IKlB90SZp4B7+JMZGL7wtDFd+lxw2+SpOxHBYLBYu7L8eCLN2B61
	M50hjWuBw+lyhPoioEyJC59glBsSCltA6EyEsHAWtJ8iPyeBCwnGnAeXCXhWcRUr5xk4cq5sde1
	UHexE/ybDFf8eAwYAvVQgaCTCZiqYpd16pg7H8YaTwQ5ZdxrUq32abh/Ga3739bZZf4AqzNJ2EM
	Xb+KXmXky5w+Zeyl8F1rmwKuhustmWawIo+usq6TTClApSJWpZ9b6ck1CNppZHXWXUdR4Q+T7Q4
	7lpH6Fivf6dwAxahyO1iOzv3pULjuGwnNG18FqnzSO2F36nXNaIQugzUztmBr9EJFFxob2BiLUs
	kOh1XwHPApKUt+yo1FEJdvne/W4SnLTDkk6yA/W9Cpiai3gRuAAlFjDIKDCgu4xEstTeNgCHCAz
	cEApY6MLPzvWInPJy+wKej2J5NClAGa5bfG7dclXobijlxr4Fj2bUfLqbMmNt1d3kUawrD8oQT0
	Q0r9yN90d1V/c1CSeC7aMKCseP2F7bErsJJSg==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr377538145e9.8.1777064217095;
        Fri, 24 Apr 2026 13:56:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/66] ca-certificates: upgrade 20250419 -> 20260223
Date: Fri, 24 Apr 2026 22:55:35 +0200
Message-ID: <219ca927c9cd31a200b2ab4bed17937af4e5afc8.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235909

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
index 01f594095e9..9cf6d5afc7d 100644
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

