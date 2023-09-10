Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA33EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.39052.1694362762488749539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZMbZfBZm;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-403012f27e1so14704985e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362760; x=1694967560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MND5e5KB4OZVVC644V91vwSuJuyFeLqIvR4uWSLBv8M=;
        b=ZMbZfBZmnwW9Hzgc2tNVkT2AmUYYYf6o4Y6rvhigBaneGZT1EK4+SCAzjDxan570r/
         eApfk6vVMHAO9vRCRrtwUEgke5fni6504PPu+9sLLdkkbsGLbCvLp4eACCMBmkO8HX1W
         y17y5HblSQe0Wgo3iZKMemIQa31fEYraLAnuPmMSwsqEIohIazp67M+eVmnNbCeCARzY
         JrbvYgmwjjLO5k2Hggr5+2y8Gcuj/5wSerFaIMF+k0nYHj2KbCmInitkFjSMyMe7ACRU
         bF1UhV8x3DYqPteag9xW6Uoe8V/YbVu8/12xy05JYyuY68NVcqbaYWCQxygQW6jqlZoo
         1sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362760; x=1694967560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MND5e5KB4OZVVC644V91vwSuJuyFeLqIvR4uWSLBv8M=;
        b=Zezray+pUW//MNbZsO0gFc+1XjkaYAJW6k5lsAk4YuJOydkldYBVGu71c3xM01c5tt
         3SCrZ6yVC7RJl7Va8ODt/i9LkwbzIeTs3wKGwWmCZVGsmfCzDmzLWLHPDaZmpfZ5eTio
         4W8Z6T8IfcBXLA/8TAb3B6DhG3kxh8row/qbQWEj/gENUI5Br9u1UbhGtYTMZLCeMz//
         Yn7LG8JwLqgKewOxw2dqudpWPwZDikvEo32l6E7d97yNHMavNseakw4x5KX1RjHQX2oA
         /UglG0dkad7URgxA6sDcsdrYx8pjhdqAlxWCTtEB8oDcCQyJZN4uZxCVVpp6yK2NkOc3
         a2Wg==
X-Gm-Message-State: AOJu0YyjbM5gzqCu4AmFGla/PAPfrLoKh5fKNu8XbV0/b7tAukAEE6T+
	jZhWJ2nGyQ7qJxPb+dlQPxzl1E8j1eI=
X-Google-Smtp-Source: AGHT+IFKqgZrEpch04uvYpKubASpAN4LOlVQQZwEItbIqvr5JdXknWgEtCXGMgzBbX67VWCyY8MzsA==
X-Received: by 2002:a7b:ce0a:0:b0:401:d803:6250 with SMTP id m10-20020a7bce0a000000b00401d8036250mr6381898wmc.5.1694362760445;
        Sun, 10 Sep 2023 09:19:20 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:20 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 02/12] cmake.bbclass: support qemu
Date: Sun, 10 Sep 2023 17:52:28 +0200
Message-ID: <20230910161850.4032227-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187460

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
index 41748b08207..68b4e83bbe8 100644
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


