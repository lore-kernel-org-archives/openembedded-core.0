Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.1793.1645114190999637290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NAiLidZm;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id m3so4549160eda.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qdl8PuYTCsvDzJofwplen+2H88Nwi2nqRcVYmT2DF2M=;
        b=NAiLidZmqy2nReuiUJfKc9wdB5F+dVQ++gRhxzLN8h1IRm5+ljlhVgEOfzVlZFaO2s
         mbTyT76ZJjIIP/pc/KI2KqxE4CBuRMkRoTjNIaVzmN8ZSP52mpPQLyd+g4WVMXjlt9VZ
         +TY07TVO9Ov3DHBUGbVhWZETaskNe0KjuEA/0jYojQHv/bHJhMeXPDZ4Wpoav57Nj2/+
         tlX9o1rcLqCrFTw3Xf/u7DQixvhAW9nemmLebzrPdX4GRlpTPgxUfMd7KHYJwUEdLGbX
         9TCG3hDZf5J5CYSXZgR5UPU5AsEvwnbVjPDODqfwSKRccgZhFIKpzrXsVCy+mwqyaHdi
         UXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qdl8PuYTCsvDzJofwplen+2H88Nwi2nqRcVYmT2DF2M=;
        b=Y/lvQzYzJq6i/29fzFxbpatPdpcwIiOmmslC3cVjv96dRcBsEHWYyPSjg9YWhq7aM4
         8WRJCqKPlS9wDjpocq3ZTY2/gsnR/cGhIXkP0DFk5tQUC8WPfoNHUp/B4EAIlHYYe4+J
         zCjjl1FRg2bWHc9R3MyEMjfZreDaNvYbUeU7tJJigIK2QEQZdZg/eX4FQ4peV325+gn+
         4gC5oKp319JlRi6vF81XzmZW+0mmlG5lxJfVJwluRxhIXgok3KWwsCw8aLo+RpIzj3HE
         OcXJ+bTgPzUi7cCLanm3AoJGyS7uOiLs7F5S2V/RX5wlVVUqoWsTlYNSM7Y6GWvPkJ0b
         aGQw==
X-Gm-Message-State: AOAM530iA3bd6/igB9ugUklheiRKI/EGYZB3tzhSaNXyZ+wGay1B/13c
	teF9CBeZ7t9qyZqI+X3+Uiu+LinmqtY=
X-Google-Smtp-Source: 
 ABdhPJwEEGZqpiB1boa3veoER4dk9OG+iINHKtQ82P4dfEpgk4DjAZ9e93ES1RlWUXCHUD1HhVwW9A==
X-Received: by 2002:a50:e0ca:0:b0:410:8306:3be7 with SMTP id
 j10-20020a50e0ca000000b0041083063be7mr3384610edl.172.1645114189488;
        Thu, 17 Feb 2022 08:09:49 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/28] weston-init: disable systemd watchdog option
Date: Thu, 17 Feb 2022 17:09:14 +0100
Message-Id: <20220217160939.1424397-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161820

There is no other unit in oe-core where watchdog is enabled, and
this feature starts to behave weirdly when test_date is adjusting the clock,
which means weston is restarted without need, so disable for weston
test stability.

The issue won't show up on kvm qemu (x86/x86_64) because it runs
too quickly, but non-kvm qemu (ppc/mips/arm) all fail in the same
way due to slower timings.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/weston-init/weston.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index e09625b31c..80745998ed 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -37,8 +37,8 @@ EnvironmentFile=/etc/default/weston
 ExecStart=/usr/bin/weston --modules=systemd-notify.so
 
 # Optional watchdog setup
-TimeoutStartSec=60
-WatchdogSec=20
+#TimeoutStartSec=60
+#WatchdogSec=20
 
 # The user to run Weston as.
 User=weston
-- 
2.20.1


