Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC31C5473A
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.70873.1724736243540120250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIZwbI7C;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so651129066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736242; x=1725341042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0iQaOZIs/jcU0emXqjSZ13wxnWB8b5NW+dKYIi7SW0=;
        b=TIZwbI7CgzzdsUsPx+aDU7HyeFu+YU8+z8lYj3PA5Eam/Sg2XvPGVrur7cj4mr5BWp
         Xo2eU5OKxpOnYMSr7OiiSi97e0dDG+CcsyzeafIHjt1WaJB4O3Eh0yZNj+aBR4J9PiHz
         vC4iz/Q7W+KtycHQyLIUB9KE1J6crHzcWHEmgSFuy9YcJgdtY8sgPDWBqHrSuGunkyGn
         vaPnLyq9sJV5/ulJkwRWUCGA1Vi/uZx88DzSi0wbec7uo98aHgpIR+AaOBuER4ioITup
         t3NrqXhScfVXiBhwoyWJ+t9kfy+DvcxXNP5SUONH1+HAXQz6Z6FItRd+cdJsJRhlG0qt
         ukjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736242; x=1725341042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0iQaOZIs/jcU0emXqjSZ13wxnWB8b5NW+dKYIi7SW0=;
        b=KKJpuxpPYDtRkM3/6Giv0WF05wnqIrj3DhlVXRHaGmHwUdp8SBWFYIEeCa24IRLrea
         RI8J8Ffv0QzJ8+FkSqoL+co2n1ZpAqJk8jypRC5gMNHLiRaLhOVHU1KDhzOF4GRH2D3m
         yniOGcJXKDjoXMldTMDmLuddeiac9Mf6P7JvTPEiL7oqwBdbBqk3ZnidRAji9QO8i7ng
         V4NmZUBW6jGlk+DANKjP/20knygWzjOO4xmPgtlp4vz8CjgxMdM/M1WY7Kw5HgajNEZR
         OA8p6XtBRu/w/hFlz4aT4ucJx4Fmn3yrt8QJUMyXmPZoosvwf4Tcj3wuhXjO8KVgLALQ
         UZgQ==
X-Gm-Message-State: AOJu0YzPHSlAEznm68rsn5hcDOtVdWuVjv3TkkZ7SEHPYsg2HSXcskvt
	DjX9h3WqRdr0eVb6Jo0Ub+k9r4vLsFwk6p3I6ooJ/qZssg8cK8jv74FUaA==
X-Google-Smtp-Source: AGHT+IG2Tsls3w8V4ARVq1RNatzs96Wa8lXH1b30rRkOhwLWX+3q5QWgB2G3bqHboeH8VK+KgWD/0Q==
X-Received: by 2002:a17:907:d90:b0:a7a:a06b:eecd with SMTP id a640c23a62f3a-a86a518b32amr895529866b.5.1724736241449;
        Mon, 26 Aug 2024 22:24:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/34] fmt: update 10.2.1 -> 11.0.2
Date: Tue, 27 Aug 2024 07:23:27 +0200
Message-Id: <20240827052354.1319810-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203782

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/fmt/{fmt_10.2.1.bb => fmt_11.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/fmt/{fmt_10.2.1.bb => fmt_11.0.2.bb} (77%)

diff --git a/meta/recipes-devtools/fmt/fmt_10.2.1.bb b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
similarity index 77%
rename from meta/recipes-devtools/fmt/fmt_10.2.1.bb
rename to meta/recipes-devtools/fmt/fmt_11.0.2.bb
index 1437eb48034..5a7041088cd 100644
--- a/meta/recipes-devtools/fmt/fmt_10.2.1.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=10.x;protocol=https"
-SRCREV = "e69e5f977d458f2650bb346dadf2ad30c5320281"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRCREV = "0c9fce2ffefecfdce794e1859584e25877b7b592"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


