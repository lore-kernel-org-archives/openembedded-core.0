Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5099BC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 17:18:59 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.74203.1722532731006337562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 10:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HZT7aWbJ;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b7a0ef0e75so41675336d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722532730; x=1723137530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wgTVz37fxtpJWgNIVx13pZZiQLC6QegmqyRPVZdHF6s=;
        b=HZT7aWbJfB3vIJelZWv1pyah2KvLVcT9jVdtSKti+fggMOO7bk6jjK1dAwTvvHPwrh
         hChtp0fCSG4E8T6gnq05Qh//9UPO2c/jmk2Fv+rJgug1frWxxTKydJJsOKTUv/wDaZ9Q
         V+mCJlN9+duqv7LU6mT+4MxsAkIr1kevIIUUxQ9vbDUwISd94DhzkVD4vLbFpg+mB62U
         pBMZnSym4T6UaS+wrezHU6EjS/IR6/DRUSO06HSaHQTlXAOtdmdiHlUMQ2B5EihXkyS3
         NhU1bRCVjNwqw/Z5FwqPodWV5ZShPnnDjCIqRWwPXarC1sSGEHbp12ubDgzWstHxZ80b
         c6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722532730; x=1723137530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgTVz37fxtpJWgNIVx13pZZiQLC6QegmqyRPVZdHF6s=;
        b=NzFAHvGztnXnY2VpoqpA6v3hBPUgu5ZDWhzx1s5gICM4Dfu3bB/sgHhIY8bPm8afci
         JWMLjYILyEy0YpRMwDT/Zj2fGvG33qDdbSQ2E3RTp1aZ+1phPfw0oRrFKmR1A2SjCSQl
         afBtfAOjRgbWnWB2dkbmO+jEh6DBNhit13oWurjVYeeSmsBxG+w1hWonAr+sq44iLATl
         iflxKbJcxSLS2Oie0QPiuya+LqXn4UL3IXTA2n5QfoLDRA5qyxR49kpLeTSvNRUDKHG3
         vWkhbbZ2oSxczHly/qYu4ncK14lWymjckFhpC2u3JxF3eWp6kivMy1D8G9Q5Z+KvuefS
         fyKQ==
X-Gm-Message-State: AOJu0Yy7lgqZUJ0QnbWPU7PEBqxfwoWutP6iQyIXC/v9sWTo0xc64yF4
	KSN62Mt8CzGOfkzZyMi+jUs9Zp/2pMpzgkIQHVC6wRwjIGguuCYxMiMJGy7762X/JMNtj4bDYCa
	i
X-Google-Smtp-Source: AGHT+IEkS0JbbCyfzU6qY2QAcRnohOvkepxK9fqCPJhnpVJBBkU6Gi4p7JtpnBGS4SGIPJtLaCOi7A==
X-Received: by 2002:a05:6214:3bc7:b0:6b9:5bee:243 with SMTP id 6a1803df08f44-6bb984301c4mr8849726d6.55.1722532729789;
        Thu, 01 Aug 2024 10:18:49 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb99a3efd2sm630176d6.73.2024.08.01.10.18.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:18:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
Date: Thu,  1 Aug 2024 13:18:48 -0400
Message-Id: <20240801171848.3102197-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 17:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202762

Refresh patch 'fix_pid_keactrl.patch' to apply on new version.

Add an extra sed call to do_install:append() to remove a reference to
TMPDIR from ${D}/usr/sbin/kea-admin.

License-Update: Update copyright year

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 fixes the sed call so that it adds the right
'@abs_top_builddir_placeholder@' prefix into the resulting string,
matching the other variables found in that part of kea-admin.

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
index 19309ce314..882df3883c 100644
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
+    sed -i "s:${B}/../${PN}-${PV}:@abs_top_builddir_placeholder@:g" ${D}/usr/sbin/kea-admin
 }
 
 do_install:append() {
-- 
2.39.2


