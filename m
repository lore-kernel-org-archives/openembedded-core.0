Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C3C4321E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7346.1651727155417544331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fM9xlD9w;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id p18so3901289edr.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TgHwx1jxWr/aZbncVhVJY+T+MyhiEI7F1+1Xi7JJgpo=;
        b=fM9xlD9w6+2Efz8exX469am69AxteCjZcLrrKTDXJZp4SNj2u0OFfsxED4r6xpTYK3
         rrjhNPsHqxAxTwR1IocnyqX/0028pQv3axMhYmnj3Pn3aT0xW+9gBsd/cwMI2jUSpJ6k
         RBZPAp0b1ahwaui5TBJEyX3/ugBwELTIJQ14KHUSgEnbR5HuApj+2KhMXrmyEpSkgxEg
         ZxCrEhHIH9++3wET35AA6A+WqMLqxPHZe6JSmK6bR2LOzo/zPWIeng695NvhjxJ8IsBi
         fbMB1HrpCckQUZgNsHP6s1VvqCfMesuEYEqeX1qLSGxHqjLyoVVZFo6sU7LojmSa7AYQ
         Qg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TgHwx1jxWr/aZbncVhVJY+T+MyhiEI7F1+1Xi7JJgpo=;
        b=cJMIVTi0PYkBArbJUQZpwN7AcIBvGDRkJAIt561avsBnrKZIMsZe8nI8q9JgP+s4Qe
         Vg6D+CqHPf1hsDqceThdfcZRIBVz23bR2TLFicV5sLv/dbcyVz7VVjxded/d5egJ0Tt4
         e8TeDaUEbml+0JLI//hVuSNKyA9tadYRGt8ChiN4x9U4boXX+OjWIsV/hTKr4sg1DImC
         MglkbNf61gjC7BNhXAE1WEqYBcppuQdsfO2A+OIVDXamU2adU8/mKFN2tV6KByTj6bYS
         WVLy2ooRHQ3r0aCuAqCktv/fK5A+CE1LKrazTHTdT6fwWBlTcmVY/v2kBSQuxXTAqaFd
         v0sA==
X-Gm-Message-State: AOAM532UwaftQ3mfLZ4tBbkwAPPG1EQ54Hd9V7msFccn6/raVn16Fefz
	jgApxP7iDL5XYduG5PpaBhYA9hA4WxM=
X-Google-Smtp-Source: 
 ABdhPJz18ZDY46UYeq8npXFF1fTz3FUzveqtZZXmtFsyR8clwN8TcN7ZRn82+u2CJgOXuF542eSqkA==
X-Received: by 2002:a05:6402:40d4:b0:427:de1e:6ce0 with SMTP id
 z20-20020a05640240d400b00427de1e6ce0mr14260368edb.227.1651727157812;
        Wed, 04 May 2022 22:05:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/61] bind: upgrade 9.18.1 -> 9.18.2
Date: Thu,  5 May 2022 07:04:57 +0200
Message-Id: <20220505050544.651895-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165243

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/bind9                     | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/conf.patch                | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/named.service             | 0
 .../bind/{bind_9.18.1.bb => bind_9.18.2.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.1.bb => bind_9.18.2.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/bind9 b/meta/recipes-connectivity/bind/bind-9.18.2/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.2/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/named.service b/meta/recipes-connectivity/bind/bind-9.18.2/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.2/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.1.bb b/meta/recipes-connectivity/bind/bind_9.18.2.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.1.bb
rename to meta/recipes-connectivity/bind/bind_9.18.2.bb
index 6aa832f8f5..1c77aceb9f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "57c7afd871694d615cb4defb1c1bd6ed023350943d7458414db8d493ef560427"
+SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.30.2


