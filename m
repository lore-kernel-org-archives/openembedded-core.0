Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3600CE69179
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87659.1766434078894907160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWhua33g;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79af62d36bso755114066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434077; x=1767038877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8c1o9BjFSnR5ENs/P0Zjo0O7sVizOQQKaFac3N1PCI=;
        b=cWhua33guqwEl2EbMLtQ4ysN+UZbK3k0+NofTb2tzEL/wNyh7DPIXy2NN+oD2caXEz
         NJXPJlrH8YS9UQrgDWVOYpjffzsIBPgiyGV+qZeB5prb76qhJw3d1BNg16o6empOkwBT
         QFUXEdM2/sMy1uDJDYXa5BiC12T1wSfNo0sYodQtr2B084FXZWv9C+JshcpXRqO6jSkj
         ivT30PbxtO03o2mp2F9R4wa99dOiCDZESFkHwmGC01rvoiX2t+i2Bm8Gbqrv29n5pRh1
         v4bf9m3EhKB3qdPEBzRPmCJPdytG6R1hWtXmtEm9pScaSdJzeuOHaSxgOgfQIZZ6r6yr
         ijlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434077; x=1767038877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8c1o9BjFSnR5ENs/P0Zjo0O7sVizOQQKaFac3N1PCI=;
        b=aFcbMW7q2gof4IVckqZTXMeqaENW/nUt+pKWef3ZpKRBs9vtnk84ZTENYHbJNj28gO
         YjkeL24da0OnUDZA4BkPxVpxWFFEegZiQ1ytUNVsGlUa5gwAiN67nK1Vugvg8nquI5Mt
         fV9CA4J817C5B7KROvNzKpT52hDTMxx4HTAqGHicbQfrVz2zVfpOLwSkJpDfFqzAjyko
         M6K5w/ZN6ZOMStiU1wcAdJJf60ya5r9JwjbdI5DmjeTW3XQKg6CzEaMkoKhf679iwQiO
         0X9hNRNQZEDsNBydHuFACepajA5FP8ueaX3L/hzMtOnEI7A3AJfovWibdflA8fRbT1jf
         7BaA==
X-Gm-Message-State: AOJu0YwKRqkkRhY/ufq0aRnZd3gxfXdmX25LJrk9t5kWfoP2iDLII3Jj
	v04BzqrvN7xGT1qWKNfXLWaPr2i6BqbhAOUW2agWGsRmQOuFNul0peIBzm5Ccg==
X-Gm-Gg: AY/fxX5yAs+mJclP/lqJ12EWz3Fg/q9C8uP0Kl4gaxiGOs87o/BnzlzAPEjIU6yOSyB
	clTARrH8XmSmEn+avZXkTJviEVRMRukhuuKVwoImC5lJPiQrISJdZWJFciS5AFqVe4rwNhoX+xn
	Dp5g2m1tVFOyyzb9dQb0BDXuDcoBvMCoCIWGH7aEb1BKPLEUlh0Gj0YcqSHDkHJnRnozkBUOsDX
	N+IV1heVhJ+P5rUOXeVxyBNKX10bjInfRDZ5PONKQHutvzPDuLlqNZ1cAa1AuVkWm7NOoeJ57vN
	FdvVMO0ZRISJ44AOd37jPUcy9T9cLPcB7TruC6/u8ZjJrVuYkUUcZ+O48HeaBXIMVESvP/rxRks
	6UkhMiKe2nJsBfhMkMd2g8QgvNdRrMZ5XnQsK9yKCvT2C3D+X9W3Fe7i8LXaV2xP1v11rE2ka8/
	ftQjD8ilHwwiAUzvlRXi4cVltABtrs5IB1qQaP/XywRdiESfg=
X-Google-Smtp-Source: AGHT+IE8F/mXHk6H5v1JLg9YNJ3SE2KF35ZlR50hslr+PisavJUjQ+io101OWj5+htOBoPlbii3irA==
X-Received: by 2002:a17:907:7f20:b0:b73:6e0d:4f6b with SMTP id a640c23a62f3a-b80371538f3mr1178466866b.36.1766434077193;
        Mon, 22 Dec 2025 12:07:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 018/114] harfbuzz: upgrade 11.5.1 -> 12.2.0
Date: Mon, 22 Dec 2025 21:06:00 +0100
Message-ID: <20251222200739.2278706-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228343

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../harfbuzz/{harfbuzz_11.5.1.bb => harfbuzz_12.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.5.1.bb => harfbuzz_12.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
index dd30c1237d..ef2f6aa4f9 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "972a60a8d274d49e70361da6920c3a73dfb0fb4387f6c6811906a47ba634d8a1"
+SRC_URI[sha256sum] = "ecb603aa426a8b24665718667bda64a84c1504db7454ee4cadbd362eea64e545"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.3


