Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2169C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:34:03 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.1895.1684953242064099959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 11:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=5M8lLYIj;
 spf=pass (domain: baylibre.com, ip: 209.85.166.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-333eb36e453so2673315ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684953241; x=1687545241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rgnA5KvNOn3SEsyL7rovUNczmas0oLnMrNzltNXqv2E=;
        b=5M8lLYIjjJX86Gu1e7nI6fa8kGifTrZNkim3MQLG6CbuOLDEMyvYa2X8b2MvVTOeeh
         w6ZopBQB0VKmYT1u0HoHve4V9Kv20Qflmt3BFAmFemmMe9bxulQYIGTBXtFTh5bIimDv
         +mVSnN0Vv/lGHTfn10agpJ8Yl6f1TyCn4yWC0X8fKQD30p1krFyXhTXft2LbuWJBvTFi
         +YF4KMxE6esdixY+VYVwWlRHo/vwitFIPZ559/T/Hmh7DHqs2fDj0mZaX2uAHb3cTXwf
         P5Mn20HwCSdOIwka2yDUwf+LqEteOrSqQlc8jV6zWHNJ9VyipL5EfhGJPaN4iIp7ejaq
         J6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684953241; x=1687545241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgnA5KvNOn3SEsyL7rovUNczmas0oLnMrNzltNXqv2E=;
        b=bi3fdmsOB6U858LWLS2MB3FeXNTGI7OSeOmhHaU0e2Mj1cr+sDp3PilPYt1DPsEEJo
         biuJSt1LMLMRXG0I7Gp2dIGHkSqyuVFwFfXyotSb7xWiohwwVx3fRgqelaGf9T4AIEM3
         1fPgKWk8UatkY3PjzGxiJxxz9Zk8L3IiqpK2sZZwt14mc1op5HdOoQ6SgWewbWcMz4NG
         Wqvpm+3lodrOrieHFUfpAkXVqJ8770nj/S8O6RgZQd6CLW/qlCXOe+EujJbx99yiwB/G
         p0x6gfK6OzkwnaSINiX3KyrhHQX0kL7Sr7zC5DpSf9PgVQUGYYOseHcbJGhNU3rcDfdf
         GhEw==
X-Gm-Message-State: AC+VfDznyQ/fV0OoE8fgasg7si58nrvZjq2N3MqaXzJbVHTxZOTrrqLp
	zY+XR2dXk+iZbABG1P+rMVxpU3ewRELD2/zRlUc=
X-Google-Smtp-Source: ACHHUZ4rNk83urH595MLlwi+3Yn2TQZws1Wmj+LUqFeYFSxQOr2hOcLMAgLa5gL1h46kyFne/RYmnA==
X-Received: by 2002:a05:6e02:151:b0:331:96e5:678b with SMTP id j17-20020a056e02015100b0033196e5678bmr12390644ilr.23.1684953240916;
        Wed, 24 May 2023 11:34:00 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:4839:d997:f6ce:5f02])
        by smtp.gmail.com with ESMTPSA id u13-20020a056e02080d00b00334f96ec4c2sm3124895ilm.88.2023.05.24.11.34.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:34:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bind: upgrade 9.18.13 -> 9.18.14
Date: Wed, 24 May 2023 14:33:59 -0400
Message-Id: <20230524183359.2999968-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 18:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181690

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/bind9                   | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/conf.patch              | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/named.service           | 0
 .../bind/{bind_9.18.13.bb => bind_9.18.14.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.13.bb => bind_9.18.14.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.14/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.14/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.14/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/bind9 b/meta/recipes-connectivity/bind/bind-9.18.14/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.14/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.14/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.14/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.14/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.14/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.14/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/named.service b/meta/recipes-connectivity/bind/bind-9.18.14/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.14/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.13.bb b/meta/recipes-connectivity/bind/bind_9.18.14.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.13.bb
rename to meta/recipes-connectivity/bind/bind_9.18.14.bb
index 8617137e87..c513cbc8b6 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.14.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3b06b6390c1012dd3956b1479c73b2097c0b22207817e2e8aae352fd20e578c7"
+SRC_URI[sha256sum] = "9ae12edf6ac3c430b33ecd1a7c0c0c60875d255185eb87850fa9a5e794a64a09"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.1


