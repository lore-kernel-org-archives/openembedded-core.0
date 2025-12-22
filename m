Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D442DE6917D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:25 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87806.1766434105062608202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5sFzKaU;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7a6e56193cso725632366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434103; x=1767038903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvlWxmAZiY+rXq+OzO5Bso12Ao3Rdo6Q/1/O3kGUjjY=;
        b=N5sFzKaUmF5H74Jw3aqqFYjpZWRt7aL+4QB9P5K5MsiVHuywmpknNOgPzBkC/vT4uf
         HninlrypNRFKVFDrcERN2L7SCPHQ7BMrEr9SDyqjFJUjFcKcr46KJ1S++SH3lhkwAp1v
         s5MnvyHZTXffNW+aBXFyGiAPECOsv3qIeb0mXAYGmwUzW4UQOME8bZK1MFGuhzsDirq8
         agMXIJObQAGGzR8+SPSiCQsxNn45IhM24fwxQXN8/Kpjmp844xiVFx8724Wm7E4ea7vb
         5BUkeECFDPxoteCm3SGKZO9MvDzysZP9FWOrdnM6CyWltxNBfreoj/OESJMWAiTS0i8T
         LTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434103; x=1767038903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvlWxmAZiY+rXq+OzO5Bso12Ao3Rdo6Q/1/O3kGUjjY=;
        b=Xrc7XqH2+qvmnA1R9kTSsnLdR62UwZK3kTuorBYAdCNEpLGG0bj4OAmMTBi2257CS3
         ucmhPV61S4r0u6OItV9sPcztSbsqZp8RdcwKf2IwQE4bdGaIVZOU2DjN32GWKRYWed/E
         K36wH1nUSktqnmmKLXcIaHGtsPXfJbWds+1JaZzCpD6NLx80qOZl5qjgQIdcCQnZpkzF
         riQ3Nwj/SlXwMOIIblIEP0Vf60cqV2r34abuDRWcm2NRuK036HmYVYS1/VMjeAxJDR4o
         uUHDDlYx7CkrxNyWCZhxhVyAR+fVNcgDS7yj7gpLNUa2Vp0gSfMql5hsfv075ANTdapf
         NDgA==
X-Gm-Message-State: AOJu0YyPUon7w844I8uxuLpnI0a8Sc+hVqZsAAoJbdKZBIV9qFqVRA0z
	fNqJKnDH2SrDidNZ46jNZ0d/vEkaWR7n3WYUOAI7UwDL2/WLPOldKqHhsJaRGg==
X-Gm-Gg: AY/fxX4fVijShxkdpN48v6NYpasRM3UwUDrEWaGUrja7dd5I+oKH8SzqyHKeD+9KU4L
	LM+DnuAAeq4EIEb3bftjmm6i16Cp+wD6I37UPv9ohCnhYgwb98Yxb5Xr8MfBKxXExxcVM/8AC9W
	EJrdTK0M7GBxnxvF/5Z8G7Cqt5el1FvG2bSxFmv1B8vksLM1k1Pyn+y9suABY+qwHpS97CqJpcX
	QVYq/BlK3MQ/XYQixsqqbt1Ggmb2tSNz/hIl+zkH2EH5N1PnAcVfjd07A9m55x9+ZnhWjm1CQgE
	iHU8hQx/hddKa46cu6y0F6DQMSMLyld68cY2ktA87aJUEgWJn7OzDFme3zTrkcmBCgzmw/BeJUr
	1Rw5yKzH0KdfqnZCIWcMZsS7/8j5aYqNVWgG5kRUYPAwc70YYTBhwo50ucjHl2Pbd0idZtoy5xZ
	LxXu+/AFHF2DkfUUzOIxrp0GTudk8y1TP8x2OTQDtZwqtW+iM=
X-Google-Smtp-Source: AGHT+IF/MzJ0dSGqor8qXaQS+bzyoCBT+Jl00OzlCZjm3Cf0E0id4U1J6iLeniGMw75ZnPBqZZW8cA==
X-Received: by 2002:a17:907:a4b:b0:b73:5b9a:47c7 with SMTP id a640c23a62f3a-b803725b085mr1340834866b.51.1766434103393;
        Mon, 22 Dec 2025 12:08:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 054/114] python3-click: upgrade 8.2.2 -> 8.3.1
Date: Mon, 22 Dec 2025 21:06:36 +0100
Message-ID: <20251222200739.2278706-54-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228379

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-click_8.2.2.bb => python3-click_8.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.2.2.bb => python3-click_8.3.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.2.2.bb b/meta/recipes-devtools/python/python3-click_8.3.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.2.2.bb
rename to meta/recipes-devtools/python/python3-click_8.3.1.bb
index 9710e8a71c..1f42fe1a50 100644
--- a/meta/recipes-devtools/python/python3-click_8.2.2.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "068616e6ef9705a07b6db727cb9c248f4eb9dae437a30239f56fa94b18b852ef"
+SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.3


