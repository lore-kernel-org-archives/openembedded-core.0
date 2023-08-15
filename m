Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417F5C41513
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.138755.1692116690025107894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jMmU0PDZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bc63ef9959so47466125ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116689; x=1692721489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fixJSp7gdSVzuksvQ6yJke1eMk55kl1spD0DhY/hIgI=;
        b=jMmU0PDZmlqkd55ZKQpRtyxDhCoxkgeIX+o0gtQy+w/kHCbSCKQDWMhV+PuhomRDMj
         MFjNKrs9OgLOKxCpACMk3qiEEIKPiwT30+dvZxsjkLzBgog2HobFxC4/G0XwIwZrMK7j
         ZVQqkOLOsFMkC0raTgPR/62SSX9DHwrl92xyeGol7Gqb4mSPNC28NWIklNIR4lze5QBX
         iWRVVF6FDVd1Mn4XvbTE785jt6rKov+3mal4+9Q7FmDKIrvroQHZvd9GsW60h8yo9Cn7
         +2z3dfMh6ZA7qX7sv3c0i7WUrJJLijtv7yQVBiGEWmO5yGgl6bvQbtmSc289dYIMeqQq
         UaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116689; x=1692721489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fixJSp7gdSVzuksvQ6yJke1eMk55kl1spD0DhY/hIgI=;
        b=EI0EEROisaQSzTHchvQjxB5KE5GLUlUXfPe+3+5tr9w11PkaBkx5xC+kJJUYAjvBsP
         2jSkIuv9wwyNR70fBS+Xov5/jHnt6d4hyEJkWpspjPoV5HBYV0xrUTuPZrcNg5FMeRKP
         RuZ/VkShjAEYikJOoFsllmMmJWH/uRlAkp0GXtQWbl02V6QQ/GIfrT9VQsAc4Stt2+Sh
         Wr6yyN21rG2XVxNMsNFh6iiNvwYN70dwL9uNcnaO4OqmkV+6yz7xoYMGxMBdmrPq7wgQ
         gLqk0+tvfbbuj+0m9LpmbRd0IAeVhcsJInOonUCLI99237IYB5uq0u7BoSgLAaifC30v
         mnJA==
X-Gm-Message-State: AOJu0YzLGPWY0qVDBeOUAg7HV6gq0ardkr/yGftTCFIedH8eLahVSdaX
	HQI/VFNfHYszbaUwiAO2W0He7pokfjN79S2L228=
X-Google-Smtp-Source: AGHT+IHY1SfPjNEHjsRE7sktex3qQAzhMARQ2TzQwJ8jbik+lmwlZrmMAAoxDfccUbYcw6Xzg9oWHQ==
X-Received: by 2002:a17:903:2301:b0:1b8:a88c:4dc6 with SMTP id d1-20020a170903230100b001b8a88c4dc6mr16971903plh.45.1692116689041;
        Tue, 15 Aug 2023 09:24:49 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/18] bind: upgrade to v9.18.17
Date: Tue, 15 Aug 2023 06:24:17 -1000
Message-Id: <0476e9b8e2519731308c88f97686e2ffcb109d39.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186087

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Changes:
Update license checksum: only whitespace change.
Update sha256sum for new version.

Additional change:
Do not use version with the foldername, which will result in less diffstat
with future upgrades.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1eda31b370ab4129ad149c45f1e43a44d6db9241)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind9   | 0
 .../bind/{bind-9.18.16 => bind}/conf.patch                    | 0
 .../bind/{bind-9.18.16 => bind}/generate-rndc-key.sh          | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.16 => bind}/named.service                 | 0
 .../bind/{bind_9.18.16.bb => bind_9.18.17.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.16.bb => bind_9.18.17.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/bind9 b/meta/recipes-connectivity/bind/bind/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/bind9
rename to meta/recipes-connectivity/bind/bind/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
rename to meta/recipes-connectivity/bind/bind/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/named.service b/meta/recipes-connectivity/bind/bind/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/named.service
rename to meta/recipes-connectivity/bind/bind/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.16.bb b/meta/recipes-connectivity/bind/bind_9.18.17.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.16.bb
rename to meta/recipes-connectivity/bind/bind_9.18.17.bb
index 1b1649566a..fa1249b370 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.17.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c7a0b6d9a1b692a5da9af9d503671f43"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf98da3db4d0b57e0775"
+SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


