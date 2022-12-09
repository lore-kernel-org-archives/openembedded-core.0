Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E30C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:25:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4109.1670599536936463853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 07:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=5yQMiwVi;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.51, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f51.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so64231wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JbRjWM/m1D0/YYfxD4hNYNtU77dUuOAjORYDjsk2dM=;
        b=5yQMiwViB4dsP60f0PTBMcCBluEzrLmk6xrrJv9lxJkCZXKCrsOaqaY0P34mkFHqcI
         +VrQqGI+okuiWQh3y1rcjKzlsVZMMjy2ytvZ9a4FffD45Hi47q64qBDFudtk4+DIlh1S
         H1x0oKwg7wnbgcKHzyEDp2/7gza31Icb4R4sjsRbW8xHsM1a9i7BZWqioPP1JIIL497c
         J1Lt9u0GhH5G/4Vtx1699tLty/uO169OW2iZGYIV0u+0QfXfPyxXwhTWfy9shrOWAw2z
         5D6LoGB8S7oH75ecNVwAcz/iSs5ENnmOBAAj9RHR4uu3jbrU2FrRyAKiNz5kzU+sHhsh
         QZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JbRjWM/m1D0/YYfxD4hNYNtU77dUuOAjORYDjsk2dM=;
        b=V1JLZpHD+24pcoDCWMK1rogmClI+Y5WLVsgeqOKUQxCnTl6W1tPys5ON3pJuRx23Cc
         iMPCklsiPbLKyCqA3e5BE8ZTvOVztxbFhN3F6uOPSKoWZUJZMunGtgroMJ1sm++CNr/P
         IdG6T6xR7YagSQBLg5zqj2U/O1x3oqpNiyP7ULBhe+4YgQ5Vzw2PuvKhvGPw5nOFv0rd
         I9PAfK0tmv4TteRaIUlGb3wWNWkoOiYiRMWB7cdUvaboSTJZkSYPJCu1s628+p1mWw7S
         QCL6fY1ByPMVmgaXrZKpOYG5O/pCPcz/sh+8JDYUolyHPEP9+iP55s9U2cr7o44hfrxb
         7rEQ==
X-Gm-Message-State: ANoB5pknlPlHsBfp3I2s7q4OV8dxYWpCCPDshZq9EeCuHW+/mtU0GdMt
	E4EhB54pVgsCH0wvvd1WTAbrmEpSiywd9fV+1Ps=
X-Google-Smtp-Source: AA0mqf41kdwaqPjCpocJ8lDuxiW8/cY39TTsxQEiGWOnzqcdROvW3J7HrNp8MeeIe77PJH8zpJ8OWQ==
X-Received: by 2002:a7b:c445:0:b0:3c6:e63e:234 with SMTP id l5-20020a7bc445000000b003c6e63e0234mr5185967wmi.11.1670599544967;
        Fri, 09 Dec 2022 07:25:44 -0800 (PST)
Received: from WIPC21110265.. (229.163.185.81.rev.sfr.net. [81.185.163.229])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003b47ff307e1sm46816wms.31.2022.12.09.07.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:25:44 -0800 (PST)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH 2/2] dbus: Update to 1.12.24
Date: Fri,  9 Dec 2022 16:25:04 +0100
Message-Id: <20221209152504.2513715-2-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209152504.2513715-1-mbriand@witekio.com>
References: <20221209152504.2513715-1-mbriand@witekio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 15:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174463

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.24.bb}       | 0
 meta/recipes-core/dbus/dbus.inc                               | 4 ++--
 meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.24.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.24.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.24.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 4eecc6921624..7e2325a0e102 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
-SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
+SRC_URI[md5sum] = "2d118d2d29e895eb3b47ccd68670403e"
+SRC_URI[sha256sum] = "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.24.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.20.bb
rename to meta/recipes-core/dbus/dbus_1.12.24.bb
-- 
2.34.1


