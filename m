Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D330C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:50 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.274.1703180505421011930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUJQ101N;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5cd88c84949so74763a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703180504; x=1703785304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iPuHJhGVd4cjb9PZg6395dDWbDDO/vSolHNFKURzaRE=;
        b=GUJQ101NCIXJrEmGrtDAuqSylOaYB6pXf1sqnHurqOfGFJpjIZcbhaN9pk8xDoL6qk
         /aHG3WG5u6xrGj0TodaNgGa5IqSyeBJE0PNkhLQx4Nk9mGnZeAxKW7Gyt0PTAuD1IY0I
         d2wGwrl8r/nGp0F/JSUujjg4QoZ3qkl98jfKB149qZXfqmJs/PqIp6Dm4fyVNSxQL9xB
         ECOQLNaU7yToxZyGN+OC2A0o/uCq0cjkmcCn9dYrQZ2ouwDaydgdgo3aeSeGjdTZewZt
         +9kzHXfFPwJeVeinutC2u+b5z4DNxZ9/u1L+YbWaRXb4XvhbMC4lvwzwmXV0Smxr6vcz
         2RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180504; x=1703785304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPuHJhGVd4cjb9PZg6395dDWbDDO/vSolHNFKURzaRE=;
        b=cHMeT5o7EQTgbI+fZd02gqSOTUEFb4109DYeGPrkuAa+dQg2WIXvSHNLEIkywTUc/3
         e/QQa0IDHJPtosA5opVT9wJgz6wVqxy5oGqAEFwqsZrq8ANcCEIWJ2xbhdPm2LMfkD/J
         LzOBAFy76vK3Lx6JeiPRSt/IdZG9+iwuGz0Dfm7kuICIl2zG4hGl+hGNzZqyYJ6xWPpj
         lPEjyxeDrR7Rq9vThOuh66M/585oytDw0Vu78yDqdpQfbNHnvZ9aUBrW5NgUWJV+vmoS
         ZLIDzl3tP7OJbFgZID3rNdLgn1IIMWW5NRDPaMUgcr9cveQbNdH7v4wTKPXkNlE/Uyin
         eRNw==
X-Gm-Message-State: AOJu0YwqjnlIJk0kg5dKpBKaSxBge3IKWwzp2qN7jhTQFuzLlSxQopcQ
	XAyO0pdnZlZ5UuALV+qG8rXx7B2TAzk=
X-Google-Smtp-Source: AGHT+IGv2bTIgvWr/uqiHtQKZqeDEpsGncY22dTu8FWebrWlGmOhgm76/4SLy3Yg7WMtLLewbxvBNQ==
X-Received: by 2002:a05:6a20:4f03:b0:194:c6d0:8d5a with SMTP id gi3-20020a056a204f0300b00194c6d08d5amr28902pzb.6.1703180504339;
        Thu, 21 Dec 2023 09:41:44 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1b8c:1070:bbfc:3169])
        by smtp.gmail.com with ESMTPSA id fa7-20020a056a002d0700b006d0bff5d84esm1856307pfb.137.2023.12.21.09.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:41:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] libdrm: Upgrade to 2.4.119
Date: Thu, 21 Dec 2023 14:41:35 -0300
Message-Id: <20231221174135.1633344-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 17:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192843

From: Fabio Estevam <festevam@denx.de>

Upgrade to 2.4.119 which has the following changes:

Marek Olšák (2):
      amdgpu: add amdgpu_va_get_start_addr
      meson: bump libdrm version to 2.4.119

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../drm/{libdrm_2.4.118.bb => libdrm_2.4.119.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.118.bb => libdrm_2.4.119.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.118.bb b/meta/recipes-graphics/drm/libdrm_2.4.119.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.118.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.119.bb
index 7e0b23e219..e89ba68164 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.118.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.119.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88"
+SRC_URI[sha256sum] = "0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291"
 
 inherit meson pkgconfig manpages
 
-- 
2.37.3


