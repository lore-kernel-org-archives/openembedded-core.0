Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92DDC3DA4A
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:18 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.15276.1720960752341246793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VQJVP7mX;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c9cc681ee0so1979905b6e.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960751; x=1721565551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rj1KYW4VdSsq89oy5iD4bAEDGIWAlUmklf3vC5NkLjc=;
        b=VQJVP7mXUf9RwKs0irUQ06t3KUwsP2e0KpcvzWNv/8GaZrL8kv7daU/wLRI780o6y4
         3oPqedxFLXnyiTB6iy3wTwJxOzt0pqgxrEFc8cRnovgjcEIHkPerQiduj5NFqo+pivJ2
         xoMIr+LoRUti1kDdLQewHByTx60qs0BSYjDEokQM5eM9iEyvq/5pPv1wt2Li4O4waR/+
         5/DYeyRzZme858GCqHR2cCtDqoIMuPcz8KNxjyeGyr6kVtO+W9T+TpiUBquyrTyLYqhi
         RCHVDmLgNU7BpppAAwky1FCtS986t1jRm14uoSqWfXPpoyQoCNSUf6mKqh8j/Z2VqHev
         iJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960751; x=1721565551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rj1KYW4VdSsq89oy5iD4bAEDGIWAlUmklf3vC5NkLjc=;
        b=taAGNUbkowrl6shrHsAVV/MS4azVcSKZpQDPLN9BBmcmrQ/h/e6O5UvRwvaZ8CCmez
         /vdxbAxbU50ygnyB7mCP/KTBE20GvtP8DSgfh8pwXG6awp0tuUxFs/BmeBTK2iJi3WVB
         kZJrviEhCBmYR7oWs884HKwL2XgEeRKXXsvO3JQVRrr806fVrTejrCEDKa65gecj68J1
         J4aocK0pMR4asC7aSn36ayOFK8g5oBnYObXvKczmbdKzgZe10rW0uzX0K7+0itPqKn4c
         56Dgw/7NaXahuIPNd+QPppVxtlIXQE2mJeWaeUex6c6CMDppIGUFd9G+D1shAgGJMpSF
         EPkw==
X-Gm-Message-State: AOJu0YwTyjYYReZ3836jGhr4voKOEKwtG96/5760bx8BaPv7wTzo1A1R
	3pfVbt53Vtw2DZBy9Xl1tYKxWkNLMIbi0LwLuIHJB7Qyh/eNVrZk43gCQ9VeRxp/ileLcDhDkji
	Q/2I=
X-Google-Smtp-Source: AGHT+IGAQc7u89Kt0InzOSeb4ULWXNWtuTP8m61eWjiOQ/GZy5/Js4Nfc5cyD/DBF0pftnhmjX4daw==
X-Received: by 2002:a05:6808:2897:b0:3d9:dc70:10ef with SMTP id 5614622812f47-3d9dc7013dbmr13309584b6e.32.1720960751161;
        Sun, 14 Jul 2024 05:39:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/27] fribidi: upgrade 1.0.13 -> 1.0.14
Date: Sun, 14 Jul 2024 05:38:34 -0700
Message-Id: <03828e381ef615ab4b1a30a8902b5eccbb5c98f8.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201864

From: Ross Burton <ross.burton@arm.com>

* Updated Unicode tables to version 15.1

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 332276679c9a004158929e03d9263e9ef66816e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../fribidi/{fribidi_1.0.13.bb => fribidi_1.0.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.13.bb => fribidi_1.0.14.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.13.bb b/meta/recipes-support/fribidi/fribidi_1.0.14.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.13.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.14.bb
index 5d0476a375..51752096de 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.13.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2"
+SRC_URI[sha256sum] = "76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.34.1


