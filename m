Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C04D5C0D8
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.14505.1731077649497474822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzEazcC2;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so18827825e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077648; x=1731682448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stPL6uSxbEgEu29Z1y6o8A0aQJNWDe5vPfiX4PLPQWA=;
        b=XzEazcC2vIi+r7TfBNuCnk2Q/58PzHnQX/DUQWMQRBfr3Plb6XhdxXnmVNVOqVe6LP
         sqDNhOg84aqm+c2Y9L/wBti9ot5Pmz5WhO2hPtyvRZs3bRXbqAyKCCVOGMRJkVnW6ijl
         uX491q+1RSL4Z33TztCbMjrVJZQ8kooMsTBcVZZbejLahsdPSpsO+Rs+ipp29Mq94rls
         zSiA1dhTKWccHPpJc0zWzKM88tyegrmsTanOXc0twI3bh2GmbAehdt7hkyi7Mje2YVMj
         RggoNtxoHl0g1pvUpAgBPz5bbxfTj/D6feofDfZWyc5D2NgkhaRzwrkrn9H/rJTYQlHk
         77xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077648; x=1731682448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stPL6uSxbEgEu29Z1y6o8A0aQJNWDe5vPfiX4PLPQWA=;
        b=k3cy9TcOGUD//EZAHaMi02pN/pGDix1u4rlOINecIjFEkDY+LX2yfcR1IITuBUuKL2
         nlxzOk0sIJmmb2uMZv/7aethVdBj6yr4Kl8zW8Ly4ac3NiGdmjvd5uSGSezsRUKCzHsI
         +5h8kC5JudQlP8Oo2WSRR9R0zmjsEVY/IVbUDk2FspEfXoMyONVHMMPIpVopT2+S8d6/
         wrn8DjZSkz7FaYrgpZf4kabi2r5PDPXe6xbxAekmM10nFHnpKXukcshEJ/9aar1udS+X
         Ifn3CIhJ97zaFU03bkNJ8Es82mbB0UI8NIP7EiAEIMB+m54+jRp7rZ5LpRwLpTzocMsk
         es/g==
X-Gm-Message-State: AOJu0YwrfgGJmBuhEkv69NnbSM6mxMdATiwuHUBSxNYXcaiiBV2GT/K2
	MWUCfn2B0oRkeSh1AVgB4ygYBOzI86xAO2chzIJxxTlHmkGg33QoQqE9uw==
X-Google-Smtp-Source: AGHT+IH9sHMg1yecEZwWdW1o8JPzNpkliElRDymS5kmXpr2F0RhqiH2oRuQYmhfH+KAAGvSCBc7SoQ==
X-Received: by 2002:a05:600c:3ba8:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-432b74faa24mr24819995e9.2.1731077647730;
        Fri, 08 Nov 2024 06:54:07 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054a5ccsm73133295e9.11.2024.11.08.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH 04/12] pseudo: Update to include logic fix
Date: Fri,  8 Nov 2024 15:53:28 +0100
Message-ID: <20241108145336.224466-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206878

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The logic in the previous commit was reversed, update to fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index f40ad9f6f1..d38c9d79c0 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
+SRCREV = "9df045968d739ead0bebacce415d05269694de4e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


