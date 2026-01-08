Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66320D1D48E
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:16:34 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16131.1767903384528269612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 12:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=TzLpDMIV;
 spf=pass (domain: baylibre.com, ip: 209.85.221.170, mailfrom: hfranco@baylibre.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5635f6cb32fso282700e0c.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 12:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767903383; x=1768508183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9E3syiIyI0h2y36azQ0OzMzgCU/zORdoJSVtkjpl3L8=;
        b=TzLpDMIVhS2Cs8RCqdgMRB/vVcKYJiIZBUCFD+Is32XymEwBMfDp/n6mY0+/iP0Lso
         O3tKQ0zqjYdkZVcQ7JZZx+WgYM79BWzaSNGdo6+GjOmsY8ytx9nLsmDrBAd1VH7MWd4m
         yZ+cItyJbu3/bvqTBft3u4AZ4NvHKO86KGG5UsM85rZDnDhoCPNmVSoN9dR75STdfrJR
         e3iGTlCqzXg1LCn/zjo6nWIuiWmFQwcl40uP1wmmD2YlzyS2p0cdOttsrNXhIOXuohky
         g0HNVFnjYfWBhwY3XG71B6z+or4Z00k7NJ3ZzbiM73jr4Fz4BajpgT7eM3X558F3UHyV
         GFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767903383; x=1768508183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9E3syiIyI0h2y36azQ0OzMzgCU/zORdoJSVtkjpl3L8=;
        b=wC1flFJvnnqsVuFQ8uof8/92bUFIfcvO1oEWMsx2HdCRlUePWmjBRcJoPnIwk2b2GP
         rrlo+pVteiw3rljl1cnVQMl3XvbJLJORvF4OKvyTsHt09NGkHmO6gQGLoNW92j3hn8Hd
         Bvp2hXkysxME4rMd3HT5q2I6n+KcQfNf/BIEAszpnRppx8PFbDOxQZRpulwGZVK+9ODN
         DvQseyoF8bMZnhuGrphRzN39r1yYbcGFmjzjFgpDfExVTvRYphxxHSUzvyITKfyOh1iK
         mCpBHJxgEJZuJ78ZqKwoLBYB3ThwopNQCHwdtn+S/1XSWrvIiEmInHWyGzy4mdoxrk4a
         t6oA==
X-Gm-Message-State: AOJu0YztyZmdTauHYrlkpDfgF3fd98hgG+zNRAgChVFswd8SwmMerrKg
	c4UDt3cwciXemgjwZ6qqZ3oCkoaKPSWR2lRGOgMwm/ENWm9+KDJXs+z4q4LfdE8Ezg5/AKiYEUl
	59d0HvRI=
X-Gm-Gg: AY/fxX7fspmfDB7eY73JlHOHrlVOvtKSawr2inPV0GTaWnwmN7EnUKsPzeAyLN6udJr
	cXRqNNYAId1sFvPiuDQbJLY07S9/6LfORTBPG2cxSEaEFJC3UXkodRpjUcLd4bETiG+RoUKQ/+G
	Aqabsuagkolv/Gxm0/WtNZngzuqTBFqVwqUREsUi+AQGsnB0FTgy7IgTl9wdSUTRIJoC7/jx5DW
	u6nvy14oJvfvaEaIp6gPzfoFAk53LbUWJv55qdZyiWIFct2t+VcKMmFMJ00AZU8rnG2B0g1kGkI
	75U63Qyfx6TW3jbAbK0lBJLZS6MOoFv9KT7nNXqGyGYXeaz/s/V9ih21Hhzdsps5Ib6SLzY0yFe
	Y5GB9vIeISQ7aX4w8B+v9A6wxMEAgyk1pN667pU6QH7bkHNlUYXFzBw55Zbcg0Uan6Q+93QDIGx
	2geLNWVX34tSKydImRcKXqBHw+Ibiw5kTJtx1gy1CHtlwomJ/G9Jc/rNzq5YVOHPMNvzRtdv5C8
	Fr+K+Mh0w==
X-Google-Smtp-Source: AGHT+IGf+GqmWQ0nzJpdp+/pBgmk/YMukNxo1dTOIZ3DtA4S76o/h1fdEBDf9IK2Q409DGKZE/RMqw==
X-Received: by 2002:a05:6122:32cb:b0:55e:4bcb:6bca with SMTP id 71dfb90a1353d-56347fc9816mr2197672e0c.10.1767903383162;
        Thu, 08 Jan 2026 12:16:23 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c3:854c:5209:b372:6655:82d4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a074d30sm7302838e0c.0.2026.01.08.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:16:22 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH] maintainers.inc: update e-mail address for hwdata and libdisplay-info
Date: Thu,  8 Jan 2026 17:16:15 -0300
Message-ID: <20260108201615.523935-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 20:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229086

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 846a12a07b..bede1042ff 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -268,7 +268,7 @@ RECIPE_MAINTAINER:pn-harfbuzz = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-hdparm = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hiago.franco@toradex.com>"
+RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hfranco@baylibre.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -334,7 +334,7 @@ RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
+RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hfranco@baylibre.com>"
 RECIPE_MAINTAINER:pn-libdnf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdrm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
-- 
2.47.3


