Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A0E6ADEC
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87824.1766434122246753161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSVUqday;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7277324054so716692366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434120; x=1767038920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa3Ht2Z3dCJlolWwDNhqxhsuXaer+iXOuPRqEJp6o7w=;
        b=TSVUqdayoje1Sl5mF1POLpBfMSROjoCOxv4BBzL6Ju7nnideTq2zTHkR8AfDXQ01J+
         3bUtXP2DUKkAsFPq5GOClt5OFmphjJh02v9iqpnVJeu7tlCtn5UVxsmYmopUIeDeLRQH
         LcbGQNJylTOPRcvGU7ZrxjhxxfUZmI0MoMRWUf4Tn83LQmgYGyMCrMxODkc4533kp/Rj
         rNSVR/Ek78RvcVaWrBEJ6vEVdlltD2SOpjmQ19Ny547xY9sQVxW6AQ77kd8bj1/Hnsfs
         JRWWLg2KdAdX7PqFW4NqBV5Zn4dX8q7uugYI96CnZmGuXdHqQcDHcn1jBvnsQ7l2wgVe
         oJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434120; x=1767038920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sa3Ht2Z3dCJlolWwDNhqxhsuXaer+iXOuPRqEJp6o7w=;
        b=SWPqhjkJyiu5aIHBSWQ3kjgeS0L40JuS2Jk1nXlBbBBgNyfXMJWbLIqDt/x3CQUC8n
         uny+XMTHUH2C61VCXYh5ljZAugeNUBSaMwGmZ182cbyMS2pFU5zMcxtFLME1Y2SvFB8J
         kbAX9gK36zYz0inUam9kP+2XLR1rvpCV6n1+xoV/rPW6X54m8HsWfzKFnrsS97jqatrx
         JL2EEXL7CxHJpn3/Z2T5BGOqphJkddwsrzCs6QCaogX4kWOMzcFRWWOcElkq5Im45enM
         GSFoI3ui4ljrPkdGWt6YWE4qnJvCD6L2WKz8NwUoix8FiHowKH27Ir4Eq7HGsTWdKItf
         /BZw==
X-Gm-Message-State: AOJu0YzTOPBxqmE1FxiE6fWQ+b5IgPS9wyWI2PIk2JJ3gnh70A4Ny/MQ
	stiLot6Q5KLxGNXXuPpsZCgBeB0u0DfWrL2n+Ym376StnqdBoGUbn7FH/xxarA==
X-Gm-Gg: AY/fxX4s/w4pgM+WRWLXpuEYK5WrDZTw1yezJAbZ4e0p5E3DCvs7vOyKBWKoZgllJeK
	VWdhPfPu81lL9ePB7F51+8zrdGUi0zLs2yTBJp5uhZpZ1NdqL4oiQJmtezXTfR4qM/KOXzg6pBH
	cCf+Cj8wFYKMn4ACEyaS0lY9rLJ4gG0Y8Fls/G1k3+nacjOWlOZV8etcixKStCMDTw5lqQk1GqM
	EFSQymsPoi0IPwOXhiY2Il/HnN6rnYyNQiv0nAKqeUNCZzTF4ZVgMFr2GhoR+dMGWmB3dKBsOvj
	fmCHJTQeNDgW2+hhtFYc82dZVZ2GhNkPr/Q8dnY2JBWzHWDrWb8VWZVdolr6mRSz8VfT544Xt5v
	WjziBxXz9Ajhy9GDTPG6Fm4NYBnQDo1CQXjZ7FT3NdympchfnvhDcDH6SsvVGI+G4uQKj1vlQnz
	+tXO0nKZpkA5S6HbzMqa6x8w2Vuhtvfcl5QpO+5x+PyGxWo2I=
X-Google-Smtp-Source: AGHT+IGdZXuVNweA/i2wG885lE5bGE3U+yyRsmmECnIuwjOCaPPrdeCKVJF8MgE5j2G8OwK0Cu7Cug==
X-Received: by 2002:a17:906:c104:b0:b73:8d2e:2d38 with SMTP id a640c23a62f3a-b8037222776mr1327936166b.50.1766434120461;
        Mon, 22 Dec 2025 12:08:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 080/114] python3-scons: upgrade 4.9.1 -> 4.10.1
Date: Mon, 22 Dec 2025 21:07:02 +0100
Message-ID: <20251222200739.2278706-80-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228405

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-scons_4.9.1.bb => python3-scons_4.10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.9.1.bb => python3-scons_4.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.9.1.bb b/meta/recipes-devtools/python/python3-scons_4.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.9.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.10.1.bb
index 1eac1ce5a9..4a62e2e811 100644
--- a/meta/recipes-devtools/python/python3-scons_4.9.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.10.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "bacac880ba2e86d6a156c116e2f8f2bfa82b257046f3ac2666c85c53c615c338"
+SRC_URI[sha256sum] = "99c0e94a42a2c1182fa6859b0be697953db07ba936ecc9817ae0d218ced20b15"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


