Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F34EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:33 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.1245.1687401387335710975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eLEh3EDV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b50e309602so52150335ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401386; x=1689993386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGCBDOA896sHrJlJ8ZR1dGx0s8LXp6rHm6o9eel3Bhs=;
        b=eLEh3EDV8KTHU+n8ZyugUeYCRnhWApL+ZfP/7UtQ2l0KL0YwHMBA0b7KuGyVI5eeGB
         HDoXQBpdjwXraSagWGJBKeSoEFDvwFQLmtkZRXFtRzRnciCsD0X08+kE8Rls5CdBYlQF
         Z75iwJZkKEYLBho5vX6oL4uMODGHYOLyAFrS+8oSRpvEbx3EwdF4jazSA7tkOtCj5UtF
         QjD01J2RhxCzMcL3EQ8nA8MZb6NWbO7HE8H7MuhEYyvv75VqQWHr4LbOuCca0+/2fnBZ
         b4SB0hebffw9i/kEpYCp7ahNmDzpfPfG0dEqo0L2UHqtCWjlKrdMWticlF/9FRwoIn8S
         7mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401386; x=1689993386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGCBDOA896sHrJlJ8ZR1dGx0s8LXp6rHm6o9eel3Bhs=;
        b=g2E38+PcOq8dCkIFkILNG+GTLIqQcAhrejoSUhZkOJgXFNVpwNL50pt4JRZ9GLKtb4
         W0cXgBUh6ddQgusmC2swqIWGCtBgsXmwfQVzQO4+0Apoopfw5q/8PuYsSFUwBL7GclT/
         Xo/a+sKBy9SjlxEt436T2RpopFV16MkIcv435J4v+cIG2tq/tlEhMDpN+19bfjWAWCMc
         fY/LtsBuKI459vW1GjGow0qTMdek/YzW1LNAihG3GCiKj6H7j3yPp1IoCc5klgxlA1V+
         Z5C2PQX7meI+9NcFIbbDntGWjPwoWTm6D0FPA0E48KfLwLfU6LumpsKN7dD0XTuAwGSJ
         sfhA==
X-Gm-Message-State: AC+VfDxppv3qAu0S8Redl5GWD0jX6EArq31VWzmb1CPlOEmwjwcDgPiq
	orP1uERnJtT2D+k12sg5wQwUkhtr6a0rjeb8wl8=
X-Google-Smtp-Source: ACHHUZ55jMziaUXgDIZJw0bBc3nphAqNEOMguEwm1XkdABybvy4YQWtnNx5eOfT46iOW9xlkECtfCw==
X-Received: by 2002:a17:902:ec8a:b0:1af:981b:eeff with SMTP id x10-20020a170902ec8a00b001af981beeffmr19010970plg.64.1687401386464;
        Wed, 21 Jun 2023 19:36:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/23] xdpyinfo: upgrade 1.3.3 -> 1.3.4
Date: Wed, 21 Jun 2023 16:35:43 -1000
Message-Id: <b2832a80ca99001ac1db729a380b27390f7082f5.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183211

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
configure: Make xf86misc support disabled by default
Variable scope reduction
Remove unnecessary downcast of double to float
Call memset() instead of hand-coding our own equivalent

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d87785189336a69ae998f75394ceaebf63decb16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
index e75a840b7d..aaa8aa8903 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
@@ -15,6 +15,6 @@ PE = "1"
 SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206"
+SRC_URI[sha256sum] = "a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.34.1


