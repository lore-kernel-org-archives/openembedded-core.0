Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF7AC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 03:59:22 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.1715.1657166355323844684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 20:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aNpzcj2m;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id g4so16232165pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 20:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OC2RTIn49sW95YL1BltGMcjHxqbAnriR7mRkXVzEZg=;
        b=aNpzcj2mY7DuN/tX5GUy3uOSbnZLCw+6tSVCdvcHHn9if6FB2iL8susJYat6+B0Tnn
         K8IkgPJVduRf14JKemYQ98VI2y6w29c8ARaDJVMM/8ZUwRl0o82pWSbti9y2Km0AsYBA
         dMctIzvyhoqxdENKCk0vsY2WZ0vXTg4VmMgdtU3oZTJisD1CTJxWx9m+xqmKtPkJiuKw
         nq0tjHjzKbOAHZtDjNGyoOmt462QL/8H+IK4N4tSGWPHn/j3N48CtrYRV9v1ureBQuXM
         k+00x7kIf3dJ2TjvdV10oLVqMHBoSEands2RyU3jumhm4rQZrkxKyPm25U3ycdLZmeSD
         5zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OC2RTIn49sW95YL1BltGMcjHxqbAnriR7mRkXVzEZg=;
        b=jRI1tZ+g43P6gqI9bOWdmLLVWwmWbj2MbIS2iq92f9tX64yPWX6gk5c6VXRMZuxBoF
         qklheRKpRPkgJPRkqKC50Higmtt2iJEiAblbVdxdqn1uri/HkyvCk1ecuAGC6hB2GFzO
         vG75ET2LXARzRc5Cw2+/j5Rxu7mKvyKivEJ/iU0Dlzqv+DJoQsuPNJQJk6kjP8l6axVn
         o4rwIUthlb6OJkXyHK5XrzAl6v5NaQd56F2476vCiEazKHzDqASW1cJQN0khv5X5dcF9
         b6+YP6GasCxc/c/tmnrsfHhqstzmLZBiJgvzv2Ta/PYQ8Xe0hsQdmP312wyN8Fkt6oSZ
         PzaQ==
X-Gm-Message-State: AJIora9F5RtRBTcoJ3HvjEVybgGn01xYIZpJY/8HBp+DtlY4qfsj84YL
	SwlFFfY4j+cOlzVzykw5k/V3+P0dp+50Ng==
X-Google-Smtp-Source: 
 AGRyM1vWAmOfGcPLdZ7sMK+IdqnK2RanTG9avY3Wwz4E9D2aEF6xII6uK4uAMhVeBx4qAahOqHSZSw==
X-Received: by 2002:a17:902:b712:b0:16b:d667:ab59 with SMTP id
 d18-20020a170902b71200b0016bd667ab59mr26810818pls.74.1657166354468;
        Wed, 06 Jul 2022 20:59:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 s37-20020a056a0017a500b0052513b5d078sm25821452pfg.31.2022.07.06.20.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 20:59:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Remove -mfpmath=sse on x86
Date: Wed,  6 Jul 2022 20:59:11 -0700
Message-Id: <20220707035911.2153302-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 03:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167757

Fixes build errors seen with clang
error: the 'sse' unit is not supported with this instruction set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20220527.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index b3ef8f59105..034b62b321e 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
 # is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
 # earlier in CFLAGS, etc.
 CFLAGS:append:x86-64 = " -fomit-frame-pointer"
+TUNE_CCARGS:remove:x86 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-- 
2.37.0


