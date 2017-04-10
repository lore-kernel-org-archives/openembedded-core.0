Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F0ABE72F54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3AJOTcN004736; 
	Mon, 10 Apr 2017 20:24:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UPNuOHQLoK3T; Mon, 10 Apr 2017 20:24:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AJAPCm003934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 20:10:26 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cxehl-0001Gu-ND; Mon, 10 Apr 2017 20:10:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 20:10:22 +0100
Message-Id: <1491851424-4848-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] oeqa/selftest: Don't use cleanup-workdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 19:24:31 -0000

cleanup-workdir isn't a partcularly good way to attempt to cleanup after
tests and in some cases is actively breaking the workdir. Whilst this is
a bug in cleanup-workdir, I'd prefer it didn't break tests, particularly
when as far as I can see, these calls are "belt and braces" and don't appear
to serve a specific purpose. If this introduces bugs, we should fix this
bugs.

For the purposes of history, binutils-cross-i586 gets run do_fetch to
do_populate_sysroot by:

$ oe-selftest -r devtool.DevtoolTests.test_devtool_virtual_kernel_modify

then:

$ oe-selftest -r oescripts.BuildhistoryDiffTests.test_buildhistory_diff

wipes out the contents of tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/
but does not wipe out the corresponding stamps, then:

$ oe-selftest -r runtime-test.Postinst.test_postinst_rootfs_and_boot

needs binutils-cross-i586:do_populate_lic and if and only if this is
unavailable from sstate, it fails since it thinks the source is already
unpacked when it isn't resulting in:

WARNING: binutils-cross-i586-2.28-r0 do_populate_lic: Could not copy license file /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/git/COPYING3.LIB to /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/license-destdir/binutils-cross-i586/COPYING3.LIB: [Errno 2] No such file or directory: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/git/COPYING3.LIB'
ERROR: binutils-cross-i586-2.28-r0 do_populate_lic: QA Issue: binutils-cross-i586: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/git/COPYING3 [license-checksum]

and similar errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 --
 meta/lib/oeqa/selftest/oescripts.py    | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index d155f64..a6e0203 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -163,7 +163,6 @@ class BuildhistoryTests(BuildhistoryBase):
 
     @testcase(294)
     def test_buildhistory_buildtime_pr_backwards(self):
-        self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
         error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1.* to .*-r0.*)" % target
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
@@ -175,7 +174,6 @@ class ArchiverTest(oeSelfTest):
         """
         Test for archiving the work directory and exporting the source files.
         """
-        self.add_command_to_tearDown('cleanup-workdir')
         self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
         self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index baf3b6a..c2e2b45 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -41,7 +41,6 @@ class BuildhistoryDiffTests(BuildhistoryBase):
 
     @testcase(295)
     def test_buildhistory_diff(self):
-        self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
-- 
2.7.4


