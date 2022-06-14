Return-Path: <sebastian.suesens@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F996C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 06:27:13 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.2974.1655188032626805757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RvazFgww;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: sebastian.suesens@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id n10so15182466ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4ARx6SDFC9m9vxoFhV23hnI8TGhmZXcCBRw4COZGIw=;
        b=RvazFgwwNlIbp/a7l6ZXhfw+lgixRIZgiQ9fLnZUYkuwOKUkQLrf2jE7twbp5b6umS
         4B14a8r7Mp29WYm/L3XUa5Ta++qPxsqP82orJibfz3AKEbii1KwtBfRnM+MQRAkhCbD0
         NEOJFazqo6FwmrO0BrxGaZJsjXASwbi97MTPqWRz9PnXnmfpKccPc8aS5EiE8LNBmH3a
         s1CS++56ap3uCF+lveJHJGl2Zkww1YvyURcOQP3TDVTvVNRhZsv9dsBcUNRhpoTvwV16
         EO1f+Xs/8YX2iOZpo49fBKzUqmPXL+gaRFRMWSnNO8CwGD/X+Aw+O9doU5EQeaLFLwPK
         An5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4ARx6SDFC9m9vxoFhV23hnI8TGhmZXcCBRw4COZGIw=;
        b=thyH3VhJPjEBTZkakqwZ1bsc/4hfqNt0nLzy9vwRjmSfd2N0KZPEwlUHXQIlCYLj2j
         6EDBKxhiAxJaQNkO9856LsfSHa76gt6GsRhM35NcUn8cxVd1OWIzMRTxRJuMIQd8s5Js
         Zml9nheM84cn/SqOw0HBEa/UqGO5QwF5MbgU/O7BJw61rlyQCjCR3UwfnoQLPZQhSuZh
         9gk4aUWrulLi0N+DgfiIq3oecrsZxVx8Fjvt51rCOxhUDesu2ApifM3UM1EdcWlVl11A
         sUGa7gYLU6VclZcbpDOAeukkgAKKO1kC2Zczgc0rZL1yEdR/l9RYta+OvOMeF5RT9nbw
         lS5A==
X-Gm-Message-State: AOAM533yu0iiCzQVfS8EvdKaf83jKg7vceu7BzDo2AoV1TYLxOJKlpRo
	D5JvpcB449TaMmB3BckzdzKBZkGsZ8KqrchV7I8=
X-Google-Smtp-Source: 
 AGRyM1vLflPhADMr5e9EP7cJm7PrWPcuxOcMJeBVcRvkT3FRj+8Od5zI6dTsILSLLX9ELQH7YFVyxA==
X-Received: by 2002:a17:906:6485:b0:712:10cd:e3b7 with SMTP id
 e5-20020a170906648500b0071210cde3b7mr2807019ejm.557.1655188031056;
        Mon, 13 Jun 2022 23:27:11 -0700 (PDT)
Received: from ssuesens-qemu.fritz.box
 (p200300d98f3c7d00bcbc9443c92a3bee.dip0.t-ipconnect.de.
 [2003:d9:8f3c:7d00:bcbc:9443:c92a:3bee])
        by smtp.gmail.com with ESMTPSA id
 t10-20020a170906178a00b00711d5baae0esm4684374eje.145.2022.06.13.23.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 23:27:10 -0700 (PDT)
From: Sebastian Suesens <sebastian.suesens@gmail.com>
X-Google-Original-From: Sebastian Suesens <Sebastian.Suesens@baslerweb.com>
To: openembedded-core@lists.openembedded.org
Cc: ssuesens <sebastian.suesens@baslerweb.com>
Subject: [master][PATCH v2 2/3] [master} weston.init: enabled xwayland
Date: Tue, 14 Jun 2022 08:27:06 +0200
Message-Id: <20220614062707.2946041-2-Sebastian.Suesens@baslerweb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614062707.2946041-1-Sebastian.Suesens@baslerweb.com>
References: <20220614062707.2946041-1-Sebastian.Suesens@baslerweb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 06:27:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166877

From: ssuesens <sebastian.suesens@baslerweb.com>

set xwayland support in weston.init file to true

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 497d860203..77dda03cf5 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -50,6 +50,10 @@ do_install() {
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" = "yes" ]; then
+		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
 		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
-- 
2.25.1


