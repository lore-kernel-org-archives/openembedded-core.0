Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F358CD58092
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.17226.1732536108835163069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cpkoxf9U;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314f38d274so55301515e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536107; x=1733140907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFMf7+AEi37/A6FUTfjv2jwPRZbc4o8Rv7Biag9Vte0=;
        b=cpkoxf9UJzWZxQuOCj8HDarBQFqqdv4bOyOh6wYZN9vwI2HdYx2l8lc5Pw8TEYSv0i
         fIEw3yH0/IZ+VQuUDeU8EqEsLNtzhdwuEnZdO67XFN9W3sTjE4YrU+6nMqOGgnJo9zTX
         njkB/kfQgF4eScuzlGWdmLiQTv70IhGdfp+Rp3q6Q87FoA5G9br44eK0qgdpkian7Md8
         zl+cAo5fuIOEinwwdsUd2hIszxRjkknuPj+TflqVIfI+7jLMkuo2STH6EmfGIdq9ICgw
         37HZoXA4qRcBbSB3qgG9cSz6kC+gyy9lOfQN9NmgZSUAS4MglXVd7msC0EFSj7Mlesbr
         zG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536107; x=1733140907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFMf7+AEi37/A6FUTfjv2jwPRZbc4o8Rv7Biag9Vte0=;
        b=F1VHVtqcGy39GJ/kiBVkkvcpwhHuzv9io/chBNCUNZQbmTz7rIMReM1LA7kpxqOfy1
         Yo7aG/XqSSxV7u1CVIICYvko2tl8i141p/Jlrcx9smnxYym/eZuvfXUOEh9sti3FN9sO
         EKIrEj3RqUKA/GRBVqQkNdUl7Cl34NAtwuC4qz2T04qgBXPL55yObNimsasGk1H1Rfqm
         GoSids69KNFpNaF+v0Pltd6gYGgkuO4nUFpPAtH+jlB2+mF/JbqXint1EeXu/nu55ZcA
         iRfxGZ2ddWSjcosSIDAdeXVuxZK2H3wcK9UM/7TgPgvkmhZyUqvBcwXpfO1/hAxesiO8
         zfLA==
X-Gm-Message-State: AOJu0YxQwByFW0UKVYyK7u4FLSAL3BtGwgYXSo2id2QL5/ICwWUuVxlV
	6wzy9AjA0T3RyMMjSxq23P8muJc3TsYR+a5nvqsp3T+SCMFHl4Z34QRp8g==
X-Gm-Gg: ASbGnct22OfUJiJiF4qUwklJRTWN0zsjeApofbKBytV2LxjVs0pnwox4AKgGzg4EONe
	KQxmsH3ZpETU/4gOvwcOa9DsVtDOWvglAGUoHjcjC7SscA7HOhZ4TGfucqYRWrCKDWKE4A9OezZ
	JK9mRqkP14tAI9tLUC73h0o0TVewH70LOBz/lx9n2tAXHBMAzU20IBOsT3RYuUrMhoVoCtcOTmM
	DWAeSSEYHGrhphIujKZ3SSpClWHJgEG8UKT0HFmqja68agc5TSUvzCSBsTtfDrDKWcIl9JAPE4d
	GT1Qqm0saro=
X-Google-Smtp-Source: AGHT+IH/PVI9ZpOXouvVKHWo/xILavJADQof6a4vda2y+fCphgXS8h46tklD7WxvVqI89w3qdY42PA==
X-Received: by 2002:a05:600c:22c2:b0:434:9fac:b157 with SMTP id 5b1f17b1804b1-4349facb376mr35213575e9.13.1732536106963;
        Mon, 25 Nov 2024 04:01:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/35] python3-jsonschema-specifications: upgrade 2023.12.1 -> 2024.10.1
Date: Mon, 25 Nov 2024 13:01:14 +0100
Message-Id: <20241125120127.2205232-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207770

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...3.12.1.bb => python3-jsonschema-specifications_2024.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema-specifications_2023.12.1.bb => python3-jsonschema-specifications_2024.10.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
index 4ee0dd9b124..6ef83e05549 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc"
+SRC_URI[sha256sum] = "0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272"
 
 inherit pypi python_hatchling
 
-- 
2.39.5


