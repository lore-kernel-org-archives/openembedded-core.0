Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C80EC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:25:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4109.1670599536936463853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 07:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=4ttj9TRl;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.51, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f51.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so63849wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFO7PDuJeczRKRO/7G7qaczb4hv+SuUzdkei4aI805Y=;
        b=4ttj9TRl5Tpsmm7l9FkL2I1Kn4MICZLQxOLF+eJPoHGObi3P15FKKlntu5t0stQ7a+
         BUiz0sfeiSULAP+NGHzxrWCecfS8kS/SBbLN2sT86MXCYI/iVZmJOD8ckhX4bzhTN14I
         FFzwuA1DS6at7DinEJ/GGfhDkOX+sYaYexJNnhuFg+mAoTZI9PUGxUfx2VsIIbenDJMA
         JuICvEtqQe04hYKy8tGWGTe0bG3Iit4z2CszTrYNxoI8MvlwAPtCkqLo7wvt4GtOMnnT
         tZkblhoNnEizVmVbYxkHebd8ERC7gKYGLnc0q0WtMRCc96drQxZm+1IsSokgmTroHV5f
         eUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFO7PDuJeczRKRO/7G7qaczb4hv+SuUzdkei4aI805Y=;
        b=TCDf22oY65k59K+uj91mFl80VGX/h+HaB67jv9GjzK4lVcrFbAdYFdiwRFNNCB5L/r
         GMkQcXcNcZ4VArsXYQIuz23QgHtJndxZcNmJf0ViBRLyhYLDg1fP3L4GyIKXmwGxJK18
         sQxcvfVOyoc3KfL9H7vohNh+4spMO2xXwaFvrKF5EBREQafoIULajmBRhGaAdXT2P27y
         1ixd1yzc0sg17KjK0yozmCrLFYQPCHg1EG0i8OnNLyfpk2yUpSqN7aOoWzxq/3DGawpu
         SqBu7HglFNhoWErNb5k0+SLtMu9BOojy4Q2xSbASr6EGjZGcAvpuz6kKrflI2nh++5d2
         Enqw==
X-Gm-Message-State: ANoB5pngsS4CsuSRS2Rp5wwpvH9n8HP3dyhjio6rRKWeXDVJbU/U8UOu
	ZgnG/ErsfpJvLqxBRvNQ1yPqVytf/zLwAv+6LhY=
X-Google-Smtp-Source: AA0mqf4e5GROkAdlG3XZPdkK5rYM3XKTyGxEAhQG7gFB5Yz9MZxHMwBOlf3nLdXwFbMekVT92rpaSQ==
X-Received: by 2002:a05:600c:5570:b0:3d1:ee6c:f897 with SMTP id ja16-20020a05600c557000b003d1ee6cf897mr5333250wmb.3.1670599534787;
        Fri, 09 Dec 2022 07:25:34 -0800 (PST)
Received: from WIPC21110265.. (229.163.185.81.rev.sfr.net. [81.185.163.229])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003b47ff307e1sm46816wms.31.2022.12.09.07.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:25:34 -0800 (PST)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH 1/2] dbus: Add missing CVE product name
Date: Fri,  9 Dec 2022 16:25:03 +0100
Message-Id: <20221209152504.2513715-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 15:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174462

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 meta/recipes-core/dbus/dbus.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index dcbcc0a9d636..4eecc6921624 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -32,3 +32,5 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
 PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
+
+CVE_PRODUCT += "d-bus_project:d-bus"
-- 
2.34.1


