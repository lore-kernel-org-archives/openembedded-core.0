Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF57C25B06
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:18:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.8524.1660234693599882199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BZHFJ/7z;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v3so21970380wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=PW/wuBp1b0j26Yxt3bG6Ywtd/Q6gl3WY+X6tA28758s=;
        b=BZHFJ/7ztpJYY/BgowGC+dwzUDapwGaoRLNWWnglAVeyUuaYhxrOy21i8JUcXJ+Ip0
         aXc/CR2V31JWvLj7Y2nIZc5gTcfhQOVjonE0KhA+tVMxdQ2YmMv3/e3AQmwExUxOGHZJ
         7pwgCKIAou+Vf+K71NvWVrNEvOWVEhMWiEOll8t4bqKghxb6fI/4oD0yXCbR/h3o/MEY
         b577FNpCCtXqRS9svWs4KZfsANGdnrmRny0QiL4EG7kEyEcXEZeo41AE0AoMyJUSBDHA
         8bLAOnCq8XWpCxmYe81pA/nveS1eTa9TQfmOtsCoSD0wKQUKPRs43c2mQHdbJ6I6WGe0
         GfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=PW/wuBp1b0j26Yxt3bG6Ywtd/Q6gl3WY+X6tA28758s=;
        b=yzFgeFHyOp42qzt69zom9oPA+ekdNx1GESheLTW3yPya8HCuOrBuY0KVEX0JqHt/pp
         eWSL5ZIN0+gLXXL1EiBtVi+6O3zJrh1HdekNUWiRN8NWY2khnmetseG/3quazYca6MnK
         ijX8PtT5S7ciLkcnvRMaOUvKuawAeURqOemUKMdj52fQaOAD13DsLG724aSsRDuJjxgX
         Nq5cbeVpzcIoDbu/s31rTuypW7mWxr2ESCHbQR6FT6KHo+1RA5Khez5xsybGQY6DecFg
         KlDDFlm3kBYeIEXwizpgJ5jZHp1APfQck5M1SFrS+OK9Vwc3beIJXh4ieAL8VUY3vDY6
         uSZw==
X-Gm-Message-State: ACgBeo3EXmUd4x9b37xGNJ5drDnnPISccjBs7GdqiV7Pr1oshXhFnes2
	gS3bwO8XBjJ/0eLNQSyX7Eqvw5gRM3g=
X-Google-Smtp-Source: 
 AA6agR4vYworiW8H8EpeBEx/seuzJzicmPept7DV8KY2sK6IbKdgqm1WxD6G1zsSNwHwosRuXex6lg==
X-Received: by 2002:a05:6000:1888:b0:222:c8e3:6bb with SMTP id
 a8-20020a056000188800b00222c8e306bbmr12553692wri.88.1660234691574;
        Thu, 11 Aug 2022 09:18:11 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c069200b003a32490c95dsm6148611wmn.35.2022.08.11.09.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:18:10 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	otavio@ossystems.com.br,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
Date: Thu, 11 Aug 2022 17:17:57 +0100
Message-Id: <20220811161757.278819-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:18:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169253

When the kernel is rebuild or some of they tasks change the
kernel modules is not rebuild as well and will comes from
the sstate-cache.

[YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14885

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/module.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index a09ec3ed1e..d377a08bc6 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,5 +1,7 @@
 inherit module-base kernel-module-split pkgconfig
 
+DEPENDS += "virtual/kernel"
+
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
-- 
2.37.1


