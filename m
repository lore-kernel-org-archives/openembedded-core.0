Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E187D5AE5A
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.64443.1730950696398223566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lXh3DEzc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-720c286bcd6so384457b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950696; x=1731555496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGi2yiHqa2k5+MSQhgKaSZtDmQuWfKsS64MxrMQMECU=;
        b=lXh3DEzcVkwphfvXeDjISJaiT8Ru+1WphfRme4Y4MJn976Qvwi/0lc7RtuZPSMDVgE
         NCYlcnMQSnwg56dT/avSwwEWTBtES2e5e+Y41JFPjkka0Hbwc4P4yRSQBE6RYiPUMRhS
         hsyjC6KW2unfmBSCYafxCp+GROr+d3G67ddkRT+1iZiZ8dbCAaEYnC5E3XiQqkKf1IYo
         WIr7eoGCzrGowlTz/Ne5vVnVCpfWnderKlih/bLArdR6FSnZN5tybYxxM8L9/7n6BqIR
         gCCaKIszObxP0H/48HalbGEl3H5yww9O2dj/eZx7gkj5FN6eC+XVngx8DOoA6RLv6E0r
         x7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950696; x=1731555496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGi2yiHqa2k5+MSQhgKaSZtDmQuWfKsS64MxrMQMECU=;
        b=sc3Av5WR9LJ8lqFsROg/RR6pR77Hmad9HuYjQMoX/6QBhLJtlEIDWbiCGcFXNKwLg5
         UEzD5TXsQvPYPri0OFDuim/Wco7VQQI7WYXQPz1LWO2PlMJO0IZRCnyU4qmtlgwFbUFH
         xPSjmjt4OQs90H6CK/waTDuO1RQ0AWgr2FHaozDzbjMPZx9U17pIbCPVBp6M20TAFjJF
         4yjL9jyup2WFnl73AWKa4ujWKluTWsqnu177/5nJW4FKtnfmKQx2FgnTurPKJrAR1gUS
         FvgSb0UaELECOt4RUHCTYOk+ExyO7jNQlPwIEUolj2M5SkaMKizEhgmnIalTVe3pvzpL
         o/NQ==
X-Gm-Message-State: AOJu0Yychtt0mTKewr0lke7apGgFvY62jo4XKlIYctmXr4h+FnhK1eoj
	sz9ja/hS7Wh1s3P7wOAJ2caQtwT+G1QBSQ+zLB8NsTjQJ5Ihj+f/DGx5FfQ2FpuWcK9hNltJrVR
	D
X-Google-Smtp-Source: AGHT+IEjm+/QiV+QgFuHPRWxUPGTyCB887cw2t/QirBNxBskEUXO2UOJTR0gGgfMukWBNrH8p4EVjw==
X-Received: by 2002:a05:6a00:1742:b0:71e:722b:ae1d with SMTP id d2e1a72fcca58-72063059df3mr52099998b3a.25.1730950695583;
        Wed, 06 Nov 2024 19:38:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] xserver-xorg: upgrade 21.1.13 -> 21.1.14
Date: Wed,  6 Nov 2024 19:37:48 -0800
Message-Id: <79fed0fa3e25e29ed15c2e80c736a44535556a67.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206826

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix CVE-2024-9632

Ref: https://lists.x.org/archives/xorg/2024-October/061765.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 957ba32bc6fdffd3a796a04ba222fae6cd673f7e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
index 1f18c22fa8..28c98eb527 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
+SRC_URI[sha256sum] = "8f2102cebdc4747d1656c1099ef610f5063c7422c24a177e300de569b354ee35"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


