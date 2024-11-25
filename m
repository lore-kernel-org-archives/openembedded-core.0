Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58A4D58088
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.17095.1732536109358636024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TeYI94BH;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4349fb56260so7047145e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536108; x=1733140908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNt2qEjotJerceUIo4la5Vb9BOh3YQU28VvWJf/M3XY=;
        b=TeYI94BH1ic5KL8zJw7uLJseU0MRc/gaODnD88KA7fkANmphPBh5gA0ySV8LkKX1b5
         svDBRSbd/G1g9pmUkGwc3ZrYm5QKQ51lnbU9SZe2FkxVae6KaON5+IWqGhM9CqaklNin
         5/XjKgEiw033TOEYaqh1DWBqeLX8E8K7bD2y71M9gCJarLzOzVDM/qLeRDzEhwYg9EtR
         X1qpFc9RfgUrInbfQITWQIy8ZlPwWlrTKV7YqdKh+GIaW1U8Y23Fyg253i+KxBpM+rKV
         E392yLei+gdYaFWyE2Q54WXxtsZvbNuR3gFDaz6VTiWSPHi+u8ORGFLxZDDWdnYgm/Iz
         1lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536108; x=1733140908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNt2qEjotJerceUIo4la5Vb9BOh3YQU28VvWJf/M3XY=;
        b=twq/Tf00XIJ3QQnhYFt+jp0ZMoYlkH+ZWJ6+QbOCnXSNO/xtAz0Ukj8qbQzx1G6TIu
         bVnbNqBS2nx3mTqk1WTYHcR2k89AJlNIyCwps/MHpTf/n9Glq/dj6u49qpzdYdofkXiu
         KvCFPjRmMgPD9754i2x0gAGow+QVTYfMUS7tTmNc8euBU8T5sx8BdLLSwf0qK4/CUUaQ
         RAoADqWfZ/qrxgY3FCzsu0IDbsZSwK9VS+1E8mypwkzxXHYEzvltDr93+CKov8vb1qSP
         dyUhR1TPTtIR9IZcaMuKXj9RS/j3eiiDOLGdHnhKy/4BwAM896lyfWdSim6/yxRsh/o2
         WuiA==
X-Gm-Message-State: AOJu0Yx4hspZd4fJgKK9gvNaSWpQoZ4q3u2kFYWu8SvmJc3m9+RcBVK2
	ho117HcgWwz6O2FQXeb9K3XCT9H3+gsw6yiDDJLa3skwuCX1hCg8iefjaA==
X-Gm-Gg: ASbGncufcZ6IT8VCjOXfsCyS6AvO7J7zA67UYqqD0vlo5vLW+qfPGhhsvo2st+jDywI
	FCHoLkQVivRLyTSbHef1Ghm1vELXVgKrx8CWq9veW6T4ESwhWZL49QnkgzALV91uUDbpHbzyFHG
	bsH0H9hSPEvGnsaJoEfk+9JeCJypI9WdnOjAGDc7Fsfp+NF0yiwgbWWUgyNCYhAIdSxEJvexPId
	ct8RAfJBNAL9EhmR5D06Wa/pmg1KibE0KI89NVS8MNuMVXNsJ2NtfWZb1q55IWG7mH4zoX+u7sR
	SiWcFavCezI=
X-Google-Smtp-Source: AGHT+IGYmgTGBSPC8EhXeZ+PNmj4GN/+TU1vEhcgqWylv2Rxm6YDqD96HMZPzQ6D+Qz31XMFjEM3Zw==
X-Received: by 2002:a05:600c:a02:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-433ce4b2f62mr106720975e9.24.1732536107645;
        Mon, 25 Nov 2024 04:01:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/35] python3-poetry-core: upgrade 1.9.0 -> 1.9.1
Date: Mon, 25 Nov 2024 13:01:15 +0100
Message-Id: <20241125120127.2205232-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207771

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
index a073f8b069e..173c3bdb68b 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
+SRC_URI[sha256sum] = "7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8"
 
 inherit python_poetry_core pypi
 
-- 
2.39.5


