Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8AEC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 10:46:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.114796.1669632400142866417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 02:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Isvo77IO;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ud5so24710696ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 02:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dgsz/+TUXhKcuxQNx3pO9I+WbTWnUaoJ/n7+Lnbxm44=;
        b=Isvo77IOQCvaLDUP0TG1lTiFtXjnT0OX9QLzmsrZqQbbtF4IwXbztDjzPbJ2zIO7kd
         4eXQyUlJo8FurPjh9Radi7aCRN781LeP3PQiLlb+ABc+K/IuU7y7RVFBipRqLV+YwcX5
         9EFIrDRUHP3LJTCV3KUSRT372TPtnHJKhRWVnF0VbTaa4T1nz+KiYnFPEQKlice+VKRc
         +3DsVB0UPAmJDdhC+3i9/+oWxAzc03Bd2XmNC1Cxl+UYwULTCl6tVXPQF65L9+cdaoa0
         +Na08B2NkeB1kgw+B8WIZjUMrdJK9haLgGKcVHABsRJBUQrOcck/yipEkJNz9Y+cl7WV
         wtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dgsz/+TUXhKcuxQNx3pO9I+WbTWnUaoJ/n7+Lnbxm44=;
        b=7URqfLfwO+Ex5iVvU1wqO1hijhtiiW0Ymacsygsu0MxObDwuvXXZE4KIH3Q0SU5na+
         kU9xXoK3IaGjy2MrVHcM0ncNwLWYKTM78bHbg5ItfyEuhdSO+Fez1Tdgvep6uBNCDruD
         ueeDTYD2WFitqINKV24cQynY/rezMntLbHYTbpVbZI6YbvEqbg3Zk0uKZKL85CNXsEWt
         yd+04ywH2n1PEEKuxI5sMxx9f+Y4LTUhGewTMj+TIZI8NwkC+RmNcl5OxksR1hOMTwWY
         Q8T8pKAlEEWD9kGXeaVj9x50wW+g36ssZQaBxjw3LYyx8M4A6TzHFxPCjKp5sFmXcF5q
         gZiw==
X-Gm-Message-State: ANoB5pmLL2JbzmP7/2JgHc+ys8uCQIIDQ6met4FGldcVGbuoNContD0V
	Mk8cRLRTkpEtFfCNsdBQMossg0+HXGA=
X-Google-Smtp-Source: AA0mqf7YescEp2Vql34VFOEuT0dWi1bQZkBMtdAP0mY1N2OExA1vPi4KAWS6e3DLfO2Gq915MvVkyg==
X-Received: by 2002:a17:906:8994:b0:7ae:ea4:583c with SMTP id gg20-20020a170906899400b007ae0ea4583cmr42448047ejc.587.1669632398506;
        Mon, 28 Nov 2022 02:46:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090676c800b0078db18d7972sm4776707ejn.117.2022.11.28.02.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:46:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/3] selftest/runqemu: reenable the nfs rootfs test
Date: Mon, 28 Nov 2022 11:46:33 +0100
Message-Id: <20221128104633.52375-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128104633.52375-1-alex@linutronix.de>
References: <20221128104633.52375-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173904

With the previous fixes the test can be run again,
and it doesn't need all those extra steps. Runqemu
takes care of everything automatically now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 58a4526df6..c2c3fbc924 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -199,22 +199,12 @@ class QemuTest(OESelftestTestCase):
             qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)
             self.assertTrue(qemu_shutdown_succeeded, 'Failed: %s does not shutdown within timeout(%s)' % (self.machine, shutdown_timeout))
 
-    # Need to have portmap/rpcbind running to allow this test to work and
-    # current autobuilder setup does not have this.
-    def disabled_test_qemu_can_boot_nfs_and_shutdown(self):
-        self.assertExists(self.qemuboot_conf)
-        bitbake('meta-ide-support')
+    def test_qemu_can_boot_nfs_and_shutdown(self):
         rootfs_tar = "%s-%s.tar.bz2" % (self.recipe, self.machine)
         rootfs_tar = os.path.join(self.deploy_dir_image, rootfs_tar)
         self.assertExists(rootfs_tar)
-        tmpdir = tempfile.mkdtemp(prefix='qemu_nfs')
-        tmpdir_nfs = os.path.join(tmpdir, 'nfs')
-        cmd_extract_nfs = 'runqemu-extract-sdk %s %s' % (rootfs_tar, tmpdir_nfs)
-        result = runCmd(cmd_extract_nfs)
-        self.assertEqual(0, result.status, "runqemu-extract-sdk didn't run as expected. %s" % result.output)
-        cmd = "%s nfs %s %s" % (self.cmd_common, self.qemuboot_conf, tmpdir_nfs)
+        cmd = "%s %s" % (self.cmd_common, rootfs_tar)
         shutdown_timeout = 120
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)
             self.assertTrue(qemu_shutdown_succeeded, 'Failed: %s does not shutdown within timeout(%s)' % (self.machine, shutdown_timeout))
-        runCmd('rm -rf %s' % tmpdir)
-- 
2.30.2


