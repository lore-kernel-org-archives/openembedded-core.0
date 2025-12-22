Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4ACEE6ADF0
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87699.1766434119625712278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hejFvqvR;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b727f452fffso864729766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434118; x=1767038918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t19aKZif1CRurHCm+p6cnL39Xo1C7G0iAZopF36U9pY=;
        b=hejFvqvRZxBdPP49S4/8/zntd/mFZIu4MIlBc5QaMYkSa72EI7UVDNin6tNlrdRd6F
         erx4zeSuVyXesoQtu/S4Wr2EDlkPEMCPmQEnSIrfQdDj5c1wH5voT69S8juhkZGOxIWf
         wpUBwTWjqaf0mRWNsjH7ZONelzC0fx7whg8dmaWl/QQYeBauvG5ISxGAVVqiSXFXe9WZ
         LD0/4HyQLtr5UizHL4JJxqhTj7fw7CRr7ihFiyqDZoNJRUw6ELFMTgpIfZVb/P20He2B
         lJcd8Ue1IzcfrJMI+j7mGqTErci8aWSBXeoAtKiVVLrB9Ewi5/aCbPat0FM2iIvQ668F
         rbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434118; x=1767038918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t19aKZif1CRurHCm+p6cnL39Xo1C7G0iAZopF36U9pY=;
        b=ElMk3Epb0T6LJPHfAJ94rWG8f7SOmN5y4XS7/cH//btr+KsOCoMW/MGmMpBJb+BzpN
         h9ZH22ZMgOAICdBjBGolprsmxeysvwDx+neBJxygUoH8eqDpLJeozvymMVzIIsc+r1Xj
         ysbDKODhoBWmfKTQGyjbTJm4SnO57hkt8zAbQvVz9ECSEGlbUa4YKYTSVA0SLlESzIJ7
         o/fIwk/Gl8UoVKBUKfD/qOYXn+uiD1wR2rn1Cp1w3+ypa1ZHEUr0xetDitoNW/CfZEBN
         DqFz7e9sURGRhlH7yxnkyhU5uNQ3Kaqtw8NXasa1/PV5AefgSsGsPgPazx0xZt/KbCLP
         Zjlg==
X-Gm-Message-State: AOJu0Yyf3hfVJEZEghEgS6ceooMclxhpb0B8coqQ5s+I4jgbwDDGiZGx
	dlCpLNaQ+uIWCoe39dgDoU49fjFjopO4Dd9/ZzUZdeHkAJdXvpMJJY9sRQeuOQ==
X-Gm-Gg: AY/fxX7wpYKMkFoNDrgL62faDy8Rm43dQ8tkqpvbKqNg2oLSnXtBCwOfH9xeMhbdlue
	QPBC0MA2SzR0aOf44/Bks7/eqNXYMV9qvgmqsuB3/Yw4MYiOvf+gZjuWsFlQBNUt3PdsmAHLbMw
	qKuc//dqlBXaoD5j0/k6UNAVjgHXZe6vi4wL1sdCn+vtwcX/ObsUB403R0fLwYqzl/ZL78e7ZI4
	xFj8i+n/AkwdWfyuuVc3/clzTCwU//+z+w3gGjCH/5UK8MMETG+U0gh4Vhgnx6mK0o3V9ckQIMt
	5bwRIgAALZNmeiDbiNOMKy7eH6eks9DRZC4XQzcheVi6u7z0eqJHhN8V72S7a5BAMfJvXTI24YB
	+t4KcEeos0/ioIzlA7n14uMZXGzrsLwL2Va130Rjz8Ezx2INm6iOeXHTIwqht9kLb3JOINE41Pq
	QKoD287eNm6ikk8dF3bJEElbp7m/2dHI2cm0g1jzjixt8+lQo=
X-Google-Smtp-Source: AGHT+IFqLX5xFG5kqd7xictMvfyABqRlDdWRVt1W8uN5PoWYHAaIOPDqaP2pypQ63BEs8liw7IoRSQ==
X-Received: by 2002:a17:906:31d6:b0:b80:3fc4:3762 with SMTP id a640c23a62f3a-b803fc43831mr825065366b.1.1766434117946;
        Mon, 22 Dec 2025 12:08:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 076/114] python3-pyyaml: upgrade 6.0.2 -> 6.0.3
Date: Mon, 22 Dec 2025 21:06:58 +0100
Message-ID: <20251222200739.2278706-76-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228401

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pyyaml_6.0.2.bb => python3-pyyaml_6.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyyaml_6.0.2.bb => python3-pyyaml_6.0.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
index 7ebe3f7d9f..7e2b088ca5 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pyyaml.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
-SRC_URI[sha256sum] = "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
+SRC_URI[sha256sum] = "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
 
 SRC_URI += "\
     https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test \
-- 
2.47.3


