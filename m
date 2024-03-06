Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73011C54E60
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.14861.1709739725148328180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WB7TC5O4;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-567fe9d7741so582684a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739723; x=1710344523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp/9jfkOkge9+p4o/VDarZsmx+Gv/gPRYDWa2yBVwqo=;
        b=WB7TC5O4tCMfndt2JKI7dzTgv8i2mUkdPpFBJTiRpe2U3gem6hUZiG8JW76WixKEy2
         J1KPDBBuuX37YAEHgV4zXbDNGy4tgcaoUUrHiy160NBmyIEA+6ZNfK5JGoIaFDNB7fwB
         LJ13NfgpPMsl0o6r0R6ll0sp+fJFr8e3hDyrckH7b/V+lXJV9GjlswEq62x5rpcHd/km
         jUGeIVoWvRkT9owhBYYj+uWwQ7dwTYCzmGRUQdeVt3uR7o+H6ArNNvpuAvaLVzyv12jL
         9KXTx8WR3cnN7QQqX2OfzzzYXRCiQON89KayUNq4mjvoJro/enAO5EWqATIVvZvD3SnT
         E8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739723; x=1710344523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp/9jfkOkge9+p4o/VDarZsmx+Gv/gPRYDWa2yBVwqo=;
        b=cU+x1INgmmJABOMAuqvLA2Kn/bcTTxk2fbRaImJZSVz3qEiY+Se//wCWDSrOU4j8vH
         eYHAuJDpVIF5Xlh+NmSVN2YU0yjneH8IZhueuS6QXIn7onVHzM1NAjGk9TYzst2mYdaO
         wjLpb8Lpjh6nrRRXj7y8PW8h8svOX8siUn5KYimdmpe++WZ7wGcmD/JQXdH1D6RU+bAt
         yfJ93p4lK+TzZMzfi1r+ScdSEEKhDH9VrFZf4BRt3w/YUYNjuP1fFOz4yKz61x7WiZ6w
         Uje/5OnXHA1W99yDCV2dtbG9mouHMsQ7Dj4PhMagMsx97cercsxsRX/LKUrTVaXpv1Vn
         AlYg==
X-Gm-Message-State: AOJu0Yx1YY707tuCAnqeeW25UkRVKyAm50vi/umu6KLM7Gl7tdsAKhBT
	Hk8Ve0PqyQ6reru6rm9xqQGofbD82/pgICeP25YLNjJmf4itoa1dCUaiXqS9
X-Google-Smtp-Source: AGHT+IGbEJDEffEqf0W8M3157tH4YXjami3Jpza9BjjkTGrOZQj59W00+VH9gf5FjDOXdLLCJW8wMQ==
X-Received: by 2002:a17:906:454c:b0:a45:92c4:7892 with SMTP id s12-20020a170906454c00b00a4592c47892mr4157030ejq.56.1709739723500;
        Wed, 06 Mar 2024 07:42:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/47] dnf: upgrade 4.18.2 -> 4.19.0
Date: Wed,  6 Mar 2024 16:41:11 +0100
Message-Id: <20240306154151.3741709-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196690

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Corretly-install-tmpfiles.d-configuration.patch |  8 ++------
 ...t-hardcode-etc-and-systemd-unit-directories.patch |  5 ++---
 .../dnf/0001-dnf-write-the-log-lock-to-root.patch    |  3 +--
 .../0001-set-python-path-for-completion_helper.patch |  7 ++-----
 .../0005-Do-not-prepend-installroot-to-logdir.patch  |  9 +++------
 ...ot-set-PYTHON_INSTALL_DIR-by-running-python.patch |  3 +--
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch  | 12 ++++--------
 .../dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb}             |  2 +-
 8 files changed, 16 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index 6692b41a160..fd942228b9c 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,11 +1,10 @@
-From 05e059cd4e9910c00b32d377f4f98e3c8dde6bc6 Mon Sep 17 00:00:00 2001
+From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
-Subject: [PATCH 4/5] Corretly install tmpfiles.d configuration
+Subject: [PATCH] Corretly install tmpfiles.d configuration
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  etc/tmpfiles.d/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -17,6 +16,3 @@ index f69c773e..3eb6d0e8 100644
 @@ -1 +1 @@
 -INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
 +INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index cb09f17a563..37359a57655 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,17 +1,16 @@
-From ffb7942cc73c3d2c6aa7c689cdaf9bc0bcbc144b Mon Sep 17 00:00:00 2001
+From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 73552967..38cf4fbf 100644
+index 4aee99fb..9e2e9e9e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index eb0309d81a3..18f9a309491 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 3bd0faf58cc9ad531e6b63d5660c4b8316e8daed Mon Sep 17 00:00:00 2001
+From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
@@ -10,7 +10,6 @@ already existing, and base-files creating it as a symlink).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  dnf/logging.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
index 448f6408bc8..fcd970a7ae6 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From 7e79b3b67fd5cecd7380e7e365fd88eca63b5bfa Mon Sep 17 00:00:00 2001
+From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
@@ -10,7 +10,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/completion_helper.py.in b/dnf/cli/completion_helper.py.in
-index 351226759..2835cd3b6 100644
+index 0da0f2a2..9330d15b 100644
 --- a/dnf/cli/completion_helper.py.in
 +++ b/dnf/cli/completion_helper.py.in
 @@ -1,4 +1,4 @@
@@ -19,6 +19,3 @@ index 351226759..2835cd3b6 100644
  #
  # This file is part of dnf.
  #
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index 0e11c2eac2b..cfbda11f77b 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,7 +1,7 @@
-From 6365389074a1b86962f3d8b22a2ead2202026a98 Mon Sep 17 00:00:00 2001
+From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH 5/5] Do not prepend installroot to logdir.
+Subject: [PATCH] Do not prepend installroot to logdir.
 
 This would otherwise write the logs into rootfs/var/log
 (whereas we want them in $T),
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d2d9c082..82270ecf 100644
+index 1824bd00..4dcb1c1c 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
 @@ -944,7 +944,7 @@ class Cli(object):
@@ -26,6 +26,3 @@ index d2d9c082..82270ecf 100644
              conf.prepend_installroot(opt)
  
          self.base._logging._setup_from_dnf_conf(conf)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 5cffc9dce17..64ea7874d35 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,11 +1,10 @@
-From ceb1043c4f3de095e36908232320b74a4128a94e Mon Sep 17 00:00:00 2001
+From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eedbb5723fa..eb46113f3a5 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,20 +1,19 @@
-From 8d97b72a1d77149e2f9048d1ca6cef66da1a8aa5 Mon Sep 17 00:00:00 2001
+From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
-Subject: [PATCH 2/5] Run python scripts using env
+Subject: [PATCH] Run python scripts using env
 
 Otherwise the build tools hardcode the python path into them.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  bin/dnf-automatic.in | 2 +-
  bin/dnf.in           | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 5b06aa26..891b4c24 100755
+index 17e35a05..28827e38 100755
 --- a/bin/dnf-automatic.in
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
@@ -24,7 +23,7 @@ index 5b06aa26..891b4c24 100755
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
 diff --git a/bin/dnf.in b/bin/dnf.in
-index 645d0f06..bdf7b3c4 100755
+index 55ceb3f2..e38973c7 100755
 --- a/bin/dnf.in
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
@@ -33,6 +32,3 @@ index 645d0f06..bdf7b3c4 100755
  # The dnf executable script.
  #
  # Copyright (C) 2012-2016 Red Hat, Inc.
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.18.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.19.0.bb
index dc0c18be5ea..784d7a94b37 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
+SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


