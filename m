Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D46C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2238.1743577855881837487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbT5ohGT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso47928235e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577853; x=1744182653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfukOupOna+UU/QiHmdjlumDdSgoTMBblvh9k/ahjXs=;
        b=AbT5ohGTi5plGjjdaUYSnZuPrM6pm++yP8EXE0HwuuUaFzLnQEVXGtmjc8udXR8GZ7
         /axwYJko1yA/QVU0+onCLqPmM5ziYpwXuudW6cT3cUfZxUmVxPLVetRUCB0HvKyMU/i0
         W3S/pdKZ5cqVJc2hmz2ohFkQs1eL4K9M7hsDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577853; x=1744182653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfukOupOna+UU/QiHmdjlumDdSgoTMBblvh9k/ahjXs=;
        b=HJLTBGgsqKYl9ugacUH6ou9K5bB3ZC9jkm6ebkzyEDFCzRcn7tGgsinxkN2n9kcujR
         MrtXYQxTjS64SguNqZy/ENizVvDZbZYoWxiOIYLEYQfnBgDzJ8SHwP3H/U/KVu1kwjTb
         xbdpHH9ctImMacDqDcu37iUtnGkAd6FYjWoNTnbekOM2ne2FZmmxcb6fzbUDZqaXU/87
         /KZosK2xE4LoG5YBIVV6+/rVPTICQz3HCct/sG1v/76BiOEXzifAlqwBkWsh7C3Er6iA
         bmuqXSJ6o4Jgl8oGqjClKdan+V9AYgzY7vXFOimznJtOKlxV2YB+Z28LmjwfYoahAXBt
         aDwg==
X-Gm-Message-State: AOJu0YyxV+G5t4uh9IGBtF3YO9VUGhsPLB2ietwIUsy8JAo21NeQn9R5
	k64tlBcUmaoufm++6EDGOjEmENOeS16zB4t02PPU59MeJCRqN+C/cWw8ydsJOdtU6K85rtF2vX5
	5
X-Gm-Gg: ASbGnctLVLfXkr5joQdSSs9emhasUf6NCV7b5/HVP0DVgneNnjVSbFtu1ZcIRRyS8TM
	kO4AYOAxxsCWrXf4N5oO836wxFDy1GCTNepKLYkYyoIBfUcDYFFbDEOddI3UJrig+mo7xYiOMlt
	i3NHDYYKUXqME/2USp5YIOhJ3gFQo1ADT3OlZhCkwCVInrAAo6G8hUS/jPFOrhPqOIY8I2J1hiR
	B1TyQTDQxzwDkVahRkTir0wfGuMo8gWGmOjfbGVjZm0cyQK4iJH65tGZZn2eXVLJ6Fbj0/j1J/C
	+/hGw8YdSK2Hf9OQqbowERCrNqgfZCRMVB8B6o9h8tY4AAvDRSqp0Vz5KCI6Ns/WI8OYJXymlg=
	=
X-Google-Smtp-Source: AGHT+IGVgoC0D3FI9M7QB7iwiXpHS/05m48iz4+49OFGkwXJgOjjk2jr+ugcsNoAMgbq1RbuXIJPkA==
X-Received: by 2002:a05:600c:45c4:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43db6227e36mr116319625e9.11.1743577853519;
        Wed, 02 Apr 2025 00:10:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/48] iproute2: upgrade 6.13.0 -> 6.14.0
Date: Wed,  2 Apr 2025 08:09:43 +0100
Message-ID: <20250402071017.2157620-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214187

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../iproute2/{iproute2_6.13.0.bb => iproute2_6.14.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.13.0.bb => iproute2_6.14.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index f1746c5096e..c4dea396764 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 5b3a2008631c7ab09252335fad42c2d347b7691d Mon Sep 17 00:00:00 2001
+From 9e427aa1c647f741b08a1f0c44483ea974c7fc61 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
index 0f37eaa7b34..a32ac342457 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819"
+SRC_URI[sha256sum] = "a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f"
 
 inherit update-alternatives bash-completion pkgconfig
 

