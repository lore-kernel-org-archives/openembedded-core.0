Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239D7C71130
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 06:38:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.12674.1751956698283941706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 23:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GMt6WuDU;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234b9dfb842so35869855ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 23:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956697; x=1752561497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLhYVs/Nsfg4Rw62vyZOXVTXUCsv4UOEbtk8vIrBUKw=;
        b=GMt6WuDUkpAWCsA9zVJbIX0QPk4+yztkZpBFTSxoVONNuuE3zDU30OJ58ED8hbrFGD
         N+4NBY1ATSFXrdZekaLoVbQf9Cxy2QIMzmfzthBCVVqbFfEP3mFu8XQpvtCUAxL5qeCe
         kIvnHgBI2CblIWZZRFhbTEUrd63LXM08x9CYQjVTQ1h+7040Qwac92FksnrV9voqgyDe
         Or9aNLmUvcZqtFab/565XI9oV5exQ7xLHPCy8ulaznIweAa7s4WZ/+fgB7bZ8v9cgGjK
         EQ6biFyeS4iERXa4g6C1Lo2sxKr1u9ztkIjjy3sHoTEUc0zI0xenEUaztmShiK7Oj9rb
         1plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956697; x=1752561497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLhYVs/Nsfg4Rw62vyZOXVTXUCsv4UOEbtk8vIrBUKw=;
        b=pdspHiBGpey2q9rPr3LCx/6oYgsmgZUX6/opKozroZbDzovsxY8hF1U+8mF2FgdsHI
         IYTkrgrMogAS7pHSXCXGwXltYh5XjUvVBCjKzm8PHUHoS7sf0PsOQNS3jZ0bxzn263iq
         gdKJ/qsd4lXFQeirMr+xZZHMqMkwKI4G7d8rXg68N3ZJn9ataPCJiZaEwoSSZZxWhCaf
         wGQlll+WuEcWOdB9v4xJRiBU+XaH4L7ziiEvH4vMyBgxOVy1+Z2sPeHbgWzd1svYKGfG
         hYSTo+JrpSu1fM+iNwFFGYZNwkiE87kqIuY46uWBpx1KqJmYNOvz+xCmnvyfC9App0t2
         Bk5w==
X-Gm-Message-State: AOJu0YytBODMi4w9902ldkX/m6VuRnQoITAs000/KA7En7IrxcxVQnj2
	7idrLIxr25toFZsQZG0xafLgrKFHGy5aIlIe9vauLoZRqXthkQ1bKM0jfEZwVha9
X-Gm-Gg: ASbGncsFLtM/2ksdPsJagZNUsnH//hgzZVf5YKoN7JE1kYx2tGFc9tvhJw7P0bo5KFz
	Qi8aau0jfEPOq6ejV6a8wmCcGFtoSTnn3Ko3kNjzphsA4u/ZAyYOlmWhzke78Y2EjCQejWuPtQL
	9Oc5rksg3S7QoGnDzzUX37x2njFoDB/C/bq75JwckNXbElT8v8p+Kwc+ni613zLtIWdvLN/gEeu
	xTI25PD7Tz4vZI8X79+AURnfWTcnY1iVXnkWgMRqJSC3Y1MLQiMVZpPN0VbdWKp/ZkwLAV/APef
	ppnFK73dUubqkFKO7wc+FAkD5iBl/I6tYf/KB8hgC9Yp7NoD5o+DJA==
X-Google-Smtp-Source: AGHT+IHJbTNvxHtpZouLpwIWXW+fCRhl46XXhhbB/syGRHTlXMN6cwSXmAgke0DkBR1mlWjYWlYPXw==
X-Received: by 2002:a17:902:ecd2:b0:234:966c:a2f3 with SMTP id d9443c01a7336-23c8755bf03mr189329285ad.27.1751956697263;
        Mon, 07 Jul 2025 23:38:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e9e1sm107839795ad.175.2025.07.07.23.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:38:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] python3-pdm: Upgrade to 2.25.4
Date: Mon,  7 Jul 2025 23:38:10 -0700
Message-ID: <20250708063810.1921024-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708063810.1921024-1-raj.khem@gmail.com>
References: <20250708063810.1921024-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 06:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220012

* Add credentials when passing source urls to uv resolver. (#3553)
* Redact credentials in source urls in the log output, and inject credentials into the source url for uv sync command as well. (#3555)
* Fix a bug that extra dependencies of transitive dependencies are not properly installed when USE_UV=true (#3558)
* Improve the terminal output when setting up a script environment. (#3560)
* Skip non-existent library paths in post-install steps when trying to fix the pth files. (#3561)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pdm_2.25.3.bb => python3-pdm_2.25.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.3.bb => python3-pdm_2.25.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.3.bb b/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.25.3.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.4.bb
index f3ec4e60d39..1e25e189742 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.3.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "6d0820f805dacf64d55a7fe56777e7d8349a2ee35efc3006f29b4573d1311c84"
+SRC_URI[sha256sum] = "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1c6102d039c8f211c"
 
 inherit pypi python_setuptools_build_meta
 

