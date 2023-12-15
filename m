Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA545C46CA3
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.57791.1702626738966539749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4Uvcy+I;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-54c4f95e27fso290933a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626737; x=1703231537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2ap+tVeJyFQNbyaSDPHyJc7H4MePXyC6cwZLIJSw9U=;
        b=K4Uvcy+IHvbka0aFbACuJ5HtIB/m1DYTspqs6zPX3RdPV3Kbge1fTLEBeJzWjgD8mz
         me2sb2Q6wL8URZjUkDBd9ypC9h6wbilm7OzgTTSWN87zSsw808A1wNt6qYL+dZQAWCdr
         NDsHCBdz/27TAzNQGoLHx56FdwNUeNWzXzFyfy0BlLtlLI8wxB5aR6FVY3RIkVk8gjSA
         aGBFOOMcKfa9ZmSg8ksHjb8JjJODHXtBugLdObF6tVv6RX7fdsH2+uD87GuiGEXlTAjU
         fi5yo07Vnn8+wctEWJ9HDQCxbs3OddYrNNobfFk8aTxYLVKOMQmbokfwwvJulYCXVavz
         7BWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626737; x=1703231537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2ap+tVeJyFQNbyaSDPHyJc7H4MePXyC6cwZLIJSw9U=;
        b=BsZKwaxRGe4jBRC1CthA2zcf/q8M6yONp5uF2ZaRWdYhhCf8A2gbzkd6iZ0c7v2hMt
         dtKqPPjMcfYdyo2hGGJdxuCCvOqRJ0cdOx31DyoEFARLHHaA5mp9JehgA8LVqOmppRj/
         eaTJe5laept2XDaMbGNw1TXyrlJ8oGUGSot2ZtkZoC4xdQmzyhjxpMjPZgRNIvqCthao
         EDq5ht0jeqIRwpifRh1VZS6w1u6JXPCPRJGRTOwO6iz6xp9QSB+wToAWu00R+410ko07
         IQGxuLJSwAkW/MqL9FSdaL2I8bwrOmz965CPF4g9H7vAu3MZxc8GhTXugfsdQ9SDmetM
         W3yw==
X-Gm-Message-State: AOJu0YxnlsYm39kc2VZlEpZoECshRocI2HKySqBRSEx1N+qVxJvyTcTZ
	8kTjOJ2eNsIUMRO1jey9ex9+ajFKwcI=
X-Google-Smtp-Source: AGHT+IEsQ9newby7cKXROedlAE28cw41TWkbWHoFqBJZPdFaJ/3J3MeeWba6l/B3U8B/1zjPGqmCnQ==
X-Received: by 2002:a50:d71b:0:b0:551:8349:c1c with SMTP id t27-20020a50d71b000000b0055183490c1cmr3848834edi.74.1702626737446;
        Thu, 14 Dec 2023 23:52:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/10] python3-babel: replace distutils with setuptools, as supported by upstream
Date: Fri, 15 Dec 2023 08:52:06 +0100
Message-Id: <20231215075210.3049785-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192418

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-babel_2.13.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-babel_2.13.1.bb b/meta/recipes-devtools/python/python3-babel_2.13.1.bb
index 6908d813265..79d8fba77f1 100644
--- a/meta/recipes-devtools/python/python3-babel_2.13.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.13.1.bb
@@ -14,11 +14,11 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-threading \
 "
-- 
2.39.2


