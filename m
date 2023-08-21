Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E93EE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:57 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.1055.1692634307134454338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lqsi5w2u;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52a069edca6so1789916a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634305; x=1693239105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=lqsi5w2uLwGX2jZtO17lamac03+Wpg35/3tguqCm5sBsUD6DsFiT8AT5L2lg7+8NPH
         uZf25hwRL3uRwigbeYKuLaFlemi7M9xf7i1PXqr8jR6aL6vycWt+MgwVlI5gPV86yHC8
         ekk4w9xnJVSDqDcBwSwBmkBNTe3iGFVwWn6jgc4DtP1D81hYtH+X9WCVIlwN2ybacvpT
         00aM8Ttp8GcHDSHx2rjxCT1B2MXV6UidfjCsuUZUpzAoMbwbjdlT81tr6Ey7oPxNQywv
         OaZdGV4/X3Pr0Cfrwmdvz1dMTdL7KV2e7kDFdb8V8H5QR5sPltcbCwS8urnlaxUlMjkU
         OQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634305; x=1693239105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=aXfcJh+y5+kxcpqy0WIVkYtcYddiiSFjIXZ2RsmvKjImfKANvRwCt9lLkrywhSd01q
         DWYffKs59SYFxSchDA/gb+5hdKzJX1MBCGI/Z1mIAqVRaFszlz87kXGj/h1wihBR7iNo
         O/auV3quDnP2lyS0V0PdK2lFxOGimlFUtHWjHek5c0dQBOeJ7LJnxKKsl6Ibjs4JCcr3
         kUQ/wcT2IW8m7iMzk0T1gaUOGK9O6oLYs3MXzNTkpHRqKD48NTsxBxJS0zTDOu1FQ95T
         v4Z+BZpivHHTLey6+FcblhyI/X4p4d07broq0ORdZiXBzVEDjC+xAY0iOObylAb8KN4q
         trag==
X-Gm-Message-State: AOJu0YzN2NdoeATTESeHwsMdV4QbTpCwJXItGcN6XFxPgVjLtZpednvy
	NKgGt2+wC/SX1XlBKuTBF0NE+kyBYBY=
X-Google-Smtp-Source: AGHT+IGq1G7TSSmxal+L4Al0zheeYLPSZLA67woAh+Rz2yCNcPqNb+WWVB2tXOiY4z+xaoIa8e5sCA==
X-Received: by 2002:aa7:d058:0:b0:523:406a:5f6 with SMTP id n24-20020aa7d058000000b00523406a05f6mr5357235edo.12.1692634305409;
        Mon, 21 Aug 2023 09:11:45 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/14] cmake.bbclass: support qemu
Date: Mon, 21 Aug 2023 18:07:08 +0200
Message-ID: <20230821161120.171956-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186468

Define the CMAKE_CROSSCOMPILING_EMULATOR variable similar to what the
meson bbclass does. This allows for example to execute cross compilied
unit tests on the build machine.

CMAKE_CROSSCOMPILING_EMULATOR is a semi colon separated list of
paramters which could directly handle the -L and the -E parameters.
Creating a wrapper script is not absolutely mandatory. But anyway lets
do it similar to what the meson.bbclass does and also disable pseudo.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index c63b0a80b18..944b0d8fefd 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -4,6 +4,13 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit qemu
+
+EXEWRAPPER_ENABLED:class-native = "False"
+EXEWRAPPER_ENABLED:class-nativesdk = "False"
+EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
+DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
+
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
 
@@ -156,6 +163,20 @@ EOF
 
 addtask generate_toolchain_file after do_patch before do_configure
 
+cmake_do_generate_toolchain_file:append:class-target() {
+    if [ "${EXEWRAPPER_ENABLED}" = "True" ]; then
+        # Write out a qemu wrapper that will be used as exe_wrapper so that camake
+        # can run target helper binaries through that. This also allows to execute ctest.
+        qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+        echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
+        echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
+        chmod +x "${WORKDIR}/cmake-qemuwrapper"
+        echo "set( CMAKE_CROSSCOMPILING_EMULATOR ${WORKDIR}/cmake-qemuwrapper)" \
+          >> ${WORKDIR}/toolchain.cmake
+    fi
+}
+
+
 CONFIGURE_FILES = "CMakeLists.txt"
 
 do_configure[cleandirs] = "${@d.getVar('B') if d.getVar('S') != d.getVar('B') else ''}"
-- 
2.41.0


