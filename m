Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DE7C4725D
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:14:58 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.873.1704730493160155453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kxl5cuo0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so669219b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704730492; x=1705335292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MELFDK2IFy79ZGN2ihs40SljKYTGDGxx4GVxEo/Wbe0=;
        b=Kxl5cuo0i5wBBxZbkYZvkiYEqsmwia27qFS14dGGWupcai9AG9mgus0KfTreP6PQG3
         /lPPeZKP/WhxZ3vG0UeaSPsaNrTLtvW+Ong979ss/e41fcRKW24ti0lA2ay5hHRLwQU+
         Xu07K2K5rt+OepRwQhHRV68gFD/1y2fBDkLFgCGz1uy6bwOJ+vlDJfJq1fcU64Tk/bo6
         IcUw+AARP2OIE7Eg9Cv64gxVXjlUMeJsJrqJJymLcJ6Vi15aZ4acc/lIId+MOIllZi4d
         dEYZmNMpq2Wj6gxOUkINoYysEuZK00dCfUVzsFxW/zEicDrJ+sUH8CUCkCq4CvodOlug
         IDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730492; x=1705335292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MELFDK2IFy79ZGN2ihs40SljKYTGDGxx4GVxEo/Wbe0=;
        b=QAZRqi2O5dbkIU57ftdZQzY7J0bFEdLif5UsFFDNmUBAy8yEOivztUOCYkjiV89wcn
         1t6jpWxK453sSIT/ox6UYTu5cOg4wRvdvpTzoU/gDvEvhJPRsoGzKoRSq8mQgEEY0x6+
         NBgTTwUlUS3tTd70BU+3zZBC2JQeB0b//FAp/n0ozVLTeeH/M7kC2gRSI4oq92+qp2A3
         aGIh7hPW6w2c6TUnkMuXI38oJrS6HsRkizazfdVroWwQJddqoQY3Pq6eUt9WkVIecEs8
         yDw0BVwE03tyd6YoeN7eNXAPkpWSnGus9m7s92b9vkm2yVdPDjx85m/t4fZe6ATnR9TP
         7Gfw==
X-Gm-Message-State: AOJu0YwSp/jh8mx2Y8pcUYDNso5ItgDhpDwDXClnTDYmWcrZ5n0Ybrf3
	QY7HHJteaTcVE2e+EDb7jBaNNX+B1yXRJEz9gdfWjv2A9vUcEw==
X-Google-Smtp-Source: AGHT+IHjCsWeR7THPzO35HpJXnYYiZcF3YuWAkKcqEAEQxAI8jFDmwq4GDXEbMLXbbGrfzPPbZwqkw==
X-Received: by 2002:a62:b616:0:b0:6da:d161:4f8a with SMTP id j22-20020a62b616000000b006dad1614f8amr1273080pff.19.1704730492277;
        Mon, 08 Jan 2024 08:14:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a11-20020aa78e8b000000b006da14f68ac1sm45753pfr.198.2024.01.08.08.14.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:14:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] linux-firmware: upgrade 20230804 -> 20231030
Date: Mon,  8 Jan 2024 06:14:32 -1000
Message-Id: <238bfed988c65ce844379afdc3d6a1c30bc97f34.1704730354.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704730354.git.steve@sakoman.com>
References: <cover.1704730354.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193421

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7c725d1f2ed9a271d39d899ac2534558c2d103fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230804.bb => linux-firmware_20231030.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 506182c9c1..a42e5ed825 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -147,7 +147,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
+WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -231,7 +231,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
 
 inherit allarch
 
-- 
2.34.1


