Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5EDC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 13:18:43 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.6385.1658841521008295513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FO+L2Eb/;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: drew.moseley@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id r21so10345595qtn.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5jvYmxGuH894cR1eOUiLmcdAEKEUUzg/Hb6/hnaKRwU=;
        b=FO+L2Eb/5hDh8ug0F0QeCNER4HOwt9JNUVsEeYUAJ2kTMQ20F6Z0JIZhT4vsK4fDYC
         LByBClthjTU5xjqiLX/A7fgFCRIwfVPEvhfYgP1SMuX9rm6z9Yss1sHboRP54zdC4WoL
         Fiwi0cP8PTH75qTgb9mA9VWx7PcohYwKbtBS9w5QTnKTz5naIBmB37zo9FvjHUzRUT2L
         xnE2VO/GpCR0PRrOv9g5pa/N+90RdgfpQqfqj1Gjq64DVMPGXR6F9OH1vKF0Q3EthlBG
         MLxf/9hJJAwHgk8jVVqEksLxyZ/1jwDQG+UUFoILW768s4OuBj4//7/q9gkyt5uWHRIh
         ggqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5jvYmxGuH894cR1eOUiLmcdAEKEUUzg/Hb6/hnaKRwU=;
        b=Tb3pyZymfvw8w8nxAWqoLWESw4iIsM5fPfGDLt/51bFlv5FBlTHTOWHlbLqrrmPoNk
         +txQlpo6Owc9fbB2p39DJPJPJPXpFN8TpUgobghsQP9IBaoiCSI6V7PNnVwee8UZfzLU
         UQ6hFUu5uX6Ji3UloKG4vAtviQyH1iUSIbC5LGpWJEROUK9iw5K2vQQGsKuciMSsotS3
         Air82IKSV07RV73Fpcl1fJzcF+OC4GaMNekHJCuh+YTK0EqI46waQOMrHxThzQsHOgvo
         fYHR2VZHbYKSW1W5IbBfqBQXKswOKcKJZr+MwxAZk32a+p/bVRJ7O0tZxfjGGzAzhR/m
         PCDA==
X-Gm-Message-State: AJIora9RTn0J4eO6WLkE2XHgAHEYpBygGRJUeChzMjbDcOIPBt3ZV21d
	G5lWmXCgCjRn9OML8fDSIsIOAZQ+l9E=
X-Google-Smtp-Source: 
 AGRyM1tSJZhJfBWepwmy6kIj4isO9OgKtYjA66z/Nh7T1KpDRjTYOZkINC7ovuHeVP+a3chuRDXjCg==
X-Received: by 2002:a05:622a:1213:b0:31e:e114:d75b with SMTP id
 y19-20020a05622a121300b0031ee114d75bmr14591312qtx.316.1658841519489;
        Tue, 26 Jul 2022 06:18:39 -0700 (PDT)
Received: from aruba.home.moseleynet.com ([24.96.56.90])
        by smtp.googlemail.com with ESMTPSA id
 m28-20020a05620a215c00b006b5c80e2b6asm10494926qkm.12.2022.07.26.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:18:39 -0700 (PDT)
From: drew.moseley@gmail.com
X-Google-Original-From: drew@moseleynet.net
To: openembedded-core@lists.openembedded.org
Cc: ch@denx.de,
	raj.khem@gmail.com
Subject: [OE-core][PATCH] rng-tools: Replace obsolete "wants
 systemd-udev-settle"
Date: Tue, 26 Jul 2022 09:17:58 -0400
Message-Id: <20220726131758.3371000-1-drew@moseleynet.net>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <e0dab0cb-4eb9-78df-6854-8fdf1ba5d059@denx.de>
References: <e0dab0cb-4eb9-78df-6854-8fdf1ba5d059@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 13:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168505

From: Drew Moseley <drew@moseleynet.net>

The systemd-udev-settle service is listed as obsolete and does in
some cases result in a significant boot time.  Replace that with
"after systemd-modules-load" to allow the random source hardware
to be loaded in the proper sequence.

Before this change:

   Startup finished in 4.025s (kernel) + 2min 13.236s (userspace) = 2min 17.262s
   multi-user.target reached after 2min 8.153s in userspace

After this change:

   Startup finished in 3.956s (kernel) + 13.294s (userspace) = 17.250s
   multi-user.target reached after 9.522s in userspace

Signed-off-by: Drew Moseley <drew@moseleynet.net>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index 568686e80e..e818cfcf78 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -3,7 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
 Before=sysinit.target shutdown.target
-Wants=systemd-udev-settle.service
+After=systemd-modules-load.service
 Conflicts=shutdown.target
 
 [Service]
-- 
2.37.1


