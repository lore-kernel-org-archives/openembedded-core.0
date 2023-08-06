Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70C1C001DE
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 10:46:35 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.8927.1691318787521215126
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 03:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rom1LNvl;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686c06b806cso2349355b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691318787; x=1691923587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=964YcoKXXyWOgCNLVFQr6aIoL5xMHYp4aTSLNCcFBpU=;
        b=rom1LNvlv0kqGHysYZwWOY5BGCjGSClxJ5n7pI8FeWdyY4GoNANOvT3/Qky6/31f+s
         ky2FpBnW+ybUN738pmjryHmyC9oP4SMZiQNUzQUrCV3OvcKnRn1FmaWkocEzNsEKNBmg
         M9iZvoeFhpWmYKFhT2/KDZpqEGfSJImSDjikK/UJRdDdV2kEUMJJnvJusVyg698lgwB9
         Wk0T4m40F4vMcACxarrqF9DuHuEn6je+5pKLJUt40jUSqvzIVtKR412tCQGgi6ZjM1E+
         tY105CaSHuwdA7MCyLIqMTh7VmJ00XZ6nSp8L8y9FsvJSVQ8Duh8OVbjJYdDEYRwWhCd
         Cp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691318787; x=1691923587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=964YcoKXXyWOgCNLVFQr6aIoL5xMHYp4aTSLNCcFBpU=;
        b=Qns9Eq/dPhX4xic56sEoWmSeh6mXnuBFuEhzvcpvWvAUfWjQ+X5j9gaw4xsato+amD
         Cg+nIJvnjqmRfJ3jkE2pAg/HTWjfZ6oSuUAqDzElrvl5YBS+xGcy8LFXmsRx/NRh/PUY
         //0rQQT5725f1PTnYlVOEvOgevs7UDORtuUMAJExGAeKvlETWtKTEStx0OInK20nOywI
         VHloS+F4Z20S3nxRLy3QzVUDJ94208SHew8MQTE/qvFc9+B3BTGU6UglCVwd7RFryIyA
         CoXC30CMRE8XOGUx5uREi9u9nzxJ6K0rjDa+tMhBMRW1oklML66hL9TDRU7i3GXJe4Be
         GnuA==
X-Gm-Message-State: AOJu0YwZqUWufHeAbDNlcVfbeU/wTwD5lTJ816V/qtzsiCtVZPQPW/k1
	Quak83M8ar8wTPU0TUejgXfyuQPje4c=
X-Google-Smtp-Source: AGHT+IHVPD0rDg+ebhTmU+fo4JlL/AFPeA61IhKZv3kthq9U2+0lnosX9rvdu6f/J5S07DAS9J/myA==
X-Received: by 2002:a05:6a21:3e01:b0:13f:3d25:d83 with SMTP id bk1-20020a056a213e0100b0013f3d250d83mr5368459pzc.19.1691318786619;
        Sun, 06 Aug 2023 03:46:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8005:8fc9:b43a:ffa3:6ed8:9b69])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78396000000b0068746ac9fb0sm4266993pfm.135.2023.08.06.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 03:46:25 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] bind: upgrade to v9.18.17
Date: Sun,  6 Aug 2023 11:46:16 +0100
Message-Id: <20230806104616.17699-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 10:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185561

Changes:
Update license checksum: only whitespace change.
Update sha256sum for new version.

Additional change:
Do not use version with the foldername, which will result in less diffstat
with future upgrades.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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
index d9b62bb8b0..9e7973ecbf 100644
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
2.39.2


