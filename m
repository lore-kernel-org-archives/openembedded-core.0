Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66136CD4F35
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.16015.1695367495683275885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DitIWPgM;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bf3f59905so219130266b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367494; x=1695972294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igRWJqDS5TqsJbaJviPNJvoEYc6hrYLafYE9s5Kw9wk=;
        b=DitIWPgMn81hLwQMrpjtw275pBf7EkF+ICOgu9UnMKpZIoJG3OxeSZHCnbieWdhKVw
         YWq9xxISvzZyAqB1G8rb2N/xkaadq9tmTBvM94BtunAlWxZUxZEHoKI+ucyOh49sJZxe
         AnnOGtzYJSNmrZGPGvzyAHL41bb7TIxO12j8MtGZHqPBrbkFJeCFAXKtjdFcK6OjiWvX
         qsPSwUyYa3M240+TFq1KdFtIJ+l/quJB8WJ8gkpf6xgOmpeUE6zexq6+1VBE92Kd7kX1
         72GgvFKnqbqCLU0+TgGEKqB84Fh+fSeJPU7dOBe4ioEKGgR2O5uc403G3yoKoXaISUkb
         dYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367494; x=1695972294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igRWJqDS5TqsJbaJviPNJvoEYc6hrYLafYE9s5Kw9wk=;
        b=ghJoxotBdKjwMjKvUQR+im9Xp3nwgfJTHVX7RPNbXAKGZkmXmJdJrw2lJeFQzmW70e
         w7dAXgXBbo05tyrENWBzn4ZRG+zj5kAJ+3pFB4UUgUx6nUtC2hW9nJK9NMoua0M0YKD4
         5VRWH9yZN+xObGyusZxS+oyhV6hSWy+LMKJbPWKHdvFIDL6J7Q+QYq9bgY4BKyv1M6GZ
         iTWvReNqcYmwjR/DV8ulhXIePZJMjwX0JQf3bHlwyXGcjkTyJ2OMdThZAPsQQjzpLOXT
         Q0/D2w+lIcEGaoQXgvQi+KAB+vB/B5rpfHcpRHz5gp0btcTitCPjFNVFdHrrXMaTG019
         jPYg==
X-Gm-Message-State: AOJu0YwudbLZLrLgjyxUo2d4QcM7gNOGc/BFAct1ohuqfgHp1f2I2p2Q
	iZPuNTrudZk+YJy25Ecnxim81g+hPEU=
X-Google-Smtp-Source: AGHT+IGAbw7GeEqS3GL0RWNdDzYNuBRBG2TOmYnw39fcpbUgoj9bdf7SWTb3z0FWjKwnD9LiCtXscA==
X-Received: by 2002:a17:906:846a:b0:9ae:7d2d:f2b0 with SMTP id hx10-20020a170906846a00b009ae7d2df2b0mr352203ejc.63.1695367494101;
        Fri, 22 Sep 2023 00:24:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/40] python3-libarchive-c: upgrade 4.0 -> 5.0
Date: Fri, 22 Sep 2023 09:24:22 +0200
Message-Id: <20230922072431.1481743-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188073

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-libarchive-c_4.0.bb => python3-libarchive-c_5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_4.0.bb => python3-libarchive-c_5.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
index 3c6bc1e1cab..5ada76fbf4c 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c984f71d7fa8416e5"
+SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d32b159"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.30.2


