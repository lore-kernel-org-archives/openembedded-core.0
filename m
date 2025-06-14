Return-Path: <setairidis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84273C71135
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 20:19:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.16835.1749932354045326955
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 13:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ul2b3EEF;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: setairidis@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade33027bcfso514870266b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749932352; x=1750537152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBkQiNfixrlF3hIvfrBfvoR70R45jBh13Md31QfeuRg=;
        b=Ul2b3EEFfaX9hVQ0KPYnYGK5bQOlGzeYtcMrT3zoCU0lL+0TinnB6UQtOUFQzsBzQ8
         Tw2qaHqqMAJ1yibGyVCPy2aMnQYKdBASgb021Qq/nBwk3sGjZZkeZaq48JW7h/ggkMAY
         VVzy47YJwhH4qmHW25emOeCrihzaNcYZ/5rfJf1zsMjy4QlUjMb9wVjGFIJwX46S2eYd
         N4Jun0B0lfdD1RD5CeFyA1LS0/1Zrs6XLK2TLqBIwS6jfVVnoWNZ1MUq2v6IqlPTRse5
         BaXivGLiUVvNEafXqVkNrlwCg19gQGlTJcjpiUmdMUP/z5YNavbl+D9X8zBeDDfHUOhB
         Yj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749932352; x=1750537152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBkQiNfixrlF3hIvfrBfvoR70R45jBh13Md31QfeuRg=;
        b=SQFtHdAHpZrjxK5M3O39OkPiBJIzDiKvGvRhPR0dsvBEd/oPY2U2umHHp6PTnQAKLA
         4j/XYh9VJ7OMEjaDcge/sDuLvG8ywn4cF2FHoHab8u2abU48fYS1BOTmx6zGzl6sjfCB
         aFJWuCOnNECMB2mkHcRdywjhbjQ3yg2Gtv0WcCtRdAdAL7V/64G2Bc9mr9iFEEFiiyfe
         /lX8ua/YqFqyjemAsnrt/OA04Mbq+bOWtmo0RwlI+aQmJRNgY/Ke4NDVF/LE0H50gQWR
         ItjvDMU0QRjQVtwdiy2fazKyAB/SHotk6AtSuOXpArus7gv2JeVqo8/xmO0nhwwrEJzi
         IOgg==
X-Gm-Message-State: AOJu0Yzcl9Xjwsy6LaldanXQ1wFnvPm1J0s3b9yPYJd/LzmUN4tqGJim
	6M6C0iWoEghdRoTdI4Hoez2wUCGE+4D0gLKN+vYhJ5fD2ier6KH+sur+cU1FsiVnPCc=
X-Gm-Gg: ASbGncv/j1Syj5N6fA7kM5DoLE36ZnmikuFDdKD8rP9rhhMO9wT8cAdjXjvKCnyM/KW
	KFvVLaFItSaDY3eIC/YPx4r9zcIyOpXq38TLHxsqF/r4TdK/6x8gE4uTZm9h8KZGY2UvWV2a06L
	JUfq1/DndMg+/s2toV8uPemVjC27Mw6zSYRPIqNMAK9jwSPgTvuKYvk9Gx/o1nqpWMxebwECvwB
	VybPGPbWFctBrE1w6pU5Nd7D1iArwgbmFYN5EyCYAwieWqfzrYnwbF1mrIe0Je33FaJamIviOyc
	CPXZYSV9o0ftpRlDHGRlsMag0+Y5hTop/BOeWj1iYjjhxq7M7swU/leGkwklzM9C9m0Z3h2+VMh
	KZq9XgmZCSKRPZqhOXa3WNV8f0BRkfVFkKdYHRryzkvNc7p2/j2fRAvkUg1eIJyaIV0e/zA==
X-Google-Smtp-Source: AGHT+IG05fHxTmo/FZL5mvCOJsfi2UsXAG9VUKqX91RoGzQPp7F2NgmPJ4ChtYY41zoQTfrivVcWQA==
X-Received: by 2002:a17:907:6ea5:b0:ad8:9428:6a43 with SMTP id a640c23a62f3a-adfad365913mr361545966b.25.1749932352339;
        Sat, 14 Jun 2025 13:19:12 -0700 (PDT)
Received: from DESKTOP-LR19VKC.localdomain (ip-095-223-184-217.um35.pools.vodafone-ip.de. [95.223.184.217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf688970a1sm247717166b.175.2025.06.14.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 13:19:11 -0700 (PDT)
From: Savvas Etairidis <setairidis@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Savvas Etairidis <setairidis@gmail.com>
Subject: [scarthgap] systemd: Rename systemd_v255.21 to systemd_255.21
Date: Sat, 14 Jun 2025 22:17:54 +0200
Message-Id: <20250614201753.7492-1-setairidis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 20:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218639

Pumped PE property to two, since this is not a version bump but a rename.
---
 .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_v255.21.bb
rename to meta/recipes-core/systemd/systemd_255.21.bb
index bb9dc3da33..aee677bc87 100644
--- a/meta/recipes-core/systemd/systemd_v255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -2,7 +2,7 @@ require systemd.inc

 PROVIDES = "udev"

-PE = "1"
+PE = "2"

 DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"

--
2.34.1


