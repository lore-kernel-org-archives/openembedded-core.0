Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902CBC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:31:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.33552.1723037459328195248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 06:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zcjumK+L;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d81dc0beso93033885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723037458; x=1723642258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwwM5xJe8DtFMxyqojZiQ86obrec/UMCqS0T2JYz8js=;
        b=zcjumK+Lqvc1GtYOOlJNfaKQ/ifQa75pFxLB/U6XuaMftjY4AA+c5bDKH7PGYNn3q3
         mTvEG1xQta/LVIaJuVbXBo1tM483J4B2UKhprlkrAGXORV5RsV8U3xYM9eQPNK2/nSEC
         dig7cjTRNstMm8zL6Vg922KE9u/W0QkdK0or7vvh6tsv11I/0wKRIVPRPW7Yj7TioI06
         Et7OulCR+0jfEt4eLUo3eOq2cyfqC0raPAycFetOd19/GYwhNA1HXFkA1aSd82CQckjd
         N78uJOVruh1w0lyfscDeUZLerHh0qc5Nx2JgthCBj1Iqqr0G+ma1YWW944hgT/tiRueJ
         pHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723037458; x=1723642258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwwM5xJe8DtFMxyqojZiQ86obrec/UMCqS0T2JYz8js=;
        b=m6FT+x3k6XdoyhM9++NxS7c8WuFegLqegOEXYu3M0V/0oYa5v4b6WJz5bMUKrvIwyB
         UjQZCkBPWXC9McOtIqplJ9fIheMhzMeOYT+JBUOzZBC3u/86G1bMuyVKupKKb3kIFpwv
         8UHMks+TjX9ppq5WptppuSlt9wGCid33kS1SEO7OV9WeThlTFI6EZ9n7IYfYIuiTewN4
         mvsPHhEBkTptsmc2FYYw/wlJQOdLQscKPjSJYSFSt3DwXIxhQPN7xlsn9UXXqia1JjKw
         bQXdKsxBbqAzqTTuLsmQfQfBR7KJ6oCs8/01p97l0e/IUj8mnNOpgziiGMGFNnU5vWnt
         9dJw==
X-Gm-Message-State: AOJu0YwNIilLGKCyDPqKtqTxbAMRiVbMcbh1U532kliCMAuxzLODWclv
	16iwwwf8iF2vh2YfiBedyLSI9o8NJ672XTMIKLBsj8cufN8W36mlTwWiApebuXoW1sUGX6902Wg
	S
X-Google-Smtp-Source: AGHT+IHrsvWRfcZTayvlyDK5IcJgG0ARXVImaqJokCVUe9YFdW13gpodmGcGkeBqG7OOQnH1yaenvg==
X-Received: by 2002:a05:620a:3913:b0:79f:17cb:7052 with SMTP id af79cd13be357-7a34ef40387mr2305512885a.30.1723037458003;
        Wed, 07 Aug 2024 06:30:58 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785e5a0asm60538285a.45.2024.08.07.06.30.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:30:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v4] kea: upgrade 2.4.1 -> 2.6.1
Date: Wed,  7 Aug 2024 09:30:56 -0400
Message-Id: <20240807133056.430673-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 13:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203073

Refresh patch 'fix_pid_keactrl.patch' to apply on new version.

Add an extra sed call to do_install:append() to remove a reference to
TMPDIR from ${D}/usr/sbin/kea-admin.

License-Update: Update copyright year

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v4 uses ${sbindir} in the added sed call so that it isn't hard-coded.

v3 (mistakenly labeled v2) tweaks the extra sed call to use BPN instead
of PN, so that it works with multilib builds.

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
index 19309ce314..bd9e63ceed 100644
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
+    sed -i "s:${B}/../${BPN}-${PV}:@abs_top_builddir_placeholder@:g" ${D}${sbindir}/kea-admin
 }
 
 do_install:append() {
-- 
2.39.2


