Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D513C0015E
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.717.1687275602037357805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hUQp+Ljx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b52bf6e659so21848525ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275601; x=1689867601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yAt2WUbF3YHunetQbSXexUN3VKsDsPMfpDnDvPFHLs=;
        b=hUQp+Ljx3xNinDxfYgxgz3yqdgL7wbFBTFlxalraSJjyF6htG5I2ai1W6Tw/CCp2zE
         /JlQ+TW7HeGbTXFaqDARaoR+1bdVAgELQpIgrTj+mSHruCcpMvEBs3u8l2IoAHKbxA8Z
         VwZUGJpcZ7QHi22OfGCWHskAkKiYf6pMH9+DWG8p+NOwypfFXNop3HdMlw8OIY2Ig8Sy
         mvRAzsHJRYBc9pqccj+K3Ty/mWn9In/IYeTLa1dGdelEnZYNldSExG0k47lq3+QAIR4x
         vULu/ICbIgv/PT2GV2tZ1roD+pRRwvIbsEdkGwPi6AmtkgexZ+3B387EAgRInDRZ7u4I
         3GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275601; x=1689867601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yAt2WUbF3YHunetQbSXexUN3VKsDsPMfpDnDvPFHLs=;
        b=TtuWrUWugV1nleD0bgucaWsOpWG9xAdqCy/mu0hggi+6ulDBjV3f5QRSVlef42nkmU
         g29I8x9VQL0vcXCQNL6AlR0HKlKN1UB4YahaYN/zCN8HeTHPZF7ERWa1krFXPQrtmkMT
         wwrBg3NNFYbwxLgFgF/+MgAkuBtIuDkvhPLGFjxGntWBDjpqNd18LGjAtCesxoPb2N2U
         Pgz6XM97fNKrRndjCEy/Ox2HmHfI3tdHy/gyRN7bX/kolHWAMTPjUpgemy+Y3k0nuOT+
         DKfI4KD7l3yksQFqlDJ+4KHyf9oUf+4xljUMuaRBw4zwRmp9ugKfZk82t2PiaeV6AbVh
         WZjA==
X-Gm-Message-State: AC+VfDyaetCOVfa9pN7joevZO4P6xKBCCCZ5gcHG8+T7IlX7sn55ijbz
	lBRJ8z28TOHHD1UtGFaRqzZyocirlO9onk1GTvM=
X-Google-Smtp-Source: ACHHUZ6ctYLg+5U4U+4FRi4R6jFFL976rCMGGrXfKuXV4QgS1bLfKtK1REoZenThv7mynsoiSACcWQ==
X-Received: by 2002:a17:902:cec6:b0:1aa:ef83:34be with SMTP id d6-20020a170902cec600b001aaef8334bemr9397621plg.47.1687275601092;
        Tue, 20 Jun 2023 08:40:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] iso-codes: upgrade 4.13.0 -> 4.15.0
Date: Tue, 20 Jun 2023 05:37:21 -1000
Message-Id: <86e8e31a413fdbb8ffa825c41d0fe83c292a6b76.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183145

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924
* ISO 3166-2: Fix wrong Spanish translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 355f2f9fe8a1e6c5e78f136cb3ed77c9004fb75c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit b189240b211e5d8f40747a0128834ed83c38a8f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
index f3ead5e8c1..b789a99035 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "ab6b01d5b56af7da9f0d2d1619a3cf84e43ed76a"
+SRCREV = "69ba16daef3c5c5e3c18f2d919e25296a4b946be"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


