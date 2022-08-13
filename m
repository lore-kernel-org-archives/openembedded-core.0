Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51870C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 17:02:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.6814.1660410121173302992
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 10:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MlpqNnhY;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id jm11so960800plb.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=9PAu2HMRG/dSX66f/T+OEEm2b8qt65eXfy92stzmVg8=;
        b=MlpqNnhYX+6nv7zo+fJVRvnyrei+8kS4dSAaTSIyFVDT2whDRaDujnQGvEuUkTJXXL
         oNoGO+zngLgSjkGSYgJEVM+VFlxUBR4D1pTNX3cge+ygerCkRhDviwbuwH5w4wddAuAX
         cUhWcT2EsDKSRkxbiW4se6wKYHFC+rr2mKxK+SHqSvmiYUGn6+2Cuxib/UF9TqORXD6h
         gGiOsOErONQ0jVTcd0c+Lk2APKNFLzGvEHvcI2CG0Q2xHjzOOZHjJabe72B1xhm0E1jV
         6ENVJQt7373OYM6Tk+rw52zPDFnCGTa2N2qlu27G22YxhvzzeQ/Si1vXW075Kw9rUvnb
         paiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=9PAu2HMRG/dSX66f/T+OEEm2b8qt65eXfy92stzmVg8=;
        b=OHYNwJEVIzKcoQ1VZ0m4TS/rcf7q+3fHE+waQqIjZaRjVFG4lFL2ASgpUYP2kF+Ati
         72yfdnUE1GS+kuGO76XgjVrHpLxy/YDPzTHEMRUw3mS7oyRrTnw2+s2f8ZkFx3uijSJu
         IH8DIOPO+bWaeo5XCYYThtgZi9ZhspEYCEb0G1PwbKxiEIGVr2/0NQGAf3bsVwTuLq0t
         VGOnizSEk6H2nDpxV5rqjIIhcdkplBMUKlL5rtcZ1WWM1/FqNP1lr2JEBptWP/KAo6/e
         GrCoT3CPvnZxffSTDc5x7v7YDV98/nPR4442ec0yjY9C6KlOHfx5G6GaUPG/ie/ZEuLu
         9KDQ==
X-Gm-Message-State: ACgBeo1yIadIXhwpylwjJl+iB4kcUpYz5UIf1ezAC3HW9Y/jvo5V3ywp
	sbQ0lzzOUh0AHEYLy9+nB8oYKg5rKljuZQ==
X-Google-Smtp-Source: 
 AA6agR4xsS8GBL94ZjFksmQjBu5c2/xdVEc1HU+ESO90y54aZohw/mDHMQYF1bcR27tyWnXr+FVgDg==
X-Received: by 2002:a17:90b:1d44:b0:1f7:6f05:639e with SMTP id
 ok4-20020a17090b1d4400b001f76f05639emr19473009pjb.99.1660410119541;
        Sat, 13 Aug 2022 10:01:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a170902e54700b0016c78aaae7fsm3975713plf.23.2022.08.13.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 10:01:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] rng-tools: Remove disabling DefaultDependencies
Date: Sat, 13 Aug 2022 10:01:54 -0700
Message-Id: <20220813170156.4040589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 17:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169310

Delete dependency on dev-hwrng.device and systemd-udev-settle services
as they can be troublesome because difference devices may have different
devices to detect resulting in delayed boot. default dependencies would
add some delay that the race condition for creating the device by kernel
module and daemon using it is not seen often.

do not run if included in a container image

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
index 0f50890dcb1..c8b46aebab0 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
@@ -1,10 +1,7 @@
 [Unit]
 Description=Hardware RNG Entropy Gatherer Daemon
-DefaultDependencies=no
-After=systemd-udev-settle.service
+ConditionVirtualization=!container
 Before=sysinit.target shutdown.target
-Requires=dev-hwrng.device
-After=dev-hwrng.device
 Conflicts=shutdown.target
 
 [Service]
-- 
2.37.2


