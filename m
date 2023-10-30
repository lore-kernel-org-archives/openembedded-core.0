Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9499C41535
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:32:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.171473.1698701533375043471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/YmzKwt;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40859c46447so33023135e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701531; x=1699306331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSqyakKWBqyAbj66llYYtVkov0kjtdI2bTgvrxP9Dfo=;
        b=O/YmzKwtfqNFL8J089orFriH3ou7oGD+r/XPI43SxUrvjq4M7f49rIueFyQ6TDDV8d
         0qtz3DQLb2HRq8WdCYvoEsZS0k13DWbctPP7JCKvyVZxcTmpiV/OQ0/GBJqnH6Gjzqqo
         ABhZYlZXFEwZWA5RDeYLr7plM5Ni7OJ8otmGGaSflWuhAE3o6BAJsMdF0fG62dCrx3Rr
         Ygehe24D01qoRstu8eE0Df3Am2d12f/FiXbaVhpp9enEmbFgGfR2nzd9giFyAXGvT8xW
         2R2hVcHnvIPyOgh9+4oQSUAKP6IqZqLpy+rqc6T2n36ipRhN35P5Mtj/XkS+mnUqSwvr
         lPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701531; x=1699306331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSqyakKWBqyAbj66llYYtVkov0kjtdI2bTgvrxP9Dfo=;
        b=ICD37IfCY1QIdSTLNWtOpvCj/Ga7KHYl7dNDaFXQMiKdaJd7uwTRQ0EXLZ1tphuOCF
         jgZI+sEm1C83ZBchrDGg2m8ycs0bQoi2eHs5Zm06fTIr3MKi/ZypSGkUqqf2vKKF5MtO
         zBBdux+7CXSalPLh2nK3HYq7W4s7FLvFOZXf3NyxpdDbyLq6OihTh5Xo9YHR4UtpZmEk
         eyVA7B/spGq7NRYXw8jneVGYvTwIuAMrmWWXkHRVbI0xj/vIhiGAbl0dYkGnn6Ga9WXj
         swfb7+lIdBIpt/O5MEAB9my/MQskV8f6S7MK5yKQ2xa0K79qN3aCWgtDg3WOf7IZJD+W
         DjOA==
X-Gm-Message-State: AOJu0Yw+JO2DZBfZ5U9m//2qhh0bQZCEO6FTiDn75enqQNEHmv3e0hZq
	F9+dmp0hk4Eq3JtRghjaer5VVLbnLZg=
X-Google-Smtp-Source: AGHT+IGCjaf9oNKpGWao0yl6QIMTu/B4VprQllMO0db2/lIOlm5l5QAgoYyN01dOk3/t4+sKF3WMvw==
X-Received: by 2002:a05:600c:1d95:b0:409:375:5a44 with SMTP id p21-20020a05600c1d9500b0040903755a44mr9076476wms.24.1698701531284;
        Mon, 30 Oct 2023 14:32:11 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003fc0505be19sm304811wmq.37.2023.10.30.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:32:10 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 2/8] cmake.bbclass: support qemu
Date: Mon, 30 Oct 2023 22:31:59 +0100
Message-ID: <20231030213205.2824790-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
References: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189814

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


