Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D42CC4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.32107.1671380007449700902
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=O/IQZ8MS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so10719635pje.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QEOsuyEEF19EwlpL9IeMviKQ/BKsKMusxgsSuPIpCM=;
        b=O/IQZ8MS293bX+lfwte1GdLBhyazmIb21dDnQaZS9yJlwKI2Y9CqRm+BebziL1QBI1
         XukzjMjx6GVsCxq2ITO3EyrwpyEaVkbAsDaQrK+/ZAwskCgZoUzcPbf2wC/POxIm/kBn
         ry75avdHlVeaXr6GE4Vd9WSdo3l4dC7BQSoo8MLjBVEzMlNUc8JnVV21b0uUoaUzbgMs
         HJgJ1iJ1su6aO8b4cN+1bqH57JH7kpYM4Jo8h+6cBLDBdzPTUYw7LqpBxEoWZn/tZbwd
         yW8ZnKSm2by4gFR32MMAnzs8tB2+Oupy09s3MhibAyehiThOESOnCBfxliQvgMy+Szzt
         q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QEOsuyEEF19EwlpL9IeMviKQ/BKsKMusxgsSuPIpCM=;
        b=P9YpXpj5eXJoDNHMR9/glvTJZ6qgk22KAKOkqaohPk4MPiv0IqGc8RyZ+uOJ8ofKFD
         iumbtAny4vBpQAkGYNgutDn7eldexiSzZuqWO3axmxPuGMIqRY7lO1L/U8YEIH2UhO64
         CwE00WR+numlnej+xAvx9rOb+I5wbtMxef22CWNhsf5/czBrhv7yBOy1Y9cqUVE+0g5W
         bRv6kNn899t3gbPbOrNHXbBi9JbjYXNvqi4cnx2ZO1SRZi/7x9rP7aAqUhXMNjM+Bq/Q
         bK4R5iY9Jv8KoqzkfBcEl2Qfs3JW2vg+uypnMH06pg0CsS8mFicFt7w2uztDYGqw5iWN
         uVQQ==
X-Gm-Message-State: ANoB5pkMOtxXpKmpCmGgan9FdoNAVYlKFGUgNiX6xQ8Kw7oWP7/1i6ww
	IZQRWUvGaBD8dJ3BtNhKkX9mD4WNZskIXhD2q6E=
X-Google-Smtp-Source: AA0mqf5L5z/M5NQ/uCbwDFTmlwkVCfR84q932iD2NDHLLRrgaJj032vBwM+uVtXM2rS2bWdBxFjWUg==
X-Received: by 2002:a17:902:c14d:b0:18e:9c19:aa51 with SMTP id 13-20020a170902c14d00b0018e9c19aa51mr35288905plj.58.1671380006490;
        Sun, 18 Dec 2022 08:13:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/19] libxcrypt-compat: upgrade 4.4.30 -> 4.4.33
Date: Sun, 18 Dec 2022 06:12:50 -1000
Message-Id: <fbad6f482d2c3213eff12bda4020d14bbe4df288.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174793

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix -Werror=sign-conversion in lib/alg-yescrypt-platform.c.
  With commit 894aee75433b4dc8d9724b126da6e79fa5f6814b we introduced some
  changes to huge page handling, that show this error when building with
  GCC v12.2.1, and thus need a small fix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6918477ad121f9c7335c661433a909e948f66d51)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 2bdedcba6d..61b0381076 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "fee2687bad66e351a3dcc963a34ae80125923ff8"
+SRCREV = "d7fe1ac04c326dba7e0440868889d1dccb41a175"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.25.1


