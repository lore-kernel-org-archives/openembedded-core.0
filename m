Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5916BC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 07:33:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.88445.1701070425560118477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 23:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ks9uiNEL;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40b4023ea99so9773025e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 23:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701070424; x=1701675224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCm/Zn63CnIOoiDBAN7q9Oa6Z57+bLkRXP6DoMYe2oI=;
        b=ks9uiNELU/vxCvhICROO2vA3Veok+ox0g8VVyHr79hg2JtGr1vzDLvkBxaDrfxGBWm
         VITzqCxeXvRutaeHZP8WJXFWDq5GmWKkpvmp+sVmocg/TKe9Es1DadVCZOO3T3LRMR6v
         spV8Q44AeXHy+gwMEuY+gJwGfO3Ofo0gP7uPxcx4Lf+dmIgA6Trv1LQUy/zF/ROqMQlo
         3r6rdnwyz0jIVBg7X8iYwA4hvu8sRnTum5NfcB6RYhHNTA2dFYrjN3i5sUjtWcqOPmVe
         t+epG+AfVBgaAyoF1T61wtUqT2lYJqZEMCmsH1/MlWChGRRfWuu/VcwgqYIcRsAymVbJ
         wJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701070424; x=1701675224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCm/Zn63CnIOoiDBAN7q9Oa6Z57+bLkRXP6DoMYe2oI=;
        b=aiWudOrmQA3DFzHNQG0FWItpWOAqtj+mrLuvNaBQmSBiVjUCITXyKncCdHVtZJkB9f
         mEAkTOx3Uy5L6WPDV54yfoaKCnGpMS0/HfSB5uvyuIU5NFKDt9z4jHA93dMwqA+qieeJ
         N/23ToilfIA7TqPlP88r2oDn8Ndlrjqq0SqDqloKdMfDb0963yALwMZsLEbRL5IgCs4p
         DtiKYyKGJ0xhjbQPO+U48xqxJtp2AgG11dPQHLe8siBn2y189YW8c/W4WdfoMcI8ce/T
         cAJqTloTNUzCpqg5lDbAtY/ZhuNPGn+kmHygbWvAFyA2A164kRXAQtlUQYKsbDx3ar1a
         PclA==
X-Gm-Message-State: AOJu0Ywtncr6rFqsb92qDM1p4+H+17dZd2YzeHUBIU7irrrHejLR8zu6
	tJqupcZOeiBkUBGqacblUyrUM3vwdbc=
X-Google-Smtp-Source: AGHT+IEw+t1P32Q3XuWvwoLQQB8zbVXZ0/arWEqRVKsbSMxqcwh/tjFeiwSCBKWzx/iU7ZnL3BDO8g==
X-Received: by 2002:a05:600c:4589:b0:40b:357c:bb9f with SMTP id r9-20020a05600c458900b0040b357cbb9fmr3831732wmo.33.1701070423637;
        Sun, 26 Nov 2023 23:33:43 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b0040b461550c4sm2710497wmq.42.2023.11.26.23.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 23:33:43 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/1] cmake-qemu.bbclass: support qemu for cmake
Date: Mon, 27 Nov 2023 08:33:31 +0100
Message-ID: <20231127073337.630358-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127073337.630358-1-adrian.freihofer@siemens.com>
References: <20231127073337.630358-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191261

Define the CMAKE_CROSSCOMPILING_EMULATOR variable similar to what the
meson bbclass does. This allows for example to execute cross compilied
unit tests on the build machine when using an SDK.

CMAKE_CROSSCOMPILING_EMULATOR is a semi colon separated list of
paramters which could directly handle the -L and the -E parameters.
Creating a wrapper script is not absolutely mandatory. But anyway lets
do it similar to what the meson.bbclass does and also disable pseudo.

Further information can be found in the camke documentation in the
CMAKE_CROSSCOMPILING_EMULATOR section.

Keep the code optional, as the core does not need this function and does
not intend to use it in the future.

[YOCTO #15214]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake-qemu.bbclass | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/classes-recipe/cmake-qemu.bbclass

diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
new file mode 100644
index 0000000000..482ad91895
--- /dev/null
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Not all platforms are supported by Qemu. Using qemu-user therefore
+# involves a certain risk, which is also the reason why this feature
+# is not part of the main cmake class by default.
+#
+# One use case is the execution of cross-compiled unit tests with CTest
+# on the build machine. If CMAKE_EXEWRAPPER_ENABLED is configured,
+#   cmake --build --target test
+# works transparently with qemu-user. If the cmake project is developed
+# with this use case in mind this works very nicely also out of an IDE
+# configured to use cmake-native for cross compiling.
+
+inherit qemu cmake
+
+DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
+
+cmake_do_generate_toolchain_file:append:class-target() {
+    if [ "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}" ]; then
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
-- 
2.41.0


