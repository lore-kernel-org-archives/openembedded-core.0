Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E067CF2591
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 21:30:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.40837.1728855055994287570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 14:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S43s7iHw;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d58377339so2427859f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728855053; x=1729459853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUflbcqKvovPay8zDeHHxljFy8WaW6woQPOtUCaNCC4=;
        b=S43s7iHws/agygcvPJl3Nrilthyx4+SblMPL6BT/P5tkcbkSZmqIiVC8BbSvKdLF3D
         zt1kgJLKAGzMjj0+pwr+sCyX1i3qEDVNrNGih8RHFV53v5tPmhvWzgFQsPFgAlS2h8xF
         rJKcUg7I5oo4cikIqgsw4sv8JPWgAhLQB40OPaye8+WqbrTYtFac8DigbSpsbE8EK4ME
         LBMT297Q6UJQazYREidts+Uo3wyq4Rzt4LGJZ4XJSJb/FbA4vrgHr6VpNpIo4WOcmpYS
         Nr0Ptx0SdlcKjwP5WviRvkPoxpABFSDdwMUqqP7X8wC0pKr7WQF9NcSXbs30Rp8DYivB
         ctug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728855053; x=1729459853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUflbcqKvovPay8zDeHHxljFy8WaW6woQPOtUCaNCC4=;
        b=VndUxuUY78Ng4WjMFKj3bR/DakxxnqqQSsdOaHRKv8BGjURwV+pNm5Mr0In1zE8qiw
         EO1h3Q3miCehj0DPRn27uh81Lm5DyiQl74JBMD7QrEW+kPB7u0Xm52OcWj1QrhhyMVEU
         hYsqLHilUS2TkOmlZUvX26J4TBD09bgCQs7jMCBdMnchNd99rl10C5wIYzjKU4FUIQ7c
         UPA2LJ2gVx+CdU6U3LYsp5REq5QiX4ualmXlsu0RapwoBsHe6qFBGyVIsZnNtE746B/p
         0cLlm9+Rkfbm0LgYTvVRqoz4dPtKjrX8MrNtgU5erNElPDPIcW3hQOkcm4J2pjM9TXUQ
         RNQA==
X-Gm-Message-State: AOJu0Yxn9cWXtvCe/Ki4epupDITMDfx7zoyB7O/pEhp6WhIBvNlW/v1F
	HuhWUN9JLJ97aV606WdTJUHq4LBdwQwMkX8r/HdiU0ybco6wFjsU+anR7g==
X-Google-Smtp-Source: AGHT+IFbFQjdvy6CdD34mSvdcBvn/5fYIhcasarPQ0bGHeP+0bbSAx/YDhpiM4LQ+oVg6x+qOH52Ig==
X-Received: by 2002:adf:f350:0:b0:37d:389e:b3fa with SMTP id ffacd0b85a97d-37d5ff2614emr5912175f8f.12.1728855052922;
        Sun, 13 Oct 2024 14:30:52 -0700 (PDT)
Received: from localhost.localdomain ([95.90.247.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835c3acsm102747075e9.41.2024.10.13.14.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 14:30:52 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH 1/2] ethtool: upgrade 6.10 -> 6.11
Date: Sun, 13 Oct 2024 21:29:54 +0000
Message-Id: <20241013212955.91367-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 21:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205727

Release notes:
* Feature: cmis: print active and inactive firmware versions
* Feature: flash transceiver module firmware (--flash-module-firmware)
* Feature: add T1BRR 10Mb/s mode to link mode tables
* Feature: support for disabling netlink from command line
* Fix: fix lanes parameter format specifier
* Fix: add missing clause 33 PSE manual description
* Fix: qsf: Better handling of Page A2h netlink read failure
* Fix: rss: retrieve ring count using ETHTOOL_GRXRINGS ioctl (-x)
* Misc: man page formatting fix

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../recipes-extended/ethtool/{ethtool_6.10.bb => ethtool_6.11.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.10.bb => ethtool_6.11.bb} (100%)

diff --git a/meta/recipes-extended/ethtool/ethtool_6.10.bb b/meta/recipes-extended/ethtool/ethtool_6.11.bb
similarity index 100%
rename from meta/recipes-extended/ethtool/ethtool_6.10.bb
rename to meta/recipes-extended/ethtool/ethtool_6.11.bb
-- 
2.34.1


