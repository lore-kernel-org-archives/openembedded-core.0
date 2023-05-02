Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A61C7EE21
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 12:31:00 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.127031.1683030657200315118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 05:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=DH5cgtvR;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3ef33f12995so17793281cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683030656; x=1685622656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UVPqz6/bvliLDEl+XRZnS2W2VMYCOndALHgHiFrsCM=;
        b=DH5cgtvRSSVzYoWQaizv0RIrlxXnDOB9Rvy0kDsnXdYJFqpHHqCZLSVxiOdfwaiJFt
         3aIpAQvch3S/ISM6Y86t5YiWHh22A/Bu6SXJJqqx/2AU7wJvGtpm2/Ni1wd8HZRsOVvj
         KnfjuBiei9h7vPW6WpTF3Ijvy2NexXrjFRRTRj6b1tasaQoajJ+91I58y2umX3yYl9+T
         DYSBacTPhS4g2jEmqArEqek6519FJVCOlCGWyoEBj99DxApzWsIk2D/ykmHTHC04nLv+
         ns0O3ctqezx61Vt8FrOufXjqe8trY6dt8a3d2aAjZYw/nEHC0p12leZK0Ixjvaq2YSxj
         ZMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030656; x=1685622656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UVPqz6/bvliLDEl+XRZnS2W2VMYCOndALHgHiFrsCM=;
        b=PR2axhcFtTSxYVvHYKItX6togSYWvzjY/DpDLIFZcOODZTFaVmRnrza/0pjhqQBWJ7
         1pfoxvopfpumCmIE+DYkXd1IughdmHLiCXeXoCxfttBkPm6dSfhWzKlx7dLdCQwT7q2B
         FtfGpTbHDOqVlub657W/QDBKrd8T+SfRzBoaS1SazGUCO6nPcnwKtcrCz7/81bEds471
         abs2QNjBIaJPnSX1jqDfxJsfgx1kY7G8AsMs+/sbFIMBmqpMBrH+TAWUVqVhrOgaVp4e
         bwU54GJ8VXebtk2c9/Ssg+pzhfqyQLR0kwNRVi+/fkocUVQscqflRTvTfBWNnRqYZ7Ix
         H6Eg==
X-Gm-Message-State: AC+VfDz1eqABbqVZLTtIkuH/xpIeg1zLzenw9n7O3hF2ATlxpUgF2Xda
	ZcWBhr5KafmQnbz6232+X+2mCBPTZkzN4MYJQbk=
X-Google-Smtp-Source: ACHHUZ74tfnVYGgsgRFCtYOMmRW21iCqpy/bmza4nQD5ma+OAi9hZrL9gfoFxiuK+xAOB13RkBOx0A==
X-Received: by 2002:a05:622a:4d3:b0:3ef:37d5:49e0 with SMTP id q19-20020a05622a04d300b003ef37d549e0mr26968936qtx.21.1683030656230;
        Tue, 02 May 2023 05:30:56 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id h12-20020ac8548c000000b003e38c9a2a22sm10173876qtq.92.2023.05.02.05.30.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 05:30:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-hatchling: upgrade 1.13.0 -> 1.14.1
Date: Tue,  2 May 2023 08:30:53 -0400
Message-Id: <20230502123053.604642-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502123053.604642-1-tgamblin@baylibre.com>
References: <20230502123053.604642-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 12:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180726

This upgrade depends on python3-calver and python3-trove-classifiers,
which have new recipes being submitted.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-hatchling_1.13.0.bb => python3-hatchling_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.13.0.bb => python3-hatchling_1.14.1.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.14.1.bb
index 17e7f86ba6..a3d2b741b1 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbe2fd33fc9297692812fc94b7d27fd9"
 
 inherit pypi python_hatchling
 
-DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native"
+DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "f8d275a2cc720735286b7c2e2bc35da05761e6d3695c2fa416550395f10c53c7"
+SRC_URI[sha256sum] = "55fbc88cbd0d96c09c3e9392b51db513fd4cb4caf47615d65f935a5ef1756133"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.40.0


