Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7ABCF07DE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:29:48 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.39462.1728552579981910266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIBr16DU;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: jhatnedap@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso6738821fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728552578; x=1729157378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqwwOiCFxOzHhCYv1sA6ZFngEM3PzFsNUxdHwWi/5rA=;
        b=CIBr16DUHaG5k8cnXJwQ75sUlFDGgXIB42ZNbp4fr8l0JyOk5D8vUIt9gW5jCXUtXU
         FpKEVxtsVIHvyPfmnhueUYd1PYbRBoNEae+IcCyhTHgDN6lrJIB8gFMD1DO/K49Hr1zC
         G8/rjWR4Ho0miLElO+opcJehk9HJ65XqwCZkByFBx6y7Vg50j0fR9QN4yswNHd4jt1Pd
         3G8+88We9fLnU9DOYBOI4GE6zT9QY7YYrZLq3BznFEQM8FRa6ThWM7mYPsphK/4srofz
         7iWSYyzt4WlgqP9Hj37426WnL5h+dcV8cqqVp3llcU2OQfzEll1f5lN5q7g6amXUVyYf
         6/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728552578; x=1729157378;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqwwOiCFxOzHhCYv1sA6ZFngEM3PzFsNUxdHwWi/5rA=;
        b=PTwSlZ08FOEWbzrUAIVM6BjmMSJe3Sogojxzf6aipgTM+SUQiSkgG9Zjit7ORKysQH
         JkwcbeqFdjtpyDyt1qQVFjmjBc7RjMaQ2c36GEgbikGtntEjPYX8mRn5eVtBEEcyhiyh
         k6M4HUb6dIrUP9dImluSmQcWEbnDJZcIXmxfWCcoV6KEi2Pki6NEpbB8dD4ehrER+rnL
         +/vnmFsBsQfivpqKvkvaq29tcgHsKGQHp1X9lJfuDAM+52nU2QjbRBzGS+MZLdxm8Oee
         4qlRk1b1ux0u8PIDXe4YLkBkVlzz2rN5rApbUyKY22xILC5qsy3nMAuh2yDHgwa0tiUu
         PHPw==
X-Gm-Message-State: AOJu0Yyb2ceO3ewWZ1agSTpEe/ya6HqOG77yePYu6A2zNZjpge87BGdh
	XNkb0agjQn7iLPMSXeHRah7SGKW+11ocl+X0JL53fjzMvY2kjrlKML9wmw==
X-Google-Smtp-Source: AGHT+IE7arX7YC7YKziz9INL5UrWlQXroUhDBQ54Ub1jIt3u2dGJtqNhc2KY7xCyomWdZwU1qRzqKg==
X-Received: by 2002:a2e:d01:0:b0:2f3:ee5a:ab8b with SMTP id 38308e7fff4ca-2fb187ce9a2mr30469531fa.43.1728552577504;
        Thu, 10 Oct 2024 02:29:37 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153032sm529717a12.53.2024.10.10.02.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:29:37 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH v2] libarchive: Update SRC_URI to use https
Date: Thu, 10 Oct 2024 11:29:13 +0200
Message-ID: <20241010092925.982-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.45.2.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205401

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---

v2: Update for version upgrade 3.7.4 -> 3.7.6

 meta/recipes-extended/libarchive/libarchive_3.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.6.bb b/meta/recipes-extended/libarchive/libarchive_3.7.6.bb
index de4d1ef7643..a1cb34415e7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.6.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.6.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.45.2.windows.1


