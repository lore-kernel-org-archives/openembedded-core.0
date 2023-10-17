Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202B5CDB484
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:51 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.238373.1697568169390596078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YkCcjzOd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so3247185b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568168; x=1698172968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nC6u+dp55PBfkPWqjc4hA6k7aIXrqYhWWHyP/r/vMk=;
        b=YkCcjzOdnsqJPrroU23BzByymF6nztMiuXx+iFSDbIiCa8Jn6T+9boQJREjOV7tRkr
         j1IBHpBt6JDTG56OS+ZA7qgmNE3Ph4yIYNsjv89qlOfLKEf6WJmg4mrQf7Ff6fc/iZln
         5IFS4C3FexRFLIeEDAAbPLMgYJC9bmVDgucByJfxM4CJq8JHzOGMY5NBm0odTE6GvTnJ
         SaGYdFFFWf43OJYwA/HN3U32E3sUO9xR6pN76LW2bJliN/ed33cNkL6Jyv8R7LxhLvs0
         CS78I6tQ9LIb5imehXfc8r+weTh77dygF/iAROm5Espr9sGN+KMIeb8Kkl3tPtda9nmQ
         DYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568168; x=1698172968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nC6u+dp55PBfkPWqjc4hA6k7aIXrqYhWWHyP/r/vMk=;
        b=SIzoF5zn+yjoxWePlZKyUK6s5y9Fuf5LQXAjihFXMJSK2X2U6Ead8sa8MdFYYn/PtW
         JcSLMCjYDh9FBjrzwzzj6bMtVuj3qpN3aBSL1J4LDSgkynMmXNjH+uqdnmB5DarnQV5Q
         ok75dCS7JsHwG0tvTAfZ8FiquT2Q3J4mAmT9vzhewHjTDGKmj9WEhTBarOs0jlVSfWcO
         U6tWYb5qlX37G2jpL3Jos8kEfX7hcP4j04I1K9UTH1HSZVvc//1cpoP4MeKmgXiXAXZM
         A7R5w9qlowmldLS6hG0WDj2yGJUxeb5r2wUcAV3xZ6Jt9R6quZvUoZ92+kVX5dAY3vyx
         /TvQ==
X-Gm-Message-State: AOJu0YzC0SxzU4naamFHzBlCYFmfm+dCysj4Dkgq+3HI7Su2sxE/eWT0
	xBy4PxrZDW/qFt5MVGcP8KLNzmNSD3MTHIMMUt0=
X-Google-Smtp-Source: AGHT+IHsvBiOHeLon0+sAQIenpRY7gweEOTJ0/7xKtGEkLVLLBm8vXwrr7ccg0wb3pE3JHwc3rN4Tg==
X-Received: by 2002:a05:6a00:1995:b0:6be:2991:d878 with SMTP id d21-20020a056a00199500b006be2991d878mr3422180pfl.15.1697568168431;
        Tue, 17 Oct 2023 11:42:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/10] xorg-lib-common: Add variable to set tarball type
Date: Tue, 17 Oct 2023 08:42:27 -1000
Message-Id: <ff386fb5632c26ceb12d2381e9128b0546aef795.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189358

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream has switched some new releases from bz2 to xz compression. Add
an XORG_EXT variable so recipes can set the file name extension needed
for the compression type.

Following the approach in oe-core/master: 6a8068e036b4b2a40b38896275b936916b4db76e
xorg-lib-common: Add variable to set tarball type use a variable for the tarball suffix/compression format.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index a566eaa45e..1e8525d874 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -6,8 +6,9 @@ LICENSE = "MIT-X"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
+XORG_EXT ?= "tar.bz2"
 
-SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.34.1


