Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F3DC7EE29
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.32983.1685293688982938348
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=DVyBn1bp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d41763796so1851196b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293688; x=1687885688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uo1ntc7/eush937xEjX+LL6rxjEHrh46vvElN2dt0ww=;
        b=DVyBn1bpsGRdXb1oNxgZCAYxi0wY5l1ZjyrPCGgmGRc3bah130pbZjBkxArX5EkrXJ
         6nHBsu5fD04n1qrAmyOhfkUWFi90hpnaoTM70SG0tp9UcWen97eFiS3CPNa/UI7x17UU
         Bu9OLXOFNdRhqXK+Y+Ir4XntopaubhxRY5Jyw5ojI1TlQbey00eD/E43hCMpEg82gYhr
         n8X/PTRHdeNN1UelN5yoyyP6JR7kT5USn3THYT47s802ySj3A7FESa3X2hQDZ+iaCqHc
         jH3bY8KWsfplNVQv24MWuZACNQYhf6Rta3cN8mUF5ubFAW2GF+TLzjqgmY0K9PBaYh3j
         ZaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293688; x=1687885688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uo1ntc7/eush937xEjX+LL6rxjEHrh46vvElN2dt0ww=;
        b=RlI5AyRm1axb7h8Twhoay9+Ha/V7jcxHnlDLyHsGd1NURWvgJWPnlf386NXQrJnjzz
         De28HtGZ2kEThcXvVnE5PfgvaIAHtGZWkgjUVnjC3X+fxB6E3iNQJM/GsMWnLq9Kap7h
         OJQACAjNPetc3BBhecrWWJobzXr1ZlQaPvWkItdLgb7EmPb7gIAuI0qnv6X0phlb6DBu
         hyZktlDiPaKW6UjsYHNkpLxHBuF/0Zu1DrqIbHcQhTJGJlAJTInLu64PvUMTHnKHv/r4
         2HuUsMq1GOokMEpvwiaO+CF/8RzAZ/46XwYx1gbxHL+hSDK1ihZEsGKSn8d6c0ILUJLY
         IqJQ==
X-Gm-Message-State: AC+VfDyEOg9hSbL6RECUKelS4gbZ/GSXcQ6Eng3Ubm+5s91/0nJUUEj4
	OUc5I1AMQHCwxGXYTham2SA6d9GqVVxjyqxn1Wc=
X-Google-Smtp-Source: ACHHUZ4GENOV/wrIQG/zilnwl7iXhnoL0V03Jy7Xvq1k1OSkol7MRfysvyXvyjo69RvO6lDSdViKHA==
X-Received: by 2002:a05:6a00:170b:b0:64d:1451:8224 with SMTP id h11-20020a056a00170b00b0064d14518224mr11700400pfc.22.1685293688070;
        Sun, 28 May 2023 10:08:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/12] xwininfo: upgrade to v1.1.6
Date: Sun, 28 May 2023 07:07:46 -1000
Message-Id: <5a30b3ddb0feb485b893d77e06939dc64ce8f7e3.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181838

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Changes:
Use xz: upstream has not released bz2.
Update license checksum: change in copyright year.
Update sha256sum and md5sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44db345f3a1f13ba31edbff28774b4512d07f8d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{xwininfo_1.1.5.bb => xwininfo_1.1.6.bb}      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.5.bb => xwininfo_1.1.6.bb} (56%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
index ec9f08268e..39ec76724c 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
@@ -6,10 +6,11 @@ DESCRIPTION = "Xwininfo is a utility for displaying information about \
 windows.  Information may include window position, size, color depth, \
 and a number of other items."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=78976cd3115f6faf615accc4e094d90e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a1b9559d7b7997a6e9588012ebf8769a"
 DEPENDS += "libxext libxmu gettext-native"
 
 PE = "0"
 
-SRC_URI[md5sum] = "26d46f7ef0588d3392da3ad5802be420"
-SRC_URI[sha256sum] = "7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e"
+SRC_URI_EXT = "xz"
+SRC_URI[md5sum] = "c91201bc1eb5e7b38933be8d0f7f16a8"
+SRC_URI[sha256sum] = "3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f"
-- 
2.34.1


