Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C5EE6ADF2
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87698.1766434117743727845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIG9DUFN;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8018eba13cso550598966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434116; x=1767038916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDgG8eu7z8lyonKZPT/A+OPWz/I/oomyHMYGHfoiSas=;
        b=WIG9DUFNY05sCqimk6nMBg92HD6zC6jlLg9beU6NY+8S7KRKjCi9VYp78H31/Arx/D
         RqaW85TjBvsBZaS0OmQM+Rtwjm+fcVNcdK3VsBv+4OdKcgh/06O+EedNP3ApBqw2tAXG
         86FQQjQABi5RTY6ugLIT+TD5/lJZtcxwKT4DUPzurzuAl9K5b4Q1oq4AssTLF0ZYehGE
         i4Wulmw8gLUiHjkDH18tPS4fIZnwMMvzSZhN52uDMoyXrO3GfSr3caf/20eRs87OtorX
         ee2wMqzkPHJ1AAh52JdSSM9nQdGjgtnaw77rS1klpVdfdHfMXDTCD+Yj96rnQpHVoW14
         3jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434116; x=1767038916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BDgG8eu7z8lyonKZPT/A+OPWz/I/oomyHMYGHfoiSas=;
        b=mIcblK8mn2TAa1hEeY5idY5JhCDXlpP2putsyLBal2t7tvC5ERks3IgfzhcTYRduMY
         emjIsDUGWINFVAZVi39+PWPGyTKkfE2muZ5XBlehHXspzVaOYTNZWfN9/1vQBhde1xBc
         /pMiQLLLdYl4EDIYTaw+XC6SpEWMrXuNhLFebiYXPfu4kN+KoRsG8KeAWehPWo/y2Cn7
         Drjuhb+I6jnYD4O9cpZ/jk4J+rJ/RFhiVpReBgnOfPfZgUKRF0YgjlzGGpJxRMp6pAJ0
         wHxLPU2jRgbLk//w94SQ4eX2s51J0OsOEHhKzu3CoWHweIk3tFIuaiHHznbEJ/JTXJ79
         orrw==
X-Gm-Message-State: AOJu0YyfSbbkNbSltrjyLGz9OIqbfgq3XVue2jT2MP1ZD03FFEd+ZIbG
	ekp2x5tQI4g20kTSo/cxynz/K6XGaVm2k/wFZxcNZnEYrTZo0IHCpoNNB44DSA==
X-Gm-Gg: AY/fxX76RKrvGxGy1rI0cK3K+qUCMJxHdHVTxAKoMAprYXvJz/sH39RUjBRWP6AzHwt
	z6K52ZNckwMoVUBoO1eZT92pl6FtzHSg5mQpmFsZfO9LUMG/RCyeQwzwy2HuJSTwdDWF/woX2/G
	bZpFnvWOIs556ttn7uA4FySXK0WBT6sGNNeMicTBRtdJrdu8NLIntH1yG5NtV2wEI5kJRa65t2J
	YnxGCt748EsAgfP4JVvRSLsanIc9wZg4lekeX/Q6cyrdOb2VwXhq8ci/QXP+e1ULEbVkkzLMCKI
	SvklypHHf13RIpxb9lHy8mAi0uK+EblJ9/HpNo7VVMWvf4KQK/Vc8YLmAktXQzIGV3hNaFVHlnn
	UPgRLdjmuv/kDvvSrOOHtAH+7/pzKEIKxUKBlNMWnZGFLmhyBlNj/ewep614q7dRtaw8+ENb45D
	U+kSl4bBU5c5728HgJ1eLhdUysv0AuSPD8bg8wHv3gDZftqKY=
X-Google-Smtp-Source: AGHT+IH/tN6JX0jDmevg7YV2JTmQxq2MzxGCeLloh8E57slnaHj3d9oNBqUDsHEAVM6nkJniYXYIaw==
X-Received: by 2002:a17:906:f58f:b0:b7c:e4e9:b10e with SMTP id a640c23a62f3a-b8036f5aa24mr1437024466b.18.1766434116020;
        Mon, 22 Dec 2025 12:08:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 073/114] python3-pyproject-metadata: upgrade 0.9.1 -> 0.10.0
Date: Mon, 22 Dec 2025 21:06:55 +0100
Message-ID: <20251222200739.2278706-73-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228398

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-metadata_0.9.1.bb => python3-pyproject-metadata_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.9.1.bb => python3-pyproject-metadata_0.10.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
index d3a93efa31..5b5396fdd7 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa10528e9e1a954a816"
+SRC_URI[sha256sum] = "7f5bd0ef398b60169556cb17ea261d715caf7f8561238151f51b2305084ba8d4"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.47.3


