Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BFBCD5852
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:41:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3216.1767782473708248894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ml6i+iWY;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AEA26013A;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23688C19421;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782472;
	bh=pxuPL0iJkN3Z51zKqj5fi1ouJgc6JxuxqWvep9tq2+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ml6i+iWYQAM2PQafHi0+Ymxsj4iqwRah0+zOMvvocw7nc/kvhDKWBUV39ls7ofwaw
	 4EafoZdt8Lj8r2bSYCBPEBfq+Od7v6atPmN8JCMcvTMEV08Jx2lSlFI+xekw4nxHt6
	 C4KVlL3EHTsobL9KYE1hS79+4bKsl2NIzqIwhZkm7ZOLVSplz84Reur1BcmRANbr/5
	 nbTsXAE3LQ9DxExV0WLXYX6rL0C7bbfc6OZKy1fgmMgCmDBfSBxN9rCMXoBy5rtlzN
	 GLRqNgUN38KysbLFHsB7ZRnpyQUyCIgEVHFFEZ4TausRbGv+yjVFqE/9/S5g0LQ6WV
	 W+Wpls0zsyu6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C94CD5852;
	Wed,  7 Jan 2026 10:41:12 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Wed, 07 Jan 2026 11:40:50 +0100
Subject: [PATCH 1/2] oeqa/selftest: wic: improve extra-partition plugin
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-extrafiles-v1-1-a4ddd07df231@non.se.com>
References: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com>
In-Reply-To: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, pierre-loup.gosse@smile.fr
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767782471; l=5257;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=TXFcnKkeJtla53OEj3/yR9MX04AZNof2m0CxbS1o3Q0=;
 b=CRpFu7C29cye0qzvKJqSqv+xeFdvypl9FUBpEPrrnsPUf2uqONLACuM7mLqVnExt8a2m8yy+F
 1EotONqtJKMCQHlWlYCLbCEiJnP5xthWlHy6gbQsn+mZaV7mA7fyZC4
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228988

From: Louis Rannou <louis.rannou@non.se.com>

Increase the number of inputs to check several files can be copied. Change
the partition type to GPT in order to avoid logical partitions.

Test various file systems and check the wic image partitions match.

Simplify 'wic ls' commands (remove pipes) and use '-n' to specify wic-tools
sysroot and avoid host contamination.

Also dedent the code just after the wic image is built to close the .wks
temporary file when its goal is achieved.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 47 +++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d7a9b14658..55fb8dfd1b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1658,7 +1658,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         """Test extra partition plugin"""
         config = dedent("""\
         IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
-        IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
+        IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf bar2.conf;foobar2.conf bar3.conf bar4.conf"
         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
         WICVARS:append = "\
             IMAGE_EXTRA_PARTITION_FILES_label-foo \
@@ -1668,36 +1668,53 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         self.append_config(config)
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
-        testfile = open(os.path.join(deploy_dir, "bar.conf"), "w")
-        testfile.write("test")
-        testfile.close()
+        # Write test files
+        for testfilename in ["bar.conf", "bar2.conf", "bar3.conf", "bar4.conf"]:
+            testfile = open(os.path.join(deploy_dir, testfilename), "w")
+            testfile.write("test %s" % testfilename)
+            testfile.close()
 
+        # Create directory foo/ and testfiles within
         os.mkdir(os.path.join(deploy_dir, "foo"))
-        testfile = open(os.path.join(deploy_dir, "foo", "bar.conf"), "w")
-        testfile.write("test")
-        testfile.close()
+        for testfilename in ["bar.conf", "bar2.conf"]:
+            testfile = open(os.path.join(deploy_dir, "foo", testfilename), "w")
+            testfile.write("test %s" % testfilename)
+            testfile.close()
 
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
         try:
             with NamedTemporaryFile("w", suffix=".wks") as wks:
-                wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n',
-                                'part / --source extra_partition --ondisk sda --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
+                wks.writelines(['part / --source extra_partition --ondisk sda --label foo --align 4 --size 5M\n',
+                                'part / --source extra_partition --ondisk sda --fstype=vfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
                                 'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n'])
                 wks.flush()
                 _, wicimg = self._get_wic(wks.name)
 
-                result = runCmd("wic ls %s | wc -l" % wicimg)
-                self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
+            result = runCmd("wic ls %s -n %s" % (wicimg, sysroot))
+            partls = result.output.split('\n')[1:]
 
-                for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
-                    result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
-                    self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
+            # Assert the number of partitions is correct
+            self.assertEqual(3, len(partls), msg="Expect 3 partitions, not %s" % result.output)
 
-            self.remove_config(config)
+            # Fstype column from 'wic ls' should be fstype as given in the part command
+            for part_id, part_fs in enumerate(["fat16", "fat16", "ext4"]):
+                self.assertIn(part_fs, partls[part_id])
 
+            # For each partition, assert expected files exist
+            for part, part_glob in enumerate([
+                ["foo.conf"],
+                ["foobar.conf", "foobar2.conf", "bar3.conf", "bar4.conf"],
+                ["bar.conf", "bar2.conf"],
+            ]):
+                for part_file in part_glob:
+                    result = runCmd("wic ls %s:%d/%s -n %s" % (wicimg, part + 1, part_file, sysroot))
+                    self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (part_file, part))
+
+            self.remove_config(config)
         finally:
             os.environ['PATH'] = oldpath
 

-- 
2.43.0



