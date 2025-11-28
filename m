Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AFDCFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10194.1764310740183153907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JBiGBIu2;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-298039e00c2so21190905ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310739; x=1764915539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hO72tXsfajLTiZwAl0cIhEGKaoWD9ZVH0/2kFs7wyo=;
        b=JBiGBIu27tukxdEytnkMdyB5FnZEXXGk02ZgbOVNi15M94tlQnA6ETh7CTZMw1S19p
         AJoD9t33vuoS/HEmbIwJ78FaqhYn1lNPFd+OFFkKEso0aFX+AgQF7mDSHStwDSGfVgst
         aSR63KiCV6eBY29yqjNLaszvcgYwG8HLSK719CvGV2cuugd2LymAciVyFJqC+bekge4l
         5b6rfIrnqSphf7NtwbkY7Hml4JL+3ekeYhsphYQpytvGQ85CRViF/ud8HNWDsmNeW7VI
         oEFKh1Q9jT4iis1X/UD3/heLpk+o2NZ/BmPIOK9QPqCA501AyeYI6MyvoWUXCgcSLwAZ
         5aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310739; x=1764915539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hO72tXsfajLTiZwAl0cIhEGKaoWD9ZVH0/2kFs7wyo=;
        b=iKuHKo2H196g1Hp4tMxfKvJ/OjiMcA4U6P8xe0UDDlHjol4/E7EN9GZMmMhgMHTjXL
         29lqXlqWjmRRYO4HUdVht6LcY5M0vmyaT7U2HAk/207nBpRixw9ANrZZsU/hZaSjqbin
         lLD2oWiqG4wL36QmCCXyKgD0f1fT+gVXS2DRirAc2hSBKX7+iKIz6SurBOjd6LwzcCk2
         3wKfSnEbfR0ayaTZpbXv/IU3a9AsA/aBjSKd5s8VSqG7LlqybSLJVr3upeUNoSHST9Ms
         qKhafCP1UvrakMPrJ1/koccW+vGL1NdEJrqu9VwMk6WmW3crf6oADunZ39qoUHtFw/ra
         gEeA==
X-Gm-Message-State: AOJu0YxzzVQd4O7dEwovg8vyfSbGMglmBjxcTzkl+En2AFfWD6XVN3Ke
	FtCcTTa6zsjYOQO+644eyvNCBqepNwH6RNGh95YaJrpVUqFtHPJ+XeWUa6+0+Q==
X-Gm-Gg: ASbGncsQeI9oGmetuC5aSVkBoSHYQWf49fgTCtvIho2ezBlEoAE+oNyJi1gSldDUanD
	lTTL35Q+uH+GO+LfLI6U6/Hk2hXT/6DKTn2fiCFgAN+RquST6gvdwszfLwZjFyiHETCmCwbCCVv
	mR7xWHs/HVDmVBIeeTot5nXgFTAF0ZXM/ZK3FBhCr63Dd8WC9XUOHMqb6YbCT9Uc6vFt3IipicL
	Wsyzh4m2Ach/QSvspReeI4uNNLKwJXrNuEYszb6GnIu2tKxkZeagHc6PYIH5gGPJBvogEniCprx
	/3cYuoQ7jVdAVMefzUe9+Shriz48EPcDZcIyuKzetyzwg0h4OG/4YCm29ULttopUYYCztLyA9Hf
	65DlLeHRvUJdYKYflKIQKK/mnRoe+smoYwGMUlYigy79N+LTGTnltrgovBMPmIsCTU4eIUdNH7f
	mtJiHdrQfq/pi1aDJCKjmA3MWwc241JYoZETE=
X-Google-Smtp-Source: AGHT+IGEEE2d0w6lp632Szy7Gt0Sdfh9wFQjev6JejnlNf6qg9mm6KgvYTpNaUePiqCTgloy9LySiw==
X-Received: by 2002:a17:902:cf10:b0:295:4d50:aab6 with SMTP id d9443c01a7336-29b6bec46afmr314704705ad.18.1764310739378;
        Thu, 27 Nov 2025 22:18:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:18:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 02/14] base-passwd: upgrade 3.6.7 -> 3.6.8
Date: Fri, 28 Nov 2025 19:18:39 +1300
Message-ID: <20251128061851.1634479-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226885

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../base-passwd/{base-passwd_3.6.7.bb => base-passwd_3.6.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.7.bb => base-passwd_3.6.8.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
index 177927d674..609f67037a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
+SRC_URI[sha256sum] = "fab3d0e6e8b641e116bda9bd5f7a7ed24482384c1513f6a369b506327fbc8dde"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

