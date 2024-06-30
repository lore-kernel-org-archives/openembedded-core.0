Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03D4C30659
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:38 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.4256.1719778115012006327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ewwwzjv3;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d561d685e7so1768026b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778114; x=1720382914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCDjYjizxfk5de/6mIvykSYwCm6iD9qJsEBzMyuYx0g=;
        b=ewwwzjv3eJyMWMApTS2Op2NL1tim2eeJqIxRYpyNRV+5JJ0hcUS+IaQYjj9ii3DSHw
         F4kUiHGiiDaDta6TxrXNtcF5u9BMdYi5dW+vKyCKlDp1h8nU8ui0elQL80vU3ZrJAn8F
         /dK66q96mTZXrZVHtM7rRaLT3KJfz5XlOS5o30mnfPmST6Ink+bq8e85eg5fh12VY8Fq
         1ZzltFZhTKvAprjyirH59/PGFsnkIxCzh6q0Spm+pVtp1gYNre1AABmPzfV2SSnY8jcN
         evSigrUpIo8o4LA6WCIjfBxkhqouOOood1npwtjGpvdoh/DtH6/1vU24rSem7i9lz+lA
         BsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778114; x=1720382914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCDjYjizxfk5de/6mIvykSYwCm6iD9qJsEBzMyuYx0g=;
        b=lI1hp+EAxG74s8+Vi5DUNyA0PsMIv2017bg7xQOLYzJ2wQWdjfqG+FpcvazjcYKqiD
         BE2F3KrRfnQ6rQq1aaTZrnoGA3kaO73kvbrxDDCoBujMR42c9+X0zo2n93VZD68gBhXq
         prLzQYC0cmzK8mHGjr7XUIWrpvFDf3L4kEak5H+5F0AJp8qjnBnMMeESpPDzvrXVd9OM
         2Wpy88P97g1oDoWO1W2pdhsJjT41PIF/pTiQ/G674m6HKIuA9xYOAGywn6Z8SjBEMZi3
         80mBFct8YVdkJYhisbxDhiKTpwZGXHQWIIuVsgp8oQWeERXeS6X2U36lS6jdZhDrLBEO
         bekg==
X-Gm-Message-State: AOJu0YxEv7tcbTblCl6NCPiTruBvBeeOetRXcGlmJ3gOcay007BhlGJb
	9yuAuHgT7KIfWUSKr1FENYvUo9dOUC/iaHsZ33rP2hQLijMzCTQ6Fbk3DDhsIGwv3O0FeuMboWl
	PZyE=
X-Google-Smtp-Source: AGHT+IF+OPwterh3ArEVKZJxuDzCKGow69BrCg3cT49CH6KZmLsTFbV0y4AdCcW8mTlsQszQzfC9kg==
X-Received: by 2002:a05:6808:2191:b0:3d6:59a0:fccc with SMTP id 5614622812f47-3d6b35ca417mr5039844b6e.24.1719778113411;
        Sun, 30 Jun 2024 13:08:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/35] linux-yocto-custom: Fix comment override syntax
Date: Sun, 30 Jun 2024 13:07:33 -0700
Message-Id: <7249f532efee968522a2d0a3fe02c9f2dd7c03fe.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201258

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The override format in a comment is incorrect, fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df5875cb22585f10a2e8782c0534ae4625e85bb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 9437240fcf..0879bb17b9 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -7,7 +7,7 @@ SUMMARY = "An example kernel recipe that uses the linux-yocto and oe-core"
 #   To use linux-yocto-custom in your layer, copy this recipe (optionally
 #   rename it as well) and modify it appropriately for your machine. i.e.:
 #
-#     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
+#     COMPATIBLE_MACHINE:yourmachine = "yourmachine"
 #
 #   You must also provide a Linux kernel configuration. The most direct
 #   method is to copy your .config to files/defconfig in your layer,
-- 
2.34.1


