Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F37BC761A6
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.18077.1678709754344914061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VfdrSJKZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id ek18so16709199edb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lJ9GTn+ROGH2KBTGtr7eqmRluYH0fC3ZnPmyMTcw0A=;
        b=VfdrSJKZf4jCbw6hx1LNt73HCvvrWpNNJMN7DtYxI4CJBBXfqFwiX/2bpHGn8mfmAq
         6uQoJLRDT0eLjyer5cfSaLx/fg5B6OkGDx5CKS4PiicSgIs40zuYHaWcyrqgtALtu9Bq
         1hulTb+9Yz53JhUzowz6eBQ341t3L7c9sn8ZcEcjwP89Hmm9SnTDKOR47EvWK0sfWNEL
         rwz/0bmBmAGvMJAfNDEfHMbgpnGNdn5Bh1Bqkxidw+FBkcmquaeEx0KPiXvdwe2uXoof
         cY8RZi7mcmHjtZF8jgi2H4k2cG1M87NCUM1KDymyU0M5UaIL1YRcn6hvG3enkP9OgYbe
         9jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lJ9GTn+ROGH2KBTGtr7eqmRluYH0fC3ZnPmyMTcw0A=;
        b=Yg/8MjHnx1Js8s+/hBFqdNXoyrv48Y4sMhcu4qF2H5DO6nRCKacxa+nDZ2GIvhP5IF
         6wF8Y5xUVlj8gzhUQaANbrmimJ89qL7a62dHcty5hlqjE+09NdYfJzCOSQ9XZv7AWVmw
         5gkMpkDxHxAEyenHSGMBjh86Be3ICqywm78hecdNilHpLwU+4RHqwPZtr2Yun6dvAYwX
         yH8KNTiiSdZTzowUnTNj13IyHV7J0GpWfzlcC+oh77/2G5VFHiTGMf6b8EZ9kBeh4haX
         xtlwdZxdtE4fkP7R6KTIz4JRve+O+5kVIjRRLjkhXxwroq46Ow3i8aLFBpBYM1EiIojT
         NsIQ==
X-Gm-Message-State: AO0yUKXJRsm7E0Eu8W08fO6H+WKxMv8FE5CIkbCbxUSSivFVpt3mdBZY
	XOa3n9OVv7VdZ9pfi1gWS+e/tymz0O4=
X-Google-Smtp-Source: AK7set+MW/1wl62vNhqr1w4LlYV+KlvJrGDk+8kylYzIyXjkY3jou9tqzTPZota6yweHai0JTeZkHQ==
X-Received: by 2002:a17:907:7b83:b0:925:9900:2df with SMTP id ne3-20020a1709077b8300b00925990002dfmr6212218ejc.35.1678709756071;
        Mon, 13 Mar 2023 05:15:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906399900b008cda6560404sm3333837eje.193.2023.03.13.05.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] selftest: runqemu: respect IMAGE_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:32 +0100
Message-Id: <3272c0f7bb3829eee4ff5a69546071ee08237eff.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178436

* don't assume that every built image is named:

  <recipe>-<machine>.<suffix>

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index c2c3fbc924..e72ff529c4 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -24,6 +24,7 @@ class RunqemuTests(OESelftestTestCase):
         super(RunqemuTests, self).setUpLocal()
         self.recipe = 'core-image-minimal'
         self.machine =  self.td['MACHINE']
+        self.image_link_name =  get_bb_var('IMAGE_LINK_NAME', self.recipe)
 
         self.fstypes = "ext4"
         if self.td["HOST_ARCH"] in ('i586', 'i686', 'x86_64'):
@@ -127,7 +128,7 @@ SYSLINUX_TIMEOUT = "10"
 
     def test_boot_qemu_boot(self):
         """Test runqemu /path/to/image.qemuboot.conf"""
-        qemuboot_conf = "%s-%s.qemuboot.conf" % (self.recipe, self.machine)
+        qemuboot_conf = "%s.qemuboot.conf" % (self.image_link_name)
         qemuboot_conf = os.path.join(self.deploy_dir_image, qemuboot_conf)
         if not os.path.exists(qemuboot_conf):
             self.skipTest("%s not found" % qemuboot_conf)
@@ -138,7 +139,7 @@ SYSLINUX_TIMEOUT = "10"
 
     def test_boot_rootfs(self):
         """Test runqemu /path/to/rootfs.ext4"""
-        rootfs = "%s-%s.ext4" % (self.recipe, self.machine)
+        rootfs = "%s.ext4" % (self.image_link_name)
         rootfs = os.path.join(self.deploy_dir_image, rootfs)
         if not os.path.exists(rootfs):
             self.skipTest("%s not found" % rootfs)
@@ -167,8 +168,9 @@ class QemuTest(OESelftestTestCase):
         cls.recipe = 'core-image-minimal'
         cls.machine =  get_bb_var('MACHINE')
         cls.deploy_dir_image =  get_bb_var('DEPLOY_DIR_IMAGE')
+        cls.image_link_name =  get_bb_var('IMAGE_LINK_NAME', cls.recipe)
         cls.cmd_common = "runqemu nographic"
-        cls.qemuboot_conf = "%s-%s.qemuboot.conf" % (cls.recipe, cls.machine)
+        cls.qemuboot_conf = "%s.qemuboot.conf" % (cls.image_link_name)
         cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
         bitbake(cls.recipe)
 
@@ -200,7 +202,7 @@ class QemuTest(OESelftestTestCase):
             self.assertTrue(qemu_shutdown_succeeded, 'Failed: %s does not shutdown within timeout(%s)' % (self.machine, shutdown_timeout))
 
     def test_qemu_can_boot_nfs_and_shutdown(self):
-        rootfs_tar = "%s-%s.tar.bz2" % (self.recipe, self.machine)
+        rootfs_tar = "%s.tar.bz2" % (self.image_link_name)
         rootfs_tar = os.path.join(self.deploy_dir_image, rootfs_tar)
         self.assertExists(rootfs_tar)
         cmd = "%s %s" % (self.cmd_common, rootfs_tar)
-- 
2.39.2


