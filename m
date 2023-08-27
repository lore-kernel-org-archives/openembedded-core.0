Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEFDC83F15
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:29 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.4404.1693164748232795670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X3h2sLni;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a5b26d8e3aso33388566b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164746; x=1693769546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=X3h2sLniOE8w3ncpycMIBFWkzcJ8VuNNU8D1Kb5SrBInm+TF5Z2PEMmIbuYbeW+Bxk
         NFu7ILSTTC0Bn1xnyEjBeVWke5rp2L/AAwTnTVjulMndS034dWU75tB5ELvoyVQORSEy
         u/bST7596CQZwdmhvOii32jIvQdsml26AwmYpInR31VE29xTtannB9nrJAVrHJyIjpul
         TSm2dx9iFrBT+a4xTl5yx+45h5yjeOzu0xLEu9a4rfwkx3Bg1TUWBIC7eBdN1+4gj/DP
         ILBmPcqb5j++LgNIVZP1s2LYsCgHTRZ/8yzEKZcfeCxK8Fx3li9WtGX6ji0WOhJ8nOmb
         1sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164746; x=1693769546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpKqPHwYxKAzegLAS3aWmgTgfZUPe4SjRDBu36GJbTs=;
        b=FLVvH8F50COn9ndl7lD1/sKXsWC4HxXqYNtx5BS1HtFzrd21A9hwi3HDxynA/7k4KM
         zWObWC/QuSXX9KAqCD2exmqh1+REV/28/EQ8aP9NngXFEvkz6GFHQijrw73bmBCkXcm/
         Z7F5a9TdIOcGaKUZqVPWeF3vWDWoAxEti6Xa27XQjkFmS74ESL5wDKC9ufBjhAjOK00c
         dXaryCl6rZqiGDFRcqQt/jnzOqp/b+qD+mjfSTM0NgyX/BAdMCnGIrX3ugs/+uXA1A1N
         ri377ze/vKgYBTEv5jKIdm9HeaKFyYcOVncuEVc9z9xf1DgEmmGjaJaAc6jqOqGw+4is
         15Dg==
X-Gm-Message-State: AOJu0YyA0V1/bsLgLsfSPc7s9fcDOlW7vN/9ySuqcKvQkoyiBOzR3dcX
	oNZpAjsS4W+jMaAo1gefWMQbS6sCX9Q=
X-Google-Smtp-Source: AGHT+IEMSxoC7JLotbNJbF7YsDNLKBvKc/9wEdDN4MKZowKnSOexwWYMjk8vlg1DBGjE2b8E+qE2og==
X-Received: by 2002:a17:907:60c7:b0:9a3:faf:7aaa with SMTP id hv7-20020a17090760c700b009a30faf7aaamr6363787ejc.15.1693164746241;
        Sun, 27 Aug 2023 12:32:26 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:25 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 04/13] cmake.bbclass: support qemu
Date: Sun, 27 Aug 2023 21:29:46 +0200
Message-ID: <20230827193200.4083340-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186784

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


