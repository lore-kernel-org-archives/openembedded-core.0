Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A60D5C0E1
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.14520.1731077675836222789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2uRztyI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43161c0068bso19680845e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077674; x=1731682474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNH2KToyEwDdUEkW4my1353o+EYdf8+63thn5D/PqXU=;
        b=S2uRztyIO6l4OLpDinH1KYAihguWWpgnCzi+80K4QJFpjR9Aezorz737KeuTIpFFYs
         A/YyRUk46NjgypZGMIlg62AtS0zVyeVfEPXtVOc+DAaLcK02lEtqZgi6S1XykDaoiNfR
         8gx9AGY1NljnMePXZFOiI3mi7hW1xN3GAJXXQkGAvhP/SfbXMk63Q/RBj2pGT4fKuNV3
         8qMMjmCnsUOccmIa6bPPHohth8WacPVBNAvEcmCJrh7q2X44hkGQ/VfEY8D9AD9hFcpK
         x3ccy0puzXMmDdQymM2qZ3Zkg5ZENr9Rb3yckkmaJcTJ/2NxwNAu0a+eWksoRYXoxL6S
         52Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077674; x=1731682474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNH2KToyEwDdUEkW4my1353o+EYdf8+63thn5D/PqXU=;
        b=X2jrRdjkWOyvZRdDLUD/Vc/AeXn/ZNybijQp5VPs8P/KGLLTuPXgNR+vjj17AFzJ4l
         3wcQoUI9oiYwquyHBMQz1IGdQiZd/mQ5R3cAqz6/8oCneauYkqX4zxTL9CUaq6qEeHNe
         ppQ+11aEEd/npLEF6qoo8TsMdTE+8UaujjSxbasbQAFAgt+FJ93HESFfQGdYYRFH8PGm
         aAaKYrjHd5gq/MbOWVX/6Es6dWU+zSLscabTqmRTUL/+CfncajtlSBPNgkBiPnkapGgp
         bM2gyFSff5mL6zeCN748A2+BR5fPumRG/dQNk5wzlJ0yeM+H+nQva2qbDJTpiR/ori9C
         vuSg==
X-Gm-Message-State: AOJu0Yz5aDGpJ/DWwBVnIALMupbcxGU3mRMW42jHvddn4KewIrtfBqx/
	LzUsfXpA1tMAEQVuyoZkg6Ema18PfdLxRL6yyzzW/3ioJ8Bso3ypNWnbKA==
X-Google-Smtp-Source: AGHT+IGVChZka3n6jiE9cjK4na0R52EvSLyE/EO4q/jIyt7Wuua0fQeXhRXktTFBDhvF0zQTYo8iVg==
X-Received: by 2002:a05:600c:4587:b0:431:52a3:d9ea with SMTP id 5b1f17b1804b1-432b74a0c04mr27571635e9.0.1731077673950;
        Fri, 08 Nov 2024 06:54:33 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f7c20sm5084093f8f.67.2024.11.08.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] pseudo: Fix envp bug and add posix_spawn wrapper
Date: Fri,  8 Nov 2024 15:54:24 +0100
Message-ID: <20241108145424.309859-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206887

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix pseudo with python 3.13 by adding a wrapper for posix_spawn and
fixing a NULL pointer dereference in envp handling it uncovered. This
fixes issues on Fedora 41.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7d8f71f65d..87c62e0678 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
+SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.47.0


