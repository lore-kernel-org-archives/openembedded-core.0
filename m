Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10888C2BD05
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.54578.1718625940102720979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gThwG7Kn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70423e8e6c9so3742963b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625939; x=1719230739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEEoKM6+jnqNs9JTbtMF9rUJIhSdXDkKIqB7uStbbhk=;
        b=gThwG7Kn+uYEVpmLFEQ9nQb8JrD/qfMxYLpepM5xszAhRwAAWlTTslG3iMCz+IKL4i
         yl8E+ahgcaAovKTL6eXZ4hWcNabzA+eV2vqgdd30UL9iwko8/A/GoGQt33ehNaWYszMr
         YBoOdUqMl6M3NXVS7oqhEkXSjgleiR4GPTvrKmY7TcD06JkGHb0HnN+1+Qn9LCVnmtVA
         5W4RvPtXAPKolx1Nt0EQQ1a0bnO/nDJfAouhhZ2fs2q4rSmCmUaK8sPFuTLhoOh1nFxl
         ZC3H6tp9TCytuwhXub4kqOU6Vc8fV/bGM8B8VBeVJmglCLRBls0IjLWgUadOkUKWwgfq
         3aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625939; x=1719230739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEEoKM6+jnqNs9JTbtMF9rUJIhSdXDkKIqB7uStbbhk=;
        b=VMRL4SVmPtC3CFXQCrrIfWGgb/Tf3jjx6dgMxeucNuf/GBWNK+dyLhaNxjnGQMIqUn
         PRzbD4/j6FhgqXimIW0Gr+Nw9R6ObnQBVr6FH3nSlj9cKN3PMVXy48KPyz0Or5mSKHXK
         9g5BsrMZNZS1+WxSud9he1nqNaBXlagpUHzivWEVnlUNrMYm6Zmm880ossGPua0wUXLM
         zdJz4IS7wvaeriHpS/sZyvD1R6Np/ur4U3Dz27RN7iL7sk4yO7VhdraVDlpdHJj+0vW5
         fv7p2vd0fxvR8dQyI/Q8/R0z5v8DClToWOykEC5x9iipFRI6wCU2DiaYs+EfkqtUv+Fc
         EOOw==
X-Gm-Message-State: AOJu0Yy2Ag2BdZpfz0TeakYTBZVK33lm81zEpRFmX0h2ivLBiETAC/iK
	m/yumwjkt+kIHQ7M8eyPJyuZ9aiCuhEevqTKqvuD30cYYjn5O3M5zlbeuwbMQ7e5yKrJA0HWOR3
	pnwc=
X-Google-Smtp-Source: AGHT+IG7SGjGilF5+j/30RnkZ5OnOlSdYsJ1+ZWvADBXLYYezIvnus8lfg3qporu9RZv4eDoipSQ8Q==
X-Received: by 2002:a05:6a20:7491:b0:1b6:23ae:b295 with SMTP id adf61e73a8af0-1bae83c6cb5mr9003206637.38.1718625939318;
        Mon, 17 Jun 2024 05:05:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/22] expect: ignore various issues now fatal with gcc-14
Date: Mon, 17 Jun 2024 05:04:46 -0700
Message-Id: <454c48eac61f8e690b148e1c598aeb25912b1ec9.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200818

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83e9790fe27c310a4f5a66fedb29b232d23a22e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 7b610b1ff2..18904ebc10 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -81,3 +81,7 @@ FILES:${PN} += "${libdir}/libexpect${PV}.so \
                "
 
 BBCLASSEXTEND = "native nativesdk"
+
+# http://errors.yoctoproject.org/Errors/Details/766950/
+# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.34.1


