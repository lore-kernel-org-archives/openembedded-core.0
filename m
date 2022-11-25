Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955E2C4167B
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 21:16:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.57036.1669410965786160499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 13:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBS254P6;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id x5so8482029wrt.7
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dgsz/+TUXhKcuxQNx3pO9I+WbTWnUaoJ/n7+Lnbxm44=;
        b=RBS254P69bdjB7TJa7dxYFv/8jGPUNJ3HGWqmWG86DUhIPk+VaxUHo4bNQ/3BrQeGy
         3PdCaEEnyJ44jVt9cPGrxiYpIFeuXVCMSek4HAd306ptsAIiP3zgvV0rcqNMlwkj30g/
         tJkSHprwjNLUn0B7CKfkX6KbvFbSNahOmhjTk1zQgveTnfu7iIrOPOt+7DATC/EQB5Ao
         OZ4iBO/HTXKxV84t9eUkbBUliVNnMr56aJvsBCaPSmqYoVNjYa825BnKKZAFAFWAADXR
         OUtAGdvT3kZ4Atvj+6UK9AXUhMiFhqlPeqrtN88zbxFLEZ4UvDcNUzfTSuHb92WsrYaj
         eSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dgsz/+TUXhKcuxQNx3pO9I+WbTWnUaoJ/n7+Lnbxm44=;
        b=FWj739pqT+WFLn0b2bkWdSlPT5IIuYN8Ei8r5ac3UQOBuScHJQK6hdR2pcJu+bWZ3e
         0C9UfuhQ5/wwRPYDChwOmN4SK3Zo0CxzbrROh08NKm+UtfrvnuHuVePQLGh2LXMRsCJr
         m6cSfrB3wg9GeirDiDMiVi8IGQZlfwPfzXJvMT1I/y+Jy2UGQ0mIpUAcJuP3oYxoLtaA
         go2njbzzAALCW+6u/DQi1MJpalIQBMz3p15NxiONXnB1vXdj8TMgimgSA/MGO1dVsb0s
         D/9brRqp8OEdNFkT9oWgr6GLsjFsdBSK1A0szlEDQsqc7F3D4thOgDCCSihJgF/Ms07d
         51wg==
X-Gm-Message-State: ANoB5pmMS5opLCH50NBVB3Ato/ZJVZM+Pxup9uD2s3yk8W0+Of7gR0W2
	oCFjm1X9ANSYgMrHbPPoQfLtF/Sx+QU=
X-Google-Smtp-Source: AA0mqf6HuaDWlfHv+yI4kkRE1jwUxX0uN5Ge9aS9SNJ0ie24fFpZWOQMaReTUEpJgOPGk/t2NtbE4w==
X-Received: by 2002:a5d:4a43:0:b0:241:e16c:180 with SMTP id v3-20020a5d4a43000000b00241e16c0180mr13391437wrs.379.1669410964264;
        Fri, 25 Nov 2022 13:16:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c5441000000b003b4cba4ef71sm10068863wmi.41.2022.11.25.13.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 13:16:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] selftest/runqemu: reenable the nfs rootfs test
Date: Fri, 25 Nov 2022 22:15:58 +0100
Message-Id: <20221125211558.20985-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125211558.20985-1-alex@linutronix.de>
References: <20221125211558.20985-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 21:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173787

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


