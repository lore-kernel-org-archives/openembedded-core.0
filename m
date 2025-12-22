Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D584EE69197
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:36 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87689.1766434107988895249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIVwW9OI;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7277324054so716660566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434106; x=1767038906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiYCWuVl9l3xbmMqcxiSC1yu5QcdR+18tEZo8ruKAkg=;
        b=LIVwW9OIT3b/h+a3IHomBGi6AVBZGEDMWU8xKoDuOk4S9hgocTF5JkCnliibO8Yuhj
         UwSLCXqCgWdu+9A+NBYbZd6MGRCULEL9z275v6g2k71vZDm+54XCc4nn+a54K338dYXN
         jViLD0gM5W3Plio6LCTYIMhlyhHDvUHO4L+gVkNMcat6TISL4f89uuV8rBW/Lir1c8Mu
         tECS8HDFbPmCgwF90LdqsNsFnrCpw83SlP3lSMMEZkKfpbQrFAxDpF1hpqlzG5NSW1hD
         EtfOpQBgZN5iJV7oGbCYHLUZa5HZurMKoNjs7pL8YVS0ppfW6UsKswx4GmsAHyBcwH/Q
         UDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434106; x=1767038906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiYCWuVl9l3xbmMqcxiSC1yu5QcdR+18tEZo8ruKAkg=;
        b=ZwJngJpXxUeik4P/bInRPs2t6TSwocXBcn3ID+bmQi2/dBT+SMgP89WySic7YvPNGv
         p2wzqmgCiIKIAI40bH/mmADUlm/I/le9EVhLLa2Y8aSuJdj5dQ9V57yTC0YeSV5EbbnA
         CE2sdn5JC1z7msUcznmgF2kmsBczL0OMUyLJRC5h4HZUXZGwl8lxYgoyvi1DplEjIIIL
         mztwHTeG20n+ewwVaNd3pIJKad6INGsQKxDz7xtj9s+/TnrVL3J6aUmiN118h/eDNLCH
         WZqc7IMXLaJRvi0lQWhREFuoK1UcuOLGNiY/uM88NOwRDqns/R/+dJyx2fAZYVU9G43x
         TPug==
X-Gm-Message-State: AOJu0YySlpqHB4ufDYGH77oZTRZp0M5IXDWenuaLk4rLNPo9fECe67N+
	Sag8L2Fomcj8PPoSKRkjjGxKMwqj7s2K1z+zt8TKLNcwUdRH9/beGZdKfkbGvQ==
X-Gm-Gg: AY/fxX59d9o9JbXlpIbdXunW0n5kKb1M4Nqz7TfKMKjb4EENMTGUua8kXGPDwvW0TL+
	LQRhonGfiC4/qR/0ChUyLYD709DoXgnm53QONQhSxQzx5bmVpDB0ahPowsfMLKYh8t4iqH9o/sA
	U/KoMLpDjF6ubIWs76LrbDdxFjAnVg7QQqivfj/d5q9jl6WUNLEDeovyxaGoFPTvcgQxWZnACKF
	w46Nj5Anzc2Bh8T5uwPdHJfBKQCu0e3zyw5dA9SHpfXcFp4H+vAsbRdq8vpnnk3KVkHjJBASMv8
	My030dfAyHgsLGQlqwNzr44hCT5y1Q1SzRCqaFlZ0vbJ1vNfbCRaakOa7bqvz3sRlheS5Ui8QAb
	A6yCRpLdJtJyNpUsmkcBNC5IMuSswhdc3+PW8E0fCkXZz8Hpx0WpH+8+L6nVMHf/HYFsXUol4jc
	etyBpZbj3w10FwfoOxjhDbifymuqDwlqH+2GuNba5qvKFD0aIGuZHEuDYZvA==
X-Google-Smtp-Source: AGHT+IEkM+cNzcqGXR/g2/Fm7KMIw2K2hMEIUQDRb0Lj4wfvuffpqS0Jm8DkEC0wJjXMqCXAW9kZwA==
X-Received: by 2002:a17:907:2d92:b0:b79:f63b:e15c with SMTP id a640c23a62f3a-b8036f12f1emr1445667766b.13.1766434105925;
        Mon, 22 Dec 2025 12:08:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 058/114] python3-dtschema: upgrade 2025.8 -> 2025.12
Date: Mon, 22 Dec 2025 21:06:40 +0100
Message-ID: <20251222200739.2278706-58-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228383

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2025.8.bb => python3-dtschema_2025.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.8.bb => python3-dtschema_2025.12.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.8.bb b/meta/recipes-devtools/python/python3-dtschema_2025.12.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.8.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.12.bb
index 9aba5f85ee..5ae67805b9 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.8.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.12.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e"
+SRC_URI[sha256sum] = "327fdf5d5ec60934cc3eddab09e68be2310173a33e15eee24dffa89787706db7"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.3


