Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E34C43219
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.2808.1668348793237890809
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=76C+0Xv5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b11so8246547pjp.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ayAqys1jT5OjUCAaSvNVAmM61IFwwIAZa/nuPFXyg8=;
        b=76C+0Xv5R1R+pIPgvaFqnreHP7kDxOLGO7yNIY3+s0cbCq9aWGvNT7dwzbtweEFbLI
         msvG/283VPbq8/5iltF3eCJfIWXjZZjjmVPHl3HX5Kb2efNaB3hD+UMbv1fqQGpQo4mx
         wVC9XG3d3CBLu4VNhLqdrcf9+sTUVNcJW4u/ZLIKIakuuDxuvUkLzfsVND94upX6ZMDM
         aCrj6VXuYt8MGIEIu5VAfdv4sgeWWDTSpyTNAfAdALHQQsBMop9EXapMVa7fx2dT1VTN
         DDjU4LyGPFHmef7FssJvla0p3Yraa6Bl3Lv0efnc5/pQ4VTAE2XOR3D5wLDAJGrcjEnc
         vIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ayAqys1jT5OjUCAaSvNVAmM61IFwwIAZa/nuPFXyg8=;
        b=L8Ots0LOOn4p3wIZuBV4/cR0czl55tNylgBngdqX5lQWMCiNiNiTGs78fVXFJGk2FR
         es8vODMOaUp6o+UZxdS9+TV/KvCPAtlXa4w59j2O7PVAN7LPnfcxx6e/Z20j4meDgXKS
         cnK2qT/aNu7RYtXzZOs3kqZgUv9DR6Fw/XCYsrlx1JYCv+yJRiLfrAGNVjLJRoCxPV9x
         rDLkaWTGcTWDVyT6Wh/eHV/fMFXheSKvgN+ZhFUIqYIlRv3xKSQxx/rly50WDIrXOpO7
         vRF8eB4XQ/lXiwlPzYdIcvPhAuxMxbzduOy+hoMpHuIXGzXXfY2VL0icN7iiIet0Ag3S
         Op8g==
X-Gm-Message-State: ANoB5plZxiWp8ITW+jgLfZQhx1O6nFPD2hqkw9cc7XMzLailxr07Hi/R
	TJvmjC+OU/suKE80mGoH55hqBwxhR/dPvr1p
X-Google-Smtp-Source: AA0mqf6oOYiP0oEBnkP4uEhWGVl0vo8P7EPAZcWSUCSiR0qYfCEAt8ieAuyOyP1RnGO5/AcwzOZtjw==
X-Received: by 2002:a17:90a:5aa3:b0:20a:dba9:ebe2 with SMTP id n32-20020a17090a5aa300b0020adba9ebe2mr10336659pji.136.1668348792250;
        Sun, 13 Nov 2022 06:13:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.13.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:13:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] wic: swap partitions are not added to fstab
Date: Sun, 13 Nov 2022 04:12:45 -1000
Message-Id: <397676b3ad152b209916b152f1b77e772a2af14b.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173201

From: ciarancourtney <ciaran.courtney@activeenergy.ie>

- Regression in 7aa678ce804c21dc1dc51b9be442671bc33c4041

Signed-off-by: Ciaran Courtney <ciaran.courtney@activeenergy.ie>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f1243572ad6b6303fe562e4eb7a9826fd51ea3c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 685d19b30f..165fc2979f 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
+               or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
                 continue
 
             if part.use_uuid:
-- 
2.25.1


