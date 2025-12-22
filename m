Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0109E69193
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87674.1766434090445062446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eDU1s6Rg;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8052725de4so272296366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434089; x=1767038889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFWaYDwBbMge5S79Mq4z9MDS4+tMRpBfcg74M+kF1hY=;
        b=eDU1s6RgeUc6Xpb8obmDrWmT9bYVl5eHxlhN8BtlzuYcvLV1pMLfNRGPtSDmu06nW2
         3lhQ77OaYUy44GDdg/JD/shj517PVb90x986e++xBukA+AHlvaNxAvukvJOW0D8Qpk+H
         aiO7Ceg5vyosfOXqirIn4C68SOxza793mQMUh/Ik3pGwbLCzjuYvUZ/cv3F9K8Er3nXs
         l0uJfejTj7GG3fxk3q/R6yMK1/LpXLyxABi1haZcNqpj/hVso9DT1H/JAIwq67VXAHcW
         mxLZN0UWXnYLkTZlpLflXAO78CZBOrLlfU01sbS8iN60CTS1fdluAHgVIOuV+/mXT9ym
         U6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434089; x=1767038889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFWaYDwBbMge5S79Mq4z9MDS4+tMRpBfcg74M+kF1hY=;
        b=FQ2O3ILQ7NZX4ErT1oW4w0gJg+2n7/c492wuQXtsJiDxX7xi2tcYKMNVvc8oiYzWU4
         qArcd11MnUvaFQ9jmBqAADNeFq/uow6LooqB6YTKD0Qp0QELYb1GiKW7oMqBJUxZcGZC
         WyKwOf5Bb/esa66c6HoJ4P5B73tQWX34kHpyLfnmFrhX/ny1lEmZWItRU36o4rL3BGHm
         fCzzCJqDaT6Ys0ZVoSnLVV+auQBwIvhO8HpkCKxnox1RphDrowi7iVzo9iraYA62HrwR
         QBOd60cS0ammASUq/AS7Q3wqkMbvBDsOBViaZKM8dDMrJFQ5LA/0wM+KunPc6SOteqo2
         uK8A==
X-Gm-Message-State: AOJu0YxfCp+4jhYcPTvKfgAa4kpUzMyDdamNpje44r44ot/FkSMwau1B
	0qlPVheIq4DQ8FkVZi7bDTzmHBqi9kzYmmdhIRNwGxUjPpH/dDl+pt2fnGvomw==
X-Gm-Gg: AY/fxX740/tD62ESQnc6Pz3MAEc9oluoTUNzoz9GfyFXlEvTFvVHtBu9JNjfSThPYSQ
	lGcq6Oh0EzeHZHvJNvc4o79+0hhx8s//4qkF/p/j7Txxfry4zpd/3tOFsuCEC4BWv8yU6ITTZN6
	hasGSleDr7SPVOmUwcP76CONJ6dYgdppeGikrrUlVQetF+CNlJrCHqOq93tVbeI+NRkdaieS/q6
	rFMfAWqZqThfmh/7Jllcw/AqFciEVLxATSsSaophl22C2/4l4/JK2Ru2SEwYUqRSSuqB4gGpw7H
	wKResD2QZ7mx3fZVc1qjd/RSWBdngb0shvCjddMbMnKkZc1tN+c/VCugSGm8W+3/n6XyYLXpLRm
	aoyhW9rr5N1NmcJqaayZQQR1lnTw9UVHV4QL2noE04eLuiZoMjoL1BO9Fkgd8fVKF5lX7caT9sJ
	SiCzkSsnHi5s6xKkd/Z14fwEuHcMpkNwSoSkIwP8YSAWQ5Cic=
X-Google-Smtp-Source: AGHT+IGsBmopMFZSPN9kethQzTNwFqUvee8PbcETz9kSXrhjupBX/klugO6jFNIDS/7R9xYmPDdMOg==
X-Received: by 2002:a17:907:3f20:b0:b73:8307:4e95 with SMTP id a640c23a62f3a-b8036ebd51cmr1324058566b.4.1766434088718;
        Mon, 22 Dec 2025 12:08:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 032/114] libgit2: upgrade 1.9.1 -> 1.9.2
Date: Mon, 22 Dec 2025 21:06:14 +0100
Message-ID: <20251222200739.2278706-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228357

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.9.1.bb => libgit2_1.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.1.bb => libgit2_1.9.2.bb} (93%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.1.bb b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
similarity index 93%
rename from meta/recipes-support/libgit2/libgit2_1.9.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.2.bb
index 43957a2087..2e023b44ff 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV}"
-SRCREV = "0060d9cf5666f015b1067129bd874c6cc4c9c7ac"
+SRCREV = "ca225744b992bf2bf24e9a2eb357ddef78179667"
 
 inherit cmake
 
-- 
2.47.3


