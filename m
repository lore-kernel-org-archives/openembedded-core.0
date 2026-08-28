Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6799C61DE7
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2982.1787945901168298637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P4zqA7HB;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso14489685e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945899; x=1788550699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IYg7wCLLraY5f2Ul+J3AN7HHXBF3t8jWpdMx55h4wA4=;
        b=P4zqA7HBBQ74J0PtW8zMPXX42tRWpUvHULTfIzitI4oHd98lC7um9uIlSY9wUFIV6M
         OJZZKLi6Mr3cHSlZIClmgahQN3j53a/t22iNT7jEEKPOZylZtOVf9Yurb+ElfDB2auWg
         FEJBXaW7WeYZfqMxbexNCuYYecIZ7kNLCvvPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945899; x=1788550699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IYg7wCLLraY5f2Ul+J3AN7HHXBF3t8jWpdMx55h4wA4=;
        b=jCNTCpZSDFoVxhVHSKysRXviOcfFUv6x91G7nhgnKP+FmKNHzFDYKWTBmArUVdSIhG
         biW7N5hCgc/yoVTN+4Keah3APL4CsnO5vwc1gwVZxu0Ggniplq7s1Dxw5jeU8vvSL3qC
         zpjG1zcsnG2jjr6bI7YPMPOtLBsI93jrmh1wUqmc8hCPzZ8YpWPDU1+RBOv/S8cgaRsO
         n8+7faNZiXd1NozZG8n2Z9ZiaS6dBssOSAw5PLlRJAGwNnMsvoTWfpfEGcjaHKdaic6e
         vjqARsR/GKXsH4QI9jNUCWkUWyoY76ok1JK7N3VqTmWYmGCJHoiA5fg+y6PKxY7prASn
         0Sew==
X-Gm-Message-State: AFuF++kFIwkqfptlCxNLRfvFitHLCSSm9o6x9cv1d3m7gCNyhryK0Rvp
	+KpxAcC0Acxdvkz8IVoUa6c2z/UArwil3QDNN8dn9woDEEzm5iFDiJ5dyOHy8THABLqQtGuzGa4
	LoiKIDpQ=
X-Gm-Gg: AR+sD13M/ulgMA3r0FYCeDVv5DjcW4E+FsN4yTA1SzVWYWLxqjtSljJwwYjaaiRLDki
	ySS3AjvxwTpTeW2OH86OvFZo9GRIGqWKf/vUse1s1TXEdLn+CRo5H9bR8wRo/eeHPfSU9sg+BYI
	+Q1PiJ1Tw6x/DhOsHxbBvrcppL0Cdbde2KjQHd7uplCQyY5XJRv78nmS8GluOnC9E4HTkGRj4QQ
	QhpxNEh6fZnZrsII1prrjQluKO8W5Lv+1eTn8oUXPt9zcbVIaqWtrGMWK/ss8xjU1QmOO6Fmcwa
	YEUe8o3vD9d/F/4bDIEwmuYOt+HOS5qepz0P8nXqv6kWQfsGweY6wN0VYLULOBR3rYmfIBX5Fpq
	X93dmToqPoVKuPjsDUGqPFS3t1Ro39mChbpDhvGoW4iffJ4uy3V5WKOdSI1SeVhkQ0zd53laGLY
	/bw9ztcgf46Ce9C9daxoi3ePJZ8MRE7P7r9oPmxOhWuEMdZ+3rlwMEL3gUPrJM2zKkS0L4fLjLY
	60NbPJZeVhRygJQVAAMXs/jxTlZJMr/ALKIZ06xp9h5j9BsHDA9d67liNJgElCA
X-Received: by 2002:a05:600c:8486:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49b91c27436mr148373225e9.5.1787945899327;
        Fri, 28 Aug 2026 12:38:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/56] gstreamer1.0: upgrade 1.28.2 -> 1.28.4
Date: Fri, 28 Aug 2026 21:35:36 +0200
Message-ID: <a8ee500dfc5b79d3a96fe610bcd48868361f10d6.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244587

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 53c2f2ac7e154225b096e7a421be5fe0eb4de29c)

* https://gstreamer.freedesktop.org/releases/1.28/#1.28.4
  This release only contains bugfixes and important security fixes.
* https://gstreamer.freedesktop.org/releases/1.28/#1.28.3
  This release only contains bugfixes and important security fixes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch      | 6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch     | 2 +-
 ...tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.4.bb}      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b0405..de255bf7918 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 4e6aae8cbddb4567388f8f19919c2c17e36e0356 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 720a6f0c97e..957356c2ba6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
+From 34d24b8d66088d92ca306a488028dee82a6f6982 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 8adc055..b5c9e5b 100644
+index abd0ad6..93cd692 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -667,6 +667,10 @@ if bashcomp_dep.found()
+@@ -661,6 +661,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b6..bc6dfe353a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From f34bc3040b1564a3d39de4a4426326866c437dae Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445d..8eb4bc2a816 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From ee4f5bd19394e055109486d88ff8e876c5c2572f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
index 4e51418c987..d1f06a52338 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ce5cd44d4ffeafdcc3dddaa072b2179c0b7cb1abf4e6c5d18d4375f8a39fe491"
+SRC_URI[sha256sum] = "f5adc7e8f448c10260b3b25aa101c9d540674c8d9a54c2b77a86d04f2b3b50dd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \

