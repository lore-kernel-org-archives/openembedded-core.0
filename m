Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF157E6918F
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87685.1766434103169157471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ReNoflQ0;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so3898039a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434101; x=1767038901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dAcRH7BqZD7zkksc8SRGh6XWSxEd/6SNYXmGMC/0GA=;
        b=ReNoflQ0P6R7lZwVGcAeNfc4w2oIkwhP3V4W+M5ldHAq+vbzRwLAOkQA1zzM3eCFFW
         G6xjFEnT0PhK1+GQOJ+5b+zxPjvaH16o4dIECjvJDLZ1cALDCE/niGrOZLdNS8N58wIf
         TxL5M8no+QjeUQkGKiuhNqhX82NfmE5hVdVJe3WcSxZ8gbWmV1ORmBr97Wn2PYWc+M/X
         9pLqIEFwnQ1D+bdLCG4lkEzakc7mut+ywY0KMc9g7icuL3C4/XHwbV2k7eIBwK/JaSPC
         8V6ihgtmkrxMbanDue9O4U73dWQS49FbbceVZywijKtnXtPIb6L1cHHzRITi3J6Epbc6
         6c1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434101; x=1767038901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dAcRH7BqZD7zkksc8SRGh6XWSxEd/6SNYXmGMC/0GA=;
        b=mIvF750oVyou/1FolDedY+2qmEtLhiGr4fXgS0hF07I3ztvqKszVOBHyAzitutSoJC
         LoNoDbhQRj1s4gxQBlugkBNofGDY6kCGNYpBSjRDgeXyTQDi++XsASuU0zU0Pp7gAPxq
         Dx7AYs7zFWVs1zv+M7NfsJmn+c9NTxezSTas3hnzTKRVfu95Gmv/DqLc8FlJHr4aOXPF
         Hdycw0uBL/VEFpC86SqBOX9pBZGkeIojK99XDce95xL4giWA2aVg/ptcw+cAKauKacfO
         DG0gqmwA2IxasD5PYLA8yHI/xExkssPXKN8jOaVhqkcL6zSAoYSp56HZfGvoccTzFn0/
         6kYQ==
X-Gm-Message-State: AOJu0YzKyVMoxPrmlYZfdHueZKKdb4PVOJtm2QYF5G6iGLiSYaypdOtn
	TPk8i0/Tr+Hb3BfV7kwPhQjLPEbEr7mmr/qUaS3fgKlYM+SyJaMoBn/V3w1oKw==
X-Gm-Gg: AY/fxX793H5OoTlAVg245rsJYwcMqvHr6K/MfqCrLHmxwxtU0Oa2zC7nMVKUwpu4jzL
	pbycW4cyfy8s5QICRsF2V8Kr9y4UB9BPUm9vK9lc+Wl8Fo+tgZgs+7uYSEgUr/xgV5NO3SbkSiS
	7zJBjWYCbN00qGtqa09ScmOaG0JzyUEq0oa0yu0BgVsacERodvqmYTQrKg6NZFJhTQ7SJAGV/Qs
	3sH5z4CwEcIYnb5BjCx8R9xaGDXZFcfxlKgbf1WqKK+IsRlX6zR+7fBFPvQHNPoGlvA1+4b9MDX
	KprL6to1BPoErfBhofaK2pzDDFbSWkZjiyMhO452VoOpK9u0AypOg6c1qN7rxZtKj/icT6eNwaV
	bbxH1Yd2pgdPAjSHq0GM3oxfZDBmN5KTblVIrHkpcv7qOnj178NUGMNU333fCI2o/rxfcZaHx6y
	pDfRw7wDNoulRiZYNZASFuICN0aBglTKcJMrkI6nWEGqQ6QOA=
X-Google-Smtp-Source: AGHT+IH25pjuKD/sLRW+FRkP3oxRX/wY5C5IepTUxGhfzRHB88/PAWVcZ4WWsv8UCAenHNaTGgt8/Q==
X-Received: by 2002:a17:906:fd88:b0:b80:1108:42c with SMTP id a640c23a62f3a-b802043fc76mr1834673466b.12.1766434101437;
        Mon, 22 Dec 2025 12:08:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 051/114] python3-calver: upgrade 2025.04.17 -> 2025.10.20
Date: Mon, 22 Dec 2025 21:06:33 +0100
Message-ID: <20251222200739.2278706-51-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228376

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-calver_2025.04.17.bb => python3-calver_2025.10.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-calver_2025.04.17.bb => python3-calver_2025.10.20.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb b/meta/recipes-devtools/python/python3-calver_2025.10.20.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-calver_2025.04.17.bb
rename to meta/recipes-devtools/python/python3-calver_2025.10.20.bb
index 85ad18701c..0aa468e05a 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.10.20.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
-SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
+SRCREV = "36c6977d6e2d9b9912c2afb83b4e36bb1289dbdd"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


