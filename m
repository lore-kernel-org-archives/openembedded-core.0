Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36969E77183
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:15:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.78239.1733663753218846561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8V+f8Fg;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e87b25f0so2646213f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663751; x=1734268551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE90JUceFTVyOIMIWax0NNp1/Nl/IcFmpiZqv1HIH9A=;
        b=J8V+f8FgKdzjMIvt1zhbcrscgVpoI2N6AyToTjGzSEmHxNsvs4W7Q80/V72zYvyy+H
         T9vSQvzHWZDizgA/T/ee939YeasHd8AjgmcrdZGiIvzRIic5dMHxa6nmy3xNZ54cO2TD
         pijMLavb2f8+Xv7L10CdPin3rW6PzziRuo56vywpeOhsD+BPZC+jGpboRDgZ1nBuZrt8
         PbaKqg42KUKE9QW8KzWZkrsVTQ/tYzaTPW6ff5ddu5qImljZ0A9Y0KZTJjVSk2hhcCCx
         ZhuW0RCl3F3OZ2v6lf4jAF9UV6kI+vSMoYHmX2Xnp557n/xDBgVSqbFREqbyIs87oK/e
         otAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663751; x=1734268551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE90JUceFTVyOIMIWax0NNp1/Nl/IcFmpiZqv1HIH9A=;
        b=ZxFjGPcQTQOmyF/tCSP8LpgQCjkU/KC1R2J+hzuBD6F99pANgzgPBvqSHgxWab5H4n
         YL/noEkkCpXgQAfAFe2IkiZQMezSR17/uBUkiJi1EVj9o7xJLcxOY8+8VHdXZEO1ga2b
         LcpDczCns6NHWOd89rHflOB8l9kLIzwWej4azUfKwLM84pA122f7aN2NthJRGzyvIpfC
         Agu19aBB1oIU96vvRK5QjGrdfD8kubmdXIXrqhJP5pOz9S1DAptSc//SX99xKR5cP78B
         HkqeSMlETpG4G6OLJgWHScrFf9WWcS4qSx8fgym9y0DFDgy2qfVQw2ZaOmAnv054cSmq
         wHnQ==
X-Gm-Message-State: AOJu0Yy7owc/ZaWc8JayWtTEC2mF3734UDeoQnB8b39zbfxQD4dciOSK
	ZvLP82OHy8Ps+Nb08iHOWn1rwnjM7/G5PiUc2GgTF/9U+1WEWoY9hkM120qV
X-Gm-Gg: ASbGncsFPqeEEdhvZDNp2SeVZ4IuktV8mBtxJ62IF5Kl8lKRnQr1q9lNt31RvksrfRv
	/z8JSsPgk+1SxOddwce37UI8coGzj5eUp6k3HEEupTyRmQYBxkLDQoN85PwaPQafhZwK9zIGBjH
	ZSqjXZ3FpqDLz+FgcU6LUk6R8NVmjTmUUj2aM72q1MmR1iB7lOMJ731vZY+oGaCgSdFQvn7Qqug
	XDV8uj0lRnaLSP3IbtrM0G/wyhxyttrO5kjVJX6HbpO7hoAY5wuZjQZwVZyX9/Ymye2Rs86F84=
X-Google-Smtp-Source: AGHT+IG8czCZXJJn741cF4qn1Wr8uc2TGrLpF506yrvZp9T6Zfi2lt/j5febTgBXkUIx/qcUUU6j3Q==
X-Received: by 2002:a5d:5f8b:0:b0:386:37f8:450b with SMTP id ffacd0b85a97d-38637f84694mr2203135f8f.5.1733663750975;
        Sun, 08 Dec 2024 05:15:50 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cc26sm9807830f8f.38.2024.12.08.05.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:50 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 3/4] python3-poetry-core: drop python3-six from RDEPENDS
Date: Sun,  8 Dec 2024 13:15:34 +0000
Message-ID: <20241208131535.5397-4-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131535.5397-1-gudni.m.g@gmail.com>
References: <20241208131535.5397-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208463

Looking at the history, python3-six was removed as a dependency
in the poetry.lock file in v1.5.2

Even before v1.5.2 and until now (v1.9.1) there is no code in
the package which imports the six module. So it can be safely
dropped from the recipe.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
index a073f8b069..d280721d38 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -35,7 +35,6 @@ RDEPENDS:${PN}:append:class-target = "\
 
 RDEPENDS:${PN} += "\
     python3-pip \
-    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


