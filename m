Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B016CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3361.1755634096723025319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pDzg8q7j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so4573078b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634096; x=1756238896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rScRuODhysXonsofZVeKgL0phQzzdZFgTtWdbiYBgfI=;
        b=pDzg8q7jHdMCxkcMWuNOcT2fod6GqqARMwiAeTJgEEtsCK7ACKQ14P0AbTvVi0103V
         0osFH2SH4h3CT+ihelxil1l5eWgizcMY7G+tLYKFvBBqOBckQpPZdPY1BQPDvUrMPyU8
         lrVcjxcUU5khi61Vwn+NJQYkMK56EMwB1cCMbCtV7MOd++YQvkwlz+XUN+Mq5OefX76O
         5e/9jXGvlczp/k0XM+M9e9kkg6L1htm7YRdTx6sdmpv4YMr4k1xU8D6iNMtQapwwCS0x
         0C9AamIWBSm8wAV5+a1Tme1ZmSspvvNUBjh9akOw4Bi6A0b9IW8IzpK/UCtsSazBOpU3
         Juvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634096; x=1756238896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rScRuODhysXonsofZVeKgL0phQzzdZFgTtWdbiYBgfI=;
        b=TcurjNI/1wucsx1AjueojDTVlZA8JM5XpaNTXB0ixX0i2d6EM2eslC7TO/gqpEZMr4
         M9Dw8x6WSbEiWmiWY7XOcbQfAPH5SSu/uvrO7gTbolUUOVBECpxqD31kGdo/g5hFsJje
         Y6XD0M9NtGOLC2veMGlVN63Ibd/AZ/8+rqSwRWydqwHeila9OSWo0fpVWzSxGu3JlG9e
         q5wk6wtYCnDy0fJ0+FCZPAs8PWHPDDSITitHyrjrgct3Haj9IcIRSiZrYzHFYm21Cq/b
         m8iFxF4ERkCagjC8r+uTN5jgMTcKawwd9adoej/kJxGhZBlY8Arqei/PMSslO0pJue7N
         wh/Q==
X-Gm-Message-State: AOJu0Ywvhd3jhaO4CKHl3QupYw7P4gNMgDULDV0lLl6IDZLnIYx3YRe+
	kCKN0zxPn6sGIHxQvsj9mk2if63Xi+ocsaCq26s9My6LjXDaiWv3NoYLFw2b7jba8EW4ck7UQop
	tpyDy
X-Gm-Gg: ASbGnctzxhqFTafLC9rbQ4Zeycq/e6tRo63Px4PiwW8R3ZBxarddORgv+yUn76+1eBk
	NNQQrFK8ccDpLEasyNa7ivAkdqrzMAstHbAKyonAhFpZjwJM85VEOcVwRmp+GNhDJvoAUYjgxOX
	xc2uIasaWFO1tScoI5T9sffBpFeuvBbw83PdTKPZOmCSrYX+vicW87+f+uq805T81SgdAn52yf0
	L3Adn6L9GgT8SxNpTmy+DFVWK6kAvVxrHoZLPdV3/kiIokn13o9zch+J4ZYATz5z8ag1Vln+Ne4
	9fmI+LMtEpBE1l1FCR+l0H+7jme3UZvyS3ML8c3kKnD1ejaexO5o4p7xiAlVCV+DXV//6Yrwyve
	RvH6Vstyi1ncEPQP9T79phT77
X-Google-Smtp-Source: AGHT+IEvlPuqx+qwQ8TWbRiRVZkCVawn0ZYsFquD7JYmmFc/i59aOwk0y4Qsn78MC8bwz7HTptHTbg==
X-Received: by 2002:a05:6a00:2185:b0:76b:fd26:162f with SMTP id d2e1a72fcca58-76e8dd44897mr501637b3a.20.1755634095948;
        Tue, 19 Aug 2025 13:08:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] bash: Stick to C17 std
Date: Tue, 19 Aug 2025 13:07:52 -0700
Message-ID: <5f966ed3680c32fd7331bc417858ea48f50b24ee.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222136

From: Khem Raj <raj.khem@gmail.com>

GCC 15 defaults to C23 and bash is not yet ready for that
so keep using C17 like GCC 14 for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash_5.2.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index ccfe5c47a7..42ab02c440 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -22,4 +22,6 @@ SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+CFLAGS += "-std=gnu17"
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.43.0


