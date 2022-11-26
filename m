Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10814C47088
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.70842.1669472155133025531
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XWCwjS36;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so6503138pjb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5U0x5dFqMCqGAixpDpKVX7MEX/WijEqnfTI2e10cv0=;
        b=XWCwjS36hCpaEhzHJvWi80IOc+IHJIf2cIdioi4Q8nMrp6ueAUZadovOcdeAMFT875
         aL/SIu++eNfmQbH1vx/JNZZ3wwFAiftHbGRqao7lGilBP9eq4mhNi/W3S6mSQIvbjsTd
         aIRVJlTUV6bcirBrYZrNE6ieXjJMQZr0KyeRkXZBEoOihs3ZEK91VQ4WJj3NCL1r3Efo
         ZOHHJShHuffYQTvlqBzdYBfybACFsd0mX6Dw3ces+u8aTyOiVaZKFbOcs0Ofsn8Axmig
         D80k2SLLNVjTOuxexkGIBedI0PPGWO7sZv9sWHOcAYwYtsV/fvnMrpK4esKRxJF2iXUQ
         Cp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5U0x5dFqMCqGAixpDpKVX7MEX/WijEqnfTI2e10cv0=;
        b=ypqSQq30QQRv8dLSBSn/L0huTIKP66CQUq18HyX3dfcTX19Fp21MLeUU6Q0TfBiuV+
         RvKs5Qm/xGEXJRRT7MW3LXhUf+GG+TBLp7Jmoh0P5fmRCddT5zSi02LoOxxs3TlyGi9+
         uQdTu4sbWWvKaoC7hlhZYdckziF9nppoowovdeJr0zmmakM9K1E7xscplUXElTsvoCsp
         64/Two7/ZI96pqZ4iKWn+1ldhpWm6KSQoa85m4i6Blkf+y/AX3QteXrvDFquBG+YNOCV
         CHWDyuYHnZq82j6hlFJeKo0dcGoPTXfK9OHJ1e7mwX2DlnQ+VbEB4TzgP+huK4HYlpSS
         fNFw==
X-Gm-Message-State: ANoB5pleF6I66d2ImS0RZWXXcrri961BcfTs8/JaI6R3m9o1eixzcdNj
	miL0yK4pbvh1MdPWAe2euMOy/W/Mf0jCiTxBY5U=
X-Google-Smtp-Source: AA0mqf5MPZB2kHMaw+VrvtqFqCFTEI+bz031nZGQDXfXdOmRo4DmOupkdgSRxBuUHMOMOGFBmjbPYw==
X-Received: by 2002:a17:90a:c712:b0:212:9625:c8e9 with SMTP id o18-20020a17090ac71200b002129625c8e9mr51358830pjt.128.1669472154263;
        Sat, 26 Nov 2022 06:15:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/37] iso-codes: upgrade 4.11.0 -> 4.12.0
Date: Sat, 26 Nov 2022 04:14:27 -1000
Message-Id: <9d6244adaa75f361e22ced620e9a00a1f8e0558e.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173816

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- ISO 3166-1: Update name for TR. Fixes #38
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2. Closes: #1020633
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 99917b4b7d5642b292cb95c770871b95e411dfc5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
index be573981b0..ea7c43cdae 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "2651d7fe65582263c57385a852b0c6d8a49f6985"
+SRCREV = "5e4dddbd1f8902ab0252ccbb19b783cc0359505a"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


