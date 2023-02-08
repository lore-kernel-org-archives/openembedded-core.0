Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D183DC636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3126.1675840910613950144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hIrp/wBM;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so744235wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWPx+Fku0pb9JrURWEaUkTcZmOb0ozKHtcP5cHfs0Vs=;
        b=hIrp/wBMec0IwxKnWWphdUfOPzYWnj0w+vkwJ5Ma1ZVQ/No7pri40W9dCeWbVJ/agl
         xiHJLC2ZlpNgUWRhCi39Cc4AlJ/X/KvOESaSTPDHje6n5x1xoHLRg2jgs7C8tuLhbTDQ
         WuqMFWHQ5izpzKYBKqzummkHJ7ecxiX02kku23eMlXUc5piMBixd1dS/egglKy1Q1dFS
         FKizQdRb4bkSRZJmRSIiTbOii/gKhZ+7Q77tJrcP324u2TnBqRUHqxPDFbS4BIBsz7zI
         jMaq2lsJwnBE+JI37f/qFKqBIuDNQSeRcNodlnK8xUvCa07XrpDJ6kY72yj1zfzQWIxV
         OtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWPx+Fku0pb9JrURWEaUkTcZmOb0ozKHtcP5cHfs0Vs=;
        b=g7qx+Tswvr78sTLSCkZ83hJALn8hFfQP+0mVSY8RVJ6oACiCQe7X2SkKFHi/MqWcJe
         5rll2OWX/HINnZ+J6p1yxy2fiY5nsknLo+R6NXUgMRrvZnR38OTbvIrNUvoJQ8iesdD/
         OW5l0DWEcZcv3rI/qQskGsFccnY0aS7tcky52+V4Gvw+xwVSTuQgQ9HouT2cN1ei7foZ
         woOYScjp8xYcj3UoGcTeAfEmUgdlnCkN5nHR82A1OHCAQjKZbeDOJcqfOBM4FeP06j5P
         oq0UNT1BKVQBpZuJBbGfUF2K1riHgyfokBR1U7mB+2FRMDMpE59NpP45IiMnM2pE3C9z
         10VQ==
X-Gm-Message-State: AO0yUKV0j4kZMdvLb9cg9z8RPOyJ4IPlNfV1NGjv9uvib93cgPrMsJUo
	OA2OJ3IxrblUI8sLcgujOSXwLEu0SZw=
X-Google-Smtp-Source: AK7set9KG+AFuL1VQZzty2U6kbxwSUeqQa16LBZjH98rXmc0KH0SBidMXHn+KXJvHVDNuDLA6YgYbw==
X-Received: by 2002:a05:600c:16c4:b0:3df:f7f1:4faf with SMTP id l4-20020a05600c16c400b003dff7f14fafmr5500736wmn.34.1675840924908;
        Tue, 07 Feb 2023 23:22:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/52] bind: upgrade 9.18.10 -> 9.18.11
Date: Wed,  8 Feb 2023 08:21:21 +0100
Message-Id: <20230208072143.2930292-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176869

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/bind9                 | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/conf.patch            | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/named.service         | 0
 .../bind/{bind_9.18.10.bb => bind_9.18.11.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.10.bb => bind_9.18.11.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind9 b/meta/recipes-connectivity/bind/bind-9.18.11/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.11/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/named.service b/meta/recipes-connectivity/bind/bind-9.18.11/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.11/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.10.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.10.bb
rename to meta/recipes-connectivity/bind/bind_9.18.11.bb
index cb0e251d51..55a06eae5f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.10.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9a4a897f202c0710e07f2f2836bc2b62"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "f415a92feb62568b50854a063cb231e257351f8672186d0ab031a49b3de2cac6"
+SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.30.2


