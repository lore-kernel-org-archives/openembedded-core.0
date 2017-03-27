Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A8CB5600BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490610099; x=1522146099; h=from:to:subject:date:message-id;
	bh=rg7GVAvlHeHBK/tjKo86Xw6XhWYsyjqCCK4GYbZL6HE=;
	b=Ma4ror9fUBqStdZp2JNDVPj57XHpFwIzLozH0FotOcDxq65KPXlk1o0i
	dc+X6KKhhC1+KmeUXR5eGpGaH9riMA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 03:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,231,1486454400"; d="scan'208";a="1112502437"
Received: from slarkin-mobl1.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.11.154])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2017 03:21:37 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:21:32 +0100
Message-Id: <20170327102132.14731-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] oeqa/selftest: don't use cleanall in selftests
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
X-List-Received-Date: Mon, 27 Mar 2017 10:21:38 -0000

* devtool: oeqa.selftest.devtool.DevtoolTests is taking 4 or more hours on the
  autobuilder because the cleanall call deletes the tarball of the kernel
  source, forcing a large clone which is especially long on an NFS mount.

  The cleanall invocation isn't really required here and switching to clean
  instead should avoid hours of re-cloning the same repository each time we
  run oe-selftest on the autobuilder.
* buildoptions: We only need to ensure the first image isn't an incremental
  image, clean will suffice here.
* runtime-test: no need to clean up the artefacts generated during the test,
  let's leave that to a higher level process rather than using the cleanall
  hammer.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 +-
 meta/lib/oeqa/selftest/devtool.py      | 2 +-
 meta/lib/oeqa/selftest/runtime-test.py | 6 ------
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 7ace747..d155f64 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -16,7 +16,7 @@ class ImageOptionsTests(oeSelfTest):
         image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
         if image_pkgtype != 'rpm':
             self.skipTest('Not using RPM as main package format')
-        bitbake("-c cleanall core-image-minimal")
+        bitbake("-c clean core-image-minimal")
         self.write_config('INC_RPM_IMAGE_GEN = "1"')
         self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
         bitbake("core-image-minimal")
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index a160c83..7f9efe6 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1654,7 +1654,7 @@ class DevtoolTests(DevtoolBase):
 
         tmpconfig = os.path.join(buildir, '.config')
         #Step 3
-        bitbake('linux-yocto -c cleanall')
+        bitbake('linux-yocto -c clean')
         #Step 4.1
         runCmd('devtool modify virtual/kernel -x %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')),
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index ea31c18..e498d04 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -193,8 +193,6 @@ postinst-delayed-t \
                            present on rootfs dir.
                         4. Boot the image created on qemu and verify that the file
                            created by postinst_boot recipe is present on image.
-                        5. Clean the packages and image created to test with
-                           different package managers
         Expected:       The files are successfully created during rootfs and boot
                         time for 3 different package managers: rpm,ipk,deb and
                         for initialization managers: sysvinit and systemd.
@@ -237,7 +235,3 @@ postinst-delayed-t \
                     sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
                     result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
                     self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
-
-                #Step 5
-                bitbake(' %s %s -c cleanall' % (rootfs_pkg, boot_pkg))
-                bitbake('core-image-minimal -c cleanall')
-- 
2.9.3


