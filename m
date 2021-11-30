Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74015C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 03:27:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.71233.1638242829326272045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 19:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mPPRR4I3;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso15933672pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 19:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1zESSH/WI0JsYSa01drG/GxA2I7bUnyhC4ZJy7YpcU=;
        b=mPPRR4I3tagl8mF/0+nflJb/qLY6/u+HEZ9YQqkCwX026Qgtc49EDwiEVz4wVhrPnI
         kiNQffO/+zjkN4RMloW+AW2j9nrvtzqMhNgWQolnZzmvhjorgWkLANtMnHyhl/bHMu4K
         4l4chw2c8yInTnuhncFzOd+ZvPROnI+UNZpxAWazJREyfzPHw7coarJZKJXSfGBVNLAG
         Xg8RSyPf40IcULjffJ+WNsp7bLCVjD+YJVxzsEaS/nau7nDvcpfM+0leThFdPPC1z1BO
         GFO/BLawTHDkpdMQD4sFvdbPRx943rw7pCWpFc5Td5mT5rwjbP2xuwG4FMqpsxoXZ4RC
         yPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1zESSH/WI0JsYSa01drG/GxA2I7bUnyhC4ZJy7YpcU=;
        b=WauFMp6e89SowqO8ghLRq1flY7b7YyDBzdbVmbOYuMiG/Z+hnVOvXylXXmA2uukcaG
         P2yy72upv6Ak+oA2dNuk0tbWisbNykAu+IzXhBARMot7HYvFOPGD6+IdDvnehFd4Ks12
         aQgJZVZoDjHr0Ued1s2GR9sunFTwzN7aUWFAONk2z3xhhkiKgrQ9yGwBEgIVPrHPDcJd
         gMpXRV+ZaqPuWmNPhzLA+g1495w/22nUSphF5FW6VSimbWe3q2fjd3hiSdZJ3rIjFnFR
         Y+NXeltfpOhXfCkTnsHj5Mkcj5G26gG5lyiaCMSG7TaWrVtfwgwHg3Y+sA2Nh94EVnrS
         9IEw==
X-Gm-Message-State: AOAM531vZBQo5kYxehGgLxNAwVdYc3uyUVjUuWmhsds0h4YzID28/WU2
	1UpvXH90f0tGYjZ9gq4mil2EDu1ZIsNzsQ==
X-Google-Smtp-Source: 
 ABdhPJxUJhyIn51XpeC9WkKV1WDShY0eVTvdQJu71RLxaPBgNBfDpYulzdAx861GBiCvrUXfqqCdXg==
X-Received: by 2002:a17:90b:3a83:: with SMTP id
 om3mr2718039pjb.211.1638242828499;
        Mon, 29 Nov 2021 19:27:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 il13sm690955pjb.52.2021.11.29.19.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 19:27:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Revert "weston-init: Pass --continue-without-input when
 launching weston"
Date: Mon, 29 Nov 2021 19:27:05 -0800
Message-Id: <20211130032705.3313502-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 03:27:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158964

This reverts commit 762a20b493cc219a46d9ac188fe4895a111ee7b4.

This breaks machines using fbdev backend, since this option is drm
backend specific, we need to know the backend before using it, until we
have a smart way to detect that, this will not be a fool proof solution,
therefore revert it for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init/init           | 2 +-
 meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index f74ac8b1846..a849f29bcbd 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -32,7 +32,7 @@ case "$1" in
         . /etc/profile
 	export HOME=ROOTHOME
 
-        weston-start -- --continue-without-input $OPTARGS
+        weston-start -- $OPTARGS
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index c7583e92e6e..e09625b31c6 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -34,7 +34,7 @@ ConditionPathExists=/dev/tty0
 # Requires systemd-notify.so Weston plugin.
 Type=notify
 EnvironmentFile=/etc/default/weston
-ExecStart=/usr/bin/weston --continue-without-input --modules=systemd-notify.so
+ExecStart=/usr/bin/weston --modules=systemd-notify.so
 
 # Optional watchdog setup
 TimeoutStartSec=60
-- 
2.34.1


