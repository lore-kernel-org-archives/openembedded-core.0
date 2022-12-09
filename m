Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43774C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:26:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.4127.1670599562687727543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 07:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=SLhJimOp;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.42, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f42.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso87781wmo.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXa/lFknkGXll8G7g+nOW8WI+nQSfc+N7PX9MIPD9AM=;
        b=SLhJimOpkdLMfZawforRffXwk13VTWxDS1Eydq1fSU9vchWGMGQrcQIkEkRDrPOOpp
         ENqVqckQp0ZV+wjhTlkCvqKLUvhb6VYYOCUmWibwfZMDvpm46+pDUjJvi+nP5uHBSWEs
         crH5RMDy7vBiOGLOI4jHooJDcpTa5cHY6M1zNL4G/7MhJAQUaWiQWFX/fY5iFRTdx1Et
         7XYFJGQu2jNLd9ARHKHFk68xcGXTLhHXcq+J50QxbxMNnPS7fsBjpqQRcYtQ7sVDU6Xg
         +3JVEqTEzynRBn2Iiu74vFBwxd0oGPMnhLyUon/0H0QjyKT7l+i/tD17kNa/vYkeShu4
         wmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXa/lFknkGXll8G7g+nOW8WI+nQSfc+N7PX9MIPD9AM=;
        b=fSGHczdlqzjKDC+co3ica8eobC732OEGozpcBTKgBgAjhBbqW8se7j5UZIuEufwWSh
         gp+pdxB8ybh1ntNx7fZ3lb74wOEMpaYwcUmEqBwZ1cLfW+i7YyYP3l5a8Msd4aKvCLtH
         raZHOYg3PAN0cargNi+FaK04WDQClJ+2udYUlS0x282SZfeQhf0yG80e18bCAOO+kIC/
         Z6TxyFuzIIdFRUi9pVa0ZM+Y2jn7ayRD69Bb0IyFIYHEw8nhUnMbU0vkZEgYcIlvtdye
         ZpN/mqY4LWrcgBotZm0mrB6o/GmCObuzAFiim4B0W+VPTMUN/EUtUlt39dGHontKkedB
         wppA==
X-Gm-Message-State: ANoB5pkBReHHmzpnac2jT5Em1bW2Uvu/RbTSmCjNfH1HHa57yxKt+xBY
	bjNKD1PNL1WLx1dZC4w2mzYgVssIDQ0XYtTUsHU=
X-Google-Smtp-Source: AA0mqf6l6/nh788HaXmo4ZaKVFkxvamZSbd67ZhiEY1OA1V+8IkJtGACDG9EUj5J72TXYbXbCtuBjg==
X-Received: by 2002:a7b:cd18:0:b0:3cf:9ad3:a1db with SMTP id f24-20020a7bcd18000000b003cf9ad3a1dbmr5374030wmj.7.1670599560544;
        Fri, 09 Dec 2022 07:26:00 -0800 (PST)
Received: from WIPC21110265.. (229.163.185.81.rev.sfr.net. [81.185.163.229])
        by smtp.gmail.com with ESMTPSA id f18-20020a1cc912000000b003cf75213bb9sm83710wmb.8.2022.12.09.07.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:26:00 -0800 (PST)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [PATCH] dbus: Add missing CVE product name
Date: Fri,  9 Dec 2022 16:25:47 +0100
Message-Id: <20221209152547.2513813-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 15:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174464

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 meta/recipes-core/dbus/dbus_1.14.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.14.4.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
index cf7f830f1606..5f91ec2dc1e2 100644
--- a/meta/recipes-core/dbus/dbus_1.14.4.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -183,3 +183,5 @@ do_install:class-nativesdk() {
 	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT += "d-bus_project:d-bus"
-- 
2.34.1


