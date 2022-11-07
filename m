Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA45C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:10 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.98.1667835424175059788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3PIhNsqU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so10686350pji.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeVJxbaNcqlS86QyypG1KXW3HDyxFyoadYaH2Sh8pOg=;
        b=3PIhNsqUmEtHiAHcQWPduA3LHiaMayf7ki+5wm49TzVDGmVBVoFsX7qCgHklMvgAsg
         74jZh+SfoCV4dd47xMR5dS5SVl5h8HmDRBPlmTkrX7KMxAABFV3M7ABp+oDuAc0Dsh8V
         6Hdug9g4JcN0q8ZqPkE7dVGBl3yROLUYMF+IBO0w3O3sNWFw2LuUUt9iAZcPKHbE9YsK
         g6uIbwe00R7Z5LIF5U+bkRQ6Vn/ijb2vtDQSU47jvGFzmoPONsbIah8+hAuWbfv/l0mc
         DAV/wLvSmzEYRlma6hNMau1n7AerBrt3qzowUA6ZMkkIEDNxAe3Hlv5LyVmRjWoNv6wa
         oPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeVJxbaNcqlS86QyypG1KXW3HDyxFyoadYaH2Sh8pOg=;
        b=8JoPllphKbZL/rauaj73ZlfMx+BvctcNbW2MMZPya29FWb8/k14G3L6cShMhGohBTs
         9gKKk3ESafxfyLo3S97fwTyDHERdOsg759Nbh/FLXkh91F/xvTQQuYx7yBTBVBnoxnpW
         yyW9imxCW2b1VA2+6LF1g4PAxQuqtU/wi6UNYaz42gwOXGXKEJiZ01kqehlT275xdI0H
         z1bgQFpKLPtul9qUq2CSes31vO+CNJGGZ9pD9B960jjl1TWK+vG0CtRs68J9urxgMBi9
         5YuUogEDHxPMWYvBEi/XYTXAIje4AiaNoVs4y3luUtKVd2RFZJQn2INbhopfO+flfWo5
         pqVQ==
X-Gm-Message-State: ACrzQf0/Mzmw9K+xU9/cgXAUqAH7jlsi+VjI1rtcUhu2Rt3Orkt+uXkN
	BDsV7xGMwkAySAq2xpAk/t2ANQ3DzFvZk1cd
X-Google-Smtp-Source: AMsMyM7Qt8wtEmIib7Wl7z0sLA74tLgvdu6i/CFLJd2ncdekiDHJNlwLwHTJonnKiK4ROASDE12wdA==
X-Received: by 2002:a17:90a:6c41:b0:212:fdaf:d79c with SMTP id x59-20020a17090a6c4100b00212fdafd79cmr51134939pjj.134.1667835423276;
        Mon, 07 Nov 2022 07:37:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/25] wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
Date: Mon,  7 Nov 2022 05:36:24 -1000
Message-Id: <d5269e53d936570c875ef743f4ac198bb3658b6e.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172904

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
Fixed a crash caused by trying to deallocate already freed graphics buffers in certain situations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0db4627fe8c6f8a0080248052dc06419774cba4f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
index 5f776c13e6..708201043b 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629"
+SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.25.1


