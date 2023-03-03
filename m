Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2036EC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:07 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.27556.1677860266661907687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AfISQn2X;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso6618976pjr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWCIsNeZxac7FpPAaaFhCClSmEHalorBM8SXNfJScM0=;
        b=AfISQn2XRnG3+C8wpznWZwOSH6X7KZHnCngjnWEDfJlMU4kWPGLDniQ3EL58uAuI68
         1dse2oKDkpI/SV56rqCNUaFmIScEwyRPCh8mLDvdcV+PZtOVtuD3me/QXH9LjkKmgQZx
         TLNPMoHRllRXlxRYffe1FfJab0gcbUbVBRmrZQufofzNNaBcfGhFwfP0nzz1a6u2UHiK
         2B6s5jq6IIZzecDHBXxEdR43021BGR7X0UKQsQ8vvw69I3whue7U6AXO/6JWXX0wNgIg
         WwGaNMBdZsdvsb0BQeSNHrSWYQxQookBC4X05Ca0FkvJ8nBbVEQMXsrpB6vgHN3kHTTz
         9Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWCIsNeZxac7FpPAaaFhCClSmEHalorBM8SXNfJScM0=;
        b=FcncqDSxahls4mWQWHDV/PNy/T1fRcuilX3BUCYoVyXOlCDL1Ejz2tJ93nqo7UfoLl
         p5mBqcTxxl4B2tjXlwntlm5ZwEB/y9R6M06zeHB9zJ8CrHomtycyYDFmXkhnohz03q4H
         Rh41RPc2QISF9NHwNVaCgkc1kFOwQDzhgt3Fd/wqlOCvSVa12yo1+xNwz6o9TwQ3hXcg
         QjKNeyy2U8aXewYRH8gsJHCsGZx/uL1t+kvJdBMF/H2TFK6Cc7Yroyje7j2W8bBG8ZH9
         mWnD64DJoAZ2Vf7wCz+8WJPsc1uPyXfHcdmaE6SZpTEORFuOthrd/ChnuZQ5Um89EN4B
         u8FQ==
X-Gm-Message-State: AO0yUKXbnHtiSMBIxwTbIjz4zTAzgB9dySKVFStMkrA0y5rzg38/mM9s
	2zXLd4ObTRLKESj5ZWQVhKEn3bzc2P1Q8dgDE1A=
X-Google-Smtp-Source: AK7set/AJswUOKtN0OeYcguiadoNh1Chz9f7Msw+7/NheU5f7bp4hHzENeyA+B5kL3iweIcXguBylA==
X-Received: by 2002:a17:902:ee82:b0:19a:b7c0:f097 with SMTP id a2-20020a170902ee8200b0019ab7c0f097mr2263460pld.57.1677860277476;
        Fri, 03 Mar 2023 08:17:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/29] linux-firmware: upgrade 20230117 -> 20230210
Date: Fri,  3 Mar 2023 06:17:12 -1000
Message-Id: <f39ffb5410f2731c510c21500de912bea383e459.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178003

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8e6134d39b840d96e1c37d3df21a522afea8bc76)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230117.bb => linux-firmware_20230210.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230117.bb => linux-firmware_20230210.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
index fa9e6f604b..bf5d4f54e6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "05f1d941972cedadbf667c05f6010378"
+WHENCE_CHKSUM  = "aadb3cccbde1e53fc244a409e9bd5a22"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "df11e25ba2fb4d5343473757e17a3b4cef599250a26b1f7e0f038850f0cb3d64"
+SRC_URI[sha256sum] = "6e3d9e8d52cffc4ec0dbe8533a8445328e0524a20f159a5b61c2706f983ce38a"
 
 inherit allarch
 
-- 
2.34.1


