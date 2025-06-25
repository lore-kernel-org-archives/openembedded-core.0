Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FA7C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 22:29:24 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.28926.1750890561905373838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 15:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8CdblCE;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso3012755ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750890560; x=1751495360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7A71g5QP76e4r+Vcslr8SXe2FBBnXf9bz5G/0FzuyE=;
        b=L8CdblCEZV4inJX1owdZWONVWNDGHcYkQmbwbKKcVi+CnzmD9TdcVVy6NuL6wYeQzs
         YeBHG9AVA1RUOBxQQhOdIsVj2zMW/NXNzwwhwk/oiXaPrAMV+/n3siiI9z1nV5Ihrs8b
         My+aT6rf5e+o9QJsDnSlkRflRgP+2f/qFOVnwE0XKxtV3YDd/h2ZlCPbW5MpsF94sj7e
         tk8WmJapEAawjJmB0/YsiaGN4ggAJlYaaGaYiH8m5Gk3GiqyuNKOMUI4JSYywpc3gl9i
         +cwHkTb0HhMYPCsi5VFZdDsA+rzAqiiJHOvXPOjs/qkvgVO4lw+DHaNVwWD+tXmAJyA/
         4VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890560; x=1751495360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7A71g5QP76e4r+Vcslr8SXe2FBBnXf9bz5G/0FzuyE=;
        b=bwx/Ttmd39O1bLL3+mLXUvYgfRbbQGjI182fNySVmXxt8E7PFJed3wmTEw1MiP1IHw
         tttdPrHuQMH/dseExnyVOkW5czRELA5fty+qrykQRxV2zuFfw/CjFt2TBI7/sgLlMUtf
         P1M4I93SR/yPBPH0msXzQt0NKMhd6SkeGfGGs4EVdL0AlA864xiwC2J7CF+YSBBQyrGy
         2X5g+oHHBMHLvBHf3S/g1QUGoz3p2uEQEaQ8KURJwG5qCe6yvN38nRo2Yu1emPOgej0B
         egTVxgWSEG1Xw8pzyvXjgwPLbIbEUFozCHHef9J5EjGkpmip/e5Nhp8p9ws/GgPqwBTU
         EVSA==
X-Gm-Message-State: AOJu0Yz1XH8XqV2et2C2kgSlReptYNLW5uyItMhoCharXSEZg2tWXh1I
	WIlWXq6kBEUKaSsusS37z9YOxoYIZ2oz8QpNZo+dQgoNNBGX1j038WVGJMGLjA==
X-Gm-Gg: ASbGncue6Za056jCnsU452IsQIVuszEAOyV6nySSHzK/zbigCEQ8pO1FSBQPnmJrnO7
	XV6OFc5urDMsIlY0hN8YeiDTy3yLHD4kBvFo/wP+i1iMbK/YbPuBNSvwBCi/LYCig7M8Sdkcw7r
	LKIV+HJBAZDFUhfFJ99ktZqJMQZcWWA4EBSJpnt20KOYGm7kyXqm2/RAELJZeB8EUXjJQUmCSwu
	Gi9Siog4MSd8irbWNeQtmKrGPkobtF5iZuItJaT+tk6GpSPdpuMjbFPGJF/cEpWj+MH9ncE9YlX
	pSsZNpiX8T2OVannz9cXVlgQsCY94bjsCs4H9GCw0dnp9Cmj+feBuq/uKw==
X-Google-Smtp-Source: AGHT+IHEy/wcuvmPfhHgxrRQJ7k3UcyLf+iqbUjw8O3yz/5bvDUVmq3ycFw8ATASnTj+CYNYVDTpAA==
X-Received: by 2002:a05:6e02:b49:b0:3dd:f813:64c5 with SMTP id e9e14a558f8ab-3df3e1135c2mr24106505ab.22.1750890560496;
        Wed, 25 Jun 2025 15:29:20 -0700 (PDT)
Received: from talyn.. ([208.115.91.139])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0cbab7sm2920816173.137.2025.06.25.15.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 15:29:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx30_tasks: Change recipe license to declared
Date: Wed, 25 Jun 2025 16:29:16 -0600
Message-ID: <20250625222916.11663-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 22:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219333

Per discussion with the SPDX licensing group, recipe LICENSE statements
classify as a declared license, not a concluded license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index beeafc2bb7c..5d9f3168d97 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -552,7 +552,7 @@ def create_spdx(d):
     )
     build_objset.new_relationship(
         source_files,
-        oe.spdx30.RelationshipType.hasConcludedLicense,
+        oe.spdx30.RelationshipType.hasDeclaredLicense,
         [oe.sbom30.get_element_link_id(recipe_spdx_license)],
     )
 
-- 
2.49.0


