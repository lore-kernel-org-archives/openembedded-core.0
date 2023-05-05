Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D108AC7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.30316.1683300022528878644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=lH5THXhs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6434e65d808so2127057b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300021; x=1685892021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBo2fX7BxmismuM/SKCMSaueUzA0/wmhUC4Cu6TB278=;
        b=lH5THXhsgRqEI1k0fKX+eL6eGh0MBAWUP1iDhdumAzoYg1XnV+N0skp+YV9meA/mgQ
         P8b/7AU8Ef6KDSO15o/Ku+I2mvZfmTTu1T2TAIZU0Q70S8lpl8zLy+dMQCRLq6Y6hPih
         WU6ODui1jIByLiN5/ZOFGHSdFWyFeHHFNfFg3UFIf7PRclGBl6U+hc5NTw2yl7wwuTjI
         f3z9Lz6zdoe0ZGXr8b95Rq5ujiH1S8g3FCCZq/ZB9Aux1rwAdVLnwCGwduw9KRBgIVSE
         mQG0RHc/RlFzsDA1WqhY+0FFFFyg5oBVlskKmFR5JQ+a2mkGZBhSazQGDEVP3Ct2AIFI
         5d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300021; x=1685892021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBo2fX7BxmismuM/SKCMSaueUzA0/wmhUC4Cu6TB278=;
        b=YXWw3pD0v9VZW3j2akaiUcnMbba8k+n2+yuwOPZmKDXwa0zywJ27hUAlEoU//qvk8w
         ZQ3g1MBckwi6YqzpIp7Fmgqx9LRXlUTYscY53ohlfMikIy9T6d91JOuHfUjUW1SZiDid
         JDbGgmqdxt9ThnGKvJX4VuaMrUCRbuy9jvsV3AQALtWkg8RTUygPXsAZt5ykWEgcvTB8
         tD5WO2dKLL+XGi0y+NR3VRdnrPyUbS6pFLAtqBRMjI1/YImAvEyQBU5i1WMSzhcXqbRc
         5jFZFQ6BBNxfoqDn/6JDfsIctaDKhImv44lx/CCe+l+y+PYGppEAO0Ekn5iiz8FT2IvZ
         BNAw==
X-Gm-Message-State: AC+VfDzEooXdTZNg+tT5MuuE1aIcpi2DpBiKlwbGVBla6cZeUm51Y0oE
	5BEkDrwMOcIrl97HjXyNR1OKV1yZAPmcVUtS7/A=
X-Google-Smtp-Source: ACHHUZ7YVQrXcqHzxd6MOY0o9UMoOEwhkEKtEYP/p/lLjzzt825l8URSN2Wgv44hwQIZhQfyo2vMYg==
X-Received: by 2002:a05:6a21:1190:b0:ef:85a6:4654 with SMTP id oj16-20020a056a21119000b000ef85a64654mr1926996pzb.30.1683300021642;
        Fri, 05 May 2023 08:20:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/35] libsdl2: upgrade 2.26.3 -> 2.26.5
Date: Fri,  5 May 2023 05:19:22 -1000
Message-Id: <c55f56ea3081f3b53c06e84fccffc289bac1f19e.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180931

From: Wang Mingyu <wangmy@fujitsu.com>

2.26.4
This is a stable bugfix release, with the following changes:

Fixed relative mouse motion over remote desktop on Windows
Fixed using older game controller mappings on Linux

2.26.5
This is a stable bugfix release, with the following changes:

The minimum deployment target on macOS is now 10.11, due to changes in the latest Xcode update
Fixed incorrect modifier keys handling on macOS
Fixed occasional duplicate controller visible on macOS
Fixed handling of third party PS4 controller input reports
Added support for the trigger buttons on the Victrix Pro FS for PS5
Added mapping for Flydigi Vader 2 with the latest firmware (6.0.4.9)
Added mapping for DualSense Edge Wireless Controller on Linux
Added mapping for Hori Pokken Tournament DX Pro Pad
Improved the speed and quality of audio resampling
Fixed crash on Linux if dbus can't be initialized

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 106cdae227775f8e3b32462ed68b99231595f075)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/{libsdl2_2.26.3.bb => libsdl2_2.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.3.bb => libsdl2_2.26.5.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
index 15054e1ea9..3274475da1 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057"
+SRC_URI[sha256sum] = "ad8fea3da1be64c83c45b1d363a6b4ba8fd60f5bde3b23ec73855709ec5eabf7"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


