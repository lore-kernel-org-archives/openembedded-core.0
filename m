Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE30C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.82664.1749548658724839927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RVjKTQn/;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ea341570so33950075e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548657; x=1750153457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99CES1ipO7HOg81ZWzL4r0tEfqPGEBiAxRadcn6cW8o=;
        b=RVjKTQn/Syz5/0gD4zVZ32odzWsXCypxY50K7/vlwp90IownsYyPWTka+RTopHsKn1
         5dQp3SxW060APsr8FFqdKQwdzMmPKYAj4KPcJvGM5WDLiFGluUjGgj2uU3ObIlxeXHRQ
         tfgJlcfBG6SUgZOdwwNyp8Qq+JX3iKPW3GYay+YUsJu1IyoY2OkR35AUpkz7Hm2Wc+Hr
         zmAiM6sSrBqg8oIP3Cqh9rFWXLWZuIeIm1Yiiytc0PIXttjy4EHfMVoeUi5Y+CEkcgte
         udRVdhyssONMtV6hv8+A1h7M7CUHHGl3wv1ONHnLFhKwa2qBuRzdF/xuL4doBGeHMI3w
         A9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548657; x=1750153457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99CES1ipO7HOg81ZWzL4r0tEfqPGEBiAxRadcn6cW8o=;
        b=Fqxug2kTq0HD74d4j2ZmbNgAQXF8EmGgneXmQTFgvtxTp+TXn5l4edjts70emBZ1vy
         SA6NZLihSsGJsVKOSAquvSHhRkm1jsoBP/waxC0QJ2NY8NHLlzu8uaWOYKY5gLDEjOWQ
         2M+b2ENlW80KH91/qgRXy3BrS6qxuS3vNeWMRGswBHYIqGIVhFDqT9ycNpql+y6iIx4C
         yRiYCtop/WB4GOf8AV5aeFxLjQB1kSnEafVXS2fUT4ZodZ1GIYzMYVezE8lqayjfaZY3
         r+BJ3jQlsb8diMjIz5bET5Md6td0Lxy9Y7Cg2QSmCTm8n2soRWPubUrYLYI26mPzU5Ss
         swCg==
X-Gm-Message-State: AOJu0Yx71dr7XzlbQpTrXIziHY5RryWlb/OiOtvagPpfQQfE76axK4GN
	FeY6SV7xtOw5DBVBTIlhQxiWwoGocVJ8s+p7U108EWOllpMtSLPeCUVkQBw6Jw==
X-Gm-Gg: ASbGncsN5nbNFtuAXGI5mrpk+coKREB88i0pSjcM7qRLKjP2bsfNUWKUmXvC8McBPlk
	4k2IsWAzQklB5T94xkkNWE7GqvT/H5G7Zh1UvUuJhcm563Yx19vDMLmdOvPvlOWX8ncKijcnakX
	p5xHheImgLpcSyuWZKRctUsimxT2ggUYM+LrIuBhRiLAxu//dDPB1fixAzjO9pdkKnmceFkWsg6
	mXxfRYWgW/p6cKkTXsEjv4rWkxEPO9Y1GTeOOlp6BVqHgPkdr61Vcz7Z7S5cTtS7sSLt+8GwxMZ
	oz1yHnVhgMnOU8FY3u4kmSUlA7jhAyEZ571aFH+TmHiwlR2X1tKoMJ8vCRQfyf90/BVv+/3XcOw
	EpY3i0wo4oqcW6B1NvUerKFu/2MzNIP+zmQ==
X-Google-Smtp-Source: AGHT+IG4KwsvfkCJXz1x6ekBzXq75XaNNr4n556Q7AXrq3ETbCtFmxPSmOw+5IfDj3MkGbVdk2xJGA==
X-Received: by 2002:a05:600c:8b76:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-452013adec8mr152511695e9.18.1749548656650;
        Tue, 10 Jun 2025 02:44:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 2/9] bitbake.conf: set UNPACKDIR to just 'sources' and not 'sources-unpack'
Date: Tue, 10 Jun 2025 11:43:53 +0200
Message-Id: <20250610094400.1653931-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218326

From: Alexander Kanavin <alex@linutronix.de>

This is shorter and doesn't include the unnecessary task name, just the
result of it: source trees and files.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4fa72b3d3ac..780de10ba35 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -407,7 +407,7 @@ STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
-UNPACKDIR ??= "${WORKDIR}/sources-unpack"
+UNPACKDIR ??= "${WORKDIR}/sources"
 BB_GIT_DEFAULT_DESTSUFFIX = "${BP}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
-- 
2.39.5


