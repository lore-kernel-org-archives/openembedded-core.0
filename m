Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56538C30658
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:09 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.69897.1718966583184669489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJtjy5Y4;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6f1da33826so233887166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966581; x=1719571381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G1XbNbm7xAHoii6+XEhdCShnB3kGhZD9anq0eD+XFk=;
        b=HJtjy5Y4fcoeIEUnYKEsZlwxgfd6Yfx73gaK5u0WPdq8KLh9on9r/+5nY4Mia8IPru
         IljikwWM9nA4x7+kqNvoB5NjZUaGmXxE4JXEZaXUC4bzk8IhLNj3/nUcyOlvllf0MzIb
         gXK9cOaIQUjmy6A0dvUH7PfA8Kv4UEnCvmxU4kiDbbuiFitPdCs38DJ5t+8wBMM7AW5D
         se6vPKU8sdznpdMlSMv1TA0oWn/n918NS+3P7jWSSp+VXgyQK/NobZLWqpj1hv/EJ3WH
         JSO7NcUtPlPnmeEiOIIMakXBuTIneTj3/1pGUeciWB9SZEdt176ZOI3cH6qgub4BjVGu
         t9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966581; x=1719571381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G1XbNbm7xAHoii6+XEhdCShnB3kGhZD9anq0eD+XFk=;
        b=ArqD+dSIIZaDdHDakWVWX1li305/5rQ42AZ35qchrdM/qp51QZkvvy7AWhhTJR8aVw
         ZbeQuFrCQ1VS9qX0wX7erFJUgdKK9J2ZLfOmngK1MXryFhmVaQBuchxkn8jsLwB3tDDA
         kJD6jEpTfUOdhaMRxydbz5fkMAaUN3laBVaT97loe/DdXldXWE8AE/2a6grcO3gIEze8
         5Ld5qtRHRwyv9vBK/xHpmHdhoOT2WYdukRgY1LcOP9XLwdhA1XwrI4GplZzVwVooAAjO
         KdwlI2fn7JuLKHr/9FWS1wh4QAfBJImBU70xk9RH+u6llr9KUoXV89OxJ3QWzE7ozlcQ
         KZ5Q==
X-Gm-Message-State: AOJu0YzjrfqRF8MFP1dtKtqHNQ98AJnN+zQI9TdTIdsg/1Qhd0K+MZ+0
	y36PoJ2we8RBIc0Lh4QiwkanhHqYkaY2EGMHvAhIWVchx41eObwWrxr2zw==
X-Google-Smtp-Source: AGHT+IHhktyEwX0qHxIXwbksYrA1EQRj9q+3JSplX4P/AJXnYF/tSIUZwnvUCguQMuZSbPydy5pmzA==
X-Received: by 2002:a17:907:a809:b0:a6f:b29f:8304 with SMTP id a640c23a62f3a-a6fb29f835amr600214666b.29.1718966581512;
        Fri, 21 Jun 2024 03:43:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:43:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/11] util-linux: rename util-linux-libuuid on recipe version upgrades
Date: Fri, 21 Jun 2024 12:34:11 +0200
Message-Id: <20240621103414.2842509-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201013

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb | 2 ++
 meta/recipes-core/util-linux/util-linux_2.39.3.bb         | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
index ec04c1d3843..71af69e7b9e 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
@@ -17,3 +17,5 @@ do_install:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+RECIPE_NO_UPDATE_REASON = "Upgrades are handled in base util-linux recipe"
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 2cd7750afce..dec4b513087 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -346,3 +346,6 @@ do_install_ptest:append:libc-musl() {
         rm -rf ${D}${PTEST_PATH}/$t
     done
 }
+
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "util-linux-libuuid_{pv}.bb"
-- 
2.39.2


