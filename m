Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D3CC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 17:09:09 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.73984.1722532142844716803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 10:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QjBPfnB1;
 spf=pass (domain: baylibre.com, ip: 209.85.166.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-39aeccc6377so21503445ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722532142; x=1723136942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH1QlIhLv5I5tl7ol0J9DaWz+USU9Uz/wh3YTMOFiLE=;
        b=QjBPfnB1ntmDOLlpykZB+D0XS1tLNuddUtp4ulQ1MEf6RkHok6QAPnZ+AIUEz+HTnG
         fb0ejzpudTgOhLJ7wReKHNeJskbgr/as10mc554IF70n8X7w19284ZDCD5w/h5eqDgAA
         5EA/94YckN9ktoZ6c81GKUbbc2FTNLUjNnXc/Ev2O1ypNEsNEeSD1fyVN7x8OM8mNWSV
         C8zuIoXpalA0Ay6OmBhlWu6p+Bc5Kn0DXTNyDtFOUXOPqZEFeVNd++kfuMISWMOO0SEW
         yBpDYzynKMp/psaASB7cP+VkMxtPoD/KJ+2ec6B+ODOa5F0uj27eJgHK1T+925V3JZXs
         8ptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722532142; x=1723136942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rH1QlIhLv5I5tl7ol0J9DaWz+USU9Uz/wh3YTMOFiLE=;
        b=qQmoSUQUX10RO8TYqAzaAPwpnIVgtrkN11kYdQaE2gSRiDlEBEkiu42XT9NqqTxZpa
         s4CStbtSE1U+m58G2aH11p44vlXIqbHX+cy7SdpBhEDTk5q6Q/Qk+ehVgZ2lglDUrTH1
         MM1wtUogsQ/yJHgXnFID+TQswdwziR3X20ZABc0EvXEeX+nj0SgWH/hQcDqgOz9WxBDE
         P3qUGHlslpiF/IX748z5Q64Qt8wtynPuS3RykH0nx9XKcm7OjBeYmVCpxvXVC7wd3ouA
         mbg5kZKFoguK4qlOB+O/TpJlmmJo/aP6lOYT2i8xKzvr9Cdo18Y6WagYXU+/TRrOWz9w
         ft0A==
X-Gm-Message-State: AOJu0YwqbzXq4MjmC9OMZtNN2uXL0wQa81iKkgUPhwVVOc2u4ZjwfIVS
	+Dg2IYkcEfBc2qhyUXy+MjHIpouetobD5emztkUISTuedcu0fwQDULs5v4aP4F7ubbvO8P+sCBZ
	2
X-Google-Smtp-Source: AGHT+IGKXwzarx4KTsin8VefbvVHcMrGO4C7+OfJ4ebIxFfneovAYRGZXudVWhBsSPmwHR/SpBTECw==
X-Received: by 2002:a92:dac9:0:b0:397:70e7:143b with SMTP id e9e14a558f8ab-39b1fb87a37mr9493115ab.14.1722532141419;
        Thu, 01 Aug 2024 10:09:01 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39b20ab5732sm433805ab.37.2024.08.01.10.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:09:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kea: upgrade 2.4.1 -> 2.6.1
Date: Thu,  1 Aug 2024 13:08:59 -0400
Message-Id: <20240801170859.3085947-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 17:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202761

Refresh patch 'fix_pid_keactrl.patch' to apply on new version.

Add an extra sed call to do_install:append() to remove a reference to
TMPDIR from ${D}/usr/sbin/kea-admin.

License-Update: Update copyright year

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../kea/files/fix_pid_keactrl.patch                  | 12 +++++++++---
 .../kea/{kea_2.4.1.bb => kea_2.6.1.bb}               |  5 +++--
 2 files changed, 12 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.1.bb} (92%)

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 63a6a2805b..2f5a217d3f 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From f5125725e4e2e250ccc78a17a8b77431100e7c15 Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -8,15 +8,18 @@ Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
 
+Refresh to apply on top of 2.6.1.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 450e997..c353ca9 100644
+index cccfdac303..20ae2e6ec5 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -149,8 +149,8 @@ check_running() {
+@@ -146,8 +146,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
@@ -27,3 +30,6 @@ index 450e997..c353ca9 100644
              # No error, so PID IS ALIVE
              _running=1
          fi
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
similarity index 92%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.1.bb
index 19309ce314..62791a7074 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
@@ -64,6 +64,7 @@ do_install:append() {
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
+    sed -i "s:${B}/../${PN}-${PV}::g" ${D}/usr/sbin/kea-admin
 }
 
 do_install:append() {
-- 
2.39.2


