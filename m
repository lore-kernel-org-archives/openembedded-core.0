Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18A5C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 09:40:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.14126.1677231628898285254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 01:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i9GFVCrO;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id k37so8000745wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677231627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndECZgoibbY0wgoZlNdpv/2POT5UXyfNS9h/JP+DstM=;
        b=i9GFVCrO++w2HyrtdgYI/ZPQZML251aoMULMIGgTVzvgBWCXX0VHrI/FaHMgYriUaz
         6LJj3WicwS6npSDxTUvABlfAyXA1exMLiZQNzJXoSwynCA0oNAVU0y/1x28S02AcIff/
         pfUGHyD3ip94G05LMdDIhedFGC8bTpGr8/FY6syxxtxXZT1P3vWybUOccrxqSFzj9Qvn
         e+k0vPAcatFB89ujTcS5JfXc0CieG5AfbWIQnlZIcfUTFHsjA6SBa1sWKgFdy+iAD2yW
         uDxSeGWvGOzddixY5u93wlT2/EcELgGE6LzaSUXbmHI/RF9dFpGGRmVrRmrMlqwkFUfr
         d18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677231627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndECZgoibbY0wgoZlNdpv/2POT5UXyfNS9h/JP+DstM=;
        b=0PXB7EqaqQwSDjEu0Sh8sZ4Y30Wt3T35bCSg1Q3hGdYnE5wi2mLvBpFrJBcuVQ00S1
         DAMPSoFQJJ+HOLdwyt7Ai30Wggz94c1m0CwvmoLx0f3RjZWSP9Ya+wM4xm2Pch3iV5o1
         bS4UOZ2DnSk8IQ+N/BqnPIX9wlVez5xn83RGsRYE21QNRTRbKTVdOoh2mpe1+3toBCh1
         pTBquTmNyDQX1LouK6iBFZOEYknoK+vyHw9CY7vnCKmvzvw0YdO1ZrXxwvt8e/19h4p8
         9eUsAmrUar0CbM3V2lkxn3eENfL1W/EI2CqDZ3RkHHzMQli00NG6olOzrlfIg594sSFv
         MxZA==
X-Gm-Message-State: AO0yUKWDzLYgSHQV9QyznVYnZlOJanQEK5HPqi2yVR6b+GlBqpOremuY
	Iqx7ScRgLGFqkDe4ew9LmTKV4Enq6Pk=
X-Google-Smtp-Source: AK7set/WIJyt8BAviM1XWRDMsRw7+YYATbj8gVWQhEILqqICEhezyjBmw0di0HLfKDwlRGu9Tq8sMw==
X-Received: by 2002:a05:600c:1546:b0:3eb:246d:7efd with SMTP id f6-20020a05600c154600b003eb246d7efdmr580380wmg.2.1677231627092;
        Fri, 24 Feb 2023 01:40:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m26-20020a05600c3b1a00b003e21ba8684dsm2395737wms.26.2023.02.24.01.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:40:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] gcr: correctly configure vala against introspection data
Date: Fri, 24 Feb 2023 10:40:18 +0100
Message-Id: <20230224094018.1227425-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 09:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177668

GI_DATA_ENABLED is the right source for making that decision
as it additionally factors in presence of qemu-usermode in
MACHINE_FEATURES.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
index b137968943..7821e31b52 100644
--- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'vapi', '', d)} \
+	${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)} \
 "
 PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
-- 
2.30.2


