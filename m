Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AA1D56D87D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:08:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Nov 2013 09:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,783,1378882800"; d="scan'208";a="392388027"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 27 Nov 2013 09:08:14 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 69C016A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:08:12 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 19:08:52 +0200
Message-Id: <0f9a62fa531d66285c06be2035199e39a2222713.1385571298.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/4] lib/oeqa/selftest: buildoptions.py: add simple image build tests
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
X-List-Received-Date: Wed, 27 Nov 2013 17:08:23 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

Build images and tests different build options like RM_OLD_IMAGE
and for WARN_QA/ERROR_QA behaviour.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 86 ++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/buildoptions.py

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
new file mode 100644
index 0000000..f99dda7
--- /dev/null
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -0,0 +1,86 @@
+import unittest
+import os
+import logging
+import re
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+import oeqa.utils.ftools as ftools
+
+class ImageOptionsTests(oeSelfTest):
+
+    def test_incremental_image_generation(self):
+        bitbake("-c cleanall core-image-minimal")
+        self.write_config('INC_RPM_IMAGE_GEN = "1"')
+        self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
+        bitbake("core-image-minimal")
+        res = runCmd("grep 'Installing openssh-sshd' %s" % (os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")), ignore_status=True)
+        self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
+        self.assertEqual(0, res.status, msg="No match for openssh-sshd in log.do_rootfs")
+        bitbake("core-image-minimal")
+        res = runCmd("grep 'Removing openssh-sshd' %s" %(os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")),ignore_status=True)
+        self.assertEqual(0, res.status, msg="openssh-sshd was not removed from image")
+
+    def test_rm_old_image(self):
+        bitbake("core-image-minimal")
+        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
+        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
+        oldimgpath = os.path.realpath(os.path.join(deploydir, imagename + ".ext3"))
+        self.append_config("RM_OLD_IMAGE = \"1\"")
+        bitbake("core-image-minimal")
+        self.assertFalse(os.path.exists(oldimgpath), msg="Old image path still exists: %s" % oldimgpath)
+
+    def test_ccache_tool(self):
+        bitbake("ccache-native")
+        self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")))
+        self.write_config('INHERIT += "ccache"')
+        bitbake("m4 -c cleansstate")
+        bitbake("m4 -c compile")
+        res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
+        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile")
+        bitbake("ccache-native -ccleansstate")
+
+
+class DiskMonTest(oeSelfTest):
+
+    def test_stoptask_behavior(self):
+        result = runCmd("df -k %s" % os.getcwd())
+        size = result.output.split("\n")[1].split()[3]
+        self.append_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},%sK,4510K"' % size)
+        res = bitbake("core-image-minimal", ignore_status = True)
+        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output)
+        self.assertEqual(res.status, 1)
+        self.append_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},%sK,4510K"' % size)
+        res = bitbake("core-image-minimal", ignore_status = True)
+        self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output)
+        self.assertEqual(res.status, 1)
+        self.append_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},%sK,4510K"' % size)
+        res = bitbake("core-image-minimal")
+        self.assertTrue('WARNING: The free space' in res.output)
+
+class SanityOptionsTest(oeSelfTest):
+
+    def test_options_warnqa_errorqa_switch(self):
+        bitbake("xcursor-transparent-theme -ccleansstate")
+
+        if "packages-list" not in get_bb_var("ERROR_QA"):
+            self.write_config("ERROR_QA_append = \" packages-list\"")
+
+        self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
+        res = bitbake("xcursor-transparent-theme", ignore_status=True)
+        self.delete_recipeinc('xcursor-transparent-theme')
+        self.assertTrue("ERROR: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output)
+        self.assertEqual(res.status, 1)
+        self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
+        self.append_config('ERROR_QA_remove = "packages-list"')
+        self.append_config('WARN_QA_append = " packages-list"')
+        bitbake("xcursor-transparent-theme")
+        bitbake("xcursor-transparent-theme -ccleansstate")
+        self.delete_recipeinc('xcursor-transparent-theme')
+
+    def test_sanity_userspace_dependency(self):
+        self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
+        bitbake("-ccleansstate gzip nfs-utils")
+        res = bitbake("gzip nfs-utils")
+        self.assertTrue("WARNING: QA Issue: gzip" in res.output)
+        self.assertTrue("WARNING: QA Issue: nfs-utils" in res.output)
-- 
1.8.3.1


