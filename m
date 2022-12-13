Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EDCC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.70635.1670929894870746365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D5Gbx7u9;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id w15so15198125wrl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0+fYSJC1bs2p0B6TLnR8KKDi9sOQlMpp7VbIq3qa2k=;
        b=D5Gbx7u9W9LUgXGLlug7+xC0s/D4a3qB0u3Dgvzc+gvI+1FJpTRBTRWxqn4IHtaWaz
         mRRkKQDhEoYGEKF656AdIdzIDPk2JUOQIeAxbijmrWnNQPSNsfldZ74cTkocqvKecm7Y
         euz6eul7DqoLrq5DWdayRx4aJA8ZQg6MV/emsrTJwKYy9HWEcjwsrNx0662CXF0KgCMm
         EeDq65bLq8wHWEuqBX2fKYM3gW9mObAMDpfDSENVFcmcueuDIkjVqzgihZBmNIcHEA7g
         3q6I3hPft7Ju9pj6E/TVCGO7gJpwla6svh3eg2p3+QvA/N9oZ1kRoTHTZ2aKQx3Y3MH0
         xmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0+fYSJC1bs2p0B6TLnR8KKDi9sOQlMpp7VbIq3qa2k=;
        b=oHTwdTTxO7i5OTxg6dfQjq93Ij2pVGDMSvmz7fJ6ERmf7lZ3Fmlw8HisVRGI7xQAk+
         5kMOGCT9AGXM4Dm2llUt/QHhZ8JU2SyDt/bQrHjzeyKaPGNCE+rPwcUbak4pJdhZXN1G
         aAKcgL4ZGZyPg8T9awWIiCvqzDhHBJf3NUU2OLBprLlrcLuoOxkRc8Y9SJXGplzgK8Uh
         PpdXyuFl+FKBLKMzX32IaVPNHSJ9qLXjosiZOM1b47rQSrsDhlEIk36vhCbAHECrQ7QW
         ETemM0zUi2qKJD9dl9GW4TvZWvCUbTZoykiLtxWrZptT2qT58T9BRmyCwOMSbMdYwSuA
         9hxw==
X-Gm-Message-State: ANoB5ploeomzbnfHy8efqQ7oTZ4Xmb+VqOUGvb1BdcK44pUs4nvuDed8
	EVXdKE83o9s33et0t3EITBxyXB5obrU=
X-Google-Smtp-Source: AA0mqf51at56b9xIP9XMzADZrK/fDG60WiOTxMV4WzENhdjJqVXupBD1QKeferOjm8a4nW08cVfSIw==
X-Received: by 2002:adf:dc89:0:b0:242:55fe:e055 with SMTP id r9-20020adfdc89000000b0024255fee055mr13087495wrj.66.1670929893339;
        Tue, 13 Dec 2022 03:11:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/24] cmake: always add local files to WORKDIR
Date: Tue, 13 Dec 2022 12:11:08 +0100
Message-Id: <20221213111118.149697-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174525

This reduces friction in version updates, as devtool can handle conditional
patches, but not conditional local files.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/cmake/cmake-native_3.24.2.bb | 3 +--
 meta/recipes-devtools/cmake/cmake.inc              | 4 ++++
 meta/recipes-devtools/cmake/cmake_3.24.2.bb        | 4 ----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb
index bcc87eb8f2..79b364909c 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb
@@ -3,8 +3,7 @@ inherit native
 
 DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native zstd-native"
 
-SRC_URI += "file://OEToolchainConfig.cmake \
-            file://environment.d-cmake.sh \
+SRC_URI += "\
             file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
             "
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 7561e851c6..151456e500 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,6 +17,10 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://OEToolchainConfig.cmake \
+           file://SDKToolchainConfig.cmake.template \
+           file://cmake-setup.py \
+           file://environment.d-cmake.sh \
 "
 
 SRC_URI[sha256sum] = "0d9020f06f3ddf17fb537dc228e1a56c927ee506b486f55fe2dc19f69bf0c8db"
diff --git a/meta/recipes-devtools/cmake/cmake_3.24.2.bb b/meta/recipes-devtools/cmake/cmake_3.24.2.bb
index bb7ed83e30..5959b0e552 100644
--- a/meta/recipes-devtools/cmake/cmake_3.24.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.24.2.bb
@@ -5,10 +5,6 @@ inherit cmake bash-completion
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI:append:class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://SDKToolchainConfig.cmake.template \
-    file://cmake-setup.py \
-    file://environment.d-cmake.sh \
     file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
 "
 
-- 
2.30.2


