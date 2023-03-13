Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7127BC74A4B
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.17700.1678709760911844287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SHk8oXWK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id cy23so47743087edb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njhpSlO+dH1xrPJ+Lg6kD+yHdRQzV3XMF4BU10W/xhw=;
        b=SHk8oXWKmxcO2CKtxbLSMr+mmTVaHLiC0F4IgHXiv685IwA/5cgUKcrJ3/m/m7mYym
         r2VIhhI3oUsUS2mEdfkIZ0p3vT6qaU2dR/0yb4qhAUG7LRK1UnXPRG3FVMIEZRbzH7O3
         u5wM+A1+MZwsPu9rqUz4PCvepmKF4cy4NBvtGpZYsYIr7rV5PhY3Ugmd71V7P3NNAx2H
         6OYFG72PygKXXQqmzyNXa9kq+Hlk7gbd1QVsjjH4nHxnWnkFM42f4u8+i131KjAb0BGs
         7JyBgblvhHnIn8yeDAlXRY7mkSdd2tUJalABpzBJi5nYoXpaRCzQN0lj6PBKGrJEC/4d
         6T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njhpSlO+dH1xrPJ+Lg6kD+yHdRQzV3XMF4BU10W/xhw=;
        b=wiCxCzXxjK2gjzqtsx0aRL4KEzBe0DNEvIPEKoP/7XfRjbpPXRzewxXmBDRLAZehNV
         ooHTzLB03r5u0srMlrmY4JdvyQ16ffAmIOSNl4hkik8q3Aoj0OsiYsAJ7bOjdAGbyEKo
         FF88XBgdfVqUEArcxf44jbnjR0QOhv4zaX9WEXUAQFoU3WAHn2oPZjL4UuV8E0hdZR/F
         /D7ngd+THL+dzUrXK31452JWZmcS/zeR3iI6ocGVUHCNluQK/h3CY5YWgY0DOLrPJPoQ
         sVjkckFltRejcn7FkeJe1DmMW6PybztNVDJ7V2G6hPhuId/FpEOghfyaozXZt2swFV0U
         a3xg==
X-Gm-Message-State: AO0yUKVNnK2i6tF45QVmObGn4Ytv4TgS3BLes742LWjkEObI6q10y/cp
	LAXG9ll0sgiyjtwqCfNXwIhusCar2jk=
X-Google-Smtp-Source: AK7set+KuPT2nzIC/4Yyen89yZJ13lmwo9Cva97y3jQrRJEBBgxXRkHY60Z46+2Hr3M2iunOp/VHsQ==
X-Received: by 2002:a17:907:c25:b0:8b2:fb3d:95e6 with SMTP id ga37-20020a1709070c2500b008b2fb3d95e6mr41128622ejc.74.1678709759430;
        Mon, 13 Mar 2023 05:15:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d3-20020a50cd43000000b004bbb691a334sm3179208edj.2.2023.03.13.05.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] selftest: gdbserver.py: respect IMAGE_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:37 +0100
Message-Id: <631e960b15079d04c24a407810c2af2bd6bf1416.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178442

* use IMAGE_LINK_NAME instead of hardcoding
  core-image-minimal-${MACHINE} assumption

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 3621d9c13e..9da97ae780 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -10,13 +10,12 @@ import shutil
 import concurrent.futures
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, runqemu, runCmd
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars , runqemu, runCmd
 
 class GdbServerTest(OESelftestTestCase):
     def test_gdb_server(self):
         target_arch = self.td["TARGET_ARCH"]
         target_sys = self.td["TARGET_SYS"]
-        deploy_dir = get_bb_var("DEPLOY_DIR_IMAGE")
 
         features = """
 IMAGE_GEN_DEBUGFS = "1"
@@ -34,11 +33,13 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
         r = runCmd("%s --version" % gdb_binary, native_sysroot=native_sysroot, target_sys=target_sys)
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
+        image = 'core-image-minimal'
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
 
         with tempfile.TemporaryDirectory(prefix="debugfs-") as debugfs:
-            filename = os.path.join(deploy_dir, "core-image-minimal-%s-dbg.tar.bz2" % self.td["MACHINE"])
+            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
-            filename = os.path.join(deploy_dir, "core-image-minimal-%s.tar.bz2" % self.td["MACHINE"])
+            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
-- 
2.39.2


