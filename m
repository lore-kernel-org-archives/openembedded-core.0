Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D06EB64D7
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.1234.1687401377574513504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d+5zJSmg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-54f71fa7e41so3693972a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401376; x=1689993376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/crmA7aXb2ZAiu4TiXgo+exlr6tZmMMtsURwpnnsvw=;
        b=d+5zJSmgBP7lvmniL3LTAsoaLGU5i5oZK3tPVAJUM5K/4+sY7limHQXUOlZTbklkbU
         Dwku/BkRCka9nw1BrlM2ryJQ0ytKwgZbS2otfshqASRbWQEOeLPmMCYyy2pH5jdiT86D
         PSero5y/phEKUMZU6RRko/ldXV1aLJLyq87h0D7kb5wrajKPZmUtU3NXKFgmIo7C2ym8
         HAOmc3Z76BEPQCpUlT+cOGENmlWvYQw4wE9kweW1EmeacaMwxKhRaDrfz4dfM1zp7JUk
         66dBu+SYJaDQrqtGh0Spc5uftGd2Gwn8wJ+6U8pWdNa0eXx0pvCTY8kSAhHFlVpcElLP
         OEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401376; x=1689993376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/crmA7aXb2ZAiu4TiXgo+exlr6tZmMMtsURwpnnsvw=;
        b=HL7m5+T9aS8WLpJAeSMe7xdLgJpjjtZ9cVcmO5si5nompTA2d6JBxkis1WDUBaaX2t
         xvM0OoqU6b7kr6drlVbFAHuqgUZWwUVlJVPWElH8urA1f6fJnsRT3jbtH5o+v7qnKDxS
         2KB403KF2P4TotEXG6S2jWM7eZNFoeydq2zpwP5ST2y0TwZlarJ4bSZqJWBk2JIYRIpF
         4ARAn509uRio3czepqI8R6kf2rRSaRV8uhQ7epvGBIRFSiicUng70IvitJi0jCr9ytlw
         8JOf66MVYzVQJfYNoudiK9sZtn49WWRryJzKfDIUNQQlvE0/RhpmYsL8ieYRNd1KZcc1
         cPlw==
X-Gm-Message-State: AC+VfDxPTIIWPDMI7RI/DzOcjUXkvCyqqXAroeeHT2t9vHIwCWLR6g1d
	j32Dpzni3ui2val2uL+sLGZLwBGNFbgrL/iBcmM=
X-Google-Smtp-Source: ACHHUZ4BhgEKa//CDlwBCIwBXgGXZu0fYM+FWnSjc0+gaSAvpCm96+2uPlZWC+cnd3o36XosOMBclg==
X-Received: by 2002:a05:6a20:938e:b0:111:92ef:314e with SMTP id x14-20020a056a20938e00b0011192ef314emr17029235pzh.35.1687401376543;
        Wed, 21 Jun 2023 19:36:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/23] libdnf: upgrade 0.70.0 -> 0.70.1
Date: Wed, 21 Jun 2023 16:35:37 -1000
Message-Id: <04bc1d32ee1084f6c13ae20f21efb6c92c1c5e9c.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183205

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Add repoid to solver errors for RPMs (RhBug:2179413)
 Avoid using obsolete RPM API and drop redundant calls
 Remove DNF from list of protected packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 965f0b5f50c2c1453d6e7d4f32091635c0ec1e49)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libdnf/{libdnf_0.70.0.bb => libdnf_0.70.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.70.0.bb => libdnf_0.70.1.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.70.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
index 14d6a37de1..c44ae2729b 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "93759bc5cac262906e52b6a173d7b157914ec29e"
+SRCREV = "3b8e59ad8ed3a3eb736d8a2e16b4fc04313d1f12"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


