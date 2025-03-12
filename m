Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F1DC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:07:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.32241.1741770440854812405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=POj5CawZ;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.54, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so564413666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1741770439; x=1742375239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=njtumGp+jKWw0uD5J6p7RGGGhNUQt9Cpq/0ZcwPOIuA=;
        b=POj5CawZi5lz5gmtvtCLqRpNRh3mKqLaJ6IayQVFhMmfhA8EVqVTm3ed9fIVlH9WDm
         xpZeioADkUDuNpXdsZRSAKJZM8twMY+qFIQCmRPNlzdMjEj05bHZs9INb9n9nCRVZSpI
         3Sk5+1Vf7t4yE/WouiHPUOumnBOcnQD4qRqdWkeAITDC6WYZGXJRm7/r1Bq29BTpbpLl
         joF/tPHcrfM2Y+3F9xgbtvFq0yc17Q3wbn5NQaDjABh5CjMfaW+DEppsFoZ8wENbQ8eW
         ZaLyZSoF3HnBNcA7ZHnE3fAymr/Pr3UcEb+R3DI2HrwJmxBCkbeS15VNKIv5PVEgJVGf
         aung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741770439; x=1742375239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njtumGp+jKWw0uD5J6p7RGGGhNUQt9Cpq/0ZcwPOIuA=;
        b=Pg9jSIfviIeU707cnrdGDWOfEPgVwGaLhGzKnOiGOxIm09xMfk5JTF7SJqfiEahgYy
         /c90wi94sGAThlb1pKk4TdThp/QjfsIA39wGB8CL29lr7T8IQoDe6118JGFu0ij8SoGr
         RwDC5l0/wm1R6MYlCgHvunAgmigdz8xDagPajU8An2vg4+RzaX1YW86BofQ3DkEFO1Yo
         w9YOb2UGErIZK/uWOL4dDq1dA9oSkzqq35Zjkm1J9VVoJY7sviaEDJJUkQlUqQVz5YlZ
         p+f4CwO8dOTAqDQHTHPCk9AHl5pIzLD2+OOh4BUafZEYnZlaPHb1nZbQRMZx/liIQQV8
         xKXQ==
X-Gm-Message-State: AOJu0YxRpIQ2DgylJ3I85lNhsdcFseRJHCVLqcKiDV9X4LZ0x+Hr89bK
	F01yRut7IwDvIf1UidQcLYmIpgbPUEsGb5ejgDHDkeEQyfWYkbp7I3nyEPpu0Uxl4jtAr1pTVjO
	F
X-Gm-Gg: ASbGncu7O3V+7dz9HC/OAKfcvMswSAkCNgZ6++tB62+SB4RWC1ZNi4kaf1E9fCIgZIf
	YS5c/MKBVEPqUvP2VsGTrSyOleFjBRR7SpQa7tTjIYz/0r4uOUbDjLwMKx0msbPewsOme+QOa3i
	HaCXSqmgni0c3F4pwc/2gpa6k5k7aYnNQxbbCJUmOgDU3xF41L9K1ZX/wU7gMxHlH6crIbuwU+8
	gY9BhWjZq0K+phxgFs1MVVyF6lven9wW2cswjP8GFJ7sv1oiPzkukZFDsLKQVArc/Y3/CHU/rre
	azPV+h6Q6OKz8PnUkUbv3gnfsJqh/YagvyZDUXU+Tq0/XUXmev5sTnjxrQI4oW/7/swDEIsF2Zn
	ZuUZR35P60dkhiCpaDngMsw==
X-Google-Smtp-Source: AGHT+IGevFaY6l0VBeBQxB+VBDPN+Nwe506nPcgAjohk0GYnOyL9ubgYKr2zcJDiDxYr8l/gmOwV9g==
X-Received: by 2002:a17:906:180d:b0:ac2:5d24:1fcf with SMTP id a640c23a62f3a-ac25d2423fdmr1796613266b.26.1741770438839;
        Wed, 12 Mar 2025 02:07:18 -0700 (PDT)
Received: from mimos.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943c440sm1057560666b.15.2025.03.12.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:07:18 -0700 (PDT)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: Fix typo in 00-create-volatile.conf
Date: Wed, 12 Mar 2025 10:06:57 +0100
Message-Id: <20250312090657.3921586-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212639

Also do a minor white space tweak.

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 043b2ef1d8..1092bda010 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -1,5 +1,5 @@
-#This goes hand-in-hand with the base-files of OE-Core. The file must
-# be sorted before 'systemd.conf' becuase this attempts to create a file
+# This goes hand-in-hand with the base-files of OE-Core. The file must
+# be sorted before 'systemd.conf' because this attempts to create a file
 # inside /var/log.
 
 

