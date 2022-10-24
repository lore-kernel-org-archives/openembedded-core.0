Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E5FECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:48 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.19768.1666621486256528764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Y9Kf1x5n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id w189so7642118pfw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUhR3QrKmfVTiu6P43U+fzITp5L+Yp7cRI5yePrqfYs=;
        b=Y9Kf1x5nU+TiY40/TI8vYfwVVY7MCvhoDMKbqX2Yg/quf6VdrK6gWqv0TG/aRzC5zY
         ogan73+BQD0UVM4xBQG0pyQrZu+vutHOp5nOzCWWHiohzfXENk0Y9/z4D6lOhJcfYJ45
         UY7ADoUrk7jRY8jGwZiCsA9+waAVnTZdJrYqynjFtk9ZHEH+NCRyY4wEwtWO58gd0xpn
         oaY8dijSA1AlEvQzwYMF1kvuusaxDZ8whVmexLW46ixw6DY7bzqgZSWTVeOvepDIpswZ
         2ostPiXcFYzMEphvL8t28uiRZxS1LyeItMHbxDGF0mt8UwV4zqdIK3r3NonWXXWpZsIN
         IroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUhR3QrKmfVTiu6P43U+fzITp5L+Yp7cRI5yePrqfYs=;
        b=vy5JB/Gd1NamJsUKq+d4qPMUQPbLuoC0fCPoLAD9a9rI7iGex6Ne8XTeDD/9FAprIJ
         KJRRAWpXlKz2ZsjuxZQ2XSbRsiuUbRri4qb8LajKjfVvwSpeQ//9t8ZWlsvgU3cwxqcJ
         2D+Q0yMtCkXxozxZlKX1hzCCW7E7sqelwCrbxU1QzXRzxJaiLMW3DwSJilV0ZBnfix3W
         t+pBvKUEaSRPIx7ONiUggKj6osHSTWJ4Y64bqUCbD/dJGOaOrBfuQAkU94B6KnPvc7JO
         sKY5OEcSYaI7sTAvKNwHtPlrnOGX67JBfpfcyR4bH7Mw8ShKijYTJWiXwu19x06l59Ps
         vMlQ==
X-Gm-Message-State: ACrzQf2CqRT2VBS9w7XKWiV0bOkdLsBUoSlQOX2vrUuv9rjIqsmSyir/
	qQZsWUvJN+wQ6EKWc5R1eicqrbpVR3lurRQg
X-Google-Smtp-Source: AMsMyM498oLnWURGOgUiwGFU7ikwOc9V1REwS+Cd+e6HhZbkomV2Nv/e9BSnRFqTypCHYhNO1Xtxzg==
X-Received: by 2002:a65:6ccd:0:b0:439:2033:6ee with SMTP id g13-20020a656ccd000000b00439203306eemr29055776pgw.271.1666621485145;
        Mon, 24 Oct 2022 07:24:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] dbus: upgrade 1.12.20 -> 1.12.22
Date: Mon, 24 Oct 2022 04:24:17 -1000
Message-Id: <f2632f0e5f814aac9f0c8f7294fb1d8439167c36.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666621276.git.steve@sakoman.com>
References: <cover.1666621276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172093

From: wangmy <wangmy@fujitsu.com>

(From OE-Core rev: 1fb8ea03cf6c4df4d8c2cc9329dfe80c83a37e2d)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc98fba73aeac4d1e661475dfb4acfca94d6c8f8)
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.22.bb}        | 0
 meta/recipes-core/dbus/dbus.inc                                | 3 +--
 meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.22.bb}    | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.22.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.22.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.22.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.22.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index dcbcc0a9d6..8219f0875e 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,8 +10,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
-SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
+SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.22.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.20.bb
rename to meta/recipes-core/dbus/dbus_1.12.22.bb
-- 
2.25.1


