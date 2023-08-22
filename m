Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFCDEE49B2
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:45 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.5235.1692732220908345092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iHpimXJZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bbac8ec902so75741671fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732219; x=1693337019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=iHpimXJZuLZGksF8qcmAO9ZWaeqOPQC+u35ieT3vwFSx0/da6R5/7z3yHbYI+m/8/v
         pxxVEexTki37mjMeMgTZHESjSGFl3K97OTgwvV7tFHyokJqbccGHW8m4g1sOBoRj/Lk5
         +c1tjSUvXROLUaYXg0SDDqwgAlqkQwewn+HR3qqhrnnV363fRGq7wXR+E/KwyaODyBMZ
         IYPw2R0HurPOAYw0nd4mIQW7PjsBT2HlkYD+FEypOliGRogZimPsI8PLeRtiJfQUmpOH
         n82Hg/itBRRV8VbK7V9KdtGgWNa2VG35b+toT7J0gFGxhd1E1AnSLEl/utrXUiSMWDvv
         qSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732219; x=1693337019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=L8uZf2WC8zSUYITyT9ufwg3oJyxSY28lSElqNsjy5FL9vrn6r3/cC23K+C7OyLwWPS
         VKkACX/uMsNT4wXhmcL4x+cmHVUo2SOnQoPAlWizMJWM7Isc7tWe73csdNQRR0DbnLlu
         v8BN51n6rtCAE5Tub0q26kDXvXmvNpTQqJ2jFoXe9vzt0LFo+vAJBAKeSAgP8Z4AZBb4
         HA4Iy1ikKAWxDmaxYCC9l95BXV2WYu9v+yHl/JEjeKmxjROQyx/Zdq6gTDkzfWj2ncAy
         mSr3JzWIoqGUHTZWvqNMOyX22vBy62ckgJ6OqLFcAEGdNg3spiDMeLoqFWhtTwZu7Nft
         WxjQ==
X-Gm-Message-State: AOJu0Yy0loFsz7BOi/r+W17uWNJlXjF3rpjurwHmAVPvLurmdcFAtDID
	ZrlIYGklIlFIV9zLnj+sVRHBriQpq2M=
X-Google-Smtp-Source: AGHT+IGI9umM2n4fiivQTZqDQlVllxzwvVoOmelJXSA70QriQh+vE3eax5tJ12YbRQ3nmoBSNmXrEA==
X-Received: by 2002:a2e:6e0c:0:b0:2b6:eb5a:6504 with SMTP id j12-20020a2e6e0c000000b002b6eb5a6504mr7945252ljc.18.1692732218463;
        Tue, 22 Aug 2023 12:23:38 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:38 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 04/13] cmake.bbclass: support qemu
Date: Tue, 22 Aug 2023 21:20:10 +0200
Message-ID: <20230822192300.3235896-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186527

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


