Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF04C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:34:28 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.71424.1722526461982776742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=tM9bs2Ll;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6bb987d3a98so846156d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722526461; x=1723131261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXZ/qUzlMqLA/sRjue/zEqKPa6ADR82ooZy04EIfsqk=;
        b=tM9bs2LlCTEN9t45Y7xmtJrBlE4dqSsxKaWKEscARqCSk/tVzVe4JLdC9Z01mtXY0H
         t9hlZaq10CS7GNqm3PccFY3zMptdpgbwZXcXzyzBqANIlNL6OSx2YYPRJZiJcJIA8hRF
         GSrEDHnF3b7BARXozQcL3REmozj8OgHzGvCliPwzFWTnISW1Ti2xGGkDea/csrfdmQOb
         A3PnTxvcuZvCM9rrhSJwTkUd2kL9tSdJvg9/hUnaziQRd8ZjnCaw8gHUct1t6ujagh6f
         XaRmyWSPwQJinniXPv9gC59uhbYGodYrcLe6jxcYhIP55nIi2WjafkFUEBTZ93ztO10W
         7VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526461; x=1723131261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXZ/qUzlMqLA/sRjue/zEqKPa6ADR82ooZy04EIfsqk=;
        b=qPJ//gEwBtCEtIfL7RaTj/vDP8qTzXnsBOit8Lqs1iJdu5lwDDFLf4IvSpPQ14n893
         klfjNvWluG1lFE5oiuY94JnXhakD5NPoQt78juu9NkPfy7ic+py1IVMz2q/kzQJAGrHT
         i9WVK/dtjey02WG2PIhGN/qpiGTVktY39uAuao0sWT9yMJCWwpCWfl4m8R2cMVsHQKdv
         M49fMlDFQd2QHOyKlCJP3QdPWNQ+njJiRVwpWPTpWrWE0w8NkYLbpq2l8FmkpEaufRYQ
         fvryF6BKhccZbx+BatUhL+ry+Po3IXkQBSK3FjXXPxCAtdMqIY1GQZk9AWjX7gzdkQxj
         8+iw==
X-Gm-Message-State: AOJu0Yw5YrvKrviLCwnkZLaxIw5fDcca6VV20hmecZR1/I7iGMrKYH4K
	iODqnks4AWxaraELJTX2HB+6epwRPRUxsfynT/kYhc5yKr9uE2WtoYGBvp27e/aVqZryhI23zNS
	i
X-Google-Smtp-Source: AGHT+IFi/oM/gRhiXQrOb7nFGfSxXI9NfzouQRK+W03oXBE9Qi2FO4O18AU3NGLGR02+sZ1/YxYzeQ==
X-Received: by 2002:a05:6214:5b07:b0:6b4:fd6b:d492 with SMTP id 6a1803df08f44-6bb98422927mr4873246d6.54.1722526460753;
        Thu, 01 Aug 2024 08:34:20 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb79c4f3dbsm28168026d6.30.2024.08.01.08.34.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:34:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kea: upgrade 2.4.1 -> 2.7.1
Date: Thu,  1 Aug 2024 11:34:19 -0400
Message-Id: <20240801153419.3011935-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202758

Refresh patch 'fix_pid_keactrl.patch' to apply on new version.

Add an extra sed call to do_install:append() to remove a reference to
TMPDIR from ${D}/usr/sbin/kea-admin.

License-Update: Update copyright year

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../kea/files/fix_pid_keactrl.patch            | 18 ++++++++++++------
 .../kea/{kea_2.4.1.bb => kea_2.7.1.bb}         |  5 +++--
 2 files changed, 15 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.7.1.bb} (93%)

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 63a6a2805b..98400212a5 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From 18f84773f992c64e07fb82949552e38a01aace4e Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -8,22 +8,28 @@ Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
 
+Refresh to apply on top of 2.7.1.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 450e997..c353ca9 100644
+index a7cf355630..c3565f7204 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -149,8 +149,8 @@ check_running() {
+@@ -152,8 +152,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
-     if [ ${_pid} -gt 0 ]; then
+     if [ "${_pid}" -gt 0 ]; then
 -        # Use ps to check if PID is alive
--        if ps -p ${_pid} 1>/dev/null; then
+-        if ps -p "${_pid}" 1>/dev/null; then
 +        # Use pgrep and grep to check if PID is alive
-+        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
++        if pgrep -v 1 | grep "${_pid}" 1>/dev/null; then
              # No error, so PID IS ALIVE
              _running=1
          fi
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.7.1.bb
similarity index 93%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.7.1.bb
index 19309ce314..228d2fff34 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.7.1.bb
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
+SRC_URI[sha256sum] = "036bdfcc8b815199dc7c1d0edff01a1057462771b8c4bcc2f323c32bddf1bd5c"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
@@ -64,6 +64,7 @@ do_install:append() {
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
+    sed -i "s:${B}/../kea-2.7.1::g" ${D}/usr/sbin/kea-admin
 }
 
 do_install:append() {
-- 
2.39.2


