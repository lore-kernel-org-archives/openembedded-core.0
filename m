Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957DEE6ADC9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87681.1766434097143509232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlBius76;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8010b8f078so507537966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434095; x=1767038895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsuRC8T/hp9W5ZTZXgxD2X2DVbJ0/OTD4vJ3ZwRlBUc=;
        b=YlBius76fGdNPWPhaYBuLevccTDzMh+I5dtZuiOfLaZEtikC0vyVREbrQkzorbWeno
         iUbN8wb9mg+ttZyUYKEsSSi9JHjiLrYsPLkIPldssj+7imLJAQT8aXlNPMmUmibZLxpM
         71Up6PRWCvNkb9O0Ar5DFp6rirvC9tCJLdY/WKPjEWbCvc3rOoWQvg1EgFi7RLrGeKf4
         uZTaeaSfVw5zJTUFZ7fDsSdLYGsKfnfsA13THnpSoOxn8nasdueE15Z6HvsTaIEpwkcp
         QU89hGwcfyiPtwrFh1Lzclrzumr01mtLFGAHmd6M8E07QvWXYpXfL+a0uOF1IXaJSktT
         zTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434095; x=1767038895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsuRC8T/hp9W5ZTZXgxD2X2DVbJ0/OTD4vJ3ZwRlBUc=;
        b=D80Nc6TDIJHe8Z2m/DH9siC8oes7taj8ZDAOf+wiaeSe+3zs0Wud5dPMg80i2WY3ZU
         NTS7XnnAzYXtPrIYG+DX3v+nG9N2thjUT7JSoSw5Am9eL/M78x1JuGJSHHUVRR+39grH
         FDOunrJ/7oHeQ63pLxwRt+wOUaS3lTFF9If9QtdeVszOE/tGuHTqS+oEKVSFLbRyYS9w
         2flLeOvnb2Wveoy+2jQJB6mNMXwxNuzbKmBUCf6PkaYet7pe/FYSbneWM5mdm0W7dugq
         9+3Z5WTGMyxbvgoraLFkipbOB8rZg0nHb5TXTUOfjH2s1gqPJ7tCFCgP71FvrfO18fRs
         CFAw==
X-Gm-Message-State: AOJu0YwVC+VQdxnrvVbJE0rddjlhtC+GfVjeeB/DIfFHLNpZmKUSdnFO
	8OB2tSx0kgtpaVrghmFrew4QrHV2achS2T2g1PLyFFO0SDBVKWf9L2ylxR0xTA==
X-Gm-Gg: AY/fxX7oNwvCP9Q+IE0TZkJnRRKJLEdoMJ7yMr5mCDNHGT+SbC3TxbmTq2JOINh7BhF
	WQyQm5CnBhl/0FUDWWsBTib0/pSTULzzWGKq5m75svHhAT5y4q4xqf/ohzJ75FrUkhWfDMLXSvU
	qHjdTRQEdZWBIR5ljW1sR5lxGyXNZcfTdrpE4RTgWNvAWoqTwaKrfWSEwhUG2Gs5y+ctaKIgYcQ
	1Hh+murZ5YWnJduRysSfLrx0LcCPb2WP5pRA0+af43bjo66NaW5fnXHj8ve4QVr/wAWafrKpO8s
	NOfMDn10KuS7IfMubC9a127HRDiWvZaf3qRa5tA7erea914A4N+OIYySKJRAHQmCYZgAYClx2tg
	ihbgbcKHEm1PgsCOZZ5Rl+2KAQXF/Ac1dBO/ucf95R/okKg6QEsAgR8VslLlpGp6y1aMZKPAY4P
	syaJUJJkH3zkSbAO2BF1NdirUwuf5GHncwDa79Xy7Ft/n98ZLJSkboUMzDKA==
X-Google-Smtp-Source: AGHT+IHUp/MR7QQ4ia13AHfzgU1hvTVdm7BHjh4e8KB4Jo1l1l2faLduvH922cykUbQskxwzBqujAQ==
X-Received: by 2002:a17:907:94ca:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b80371d1dd3mr1311540366b.47.1766434095434;
        Mon, 22 Dec 2025 12:08:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 042/114] libxcrypt: upgrade 4.5.0 -> 4.5.2
Date: Mon, 22 Dec 2025 21:06:24 +0100
Message-ID: <20251222200739.2278706-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228367

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libxcrypt-compat_4.5.0.bb => libxcrypt-compat_4.5.2.bb}    | 1 +
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.5.0.bb => libxcrypt_4.5.2.bb}        | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.5.0.bb => libxcrypt-compat_4.5.2.bb} (99%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.5.0.bb => libxcrypt_4.5.2.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.2.bb
similarity index 99%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.2.bb
index 30ec6a4674..bb4e2032dd 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.2.bb
@@ -16,3 +16,4 @@ do_install:append () {
 	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index bef40b0ae6..9aed0b9d81 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=b65434749329c34b5d32c2df3f1b4112 \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "096296cb6fbecd9ad46c93a410d76c752a5d6206"
+SRCREV = "db70b42bd7b2a5b00a8580c8dec0aa66791c950a"
 
 PROVIDES = "virtual/crypt"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb
-- 
2.47.3


