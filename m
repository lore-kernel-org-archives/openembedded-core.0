Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0328C001DB
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.4372.1698836501923027881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQNnJitT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9adb9fa7200so153634266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836500; x=1699441300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSqyakKWBqyAbj66llYYtVkov0kjtdI2bTgvrxP9Dfo=;
        b=FQNnJitTZVZ82Zj82hsrRew2eKi+eB1lD2dq73hA4Hq6uMqvkz2foyAgd8r/6rSb78
         Zpi8DPj5h5Qt+sevUX8LDPmnu/3Dh2xQiYSLOREVmBANogpn0G0NWd2VdpzIupHYC3ey
         IV86V1uyNvqijQgQJSpZpVNjBhBIdTIsiJseRJ4XYr7iMvDPqSJ159kLksttEbAINi6e
         a3PAzIaktjdx+serdkdNN9xzr/NPY9CwBgp+0NmJUV0xT1SGbxpMNS5s9hsQ1A3GUCc3
         nZeOQ+YPLNNNDeS+5q2J1zy0j8AHHt+ygGR1V/uOB4LWCCedqLqHp4URnIc2CnRcdmH+
         ILIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836500; x=1699441300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSqyakKWBqyAbj66llYYtVkov0kjtdI2bTgvrxP9Dfo=;
        b=mX/5nT5AVAfkjlLd3CUWLbW9CCfRFXT8rsXwzI547samI/r/NQXQ9pz05GD06poHtc
         0xCGx55jRzix+pIPOXFzQVvHGg/T9Zuq2NvrYjzKfu0va8+LoBtMJUDIDDfXdlJCDRtW
         3ZvrqM1+xUYVUE5gEQCPW8zjH10WRbllvPa77U1ErUZ8v03jux4O/U+6YNVzhsv+GUGh
         KzG8s7joZY9bmN16cPYrCpeFsGUBs1NEXIt7uC0cTGdIhDQt/FXOXUV6qcv4R5o+4rag
         xs4DAxaGtfJ4u0yMaBtELT+thS9mmOURoowCTBea5gGZWgHnFMhgnCD6IeUBDvNkMRzS
         ndiQ==
X-Gm-Message-State: AOJu0YwImkoKLfITnQBUX4JizyGl3Xo2024xteVwJ/xTccfNVkFr3rAn
	fHavPYxeVsMIRG6KBaNMZWa8LYsTcUI=
X-Google-Smtp-Source: AGHT+IFwy7ihhAeMUKhxAAHhFqMSfnY7OgK7iLQ3bQONbgVqe4YO5hyMEPbrc46oRUT/xYl716lgEg==
X-Received: by 2002:a17:907:7daa:b0:9bf:952d:a8ad with SMTP id oz42-20020a1709077daa00b009bf952da8admr1682478ejc.5.1698836500053;
        Wed, 01 Nov 2023 04:01:40 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:39 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 2/8] cmake.bbclass: support qemu
Date: Wed,  1 Nov 2023 12:01:23 +0100
Message-ID: <20231101110129.647878-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101110129.647878-1-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189901

Define the CMAKE_CROSSCOMPILING_EMULATOR variable similar to what the
meson bbclass does. This allows for example to execute cross compilied
unit tests on the build machine.

CMAKE_CROSSCOMPILING_EMULATOR is a semi colon separated list of
paramters which could directly handle the -L and the -E parameters.
Creating a wrapper script is not absolutely mandatory. But anyway lets
do it similar to what the meson.bbclass does and also disable pseudo.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index d978b889440..911c237a3fd 100644
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
 
@@ -156,6 +163,19 @@ EOF
 
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
 CONFIGURE_FILES = "CMakeLists.txt *.cmake"
 
 do_configure[cleandirs] = "${@d.getVar('B') if d.getVar('S') != d.getVar('B') else ''}"
-- 
2.41.0


