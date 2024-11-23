Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07342E6919C
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:38:25 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.53813.1732390701008122990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCXHTN5A;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: hiagofranco@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-514ce0ab49dso941488e0c.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732390700; x=1732995500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfYRdQnybzYOZpkb/w2VvRILnd87BEc+GsQ8xuq1MzA=;
        b=HCXHTN5Ah463QlM/h0qx6WoxzbLZsDlsdHPalVpbdISz4X3d92M4aQfbc+MdaLQyG0
         AEOAZA7oh0X9g4CycyDOHgbXQ+of9b6mP5d2Mun4vI5BsknKNe/kphy/l68A/JqBahjM
         JFWQn3VN+o7xQqSw7aP2WdoBRTwI8RUhCKJ8/I+TiAEmxMc2HLnsLk9C35NNPSHoUlJy
         rcstDK+DnPPG+SoPYLPrMLVmF1bzWKmO++yhGtSdc7JMTlLi1jmGX1n4VUKPk2YJinTi
         LURThDd1gR4xAcvJlJlNQ9bJc7yT3xKa95D+rZKP6/2x7q1YmxJafoL3eqwKv5HznHRn
         qRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732390700; x=1732995500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfYRdQnybzYOZpkb/w2VvRILnd87BEc+GsQ8xuq1MzA=;
        b=Ty9n4Ach7qT+COJz4qmSvok/coKGBVpOZBUcVQuP6sUXQQPSZNkTq+ykTPuVffonKw
         h7cuPaXfRJ7FG4B3fGL5NzkaU83klYB73jO9IamwBdWyr8MQjQ1U7/ne6gJthL05IwTj
         txg4KB+KzOX+1srxI49tWezQESmB5vIxuRmyIvbu7xG70OIIYxHehaV4oGpASyzpVMS5
         TkHvDaRFrsh6FLeCM+Z5royyvtHR9FDGDxGZOiuKGoY59PqwNbTN80Djqt6qS67IZIlH
         wr8VNmlJgTIJ+N0dsMaaHD6V4DPqzgHuZ2X3D+pL+zGOroNqr3MoUL9ZHLAbf++l02IL
         i7bQ==
X-Gm-Message-State: AOJu0YxJwr1tMYFlIL2Fa1RRPHkWyN+e5HjYrp1ZhWQhjs89afGgs1X3
	Ty73EtBYCCWlHm0koXhYPuhekaThLZjqYBY6r5AnRCPrfmAiKwL4U/a+9w==
X-Gm-Gg: ASbGncvknbedO692aeadPD4xQaOwBBozH+OSoTw9Jv5y4xv+3wu6H5rVVZ/ECyj7MTe
	d05AzG50XTw2c4J7rgG0afr0wKWaD0KB+ZnSoyPevezpsW4nUBZTSflbquE1GaOlS6NzItmVZjK
	KCzDqQimVIy1kgvuC6cbv822PKnyldCqnJ24Pl+TO8VCkhzLM/pCN9Rwg4bmb9HONKrDYu6y57P
	hPo6ioqBTKfB6e/5QTHlQkfDA6EJX9e9mZnQwttYFQoGYz9PUw=
X-Google-Smtp-Source: AGHT+IHNzAwfGsIBY0u4nzr07RBQIyJ+G6mTgMMZ3zyDvfdpk0tZos60zFituAWZ5Ln1jmr/mxeggA==
X-Received: by 2002:a05:6122:4d0a:b0:50d:4b8d:673c with SMTP id 71dfb90a1353d-51500063519mr7799457e0c.0.1732390699667;
        Sat, 23 Nov 2024 11:38:19 -0800 (PST)
Received: from hiagof-nb.. ([146.70.98.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-514faf3a95fsm508162e0c.15.2024.11.23.11.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:38:18 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 0/3] weston: upgrade and add libdisplay-info recipe
Date: Sat, 23 Nov 2024 16:35:26 -0300
Message-Id: <20241123193527.1435268-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 19:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207690

From: Hiago De Franco <hiago.franco@toradex.com>

This series aims to upgrade weston from version 13.0.3 to 14.0.1.

Since commit a16598b038b2 ("backend-drm: make libdisplay-info
mandatory") from Weston, libdisplay-info is now a build dependency,
therefore I am also adding libdisplay-info recipe into this series.

In order to build libdisplay-info, hwdata-native is needed, which today
is at meta-openembedded layer. Therefore, add this recipe to oe-core
and we can later remove it from meta-oe.

v1:
  - https://lore.kernel.org/all/20241120203005.1802141-1-hiagofranco@gmail.com/

v2:
  - Added hwdata recipe, with DESCRIPTION variable.
  - DESCRIPTION added to libdisplay-info and SUMMARY fixed.

Hiago De Franco (3):
  hwdata: add recipe from meta-openembedded
  libdisplay-info: add recipe
  weston: upgrade 13.0.3 -> 14.0.1

 meta/conf/distro/include/maintainers.inc      |  2 +
 ...Include-libgen.h-for-basename-signat.patch | 45 -------------------
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 -----------
 .../{weston_13.0.3.bb => weston_14.0.1.bb}    |  8 +---
 meta/recipes-support/hwdata/hwdata_0.389.bb   | 30 +++++++++++++
 .../libdisplay-info/libdisplay-info_0.2.0.bb  | 16 +++++++
 6 files changed, 50 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.3.bb => weston_14.0.1.bb} (94%)
 create mode 100644 meta/recipes-support/hwdata/hwdata_0.389.bb
 create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb

-- 
2.39.5


