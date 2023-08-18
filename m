Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF825EE498E
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 19:13:30 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.2941.1692386009113489780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 12:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=EsNbwZut;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76d7fcae611so79116985a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692386008; x=1692990808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz3zr6ZQJjhS/43f0FvH5l6rN9rFaZJJuLz0Az5qGVc=;
        b=EsNbwZutxljRPHhSOdTdiBkt6GnHN6Llcl94HZOJ014ei+bctFrzQDDU87PkxK0of9
         kocs9c2KDWtJLYRSu1N6hfdV4enBuo9gz/Zwv4HIZjLmzesf/flIh1hJSckhrss9Wt5K
         iIjwBW5aURE04BJktzZp2db3DA+mjwJinXCVopDevpxaoa37prL4q975yDi3mr4Mf0bu
         Y2qLLGxn6NVn3OJz/P/AV3rFt6AD12/I6Drd3yQqswzew4fyGBeVWorI1Uab9uVSHIVB
         6hhOA9z09TP19qRpDa7jUq57n+rlOUwwNYL8Kjidq+5+o4o5yo7x7cL5c2bi2DUoMuMC
         V+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692386008; x=1692990808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz3zr6ZQJjhS/43f0FvH5l6rN9rFaZJJuLz0Az5qGVc=;
        b=AgVOTFH+VFDZikGJfKtgWU1q/QqSUriBRwdr0UU83jv9vSsBzgd6MSRNBSTwWw6aLZ
         ekHM04J76JFQYf0QyU22NueQqNKnyeJLz7mMXcda0bO8kyBadsCWGdYZDNRIfVgxMcdF
         I8Uz2cs4kYCkEZJXm7EKxKPP2zpl8O4Ti7O07+liiYMiqsFMHx9P8arasMeZ53ETQ5mE
         DjabDpZlc10jr8kCe5XhlvRNtXfesWnSOSOCqjTCif9U1fiaU2d9OqzUm5cMcuwSJlKe
         nYikydu7ad1cb5yu1JAdiLksuZ/MZJdaX2ByuEPNmPL9euYo3RjMdJ88i2OiFXJR73B2
         pjgQ==
X-Gm-Message-State: AOJu0YzvguZURRtdBSiSAmj+ZVWCDaPJqCyg3jXzo/q6EDP7pA/dGlZH
	fgQ3VY9roopVW9cibfnThvBgQizsmeXhw//8CJ0=
X-Google-Smtp-Source: AGHT+IH7u7ESDna9qXJrA45W9v0dacI6QwSHePW+e5ckWR1rIfM+sM8Yi3Uk2zxqG2rweLaWKO/jKQ==
X-Received: by 2002:a05:620a:294f:b0:767:27c8:968d with SMTP id n15-20020a05620a294f00b0076727c8968dmr158501qkp.6.1692386008028;
        Fri, 18 Aug 2023 12:13:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cx18-20020a05620a51d200b0076cb0ed2d7asm720732qkb.24.2023.08.18.12.13.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:13:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/5] python3-wheel: upgrade 0.41.0 -> 0.41.1
Date: Fri, 18 Aug 2023 15:13:23 -0400
Message-ID: <20230818191324.1959527-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818191324.1959527-1-tgamblin@baylibre.com>
References: <20230818191324.1959527-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 19:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186396

Changelog: https://wheel.readthedocs.io/en/stable/news.html

- Fixed naming of the data_dir directory in the presence of local
  version segment given via egg_info.tag_build (PR by Anderson
  Bravalheri)
- Fixed version specifiers in Requires-Dist being wrapped in parentheses

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-wheel_0.41.0.bb => python3-wheel_0.41.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.0.bb => python3-wheel_0.41.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.0.bb b/meta/recipes-devtools/python/python3-wheel_0.41.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.1.bb
index 2d8742545d..8eb931b5c9 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "55a0f0a5a84869bce5ba775abfd9c462e3a6b1b7b7ec69d72c0b83d673a5114d"
+SRC_URI[sha256sum] = "12b911f083e876e10c595779709f8a88a59f45aacc646492a67fe9ef796c1b47"
 
 inherit python_flit_core pypi
 
-- 
2.41.0


