Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BCACEF162
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 12:27:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7905.1728390437830382883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 05:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QdR8C2VY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37ccdc0d7f6so3581648f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728390436; x=1728995236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WNLPS2NhWErYZA/j8o/67ApNBc9udtclAAnNl7Ftfo=;
        b=QdR8C2VYuBqxeZE4uKftbRvnK8YHkpj0OnUb8LetbQFU4tpeAUK0gsnOwX1hGt6Pi6
         J5kJrpKFMqnCEl/8mbEU5yOaMScEpx4ZZ4o+aQc8Ro68kcXsyJKYH4wJwroGo1bS6086
         FTWwR9L/BZXl/vulovTf0+uptPIltj5C/RBw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728390436; x=1728995236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WNLPS2NhWErYZA/j8o/67ApNBc9udtclAAnNl7Ftfo=;
        b=ClugOoD9+3oCimOQq/A0z2S/UpgMAK2R5KRKrfDlnugbMwzXok4BZJ5zS5dDi4QtIe
         HxlWuT4JU3W4fwl1wl8nzUqkw4LrqSETlPJi/kmYcr5PibsiVG3+B7Hafh9kj8Gegjcb
         HOwEdPd3mMETnZjzB1Xu2ZTYg8ub3EEdcpFyjAJbM2xX4lPSic02/2bF/+PpOtLijHaL
         OOrv5guyyi9KTBqTFB5YwA5uQotaxDBl/z4lCZfHuK4OExqwxmPqN+RBxKhPNVBxdio2
         TuvO6GUkiJnQpeo2+uuBtlvoFlBRhJJvhmAUaItA+sWuUjBlbzYo/Me6azF+AzCFJacz
         6QUw==
X-Gm-Message-State: AOJu0Yy97HCoxqVv5hmD7KEPI4c0aCVQN9yi+Bfw1WL9q7x1+i93Y8R0
	D4IkgqzqJ6Y7soDRhkOqnIQRtsQSyXOBw88mF1DhsNomI3Z/do6Ro+DK5stFv2k8AtG8x0rdwLX
	2
X-Google-Smtp-Source: AGHT+IFrXNmiA/kWR01SnDAv8DnziRXxlIToYzBmABH8R9CoBXWUnzY5bsbY8xuEQ9kSzfPOp88HRQ==
X-Received: by 2002:a5d:4d44:0:b0:37c:d227:d193 with SMTP id ffacd0b85a97d-37d0e6caeb1mr9156671f8f.10.1728390435399;
        Tue, 08 Oct 2024 05:27:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f9a:5ae5:8636:3d57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b445d2sm126172795e9.36.2024.10.08.05.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:27:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Fix envp bug and add posix_spawn wrapper
Date: Tue,  8 Oct 2024 13:27:14 +0100
Message-ID: <20241008122714.248948-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 12:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205289

Fix pseudo with python 3.13 by adding a wrapper for posix_spawn and
fixing a NULL pointer dereference in envp handling it uncovered. This
fixes issues on Fedora 41.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7d8f71f65d4..87c62e06780 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
+SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 

