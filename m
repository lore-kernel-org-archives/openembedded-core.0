Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68552C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 10:11:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.17511.1752833503693084616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 03:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EvuC+c5e;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso293358866b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752833502; x=1753438302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx8lFIhoxXk8aLE4/huJ8kX6sQQxRz6zat6xoSiTbAI=;
        b=EvuC+c5eimZEYOqCqM44m1ONuDr0VVgscB3DIyjTpCfTFVM+hqg0ZqYvOpmDM2uKm8
         g7dgDKO6yXA5F/LrJAKnvrfJP6E56HF8eVDA46AlFjW6RD9yWOdnZ30LpUyJi1Z0Wro6
         qWEPKnKJBb3n/DycPR7xvdC6NqD1qluIVltDoLkoamfDgQg3UHIQMREZR244a4v1WnDN
         ZBKGDmDmS4guRzc4SddKlpaojQ4203ODfRk4I2wcwP/744ifBUT1KuZ1idt8EjI3sjZN
         P0D+8CBNT0Q1eyvi+JVSSBZSTiIZw/lJOGytDx+RzKe7zOb78aMVHvE+DmCYUFqbulDH
         /6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752833502; x=1753438302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx8lFIhoxXk8aLE4/huJ8kX6sQQxRz6zat6xoSiTbAI=;
        b=hKiwTeckarcCdx4GSZsgTJon2+iR2i2M72/1snuNHZLaZbdYKl/ImXq/aYt2qHqb2w
         XGm+8sDiO2VOr4IHtzafIRb0llVwWVkTkLQdR2C/mi8qd/kpCKhMv9HKjekh/dnpv+Yx
         gOHmTIgULENHUe/9Xcqj1t2OpyU+fu6Za/M/pa0BpXyhBQvxr28pwsDsNQQ6ej7Xnvro
         44iyat3nUroeJuG+Z+rDpCYgxyrfq5nTOp9ZlAIFHzUHP96o0OYefU7vqfnq9s03WuC3
         5itfR8u9d6Gq2h18Qs3arqarf/qYh/PQC2d4yEwwScsEiogO9OZQNa8UJ8zxemjs05fd
         unxw==
X-Gm-Message-State: AOJu0YzoYKI7GfTLNt3YzXmF9XLeSFNPn4whT6ZIXBlbQ6RgDaw4sEHN
	ktLqL6LLjAR+c241R6FQbBQ2J5PYevr/oWsy/ZJZJbAlAE28EgaZm2YGUGpx4g==
X-Gm-Gg: ASbGncsvmowjv054kFZJUeY6inxHkCrjlmt4zC6oCgzRYJ9PsTyCgiOF8PSgsLY9cZT
	X4o7eHcrWjiDCrdaco+O9bjaoUiYWRA6we0xHQiNPwHwCBqfrggN6ZB8PsoZK+jqksXnoGQqhOL
	f4W05LAxNfeWi7Ua27zIVsP+oVmQ3R9kdtWlUoasOKHx0pd6wgVQxg59rFhrqO8P68TExB+12LV
	f4UaoppNb40f86YJhu1b+ZxwW1RoMqYHEvbTPGxqaCIdukTgppQLES3GpBUu1Rc6aMb5hcSsZVC
	bb7Ucd+PfuOSRX3fQcTGd5TMBU8xCF9RIF78dYUxxUeRsVDLHYu1D6Cv1ovNDdZTe9uiLgv6Ums
	v0MVSgQKRURiK/y9CyNk=
X-Google-Smtp-Source: AGHT+IFumf5aW/jwe0p4H+cymTyFAWT6fCqqT4AUnhpqbvBHBQ482bbf+MYHuuVRrFYsg5sVOOOzcA==
X-Received: by 2002:a17:906:9fc9:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae9ce0d2aedmr1055591866b.36.1752833501672;
        Fri, 18 Jul 2025 03:11:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d30csm93556066b.119.2025.07.18.03.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:11:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgit2: upgrade 1.9.0 -> 1.9.1
Date: Fri, 18 Jul 2025 12:11:40 +0200
Message-ID: <20250718101140.297012-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 10:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220593

Dropped 0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
because it's included in this release.

Changelog: see https://github.com/libgit2/libgit2/releases/tag/v1.9.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...eLists.txt-install-cmake-files-into-.patch | 32 -------------------
 .../{libgit2_1.9.0.bb => libgit2_1.9.1.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
 rename meta/recipes-support/libgit2/{libgit2_1.9.0.bb => libgit2_1.9.1.bb} (72%)

diff --git a/meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch b/meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
deleted file mode 100644
index ae48524e0d..0000000000
--- a/meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8ca35649c33d0d2fcdcd573ce6a9edd91c77e4da Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 7 Jan 2025 18:56:19 +0100
-Subject: [PATCH] src/libgit2/CMakeLists.txt: install cmake files into
- configured libdir
-
-libdir can be something else than /usr/lib, e.g. /usr/lib64 or similar.
-
-Upstream-Status: Submitted [https://github.com/libgit2/libgit2/pull/7004]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/libgit2/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libgit2/CMakeLists.txt b/src/libgit2/CMakeLists.txt
-index a7d3c7ca4..16b3a23d9 100644
---- a/src/libgit2/CMakeLists.txt
-+++ b/src/libgit2/CMakeLists.txt
-@@ -119,11 +119,11 @@ configure_file(config.cmake.in
- install(FILES
- 	"${PROJECT_BINARY_DIR}/cmake/${PROJECT_NAME}Config.cmake"
- 	"${PROJECT_BINARY_DIR}/cmake/${PROJECT_NAME}ConfigVersion.cmake"
--	DESTINATION "lib/cmake/${PROJECT_NAME}")
-+	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- install(
- 	EXPORT ${LIBGIT2_TARGETS_EXPORT_NAME}
- 	NAMESPACE "${PROJECT_NAME}::"
--	DESTINATION "lib/cmake/${PROJECT_NAME}")
-+	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- 
- # Install
- 
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.0.bb b/meta/recipes-support/libgit2/libgit2_1.9.1.bb
similarity index 72%
rename from meta/recipes-support/libgit2/libgit2_1.9.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.1.bb
index 66ec62f17a..43957a2087 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.1.bb
@@ -5,10 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
-           file://0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch \
-           "
-SRCREV = "338e6fb681369ff0537719095e22ce9dc602dbf0"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV}"
+SRCREV = "0060d9cf5666f015b1067129bd874c6cc4c9c7ac"
 
 inherit cmake
 

