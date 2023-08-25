Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C237EE49BE
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:43 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.2725.1693002460863427181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IoB6Gw67;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9a2a4a5472dso324398166b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002459; x=1693607259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=IoB6Gw67+xLV6mrubFbf7qnw6WxWNxAv0dXaiBlpI+vMFWiHAWnmUi4ADDajeX4Ijp
         E+0Tjx8BBGXmSUgBzAOeSFtM3XBK+G/DfODrxN/bDYCFr59P9JYiDkH7Og2kZpJlOcB4
         YNqtbkebAiZskrz1Ss0YQt3lllRUA4pVxIb11AtoApcVxEjl0kaECWz1w4a3/VkOR3Lk
         L8ZSQ68d3cdSqC+PrvXYHXjFWJtQlYKnAHdhtW9jwTxv93PuaOBiulg/OZLCDmdP/7VP
         RvYLLWb3sZVxONS6xlPoMYviS++J5p8+gm0wjwLVO1Mg7wNDUWujozmkg7g9s+r2GMMp
         4cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002459; x=1693607259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=Ms+muhn+c/jn+6cJ9u37b1/PYwLbpp3hmf/RirM6FDfssP7cyqdED3adg7aniGsJ4y
         4N6yk68+k7eCX9V74/PEElTUp2Nvd5z6PcK/ESkYPGfXcIqbVbujxej2hz0NLYE/Ceh7
         3v/IOklfioA7RZ1N3xmPS3XhHQwSmdQhObgKh0CO52M9iIoUQqOtgilZLnC4JixCUJ6m
         01nGK3APv841LGn3+hrY+12dMvJX6lrhP0IWjmJ8CmH1xk6+kJfoOIIquZ8XLF997gKW
         rZuKAkcys2Ff7jXftOvphV+DYRx5joFfbQOlxi21G2io6L2J1Ve54Epnj5C1slLBmMtF
         +u/g==
X-Gm-Message-State: AOJu0Yx9pXL+OOOju2Z0y/UdbVs+NzBJCZPLnTDO436omm5wBMEzcw9A
	Jm0M27s7vKxSoMwIoqeGXgwaXiJAZ60=
X-Google-Smtp-Source: AGHT+IFlPnJCclV0t/FEEBjh+zo8ZVdMjfrNgK/ZuPsRIVlfkGvXGUf9EPBgduPK/7XOB5VID0CYfw==
X-Received: by 2002:a17:907:6eab:b0:9a1:e5bf:c907 with SMTP id sh43-20020a1709076eab00b009a1e5bfc907mr8700390ejc.2.1693002459077;
        Fri, 25 Aug 2023 15:27:39 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:38 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 04/13] cmake.bbclass: support qemu
Date: Sat, 26 Aug 2023 00:25:44 +0200
Message-ID: <20230825222711.2735745-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186730

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


