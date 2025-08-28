Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB41CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 17:53:31 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.3941.1756403606794062412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 10:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Di/7wIB2;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afedbb49c26so194407866b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756403605; x=1757008405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQHEZ40wwCLpneDY55M6fmd4IZfUrFWc5geBrz64LFM=;
        b=Di/7wIB24pDUkY/IzAsTYSeCGVkF5MTZihJsf2I9Gz39RIy75nJRyKAIRXags1+iBX
         WQv9nLWnoNLwwVHfb08pDlhnFZSj42ZqdQ6drFLdHLdd/0RxyM6iMDDVdDV8NTqfxpYw
         9RJCBojVwQux5PJGyra2+DKBa/Fkixct0re1zzc7AXiBKbvMWng/A3pAfvs/F3snEsNV
         YwSP0i+eRGJMn6gwiBnmud4nNKOwX7gkRVSv5F4THN8tg7TU6ChtFoOAZAkLLVIwkkC2
         bqfD/wiAb00OvSIbZOEy/YCVpaAe9qBKvhp/krxJBsqYQlwe3VtwVUkgI91yQyIh8818
         ykgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756403605; x=1757008405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQHEZ40wwCLpneDY55M6fmd4IZfUrFWc5geBrz64LFM=;
        b=mFDK9woA2pHtfyZCK1nRakzeZBYuMEAuI0UkqzheKuw8YjchulKHwgYbodLQCDV3PQ
         CAN5DpGQwYCnRws5AHhgNKxcqQyWQFovEYtSbyguBULmxfn9GISg+3auz2LFqqq3GPIm
         +Nkoq6myprguryeAFlrwgdNlT+/1JmZbmBskgIXuqnZYn9mKVKkpEb4ED5/6SPiCxwhQ
         7OrxqfBQ65Yf9YYBPzfB6yqxnXbMMjEi085tthVa9tGJ6eG0T0gAuPTp5ORxrRI8ksvo
         2BfaBUhQ6cKl49Qpi8eqwkI9KXq8dmdwOUaY1c5Cj+Di3D5uI4HFw0L9Q/CAEIenPbDV
         c5Yg==
X-Gm-Message-State: AOJu0Yw06uu7buiuzGXE3Qj3tD5GLnsM+Piw4R/PyzaRv/B7ho2KApu4
	3bn65g53MctWhJmsX5IiYJaKpeKvYPzqZ5pXN62OW3SibVvT1YTMq5BH1QipXA==
X-Gm-Gg: ASbGncsRT1pBuc7dIHU3GyEMGYRUBThpVSHl1Xq7l+vXY8dk+tOLbHKIh1eXJGsoNPq
	t2eY1Gth3JeX5wCR8EwvUdUOcOmie/PYMupM629T1pO6r03Qly3ZRD4R/N2naQ+QZlqM9BBl7MK
	blUkQVt/G3VbMXOCtfOzLk0AbiBzbYvtEer5RUAwS9HAmZvgNiuUKdTX2K4LxjcO1l5ouLh5ZWu
	uJfKYniY2fsYwcnt69pDfs4ZyEJAAFaVG+4i+DUhlCMu+sVGXdBPKy5QOMsQQAfCi7egyYsq9hO
	KomhpWwpsyvdFyI4EPW1DfDYvwGZ0UvrEV2GsGLcBX9hn/E5qXhiUfUuPF6tbHErSFhY4Vabji2
	Y03T2RYpA8RMMy0u1i4C/ty+A9k44PRA=
X-Google-Smtp-Source: AGHT+IGpTgB0C2bkxlWGraSYki+YHLCB26Dwz1WZlde9+7P6uIbkjPICKis1dEbbZZxc+jrue6d1oQ==
X-Received: by 2002:a17:907:78d:b0:adb:428f:f748 with SMTP id a640c23a62f3a-afe294b483emr2254033466b.21.1756403604832;
        Thu, 28 Aug 2025 10:53:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcc1e8acsm8899766b.86.2025.08.28.10.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:53:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xf86-input-mouse: stop checking for new versions
Date: Thu, 28 Aug 2025 19:53:23 +0200
Message-ID: <20250828175323.858522-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 17:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222584

The application has dropped Linux support in their latest release[1].

Keep the recipe in the latest supported version.

[1]: https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/d719d0588c580ac0ffb8546e864c05c521b1ab9d

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
index 92e54d9701..6f578155e1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
@@ -12,3 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d213a69053dffe9bcab94abf60013d33"
 
 SRC_URI[sha256sum] = "4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968"
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
+
+RECIPE_NO_UPDATE_REASON = "new version does not support Linux"

