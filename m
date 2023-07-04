Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEF6EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:19 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.61495.1688484616422248233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MDtlUJFg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b852785a65so36696185ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484615; x=1691076615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31wEcdS+KxdwOOzdtu2gxIQLfZxce3SaVWl9h5rsM/M=;
        b=MDtlUJFgo9oCymbrct/aAwTDzzW+gIJyYdzclezpY9N7U/DCumdDhqGIrClkuN3A0/
         pOpDeSxcQ+pHdG7o+He8v2F6HpiQGu0iM5BYwnFMJJ5onTaTEBBB8AePl4MEmhhnL84A
         lED5U7S2f3pz/izIhjCL2xJ+cy4OICvhOfPFnpK56/iXTSaPLCE3EpIgyHc2RxA3Niun
         GGi575g9RW+QqoCVytRC4TE2xTVrJT4RpaAbSKeDVnsbkVet3Sp3gdnHNPEJQz2KYj4v
         xw5m36/6musZItdN4E4wpB5g4G4gt1V8bDGt4Kuhac2Q1F6hyGzbJQVwYq1u9CNFGeqf
         gztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484615; x=1691076615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31wEcdS+KxdwOOzdtu2gxIQLfZxce3SaVWl9h5rsM/M=;
        b=VjtihcNmRqj3NcBrO3aO9//Om86oQ0ruEagDOg1NW6fC6xPSdp4Xm0PQhinEeU9VzD
         VZS/az7I+YsxKBdSrQNqEp4cmRX5lW0m6t9yxdhTaKVzxnokQm8MaG+UxVjGHgbd+iBH
         KSU7USyLhbDkA/tIuM+n7TTumWVx+RmBOIaKQdv0GP7C180MSxxJQas4k3qlpjaMaOhH
         rr8Rf9B9vg0yyRmxUlJfuGBP7mLiajISGyRohk68ANeqASeLUsi/Qqf3mRKCM2YeJBAx
         qYcJkgrSK+FI/uPpe/Mx4C9TQFYA9TiayAxVAE7SFn8ehLT8kFbmdMSUvtOXc6il3SEV
         TKtQ==
X-Gm-Message-State: ABy/qLZqvp4zlZJgEhFcUt06zwFs4zxAcA6lOyBXq4uqakp1gQfq6PZ/
	jFs0tJbMCV7ExnAONL4r59uGbJWfKK0heOP4DTZvGQ==
X-Google-Smtp-Source: APBJJlGE7+gJLCvVXrH4EVYWRUyiGCgvbNlFEfbMPiApRwmXEUajkHIcZVBt1vAUxE/TntJJnvb/PA==
X-Received: by 2002:a17:903:2304:b0:1b6:b703:36f8 with SMTP id d4-20020a170903230400b001b6b70336f8mr22696516plh.25.1688484615521;
        Tue, 04 Jul 2023 08:30:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/30] glib-networking: use correct error code in ptest
Date: Tue,  4 Jul 2023 05:29:20 -1000
Message-Id: <669bb92fde575d3f9674b87044575873c3506df5.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183853

From: Trevor Gamblin <tgamblin@baylibre.com>

The eagain patch is currently using G_IO_ERROR_BUSY as part of the check
to retry when the simul_read_thread test fails during ptests, but the
actual error code is 27, which corresponds to G_IO_ERROR_WOULD_BLOCK.
Change the check so that it looks for the right code.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8574fb1371e2d83c1c7ee58067c50319a62a22ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index ac6592ffef..ee5b6a7beb 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connection.c
                                     MIN (TEST_DATA_LENGTH / 2, TEST_DATA_LENGTH - test->nread),
                                     NULL, &error);
 +
-+      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK))
 +          continue;
 +
        g_assert_no_error (error);
-- 
2.34.1


