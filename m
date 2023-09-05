Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D9BCA1001
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.27270.1693933175706388320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=USDUtvQt;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so27196405e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933174; x=1694537974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MND5e5KB4OZVVC644V91vwSuJuyFeLqIvR4uWSLBv8M=;
        b=USDUtvQtD16ql6FqCdlDZ4IwVvvjXxeuGvFK8RLeycYPh/8/UATlrxvHQViPGyVit9
         IT4j/ScyCM9m3oOlq9Pp2wrR202HlBvORq5yO1m5vOSFA7QO2wfsbTZ7ZWablqg2Uvjg
         KLz+VwvLOVRvlWPZAMoRwPGbAXfkAMgNHK3HqYMefIOdZ60USpODLzRouA70+Bb1rkNV
         iOVMlTr29Zivj+Qaz2V/IyxD6o+iSjLmv4SMLONOVXWKr5BDjhPMOSQCAolg+oLHEEt2
         h+4MPXFzIPRD+ENRGC/LMiqUbFodMK6QSNaSMS7sLpwaKDOEn0cekgV1Qhm1iCssALcj
         pRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933174; x=1694537974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MND5e5KB4OZVVC644V91vwSuJuyFeLqIvR4uWSLBv8M=;
        b=JsSbr37rhDvwVirrWdJi5VEldNNHrcYFBXz2lyIKbB1f1ZO9yYu959ViOj4XnnG8ad
         laLyPE8DK7t2UUrXXLuPfiwZnzxaMIzfqY+aDSo5Tfcs1otOhJBheJOayrGGGvK4+RbI
         c77EZPiXasXKe48Txf79RuVwl35ebB4fZmtF5avmkUH9eGYmuCjGWHub+OmxmCS07kri
         XJcxkQLi5DVFwrpHEFDkuw5RzS1YdDpPF7JRh2QJqX02qrvJHkUDpmaJIWlaq6Yus/55
         jfPPyYRvAV+9xMYmVjwWRycvQ/ETmMkRt1odMVjgKnxqDBtA1UXDMRYHo/3z90SjkxjW
         FfkA==
X-Gm-Message-State: AOJu0YzDKSl6tLERi3+Ex/Y3mP3YfvyApFVWxoHtzs+PZzyIQbfIOeAO
	wu2Zq3C4RgJAgKG76yiTIZYHyfvEL0Q=
X-Google-Smtp-Source: AGHT+IELhxbbFhMS2Ulgp3bvPQir6oUaGUYP7t4Vj49T8MkpMAMio0dYisiFj4COveTUSM0AkVLamA==
X-Received: by 2002:adf:f3ca:0:b0:317:57f0:fae with SMTP id g10-20020adff3ca000000b0031757f00faemr299472wrp.63.1693933173837;
        Tue, 05 Sep 2023 09:59:33 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:33 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 04/14] cmake.bbclass: support qemu
Date: Tue,  5 Sep 2023 18:51:13 +0200
Message-ID: <20230905165913.2560907-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187236

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


