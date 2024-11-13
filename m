Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064F7D637BC
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.21874.1731530556927336993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PTWlqbK0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cdb889222so73934285ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530556; x=1732135356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nEP9+hfpnCbebrAr6/MTg2Rpo9OdTUnsPUvr6IlU00=;
        b=PTWlqbK0+XotUFsWfyGH+ES+5iPW9MoO2fIadUPp9iymsxvoxoR+5iu6TS60UwkS6o
         dkvOX+i759OyDMgY8GvDXRZ1Bm6U9+neTKp4JVGQN82tW4qqBjgeY9yNo/FTQn80FCZH
         724HL8IBP1Z8WdVXWMgVxm4U8EZF8EcbUGeQkTLTWNZP8HhfrG8Uvf3ZPmnpaN1k7/A3
         RG4lGjwJZXQLEGn4wRitfr4aLFXrBf277PMDdI4C/A1GxDYn4ql51Mn70pp4T7GHeD2r
         IMAX0PE/oFO9/sgzyrNf4KXSf1hH+956RqyP4FcffLjmfgycKctWnpSgrw3oa+S1PqRZ
         Psxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530556; x=1732135356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nEP9+hfpnCbebrAr6/MTg2Rpo9OdTUnsPUvr6IlU00=;
        b=GlpIOdshsPJZSaDxcnNzJYyXCmW4WVgH6T0WUGAGHAwVnzZL6yYpC01oRGpMVZg+jY
         tXaDgaI1Bwv7hqrLSFZ+Hlq3dYIRxUl2RzeQCY2IjYwqwEDnDWwc+a2yIjSwlCjkve1G
         vRvmcSgZdEMxDmrZUNPtCxiw4AQSV/a2z9srDZ8tPzXzw9Ww+umLg9ywuIx0MSm74BBO
         iD81sPdG6adSCl6gK+mMBUcyQU67Zhn+lDsNIY69ZY3EH5OWNnkHFFE4zrZRCesHIB9n
         A/0ynewxjxPeNUR3x26Qb6RHOB7pdC5Wox4EtX36zmrJvw2kPLqFKm/SvRA6GYwnoaQk
         5PSw==
X-Gm-Message-State: AOJu0YwJMFL010YbDy+0Ft6ICZ3fuibCeQWeQEfPvTuc8A2eGUKX7ayC
	pcOz0/zUn59jBR0sgU8NyQ1kq+m9mQo0BY3OsgVg32spYBzxTrZQbbdbu5VMFzlZnpPVp24Fqzm
	S
X-Google-Smtp-Source: AGHT+IFVn3cKehA9F5jXXQrb1A8EH242wk/8+Vh/rcnah1e7s7ElOYlhytanXKpiB+zC/mSJBhOBOQ==
X-Received: by 2002:a17:903:22c6:b0:20c:bda8:3a10 with SMTP id d9443c01a7336-211b5d29e3cmr50679645ad.37.1731530556156;
        Wed, 13 Nov 2024 12:42:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/9] expat: upgrade 2.6.3 -> 2.6.4
Date: Wed, 13 Nov 2024 12:42:19 -0800
Message-Id: <e53da1a3bfd62b6b1771f9026fed8fd04e97f7b4.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207128

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2024-50602

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.3.bb b/meta/recipes-core/expat/expat_2.6.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.3.bb
rename to meta/recipes-core/expat/expat_2.6.4.bb
index 5ae694a004..f383792793 100644
--- a/meta/recipes-core/expat/expat_2.6.3.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "b8baef92f328eebcf731f4d18103951c61fa8c8ec21d5ff4202fb6f2198aeb2d"
+SRC_URI[sha256sum] = "8dc480b796163d4436e6f1352e71800a774f73dbae213f1860b60607d2a83ada"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.34.1


