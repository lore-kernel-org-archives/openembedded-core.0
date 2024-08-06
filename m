Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF763C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 19:12:23 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.15510.1722971542868131811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 12:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BkdLDwmx;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a35eff1d06so61913685a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722971542; x=1723576342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1zC35g2NxktpkdBZLdC+BvGyq/IcFv0rGIXrcnLTl4=;
        b=BkdLDwmx18SeVM1XkrcV4bieQzxsPENDmZhYVeLA/daTg4TGi2Lx/tBK+hxOH21C9r
         9Pp+SXuZigQR+vpKt1L6gi2rknxRnj2xR1x6s+8KYLnxJH+UGBCmLK4zrx52m0S3Vp2Y
         /mdh+zFSpgTI8PJso7j+LqYJeZwvvmjCEjbW7TdU+vakg9ZjvOM92i/zOcpDeGd5FASn
         kMjdZbmL81KyocPT2ssrZgaoFq2BxoVLp79jfme5eEW8Si6XOb3t2Gf71rK96S90aTRS
         F2S18MRX1JstTsTnyQsQwW2yVo0Q/OP3MJksVT7TEHRr1+QhRPWtfbHRkD8JhRGHAIgh
         5E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722971542; x=1723576342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1zC35g2NxktpkdBZLdC+BvGyq/IcFv0rGIXrcnLTl4=;
        b=ObKDct83ln2nQzyT/8y6g0VdDfQfD6hhf1hR12M/kLBs9fsGPmMNTwx0L33maY6FpE
         P9S8+/5ueBUzGoUwkvq/B3Dqr84uzgp2zCSCAu25gQFEmzsw7/g9LMuVQTYDCZ2WhnMH
         p2s6trYywDSo9QkXhmaXoc6a8qvWdGhDM//1iDCTv3MxRopagojzGq4hyUFJwFprm/sh
         lN1HkQNNx5p5TkMqFdT4yv7L8L4xZkHpNPFj6o0p6IEqjW9PugUcwR8Hj4ILKRyW06Ig
         DheGUxYbDVuT8CwRuJgjWbYC1qhUzPeTkMkX5Sob0KaJqJje7CU6qhVE9B9SVEbESPSc
         E0QA==
X-Gm-Message-State: AOJu0YyozDBmGnG//S9YeSNOZ+iFSDlYSduFWlZzGnxAUqGlTNjyMhKd
	qIB8pDHh4aUADM5lTOzhv1L7CChm4VyvxovIocLP826svikrK0JvVd1THGdqRLVNPNt5bt8dwm0
	d
X-Google-Smtp-Source: AGHT+IGMh6OgdE8YWThFrOVdCj/GrmJi4Ht/RyZASIzj5HXri2RjaBEEgX9UQgfAFwzQ7kjZFjsJog==
X-Received: by 2002:a05:620a:1a13:b0:79e:fd11:7ab3 with SMTP id af79cd13be357-7a34efe22c7mr1880721285a.46.1722971541637;
        Tue, 06 Aug 2024 12:12:21 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6f6b7dsm477460585a.55.2024.08.06.12.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 12:12:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
Date: Tue,  6 Aug 2024 15:12:20 -0400
Message-Id: <20240806191220.323104-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 19:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203048

Refresh patch 'fix_pid_keactrl.patch' to apply on new version.

Add an extra sed call to do_install:append() to remove a reference to
TMPDIR from ${D}/usr/sbin/kea-admin.

License-Update: Update copyright year

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 tweaks the extra sed call to use BPN instead of PN, so that it works
with multilib builds.

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
index 19309ce314..05a756a6ee 100644
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
+    sed -i "s:${B}/../${BPN}-${PV}:@abs_top_builddir_placeholder@:g" ${D}/usr/sbin/kea-admin
 }
 
 do_install:append() {
-- 
2.39.2


