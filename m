Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30961CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 23:46:15 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.7258.1757369331484970602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 15:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcC+9A/f;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: m.kurz92@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0428b537e5so793507166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 15:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757369330; x=1757974130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5VMGE5LPLzwJnsMWoNmLvyrOaU7YXO67mwnV6hErZE=;
        b=jcC+9A/fAgSpZg9PKskN2Vq8rfISQp6yOiz1e9Zz/cDuNPKqWb+K1yLBojy+MnbN3M
         QsBINQg6w+46ivgFGG3Mh6X1AmGzyVLJEXlDXkgHqZS+NaDLHeWcjmHVYDs1cvSOVl3P
         wjfEsqllAD0mZlJyvCdi9gFDG2L1G2wXKqTEjmS6m7nYZA74RPYKWjVlyrdGaX3U5+TW
         pXh0jUkOPbIZUriuF+0LTsu3ZQznbQuWwX458TvFF69dpHeolJyQMr0+Mdur49FByhns
         jwmwEiVgOi0uCUoQEzqpk0MmkCx8TwvpmiLI37EwpdVXt1DUBRrh4moTtSzss5jNDTQe
         /Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757369330; x=1757974130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5VMGE5LPLzwJnsMWoNmLvyrOaU7YXO67mwnV6hErZE=;
        b=EHUqyXjLD6K0PJ7mZ1wjE9OFG4/ic+cy8Wl/Ksmrz22DqT/lGXEmlENnH1dTBpn0Eo
         UvB1gItGCzbG/dqLfrRoW6kckJzOMR1EEitsXa0ewUFNeGIZZ9SAawteRmNlHtZzuCNa
         8jHp6oDr6PwF33eeJVQyKlU7YtOIsPgIj//xGP4OPz3ORH29iYfMeGMWcTjxMbMTON7l
         qr2Uk9MgnaeVQ2P0wbyEC204A5k3/M/iAGNIs4mS8s622lFUnalm5YRrW1TUx9cAidEZ
         OCbcYmQAjjU9HVqpRWI5MOtaBvCaVPTxNuoXhfNfWgzWeHV+pwiFCmqOz2ZFCq7CHXTR
         rM4Q==
X-Gm-Message-State: AOJu0YyL9vGSfh8n1AIb+JbJ42Hcdtot88lctzeRuwNHoXxC2mg9BsC4
	8bpmf/OZ1zYJxmyEFxe7mRyG8QyciJws+rnMQMB32NFhfIsqz/Mur3QVVVT4fm6H
X-Gm-Gg: ASbGnctvrYlseniXL4yZVB6kE5nmrnl5s9W3ovcdnXSgL9ueCAIX5LahMaui2n4TT81
	IY8TJ3ja86a4OsaNEQa36T78vD9hy476+37f/CGQStosb40Epm5qnUdTkenHKWOjR7KDqAUMlC1
	8zNMQXQQqSIp7pvxdDMB+OtnLXoKCe8FSMEAPIF085TxEq2zuFfwKGxuy1JUYVNzz3Ha6zjOGz0
	+Qcx3AJxDEbZLJBVoW6reFyDo/2K0IH2c1f9r+34hQG1JtuCvl2PzcnpekguBdir4vKmrdOrH68
	jX9G2cOd6QULMJDmJUsJYrE7sfMPxNKvmb+ffmAOKyNAhF8agKM6HhrfMHDi2+P457O4WGtLfPn
	AxWMVgEAr75cyvFzYDXqZC7bfV8l2bTAr12MrVLeflDgFMgHQeg28NsAEi8tk
X-Google-Smtp-Source: AGHT+IFVXofKYXu+bQi9z8xf6x3j7Qwl8FCADeZLCGRBbf4wdJPjw/xl6puFMuQAocPBDHSedUpwnQ==
X-Received: by 2002:a5d:5f82:0:b0:3e7:42ae:d3dd with SMTP id ffacd0b85a97d-3e742aed713mr6126804f8f.53.1757368946892;
        Mon, 08 Sep 2025 15:02:26 -0700 (PDT)
Received: from pop-os.. (82-194-152-106.dyn.cablelink.at. [82.194.152.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm42776328f8f.61.2025.09.08.15.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 15:02:26 -0700 (PDT)
From: m.kurz92@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Markus Kurz <m.kurz92@gmail.com>
Subject: [PATCH] appstream: upgrade 1.0.5 -> 1.0.6
Date: Tue,  9 Sep 2025 00:01:57 +0200
Message-Id: <20250908220157.1306459-1-m.kurz92@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 23:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223086

From: Markus Kurz <m.kurz92@gmail.com>

Changelog
=========

Features:
 * compose: Accept .ttc font files
 * compose: Give font icons a background shape
 * compose: Render more elaborate font sample cards

Bugfixes:
 * compose: Insert screenshot tags for auto-generated font screenshots
 * compose: Trim substring when truncating font sample text
 * meson: don't override appstreamcli when cross-building
 * compose: Prefer rendering font icon with "Regular" style
 * compose: Sanitize font text samples before using them as icon
 * Follow directory symlinks when looking for Flatpak data
 * compose: Drop bad private-header include in public header
 * compose: Drop unneeded const declaration for GKeyFile
 * Fix typo that prevented video metadata from being composed properly

Signed-off-by: Markus Kurz <m.kurz92@gmail.com>
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch      | 4 ++--
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch      | 2 +-
 ...Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 4 ++--
 .../appstream/{appstream_1.0.5.bb => appstream_1.0.6.bb}      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.5.bb => appstream_1.0.6.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 03ac5eb05b..5f4ec29628 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 7372848f22d7edc01e40b0533047b34f41f6cf71 Mon Sep 17 00:00:00 2001
+From e713f4d6ce2ee198eabcc31bc734e84cdb20ea32 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 7e89ab0..c34ea74 100644
+index ee5b179..8a06e75 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -194,10 +194,10 @@ endif
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 71c9aadbc9..cf26013019 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 43afdff090c4cbb2d3b4025a38b25a718c8f16b5 Mon Sep 17 00:00:00 2001
+From eafac7178683c9fe5ab50192dec004f24638b2f4 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index e522a92e14..d1994e3c4c 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From c36b6226479a20ebd910f355deddb9d5c7571213 Mon Sep 17 00:00:00 2001
+From f19365d8b90cde7d2a385f8c85b74a2565ff25fa Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
-index 63df65f2..5ab2d0ec 100644
+index 63df65f..5ab2d0e 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.0.5.bb b/meta/recipes-support/appstream/appstream_1.0.6.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.0.5.bb
rename to meta/recipes-support/appstream/appstream_1.0.6.bb
index bb293f76e2..62761380f5 100644
--- a/meta/recipes-support/appstream/appstream_1.0.5.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.6.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "ce0ed29e89abd5f0cf790ea87d792f1967c3413060beb30e63a979578d975121"
+SRC_URI[sha256sum] = "db4439db6a33de3ca1041473501610844ddf1b72ae23016c05242c681c380b4d"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 

