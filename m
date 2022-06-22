Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29FFCCA47E
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.5891.1655894024757097547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mw1UiA5u;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id fd6so20487221edb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A9DPE0vwLHHMEmDegh18Iy6FVm/Ysif1VhWWqi0KCB8=;
        b=mw1UiA5uBID00smWuwiwC2oV7nJX4ACzc+wtPndElu1H8Gg8w+2HDekr4GAuKH3AvZ
         oQG46Ax0Lxj+8HsopMDBu+AwClzqpYbPLgJ8TlhuP4Y5QlVOa6vT9d/Gzhq2zhblAxnu
         yDLm1HrVUlwFDbfe9e/GtQ/8uXqfrNYi4OSRcvV8wQQgf1VcVA4U2Q1ZG9v8FD2vlI4L
         rHPVLwnlVEXJzJl/H0+ShVFjxQZx5pBN6bsUrCYKj2Ik7tpwuo69O+qzCIQHDdEaSxDr
         CiJkdT1O18Pw2Ds06UzVUFQg1NY9J0F/U+2Uql+2WWuzVZuKEKtyBwGtSa1MbqhhTClc
         jFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A9DPE0vwLHHMEmDegh18Iy6FVm/Ysif1VhWWqi0KCB8=;
        b=U5S4BFsqGaTVUO3R7s987SASO0oQ06uKY8FVwD+hyB7Wbhrb0fdXv76oErCm0EqxnI
         y5bmHCh9TGzpFbItn08hCViQluisad0Xbymwd5ngxyPjIYAVRNv04n3yIYXMDRBZPGM1
         jOFFXAQLvAVX+vkmdEDcBch4j4kSsavYuALHZ9Wq+FuPonYIXf9uofdRIbh2ca9ogUKB
         8pgP7ZVfA+Gv2EmAsZlXrPmbMbQGqC8TEmdJgrXvQqJXFmgvH2nRkEYAnwdIevJFzNrF
         xXdzmKdg7UITWQ6ljo8gB/l5oHeFZuvGb2yz7sPhO6TwXalFd1MMqOpQ5l5JptbkgN5r
         vOPg==
X-Gm-Message-State: AJIora9W1vMNSe12DuozSwZFYGQNmy9JPadh8es8mnCo4YpWOtfSBNbn
	I5RhjlnLKZFLaUCwA134A/dzx2gTdW9LbQ==
X-Google-Smtp-Source: 
 AGRyM1vuNrDyNyrH/CyzugTNGIgrx1P1BG6lv5RifAQGN9NKpWMVe2dRl624+ZaaNpZVRXRXMjnASA==
X-Received: by 2002:a05:6402:606:b0:435:72af:4680 with SMTP id
 n6-20020a056402060600b0043572af4680mr3255838edv.224.1655894023270;
        Wed, 22 Jun 2022 03:33:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 2/6] meta-ide-support: adjust to provide (e)SDK experience
 directly in a yocto build
Date: Wed, 22 Jun 2022 12:33:08 +0200
Message-Id: <20220622103312.1098389-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167228

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
index 39317d50e0..3d480c71d4 100644
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
+do_prepare_recipe_sysroot[nostamp] = "1"
-- 
2.30.2


