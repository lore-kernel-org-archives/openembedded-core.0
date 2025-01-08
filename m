Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D56E7719C
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.14680.1736325756425456495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLXZwH8S;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa67333f7d2so2409816666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325755; x=1736930555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/eGnWSob+DrOnQPGYp9DMxyhbX1YSeYwlAN6iV5A4Q=;
        b=JLXZwH8SERdUw4GS8Bo+Tf1NRfkT3iX7O+HhIImD4SDOvUWX4GsTfYXaZKdXigC5XP
         Pj7pW3Veg45DY++oUiTrFRzCPngrJ5PE8Jxt3X2nfuCWTJ0qgj+DOrd6gXhgwFPfYk6u
         ZZ6yGnYkk0V8BQlJ3YP6IsRTVNxjVNAA5YxYXJfaPw75pMXqzy1S1ZA55HWkW7AA0arW
         H4QwlC0KwAaOdoaQ/WIWl2U0ICmYwDdgIwpl5BhS/kMf2EschHKtwZMUx75xJ0021faw
         R8GRyKwkEc6t83V5e+TJSmvSnVPa8BX9TBAp1j7LEELVIYUeCicfL/w5tIgq8LOnX3zI
         05HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325755; x=1736930555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/eGnWSob+DrOnQPGYp9DMxyhbX1YSeYwlAN6iV5A4Q=;
        b=lOK5XTohWuy2TT8wTrutyk12rofyF4BEhhkX0hrHFD9VIgWudD9/lTvO9kfK3L8lsS
         8h0se/afsVJGFeV7T3OQaUdtMPBD2yJVsiOrMdUtWfr/jDzNeXxE7t3lr6nKng2gM1yD
         OXrNzVT0orfr0ehXZWu/uLFqSrtNVXqm2j6NXhyEqI7gjPYTw3ndh3XOIxt//GsO6N82
         ju0o8shhsVGKVVciPfEhyNpFct3kZhoS90LvmmM/DRFeXKViqKOvyC7mxL2jS36Dxo8g
         DwrI7KDiQ/C+j3QVAs11oRe4SCfIvBRDZY97hDc7pybxIW/6sGxfJCtGCk1WS9V1l46y
         mhnA==
X-Gm-Message-State: AOJu0YxwsLHJQUIpVN/pJ0I1lFACyCTVg6MkcHX0buT34Xd43o9LXT7Q
	V1QeG1vpRNIYWqorM/o2SCGub73+WrBJ7bpobTqbUolW1TMrVvMhskl6vw==
X-Gm-Gg: ASbGncvLGnzXI57lLcmvxSFYAACuwJmQ3DJXAQV9aYuRv2G/IKfp3v44AxSjNMzxjQH
	5lqWI7oeNehKB4Pq4KM35eemJvzsUBSBQDhK06oA4XOplM2jS7IoxY38rppcT6lHdlE2J5pXRd2
	2QxPkOoQzwUbfyL0MTjAT+RR2ySwAeKt+vYKnH76J/zbvEag96zxjU9aqJ7Gu1hT5K67ZYWj//u
	/R6cXrMPCC9QDM5c3dkXbmaD63Ra301MEy0et5QO6x59U2CB4LIhMtnYxMLaWcbDee0TP6aVrX4
	BVgOqx0GiftTgR2Myw==
X-Google-Smtp-Source: AGHT+IE7gSMpmOdwkhEc9Hx8fbDHdm6ZmLe5p71y4vphR4wi0BhyJyvXFf8ifZcUB0Vv30BQ5BIwnQ==
X-Received: by 2002:a17:907:d92:b0:aa6:19c9:ad08 with SMTP id a640c23a62f3a-ab2abdc108amr146794266b.48.1736325754572;
        Wed, 08 Jan 2025 00:42:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/20] go-helloworld: update to latest revision
Date: Wed,  8 Jan 2025 09:42:13 +0100
Message-Id: <20250108084226.117178-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209529

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 1e911e16940..4d2b5b63bc9 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
-SRCREV = "d7b0ac1278591aea848a99258ccfdee8e4d454c1"
+SRCREV = "40afcb705d05179afce97d51b6677e46b5b48bf5"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.39.5


