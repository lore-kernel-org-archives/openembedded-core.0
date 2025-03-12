Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF23C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 12:36:29 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.36066.1741782979743264695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 05:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O81LjBzA;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so1652790a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 05:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741782978; x=1742387778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIOD1NAghxIQIrtEvEW3D2gVwqn5ym85QqRMAYnEtVI=;
        b=O81LjBzAfT1GJgcGZwGVW2JxyVxKkcO9VvReN8fQHcrs7oWV4Je9p4N+7P9SOQgg2l
         XB5SRMaBpSHKAeNn918ePet3ah/tTYz5SE4j7bXmhIvx7KHj1fogxhf/2pG5i53y8uQG
         13dMcCNzEihmXuKCV/oK0ZM1mF0jyUTZHZDlpyso+l/DVHZHDdxBC50MiewOq39NOMK4
         peclYd5GbB3fwDSJnRd68uo75oSqdeXiGNITQRAYQH8JOPVDrEe+PqBsdNZuHUPjD35p
         h8NQFT2i6fRVxq5QSHtXelwuYeONw8hGz88yYKIiJiYK+4k8LtLBsisAdIbjj22HEH1R
         PzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741782978; x=1742387778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIOD1NAghxIQIrtEvEW3D2gVwqn5ym85QqRMAYnEtVI=;
        b=KVnS4h0yD6jtCBlg7df2/Vf9+ycJRspq2+9A8+3j4ZBk5B/nmfho4BGc0WXNonbqZB
         IVEgUaB9zkRibjHqJjnbNtiQqmlUPfuWsphdRClYWUOZEcFXv9HyIlFfvxbLEYWA9QOi
         GuS5LvtDH5y6MquOY1cBB44Vt+eKagQTHDyFUd7nhf3K5hfx0qvtrVQf0Qd7HR0n5bh+
         7lX8LYm/cv4psa5RbTux6WBzJHyv+juZWVG0KXyD6xo/19JLBdZC7L1PtgBSTvF5wvoy
         QG5hQLt0Wj1L3ZdNOJC7+locIw2zOjdsXmaARn9ZNT3hnowYLlvj4iwK/BHbB6T+rPAQ
         Nv4w==
X-Gm-Message-State: AOJu0YzoBbygTZZqoJbcXco9uZqrDGCx63ErRFIjBN79rqCb7UUvSwZw
	91OAbgU+lHJwSgvOtcDBexbuPepnZ8/kzNnJ1ViLXd60zJ6SAg5BDblD0A==
X-Gm-Gg: ASbGnctlbJG2Tl/KUCqbUDQwozQHalH1CamxVj3AhDFVwZddCe3aFd4qYN4Jo/z8Gft
	R51xUo3120DCmqVwZeFtWqEy7imvYRwL6p8p5zsc+BJzwDxFHlb3xQUY7lIDK6l07lbLFpyLFi5
	LRbkPWzDDwIt5WWNAcHraXE1vD2hmqVHjG4UFVT741PHoOxv7U8Y6vqGqwWCbR0FkBIrEQoVAEX
	v+G3LfX1sUFeUgzPQYP26ccSC/0Mh+WltXalPdkTb0s2Ehvek8OZT7RybdfDdoWV/IrGsnHs75p
	uX6YHFGLEhg4zCPbasxUE0In2kYCKrVMqld2qNFcTCuFXkuH652U0rC1yPjsBd14PjR83+IjvGE
	Kicl5hmZ3axGDAn6I
X-Google-Smtp-Source: AGHT+IHLKj8xStHPIEqnlYYY/TOzoxWDzrwGRpCvYgOhFiAWcXSQubtOroljjksaY4g8LwG2hLe6QQ==
X-Received: by 2002:a05:6402:26c1:b0:5db:68bd:ab78 with SMTP id 4fb4d7f45d1cf-5e762fd8d31mr10280970a12.10.1741782977913;
        Wed, 12 Mar 2025 05:36:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7476ab2sm10011835a12.31.2025.03.12.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:36:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] glib-2.0: address ptest failures
Date: Wed, 12 Mar 2025 13:36:10 +0100
Message-Id: <20250312123610.4018764-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312123610.4018764-1-alex.kanavin@gmail.com>
References: <20250312123610.4018764-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212647

From: Alexander Kanavin <alex@linutronix.de>

Particularly:
- one of the tests requires a C.utf-8 locale
- another needs .gir files to be installed

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c6e2d6e1a0a..1e22a59ffa7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -157,7 +157,8 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-ptest += "${PN}-utils"
+RDEPENDS:${PN}-ptest += "${PN}-utils ${PN}-dev locale-base-c"
+INSANE_SKIP:${PN}-ptest = "dev-deps"
 
 RDEPENDS:${PN}-ptest += "\
             coreutils \
-- 
2.39.5


