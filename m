Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCF6C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.26490.1643278814012516738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FMA4SwPu;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e2so3849643wra.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RDaOvx5Fpswi5HoDvzyuPIvIBneWRo0+M8qBEwLGlp0=;
        b=FMA4SwPuSPdMZTzsfe9GOoMwMEJ0+K8ngRtXWOuTtMBcDTxNimvE1UjVy3963b/ejT
         OHeiDAEZHZLw/XNg7Y8OXQ9fNuIM+Yc9Qgp304u5ItoNgRl2RJbVqJVr1JFxU7f+bxiB
         ZbuiA4FopltnJZj236oilv/CJrNSesvB9vjxO093k/spyZtXjUeFLXmy4Ael7BDAEC3/
         NudWqZ8o7228mCk0z3GPNXpAUG0YSN67qI314wMeDjrWWJNTmxcz/EZYSACQCyinNTnw
         mkV72IedUI8421QTMoJBscBpkMff/mfPlVbh0x8yMHzoNiNAb0t8AeNaMaAvjxp+FdJV
         lNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RDaOvx5Fpswi5HoDvzyuPIvIBneWRo0+M8qBEwLGlp0=;
        b=hBBl7Kc1EV9fYRLXZqd3F62MfcizEjck+y0ADy4u/IH5s/avgzluws+xv5TgkvG7rb
         HLvQHgg/w6eDjD1p1EbCB1NaZ4FNacgA7wo5VyuOI7+2GgtOUKlzrjJX2vuhX7Js833d
         +PCTfmM3ztc+0qWAFIIqeaoDo4+kufsp4JrYs2c0TLqJXiUz7sHL/+DHzLwGRqFlXZBw
         reUVQ/ez2Hdptb9A3rybAmqk//8K/bu8nF4w1phn5SW/YgH/9S5nFojQJRybHlooY94x
         0PQ+u1CuzH4BJ/yM4vOzQkm5v/se+vL22ThjzILU1mT4lx3bSAPIGsBW4PVmT7cnxxaA
         8MpA==
X-Gm-Message-State: AOAM5303DwSoUEMhXFNYBMa+OOa0G/SxnDlyMfiUV1jUYYFMlggEZB0E
	Lc0HyvsOym1FZU4Wfm6NI6zmApSsKuc=
X-Google-Smtp-Source: 
 ABdhPJzSgE4bHzPa1npwLrYNpM8jQJvPqspMDVeq/SMN8GMav4wbVBpZ6GPXhP0di1F89Uf5iTo+9Q==
X-Received: by 2002:a5d:5846:: with SMTP id i6mr2464963wrf.4.1643278812533;
        Thu, 27 Jan 2022 02:20:12 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/17] bind: upgrade 9.16.24 -> 9.16.25
Date: Thu, 27 Jan 2022 11:19:50 +0100
Message-Id: <20220127102005.3050843-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161024

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.16.24 => bind-9.16.25}/bind9                 | 0
 .../bind/{bind-9.16.24 => bind-9.16.25}/conf.patch            | 0
 .../bind/{bind-9.16.24 => bind-9.16.25}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.16.24 => bind-9.16.25}/named.service         | 0
 .../bind/{bind_9.16.24.bb => bind_9.16.25.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.24 => bind-9.16.25}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.24.bb => bind_9.16.25.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.25/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.25/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.25/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.25/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.25/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.25/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/bind9 b/meta/recipes-connectivity/bind/bind-9.16.25/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.25/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.25/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.25/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.25/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.25/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.25/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.25/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.25/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.25/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.24/named.service b/meta/recipes-connectivity/bind/bind-9.16.25/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.24/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.25/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.24.bb b/meta/recipes-connectivity/bind/bind_9.16.25.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.16.24.bb
rename to meta/recipes-connectivity/bind/bind_9.16.25.bb
index ef5fd42ef8..27a1683a5c 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.25.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ef10b4de6371115dcecdc38ca2af4561"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e7b3c52170a348459a4ff3f5ce95e37"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "5582f3734bd6232284f93f14206b8a46d1f819dea4797ae157066f6963b08507"
+SRC_URI[sha256sum] = "9fa328850f82843ef8b7bf1ff5322cb68b110273a33f375ba41f35270f5e1ff3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.20.1


