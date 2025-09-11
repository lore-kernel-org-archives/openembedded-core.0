Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCF0CAC595
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.41414.1757580705999931985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxvvqalR;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e7636aa65fso47817f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580704; x=1758185504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rszRQav+bYBEVuetlU9OZR7YXVqYvUIBpDTM/jt7PWE=;
        b=jxvvqalRjZ5o27avfu7cEsmhI2CQD0AyZOlx7UkSPJ3vPotN/X912SEeXPie6M76Sw
         gC8jm1tVaV+apUrrNoyUyDGHG8Tl9sh+GcDnYhb7Tna2ad12beZmtZ6Shrn/mHpUtF4p
         GbBeUoWdYQZJdBKxvKUMMFdeABfCnolkAIGc7F7nGpuVzmnkIhEdLD9imIPoDZEDMN/U
         1sqGR5Ak/GBLu88x3DCACexVtH5fG6MX/qDRjbf5svEYefECgoUKlMCH8NJ0LVodsR0m
         CpqaVUzf4zve/mn7OG/BBnbSQT8XuYokhJR3KPZKUUGZlJHiTKXSMXswkYMdPVksslWm
         hlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580704; x=1758185504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rszRQav+bYBEVuetlU9OZR7YXVqYvUIBpDTM/jt7PWE=;
        b=EU4ruLc/P8t0qnDRDRvdQxPLuMAVLxEGjI7s1yEjrHM3JgiM9/40y9/JcxzgQQWVuh
         2ft0VawmGjZLjeh7SiV1Po2WaqDnb0rtQKpWpcOYhqdUMIgtxTK1dAJkQtXl5LYw5pVi
         4zftnQNGeER4N+pvfqVQb8h0aAk8BisrxCqCAkDIwI8pAIsJk1rK4eWK5s/K4vFgTNER
         opNdKL5eM9cnsctTFRobQfUrxbL1aP2+vGEqEAQoSKaTuoOb0KxvoO3tXZeDgTR3IUO9
         Bjv9Yw4sULoaDMP+15lqVbtbAuTKgzhovmTms5bEz2eg3TzUeNpBHymzAzRMisQ3c7Y8
         ojhg==
X-Gm-Message-State: AOJu0YwL5n64Dto/Y1QcTSZzT4M+CoXvDnFPB1D79W1ih36jgGR21TM1
	x7PiMf2+ydlH66xjFh5TVbcudGn0Wc40yo08c51gEx/nE8qUzNkQA1GFtxLUwQ==
X-Gm-Gg: ASbGncs/U2XapyDjTNurprD6PJS/S5fZP8vsP92Uk7C9V23ehq5ouEhB8V51SMhK3pB
	fpc8opv+fcT8/vm7W3YxwkW9jjApGuUq8RGypK6nSoT1fKKgEGrfklvgNMVhKiZaBtOYjf8wOBM
	AnTIHyme+rz6jGaCFd+1ykYiJmVdk9qmN4srw8liICg1KgNz3lIWsQJe/8Fc0HLocM4yT8gMQS5
	HSxnX1Qd3+fFFANXSd5HsrLmiyQQVKeVHejhbhfMKdqBwvsLNBUI9VD9OhZmUO1d7WQu5IQFlgT
	FjCV60jmK/y2j9h12R9zybjJt9dgsUfS0GThGtGBPYhpDnUnjJWRRvLdRxYwwYnEbuc36m9ThFO
	VVJ/zXZpbOzjr4a4DE8h69TTvEDRbZmgy+lrBQGL1yGBWbzYpnS30mp48VmffesEGhYXbpi5peG
	FMwU5Ex12nhKI6vVEJgAQfcEhraO2ak9VgT5cHoV7MkAzh7CzqtI7UvzawCpzVTrweoiO+ls+08
	XKMgFU=
X-Google-Smtp-Source: AGHT+IG/NuWypFBUUKWQ5ucbwsn2fSCp4tMl8m5NLmw+q3ljR9xD8glI7tPpxoBwiJEL9O3D6SwY6g==
X-Received: by 2002:a05:6000:2489:b0:3e5:13bc:1fea with SMTP id ffacd0b85a97d-3e642f91885mr15782907f8f.31.1757580704348;
        Thu, 11 Sep 2025 01:51:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/16] pango: update 1.56.4 -> 1.57.0
Date: Thu, 11 Sep 2025 10:51:21 +0200
Message-Id: <20250911085123.1551425-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223261

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-graphics/pango/{pango_1.56.4.bb => pango_1.57.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.56.4.bb => pango_1.57.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.56.4.bb b/meta/recipes-graphics/pango/pango_1.57.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.56.4.bb
rename to meta/recipes-graphics/pango/pango_1.57.0.bb
index 5de51508fe4..5dc8a67dfe4 100644
--- a/meta/recipes-graphics/pango/pango_1.56.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.57.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01"
+SRC_URI[archive.sha256sum] = "890640c841dae77d3ae3d8fe8953784b930fa241b17423e6120c7bfdf8b891e7"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.39.5


