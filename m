Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E468D5806E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.17228.1732536111446406647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JF/JXtv5;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3825a721ae5so2353819f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536110; x=1733140910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAUI1pHQQWQ8+BWYLOiq5wLtPeNihQi6haERLUnH81c=;
        b=JF/JXtv51vDySU7WijE0Urrryi9A14Qv4kTO6wjEF9E1p3T1bpQNd17xxsm31wW1zQ
         GcPwpCDXAi07dhJBIyDkLxPV319vR659WGkphYIZTdAJhcf2d4yGiA6IzytX1GMXA12P
         MqTQuB9vA/rkHwyjAxJh0mTxw8LhTitaDQdNcA97w09oQ5UZqoqx9bxyNNcshndkvecp
         kO13D9bQX4IWnc/zehChAM1hsogLNxa2qv7p3RMiSNeDrwmMxGp9nU3yKB6tq1iJFRVc
         WMntTiQJQvu7Sk2WqMEnN4Go8tkNNnk2pqgEu0E9LGOLiui7LUh+7exxQhwL024lLme2
         xwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536110; x=1733140910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAUI1pHQQWQ8+BWYLOiq5wLtPeNihQi6haERLUnH81c=;
        b=fSpwLoCkY3f9ux4DYEH9uVwtybo6ww7QLjKHTaez2xyndbwauTKnPru8CNc7uOJ8qt
         kmMWaDuwziUfkv91l7MIDFmcq4BD/SQxBbXVbV9tSeflxIoAGzRLjl8bM+gsWvyC1Sw0
         4Kd783AzQjtuQnMUjdElMfRQHnqWVW0T+wHbqVuNRnf4jSTXmxALbCGrrGXFPiHEKK0w
         VJXn4KfBu9ZtwYc7HNvR5HtZb+7+uJUxL//49j2lt+xzaY61jz9G2lUNYHlbxR7hdfsY
         CSKLUNSoQ2SUIWOJHtk6ZpukEx5P/7RR8URgR4l7Idnaz5WYdCDE9UHmDIXmawB7eIcA
         8tZg==
X-Gm-Message-State: AOJu0YxAGUkwMy6mKn6BzbNJxP0Oa2mV7zQjtMipALDn1uqK/GwgEk24
	D2ZSXOy3Z9Na8jZ+e9eBr5eN1rqsugCEQSc/A2GpRADePexIhFXO/QOhDw==
X-Gm-Gg: ASbGnct1vEOm6lyp22f5GI5H86ER5MC+FPFsgJEC8eGK/cx9ekuqMrZZS/ZSQpqUgF8
	yqpdraoMAlphJ9YPpG2NDtc1pU8r0+HcfkmGfwpk/RWOdo7NuvIV+RTRtUSaUS5MvNkrMeVQlIy
	W+Pwk5GWbnmrlchQLspIhxMqEvrW5XTO6vcv5yjI5XVNbw+niLMr7VAPJxzONj8WTXP2LEPjdf2
	0ihi7R3QaoGFU1lwqkcJpdUXEgt9Wq9wckrKqqUDoFRYgNSoHEZj3SObGQLOWbNFjiItJ6y3Y1R
	JfT4vWcE6mo=
X-Google-Smtp-Source: AGHT+IG2JkzflcZPH94o5c5Mz8gWkR0RrFOZbzqmQgk070w0IXxmJvc8WzO5J4xVvhQiEucxRUHIhA==
X-Received: by 2002:a05:6000:1fa3:b0:382:4aab:eb9b with SMTP id ffacd0b85a97d-38259d4fabdmr13468050f8f.27.1732536109680;
        Mon, 25 Nov 2024 04:01:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/35] python3-xmltodict: upgrade 0.13.0 -> 0.14.2
Date: Mon, 25 Nov 2024 13:01:18 +0100
Message-Id: <20241125120127.2205232-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207774

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
rename to meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
index e8e275647c7..e99fa3826e1 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56"
+SRC_URI[sha256sum] = "201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.39.5


