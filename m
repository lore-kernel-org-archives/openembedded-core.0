Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A8EE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.14683.1736325759959130121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cgqhFmbQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa689a37dd4so498377066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325758; x=1736930558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erSZY4mgV8Ro1OSMbDGB6bSKAfjixguW9yaQrWFm7rs=;
        b=cgqhFmbQliHcAW+KDKFhOnirwl5D5yGclvX9QF7EJDhxXJzOjQqfy13l39jqvmc6kM
         JK5e/RQI2g+LQGuI5Hhus6a1+14TuwXezZDe57XZengokXjY5ui1en3UHQzwl87XdMLA
         p0x4Rjnz0XXMFOWc5okvFlJ4Aplf9suWB/ibw8v9Uz+Sq5ee6AEDFfWZ54SyHJ5mykC3
         RuvwYuCTR7EJkXOHBEhkD/ybouJMMfUKc1MuTbiyG/rI0Grid3ll8JBJIF3fYNNM38yP
         lTdeYjCyG4iJgd5apcaTvb1bTXZ3md5RtuuCluN83aFu3xsffsu615lYyZ5/II1iJcWM
         1arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325758; x=1736930558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erSZY4mgV8Ro1OSMbDGB6bSKAfjixguW9yaQrWFm7rs=;
        b=QE+Pih3EUj8E15dkx9HG8K/PjNdkc7Aq3tTbI1C+SbX3XupyVQ4GCdMqe2Km069Quf
         rWe2trpqIqBe6UAR9JL3gmPLLLAUtnliEV47wDKqny2cD4lw32o6nBfkVkUmr0vgJIIz
         DLPhFJEuFnwHz0crXO0OM7GRpNXl0ybpge+FQTMSzREmKlrakCYPJEtoOQjNKzwOD9LT
         knJd/MdyfqV37Y8DwekwRgsYRVL4syMa7jw3ya6inoL70hWu5V2/UBElUsArctP5GuSC
         UJ6AU87z1UuphTtUKa0+eznbHYvw6y/HvJYI7FWI+Bg70o/CBPVVy0eBIpMMg8Y3cMY9
         fS1A==
X-Gm-Message-State: AOJu0Yw9c3T/DDFgwj+8K0WbLW/LXu+GTfeSiuUbpNZXiMkDk9S1/R35
	p42nTioBWV9lyvV9x5bpDE2Htpn2xKHrYPlhPz46DiUkxUe8YXrunDXf8g==
X-Gm-Gg: ASbGncuiktNuYgD2+KPRfqVALJxOvhoen2toYN560P6E2/sKdMWQL8Ga3IFxAnc3Y6i
	yVSUJB/ZJtsCC7RM9TVZh+2QRBKiiX9Mk74iq047fjDbSTLCXYnkf52ftAF7Yuh3bw9SeLJeMJq
	twCPTs7yu0slIFA2jx8s5r1tA01c0+un94u8bcrOPGsQ+GCafnF+AHdxlx9yOCeuooUTO1RxG3j
	ACnLdXbes8VyrVNaNvC5xoPSM8BaSUHd6EaFrFJL/IyWpa8Nng2TSU0MfVKUbN/GHpOSbEJHFbE
	lRUDPSPBj6oSLE5BLw==
X-Google-Smtp-Source: AGHT+IFo2ngjujFUCiOjsPH3Etbl/VHuVdKSbra4dysdAmnOWdAGbVw0gpSYCsL86O8AK3z3uBF8iw==
X-Received: by 2002:a17:907:948b:b0:aa6:6f92:74b1 with SMTP id a640c23a62f3a-ab2ab6fd565mr148916966b.13.1736325758140;
        Wed, 08 Jan 2025 00:42:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/20] libgit2: update 1.8.4 -> 1.9.0
Date: Wed,  8 Jan 2025 09:42:18 +0100
Message-Id: <20250108084226.117178-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209534

From: Alexander Kanavin <alex@linutronix.de>

Do not install cmake files; if someone wants them, please make
them reproducible and not hardcode-installed into /usr/lib.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...eLists.txt-install-cmake-files-into-.patch | 32 +++++++++++++++++++
 .../{libgit2_1.8.4.bb => libgit2_1.9.0.bb}    | 10 ++++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
 rename meta/recipes-support/libgit2/{libgit2_1.8.4.bb => libgit2_1.9.0.bb} (60%)

diff --git a/meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch b/meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
new file mode 100644
index 00000000000..ae48524e0d4
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch
@@ -0,0 +1,32 @@
+From 8ca35649c33d0d2fcdcd573ce6a9edd91c77e4da Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 7 Jan 2025 18:56:19 +0100
+Subject: [PATCH] src/libgit2/CMakeLists.txt: install cmake files into
+ configured libdir
+
+libdir can be something else than /usr/lib, e.g. /usr/lib64 or similar.
+
+Upstream-Status: Submitted [https://github.com/libgit2/libgit2/pull/7004]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/libgit2/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libgit2/CMakeLists.txt b/src/libgit2/CMakeLists.txt
+index a7d3c7ca4..16b3a23d9 100644
+--- a/src/libgit2/CMakeLists.txt
++++ b/src/libgit2/CMakeLists.txt
+@@ -119,11 +119,11 @@ configure_file(config.cmake.in
+ install(FILES
+ 	"${PROJECT_BINARY_DIR}/cmake/${PROJECT_NAME}Config.cmake"
+ 	"${PROJECT_BINARY_DIR}/cmake/${PROJECT_NAME}ConfigVersion.cmake"
+-	DESTINATION "lib/cmake/${PROJECT_NAME}")
++	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
+ install(
+ 	EXPORT ${LIBGIT2_TARGETS_EXPORT_NAME}
+ 	NAMESPACE "${PROJECT_NAME}::"
+-	DESTINATION "lib/cmake/${PROJECT_NAME}")
++	DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
+ 
+ # Install
+ 
diff --git a/meta/recipes-support/libgit2/libgit2_1.8.4.bb b/meta/recipes-support/libgit2/libgit2_1.9.0.bb
similarity index 60%
rename from meta/recipes-support/libgit2/libgit2_1.8.4.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.0.bb
index 63986fcd130..47a63ca2862 100644
--- a/meta/recipes-support/libgit2/libgit2_1.8.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.0.bb
@@ -5,8 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.8;protocol=https"
-SRCREV = "3f4182d15eab74a302718f2de454ffadb1995626"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
+           file://0001-src-libgit2-CMakeLists.txt-install-cmake-files-into-.patch \
+           "
+SRCREV = "338e6fb681369ff0537719095e22ce9dc602dbf0"
 
 S = "${WORKDIR}/git"
 
@@ -19,3 +21,7 @@ EXTRA_OECMAKE = "\
 "
 
 BBCLASSEXTEND = "native"
+
+do_install:append() {
+    sed -i -e 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/cmake/libgit2/libgit2Targets.cmake
+}
-- 
2.39.5


