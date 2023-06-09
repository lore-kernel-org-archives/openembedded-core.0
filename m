Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9D0C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.136.1686329656220340815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=h0Y8zthM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-652426346bbso1660167b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329655; x=1688921655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pKRSUf8AUx7R5veqnKGQ7+2sEUX9m8aFYTyQWHIvtg=;
        b=h0Y8zthM99IspZzko2GszTDGnaygflXQNgXn2RmvMkyren5ZWI/ArhA7CTyw2+YqIQ
         xk36HffpTN3h+pUcsXhf8kr2nRAWorrm/Lxz96gr3aU9aPCzaUmf2cL/bKUq/z5XAR62
         fYmTLkC2MJ/aTvDzY3NgbNTNjvPLd+aVAxtlo2n9/Cyk2x3yNba0pTxfVp5MaGdQTmYd
         OHXJwjTVyHt3tOkiQuuRrgkFhK2n/V/zHvsP3Rfn5B1IkJTFosshR6kZ8d2FFKDFk+z/
         KTVYuDyKItsdc6lju/O/j5ijbLRGIIvO36lDy8Wbcg/c5+HYFYHoiF9l4e8/StDyZucO
         NV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329655; x=1688921655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pKRSUf8AUx7R5veqnKGQ7+2sEUX9m8aFYTyQWHIvtg=;
        b=eM8bAAeQW65IU4O6p5nTEWIVoouUKUWKsyp34SHapY+uYIkKSGSBwpt6Y9rfsl+fvu
         Avfr3yutZ7sdUvDNWCA1NwagHRuG9RgXFcBYxBYrgdgeiD9JzE1koKvNccZZj67r9eLW
         vXudp+X45i+WUBd8Zwi4jd70n9ZtD6HciMUA+8bRbbiqiKMfbGXhvZbJfJ10k/LSv1sZ
         A8xnk5PBbjAVnYG5Q/ti3bph0AKbMY9Cc6PibqpLR34tKX1U4UKjS4u5Ptm1C6ZJr+8I
         gkSRYLk30Wb0MRRd0t9rdyz8NbexmW4MTuRV+w68ECRc1UDHUBaCcwccA/2/2ddh4H8K
         QcPg==
X-Gm-Message-State: AC+VfDxHNTIbBgYxmqWNNFkY/C2x1Hz3NgPN+HPRS22DSXAAi1fKo2+7
	iqVSlpMpfCIhZtNCrK3mqQQwOSWwMEX8VO4r35U=
X-Google-Smtp-Source: ACHHUZ4rR28ajBBuaeBdd4qhs++dl6BvHe8XjnT2ux48w4Ns7k0YoMCly5OdqJOLYQ1W2Bt3oOaiig==
X-Received: by 2002:a05:6a00:2d0e:b0:65f:1772:e253 with SMTP id fa14-20020a056a002d0e00b0065f1772e253mr1755375pfb.2.1686329655266;
        Fri, 09 Jun 2023 09:54:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/30] iso-codes: upgrade 4.13.0 -> 4.15.0
Date: Fri,  9 Jun 2023 06:53:34 -1000
Message-Id: <b189240b211e5d8f40747a0128834ed83c38a8f4.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182573

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
---
 .../iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
index 1950583f59..6ae6fdf8cb 100644
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


