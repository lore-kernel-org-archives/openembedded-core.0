Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DD2CCA489
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:39:38 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.11458.1658515168552939762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qTAf14tb;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l23so10019619ejr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ApLkMAsvtvuW3lLfkcuZOiBTHFW5KtHbpzX5B9uYltc=;
        b=qTAf14tbuCDW0v+8ewi8ay0/IiWraNWErb0waWHZBQFitSh6BAzDWum5NCnLSBddQN
         442kTVFZweWKJprKoOtzSqWBbnbafoo8Jk9HYkSCOAbwT7IY3s7y0S9G4tQcnz0iT/iU
         kRNtfrfGbMaOhIeblQqJ6BHo9tsOGxDnngjEwkSZtuCsVbAvsMoiJR7IvWYSzUJzA0w6
         XpQngN8RvcL7EyWnKFx5wSnAFQiV5FLSmpYC7whqMb53+v8Nzfp+dCBklRxvpkiSFZDx
         V3ReJuJ3HbSaarZnCVnEY+1Gj4BRa/TS4p/vpqrSVDEdef0f6GtNIBC3Np69tm1xoNit
         dUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ApLkMAsvtvuW3lLfkcuZOiBTHFW5KtHbpzX5B9uYltc=;
        b=nauhhhWYR21eWFqj/2Mk+xId5+COYFAUaXzRQ+Sr81H4/4YJ+AFUEfiAWYXIYNPQO3
         Z3HYkylgSSWRg/8hqzET/zqoU8bA0aqGjACNCX43EGsET3EzYn8KGKp4ma/Cgdo6DIKv
         wtuveejTXdA2t3u4Q9AOjlfAYZurugcu4yE0aC20gthx0sCRr4LU/rNt/bnyV1PrnxU7
         iJhtLx/lr5i0J5rGSdon1OAFW2wDsUQVx3BT17goVFqJXiqTe2DJl9EwMT29/ctun6f6
         HRaBpD3HA3Yk/2l9Gy9wpKmVR/eNpsGL0JoPZn+0XohedbYCLJC8WcsVgjw11e9Mgsin
         g+Fg==
X-Gm-Message-State: AJIora+YXZKrrIj3zgClaHf+K1YaA7ByTC/JyfbpgQx3Mh/uvt0Qp/3+
	UgatTn2QpEqcWUNnl+N1zc8EaLRBTow=
X-Google-Smtp-Source: 
 AGRyM1vfSdhdcMRDAHlmVQkTJF1o13FQd0FX5X449TPWfWWD09Pz60J2FjOMo5FU/dXJ6j8IWnYzmg==
X-Received: by 2002:a17:907:738a:b0:72e:8510:6bfd with SMTP id
 er10-20020a170907738a00b0072e85106bfdmr882000ejc.688.1658515166999;
        Fri, 22 Jul 2022 11:39:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bt8-20020a0564020a4800b0043bba5ed21csm2931885edb.15.2022.07.22.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:39:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] meta-ide-support: adjust to provide (e)SDK experience
 directly in a yocto build
Date: Fri, 22 Jul 2022 20:39:12 +0200
Message-Id: <20220722183916.360600-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722183916.360600-1-alex@linutronix.de>
References: <20220722183916.360600-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168419

Specifically:
1. Add a few more toolchain items to DEPENDS so they're available in the recipe sysroot.
2. Use deploy mechanism to place the SDK environment setup file and testdata for testing it
into the image deploy directory.
3. Add ability to run SDK tests via the testsdk class and task. This also requires providing
a testdata json file.
4. Ensure sysroot population always runs, as those items are mean to be picked up
by 'bitbake build-sysroots' into the unified sysroot.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/meta/meta-ide-support.bb | 26 +++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 39317d50e0..7f349f673d 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -2,11 +2,13 @@ SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native"
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
 PR = "r3"
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit toolchain-scripts nopackages
+inherit toolchain-scripts nopackages deploy testsdk
+
+TESTSDK_CLASS_NAME = "oeqa.sdk.testmetaidesupport.TestSDK"
 
 do_populate_ide_support () {
   toolchain_create_tree_env_script
@@ -18,4 +20,22 @@ python () {
     d.appendVarFlag("do_populate_ide_support", "file-checksums", " " + " ".join(searched))
 }
 
-addtask populate_ide_support before do_build after do_install
+addtask populate_ide_support before do_deploy after do_install
+
+python do_write_test_data() {
+    from oe.data import export2json
+
+    out_dir = d.getVar('B')
+    testdata_name = os.path.join(out_dir, "%s.testdata.json" % d.getVar('PN'))
+
+    export2json(d, testdata_name)
+}
+addtask write_test_data before do_deploy after do_install
+
+do_deploy () {
+        install ${B}/* ${DEPLOYDIR}
+}
+
+addtask deploy before do_build
+
+do_build[deptask] += "do_prepare_recipe_sysroot"
-- 
2.30.2


