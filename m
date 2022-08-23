Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76725C28D13
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 01:47:18 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.26797.1661219229553370377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 18:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZciSXLh6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso13154471pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 18:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tCQru7JG3MvSNf7mOXrgcP5ZVz88lwvZf6ytk1RSIAE=;
        b=ZciSXLh67I9H+dTrCGivjNsbcFeIgmST5EJNgzqjBdpwHWhHMISnzM02kg6Q1IvpmT
         Ki83Ay+godyKJZnL150lIxa3TGn2bVimgOIHJEswb/UIqYcMYVShDft1phASOjbkim24
         6/cwK/ezu4kkDlTE6Jc9Fi1Uzh+w6K6KK0uIFoQb1kEqrdxOLyEvfocn2zdCOmqnjJ51
         K1RYNUv6SDQSlSW4N9JhL1TVvl4cf/2wDOHjCmYX0p675cJo22kBzJzNgWZTnxo3rO+/
         Lj0TTd7gOM/m1iDrvyxhH3U3KmfNg644Xg0XGJWekTDW4TbJAzpft8wunqz2Pe0XeU0M
         OrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tCQru7JG3MvSNf7mOXrgcP5ZVz88lwvZf6ytk1RSIAE=;
        b=r7NjVe8ALCmiXRFh+1RvyTSN7JFRpE5ZnGzos4yFqCPbyEVO5CNlns3AkX2wcr06sF
         0Kz3xW3WRMCcznAHDWfSWqmCYyPSA08JhBVZRWRDbRZL6nwb7Az7ohzTcGUouqN86B8g
         LANrT/busmFaNDQzItDwRx766uqJfpl0oLdK94mV042ZYQsJ5YHJjK/YutPcgDIltdS/
         LU2XwXrNe3eaqWVyPJ3k+jpd0nN58kyCNYsVTIu/94HAnyUt0l48lPW8YbHOZnOrzyc9
         HzrSOH3+IhGNPf+th3ayzt9nx7JKPlYtAYnm/aFqKQvoXfHoMfeu7PisbYsEsib0uNej
         MJcw==
X-Gm-Message-State: ACgBeo3intBI1HdVD5mrjz5LJ5WM/bskyH5mhh/QiFpASfEQGB44ZhiK
	6Na2o5IoQdSazfTMVa9cdKjlosMy0jnNxg==
X-Google-Smtp-Source: 
 AA6agR5+y2UXfwNC7aGRa+6NnuB5l0DjbqjrK3Tq8GyxdyBcz4OhTAGU9oTnnarItqGMHFdCy2R5+A==
X-Received: by 2002:a17:903:11d2:b0:172:6ea1:b6e6 with SMTP id
 q18-20020a17090311d200b001726ea1b6e6mr22460393plh.72.1661219228706;
        Mon, 22 Aug 2022 18:47:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 t189-20020a625fc6000000b005364e72981fsm5525744pfb.145.2022.08.22.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 18:47:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rng-tools: Remove depndencies on hwrng
Date: Mon, 22 Aug 2022 18:47:05 -0700
Message-Id: <20220823014705.1368891-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 01:47:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169691

Delete dependency on dev-hwrng.device and systemd-udev-settle services
as they can be troublesome because difference devices may have different
devices to detect resulting in delayed boot.

do not run if included in a container image

Add EXTRA_ARGS via /etc/default/rng-tools e.g. if your device has
hw RNG then something like this

EXTRA_ARGS="-r /dev/hwrng"

You can also use drop-ins for enhacing systemd unit file from machine
layer via a bbappend and adding a fragment to systemd

/etc/systemd/system/rng-tools.service.d/10-hwrng.conf

where you can add

[Unit]
Requires=dev-hwrng.device
After=dev-hwrng.device

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Break the sysinit.target dep cycle

 meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
index 0f50890dcb..5ae2fba215 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
@@ -1,11 +1,9 @@
 [Unit]
 Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
-After=systemd-udev-settle.service
-Before=sysinit.target shutdown.target
-Requires=dev-hwrng.device
-After=dev-hwrng.device
 Conflicts=shutdown.target
+Before=sysinit.target shutdown.target
+ConditionVirtualization=!container
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
-- 
2.37.2


