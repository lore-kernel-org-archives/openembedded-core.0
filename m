Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D14C7618B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.16132.1678375217925003146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZjrCaPhj;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so1489855wmq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfL9f5sgchIocS4fSRJoHaeCC2qqm9SBqc/0HMADrO8=;
        b=ZjrCaPhjmv2t20Oc1qWdGI3W5b+OOkXk+iF6806nYWnLLYkJVGhLPxxXpRrwT43TLy
         hNPQw5/FOWTY4K9dn+YTZldZ9FRyUhcNQkLUub9ClNSx9S+aEcRhZZZjhVkoA+qOwLs0
         FTpM5TZ/yox8nm9XJUgebpTlF7Ve3XxBT7HpXUYHYNPtrCms+tXw2C8diArcV2sn0fu3
         pd4CRQU8dNwRSaOzAueSf6peTQnnDHrKQ6bWCWQWBId5rE3UVltaeVV7zGj+B6NuavZC
         CUEhDEu0xjFxSUAZbXE4Ra+fiFEGQUlZ7MpxsRkOPTDpHRBS5q1xyLYuC9KHmEwIk1hX
         BVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfL9f5sgchIocS4fSRJoHaeCC2qqm9SBqc/0HMADrO8=;
        b=ztIJ5kM3At9rQMQ66QDJlIoqMzLJagiQDd1fYjK6ZyQwoYw1GFI4CrBgsQ4SYwnuLV
         9Np/jYynTXooboi+9im1jnAVriOjlu3gnl5npJ4BCWKehDJoGd8xkh/k88sejkrcgmHi
         tsVFFkLVFtirBYrEF8MHLDSfdM4HK7PIRwU2HODusnjdZSIfnV2te//8zA+/Lmlh7Vy3
         k2vbruj8W3GXWMHFmeM6fvYH36vpA3DEoCymuA75/JB6a6M7ZjtcRo6YItnBGddjs1MT
         ARF5YCcqGnt+flqB/7jFunRA5AZ7aoCWHjm7DMwHwJxwKSdsNyzYT1sZ3PoZldi9aPpr
         XFOA==
X-Gm-Message-State: AO0yUKVc/vyjXxsxVd0cTilBI0JP1mIZyvrHsIVVPFgQzcS/hVUb/bHL
	pXuLoC6cdwEkTyuBAJKHfpMPxp7ZUiI=
X-Google-Smtp-Source: AK7set9dqAzvbzMxuLUDldmC8KthUgMhnc+bCzmOKpMbDKhOHAIlvF+wWNGnAsLWlyDdQLC+KMCPEQ==
X-Received: by 2002:a05:600c:4e90:b0:3ea:bc08:42ad with SMTP id f16-20020a05600c4e9000b003eabc0842admr19441514wmq.2.1678375216357;
        Thu, 09 Mar 2023 07:20:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/26] bind: upgrade 9.18.11 -> 9.18.12
Date: Thu,  9 Mar 2023 16:19:55 +0100
Message-Id: <20230309151958.3619193-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178249

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.11 => bind-9.18.12}/bind9                   | 0
 .../bind/{bind-9.18.11 => bind-9.18.12}/conf.patch              | 0
 .../bind/{bind-9.18.11 => bind-9.18.12}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.11 => bind-9.18.12}/named.service           | 0
 .../bind/{bind_9.18.11.bb => bind_9.18.12.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.12}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.11.bb => bind_9.18.12.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.12/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.12/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind9 b/meta/recipes-connectivity/bind/bind-9.18.12/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.12/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.12/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.12/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.12/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.12/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.12/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.12/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.12/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.12/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/named.service b/meta/recipes-connectivity/bind/bind-9.18.12/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.12/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.18.12.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.11.bb
rename to meta/recipes-connectivity/bind/bind_9.18.12.bb
index 55a06eae5f..abce1c0f45 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.12.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
+SRC_URI[sha256sum] = "47766bb7b063aabbad054386b190aa7f6c14524427afd427c30ec426512027e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.30.2


