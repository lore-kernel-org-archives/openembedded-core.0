Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F44DE6ADD3
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87816.1766434113335968828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FV88atOu;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735e278fa1so755670566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434112; x=1767038912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceoGXuZyO1Sbml0ZuPpODWEvaRFHb81fmCBQLuJhF+E=;
        b=FV88atOuOGv/YlNElIqiVnDajEbSJxO1T/mhYhMM5G0D3XMJ7NCv/oGBQoxxn6M1Tx
         IgdlmYYwLIaYLnly04C1iOifYNumrwP5KWAGd0EHM1MIWuywHXC1qmtzejhpDtVKVUVT
         V0MLNSbm+Vq0aJ+DmNCwTxASXiX7sOX0/kFumIw/D9zeTGhdnDrUNmQeb/TytI6+Z+pt
         6S1ILG5ptlCEmPKxQCtIxET52g5oQS3TV2HpVT9LgY1nMdw7Uw98Ofty24RqNPdHQ1mp
         2SlpPnmlqWCbburucemfPh72cwqahbsqMFAqVnjvvO91wrmr7NtDCI+nc8lE8dWU5YUd
         ABmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434112; x=1767038912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ceoGXuZyO1Sbml0ZuPpODWEvaRFHb81fmCBQLuJhF+E=;
        b=JdcM242r/CpCiQi7oEcQ9pLPwnbn1lEQBc+i8Ar1gcXA7N44LPTL2NICzvTssKd5Wk
         VisOkGExCXg9FcvuXDkPED1yUEztV2yKDhvSBnbxTXBS1tnBTLQtpiFcWSYVVaD5ZyPc
         zxJFU0Y+x2NP2tNf8XvOK4l3JLxoQPekaGMZnwvJS5P70lbMZjFZPSKLwu0IuZZ4gxKn
         FTWuGO9Gv9wYWL9bVh7kfF3B/9fuJQ3uXFrA3IewAY033R8hE9Zh0BSmMwELsJUROKdj
         P8QqjoVdCsA10zowgbAUBsXofHa2qromLBP04weWQiu++NnjAghKDAixZv+mAEKr0dHp
         mFfw==
X-Gm-Message-State: AOJu0Yy33qZMfFsRbw7Imc3BHK9xoRuidGL/b5xRPC2QqILzyWqvsT+X
	QQv7+I2hEREBfFkOzBWlNccx5aN8dx6os/CXw2OUSY2YJvmMbg48oxlFV+6vYQ==
X-Gm-Gg: AY/fxX6bt2Ja/OH32NgJmDyBYNpWzzUb7d3S8x9nAOKA7KCqoM6k/U1BQyz3EKlVtrF
	YIfZnnhNXhhr5vzpPooqFAYHflK/0uQ598e4Dxhxa8ZHgDXhFyJss3mqewkn37Oh4cyCE55hHy9
	lS8fFOaAWPxWEPFSY8eOsK9+aloS7IoglFGtr50PLewYnjnUWfU0UuJGiihZvuD7dgCSJlZCiaR
	6yP84UfO/vkveSgvFejDNRc68UaSRDdIoakSLRR/TOXobkc1OFX1UKjI1dcfc/ARzKcOJlkQZ3O
	9d5USde7RtsqwO9DxG3yCrjnlAfnMQbOq8HFNgfhpB3vG8Ds8+fHCpiU9zBecILTciM/MhQfGUM
	fl2MaOHiXtKfZ9fW/XEkZYhEJ+5yL9I1ReZeYmw631zLByJFWXQWuVHknoqAm4YwKCYJfrczf7i
	yg34knpx36OP9zkpE71CgVxxIWfpkGccW1olxYuSOnz5sYC9E=
X-Google-Smtp-Source: AGHT+IGzmP7v3PArWH4OhcVDFOB4Yx8ovh+Fxbb2Bm9Iq27ab44nxQY+DtOwlHlm5ifnRu6PbQFB8Q==
X-Received: by 2002:a17:907:3e14:b0:b7c:f831:6ac2 with SMTP id a640c23a62f3a-b803715344emr1342420866b.30.1766434111527;
        Mon, 22 Dec 2025 12:08:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 066/114] python3-pdm-build-locked: upgrade 0.3.5 -> 0.3.7
Date: Mon, 22 Dec 2025 21:06:48 +0100
Message-ID: <20251222200739.2278706-66-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228391

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-build-locked_0.3.5.bb => python3-pdm-build-locked_0.3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-build-locked_0.3.5.bb => python3-pdm-build-locked_0.3.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
rename to meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
index e8f2ad0e93..3844934d93 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pdm-project/pdm-build-locked"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
 
-SRC_URI[sha256sum] = "ab2f381e00d79841d46be2e6909c265038b9fa951de2bf551ca6adb7f6844201"
+SRC_URI[sha256sum] = "53428268284125532413434ebfeb8e7a287525516cc5a0a055d63ba63b207165"
 
 inherit pypi python_pdm
 
-- 
2.47.3


