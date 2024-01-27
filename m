Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7952EC48285
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:49 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.8358.1706323066721304423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pMoezSIQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ff9adbf216so8301637b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323065; x=1706927865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW/4/LuYo3CjrcQGwcbpEapZn0hZAIF+tyJVAdyhCKc=;
        b=pMoezSIQloSExCIJLKp5TiHmx2BNbfCLhPDkULcNAtY/i9Gb4abW06HeM8ich6D3bN
         xuR8wlK5tlai5w389pk6D77uB1+41zmhwAhmpGoT1aa4oWnfGnKtCWrjBnClNGM0ZWA/
         eeYGv7rARzduWmufE8Tz6Aw5hnYC6oTFowJuaH0qvtEBm+Nw5WlXp2Z/wv9d+lJBT5Nu
         3FNChTvTqJQ3b/FAqhsgsG3Z2HqIATLRT4yj2GgKGTHvauRgUMzZLlnkOMVVBwO/Ayml
         WsD7x7kgsJlr3iNyL9//MRygWIEnG/7xbU5fxHKmdIJNldVvohKemAR35rVfamf4MESG
         PE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323065; x=1706927865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW/4/LuYo3CjrcQGwcbpEapZn0hZAIF+tyJVAdyhCKc=;
        b=G4zro/jm4sP7Zc3tgTPaUC3AygLSfCvkXmf97lsgWh1gUaHfJRDwiUGP535DtWpGSN
         PSl5PJ30tJHSwnHYKEe6pqeSu6UE8Kz0fG73L0v3nxaLf+MucpqNs4wpWbkqWfzdcsPx
         IJ1tLRkGn6+rKerdTGTdb6C7FjiJ5WIrCgXa6IvoJJ1BGUdABnkJlGEMqer6AHsHHECX
         eURR9k+/27PTpQyYL5dCu14bdH0PcYqGBKDo11DPEQPeaVZ6l1ak+LgppgpGgHhq00JA
         tV7YFBYtjyJK93oGjykMrjMC0gF76JUD7tZpDoeA4uY0O4HEhKIrpIpZDSE4O8UOKHSd
         tJ+w==
X-Gm-Message-State: AOJu0YzZnzoD9KQ8WteoozqBclVeclle/mX7iiNL9dLT3C3IqlVDFp4A
	UDOeu/AZpkdT0th4vvINW73ogJf+Kaj2uhDMoYPVd7INTrg0sCQkiVg6Kx/YntxWRNCJVJMqQSK
	PjrBP7Q==
X-Google-Smtp-Source: AGHT+IHAHZrZP5ZQueq3PvyLHvO37jkzhzNJ9IhALNVC1KO5OKRMMw9JTEJ7xcPoI/yRBqvNg5COCg==
X-Received: by 2002:a81:a88a:0:b0:5f4:a5ab:4105 with SMTP id f132-20020a81a88a000000b005f4a5ab4105mr837545ywh.8.1706323065661;
        Fri, 26 Jan 2024 18:37:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/23] kea: upgrade 2.4.0 -> 2.4.1
Date: Fri, 26 Jan 2024 16:37:12 -1000
Message-Id: <fcf269bd8fc607882960cebc2c6e2e557517647d.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194413

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-The library version numbers have been bumped up for the Kea 2.4.1 stable release.
-Fixed interface redetection which had stopped working since Kea 2.3.6.
-Fixed a race condition in free lease queue allocator

fix-multilib-conflict.patch
fix_pid_keactrl.patch
refreshed for 2.4.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7afab39fd1c3239df3bb2fa49b79a5efaaaf9db6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../kea/files/fix-multilib-conflict.patch                 | 8 ++++----
 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch | 6 +++---
 .../kea/{kea_2.4.0.bb => kea_2.4.1.bb}                    | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.0.bb => kea_2.4.1.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 451b409c88..5b135b3aee 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From d027b1d85a8c1a0193b6e4a00083d3038d699a59 Mon Sep 17 00:00:00 2001
+From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 22 Sep 2020 15:02:33 +0800
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
@@ -35,10 +35,10 @@ index e6ae8b8..50a3092 100644
  //          "param1": "foo"
  //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 26bf163..49ddb0a 100644
+index 6edb8a1..b2a7385 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
-@@ -252,7 +252,7 @@
+@@ -255,7 +255,7 @@
      //       // of all devices serviced by Kea, including their identifiers
      //       // (like MAC address), their location in the network, times
      //       // when they were active etc.
@@ -47,7 +47,7 @@ index 26bf163..49ddb0a 100644
      //       "parameters": {
      //           "path": "/var/lib/kea",
      //           "base-name": "kea-forensic4"
-@@ -269,7 +269,7 @@
+@@ -272,7 +272,7 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index b7c2fd4f0d..63a6a2805b 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From 18f4f6206c248d6169aa67b3ecf16bf54e9292e8 Mon Sep 17 00:00:00 2001
+From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -13,10 +13,10 @@ Signed-off-by: Armin kuster <akuster808@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index ae5bd8e..e9f9b73 100644
+index 450e997..c353ca9 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -151,8 +151,8 @@ check_running() {
+@@ -149,8 +149,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.0.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_2.4.0.bb
rename to meta/recipes-connectivity/kea/kea_2.4.1.bb
index 316468754e..c3aa4dc8f0 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-kea-fix-reproducible-build-failure.patch \
            "
-SRC_URI[sha256sum] = "3a33cd08dc3319ff544e6bbf2c0429042106f4051ebe115dc1bb2625c95003f7"
+SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.34.1


