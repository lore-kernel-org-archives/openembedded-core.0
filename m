Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D291CCFA18
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 01:31:42 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17697.1762651892970379906
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 17:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K738JtF9;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so318632a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 17:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762651892; x=1763256692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=boPCJzsFJDgVVYhq95ydsy5ub2FPY5VO04kjbhhLVUk=;
        b=K738JtF9TRVkcO/Sikg5Pxgm8JebFlgC1W8aQo3K7veOzcVPDWcra5pYGxu1pVp/cj
         GpGOvmF/DelfKD1ib7bPSpLkew/ZuEROu5hfO6fVzmf6b4Ndfft6G97F+9uWhgNS6LDd
         69PpkhZ/A7LLqJK8IJYrLB/2SfogKL7C36ANZ3Ee/sTTPsCGEONKcB4s/u/lag+wbt+G
         Kav6Y+nxqK2VTPRNNooSFf2iTbcJKu5pYrtCzWc3vtg+lb2ix38RGqz+qS1TdjvaV5W6
         db+p8GiEpsFZ5ODT5PRzUALJ2XIzMR5o7/QyOO3QD2JrCaMQejq9z5kWXsXTsRYt8dZu
         11fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762651892; x=1763256692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boPCJzsFJDgVVYhq95ydsy5ub2FPY5VO04kjbhhLVUk=;
        b=SOt4IvhXUJKa5+ldkScC25v1rfvxnyqIZdy0bTRYxcv/hovWJR9eycVr8ebanDBiJS
         2DJtBU4HVJ+X1Vk8uItZ1y7mr8xr/qFg5GtPNhYlqVB/F8Qfgdy0NS65T2sgSMZywHzV
         QkIQlYBHwyVjpk8p4yEEgO2NCICbTHxkcX4BIct+dDBbMs97sDn6mrDinbKTTSVaMZCJ
         TMyl69eQPo7O37qUh+d1Rviadi4nGdiCznG31Sj8fKsm6cBbpgZ4IpXClVGtqkZ4W45Q
         lKFhEUQzxxZjnXgT9PSpBtBhFGEFr/QVvApuATAiMEuTM97vfFTyiCC6Geeflx8PS0cZ
         o8EA==
X-Gm-Message-State: AOJu0Yw9hGJVvaH7OBIyXi3nLrBW6v6jZeHuynlooGvwnRG5du+YHdVy
	quRS5HXP3wdbc9b6saVcvuHRcd/8Eu7Z+1q/auJIDB6Yo9t0rHdxsOqNW5V6ZQ==
X-Gm-Gg: ASbGncvXyvoUGY4KU7AH4R4YEP0cpRLDEDUIjgb9r2rdKoG2JRYmxhpHUSQ1IzCpHAX
	xWmyXpbpK78oUAxQ2ld/MXf6n5dgBPHK/pKF83rijEIydiPokU4erJ5aJ12GVw1u//R+V/IG2Ce
	IT+dHM+OxZvJq9HXi/8fIa2RgNJRjtq8HEx9qCVq51S/+CMk5phXpGwUCC4qz7bJkgzBm/Oiq8/
	JC8xaU61NgriF4pQdUvtxZVDGdgjviY+PzO07sbSG6lVY/oL/0rPj5z5pP8gCFuINOuACFn3Ju1
	SABGZCkxavjpOTLWjoBvI71nKUFd12XmQYvJhEcEMQ6EmK7xwuqT8tmp2exjnR4wRNUcpeXSgiF
	d2Y/UMs12QSRtwm+avCzow0gLJF2MgX2gOLaJrgmSZ3RwJf+w2NlnKtQEf9cOykZSSk9NWAm/A1
	fDQ36/N3ptepsdhzyri9k0V/lIaeGVqqZwLpE=
X-Google-Smtp-Source: AGHT+IEECgnJuZshbXz0oLVGoHoYwzHkrNL3QoSt/SfD6wJ/Ab9j2GgNtMAKaVz4/23GpsDovlor3g==
X-Received: by 2002:a17:90b:254c:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-3436cbf60f1mr4937908a91.23.1762651892016;
        Sat, 08 Nov 2025 17:31:32 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0adcb47sm5250697a91.1.2025.11.08.17.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 17:31:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2] nghttp2: upgrade 1.66.0 -> 1.68.0
Date: Sun,  9 Nov 2025 14:31:24 +1300
Message-ID: <20251109013124.2716313-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 01:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226087

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 26 +++++++++++++++++++
 .../{nghttp2_1.66.0.bb => nghttp2_1.68.0.bb}  |  8 ++++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
 rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.68.0.bb} (62%)

diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
new file mode 100644
index 0000000000..32adb05e07
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
@@ -0,0 +1,26 @@
+From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Sun, 9 Nov 2025 12:45:25 +1300
+Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
+
+Remove hard coded path to fix installation on 64-bit arch.
+
+Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 98e3dbe7..3b6a4400 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
+ set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
+ set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
+ set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
+-set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
++set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
+ set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
+ set(NGHTTP2_VERSION ${PROJECT_VERSION})
+ 
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
similarity index 62%
rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
index 49d6d7e632..dae7285c1e 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
@@ -4,8 +4,12 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442d430df97c6f9e631"
+SRC_URI = "\
+    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
+    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch \
+"
+
+SRC_URI[sha256sum] = "5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c"
 
 inherit cmake manpages python3native github-releases
 

