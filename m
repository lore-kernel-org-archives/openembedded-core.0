Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 10C9D71A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 18:31:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,250,1477983600"; d="scan'208";a="54537366"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga005.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2017 10:31:52 -0800
Message-Id: <cc6a7fcca781a3a153ba5cfbfe7a45282a55f917.1484764234.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1484764234.git.randy.e.witt@linux.intel.com>
References: <cover.1484764234.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 3/3] selftest/containerimage.py: Add container IMAGE_FSTYPES test
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
X-List-Received-Date: Wed, 18 Jan 2017 18:31:57 -0000

This test checks to make sure only the files expected exist in a
container image. Currently only ROOTFS_BOOTSTRAP_INSTALL, gets added to
all images without the user specifying it.

But this test should help if a developer in the future ever silently
adds more than just ROOTFS_BOOTSTRAP_INSTALL, and that the developer can
make sure it also gets removed from a container image.

[YOCTO #9502]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 .../container-image/container-image-testpkg.bb     |  8 +++
 .../container-image/container-test-image.bb        |  8 +++
 meta/lib/oeqa/selftest/containerimage.py           | 57 ++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-selftest/recipes-test/container-image/container-image-testpkg.bb
 create mode 100644 meta-selftest/recipes-test/container-image/container-test-image.bb
 create mode 100644 meta/lib/oeqa/selftest/containerimage.py

diff --git a/meta-selftest/recipes-test/container-image/container-image-testpkg.bb b/meta-selftest/recipes-test/container-image/container-image-testpkg.bb
new file mode 100644
index 0000000..42014dd
--- /dev/null
+++ b/meta-selftest/recipes-test/container-image/container-image-testpkg.bb
@@ -0,0 +1,8 @@
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_install_append() {
+	install -d ${D}${base_bindir}
+        touch ${D}${base_bindir}/theapp
+}
diff --git a/meta-selftest/recipes-test/container-image/container-test-image.bb b/meta-selftest/recipes-test/container-image/container-test-image.bb
new file mode 100644
index 0000000..d5f939c
--- /dev/null
+++ b/meta-selftest/recipes-test/container-image/container-test-image.bb
@@ -0,0 +1,8 @@
+IMAGE_INSTALL += "container-image-testpkg"
+
+LICENSE = "MIT"
+
+IMAGE_FSTYPES = "container"
+IMAGE_LINGUAS = ""
+
+inherit core-image
diff --git a/meta/lib/oeqa/selftest/containerimage.py b/meta/lib/oeqa/selftest/containerimage.py
new file mode 100644
index 0000000..54e792a
--- /dev/null
+++ b/meta/lib/oeqa/selftest/containerimage.py
@@ -0,0 +1,57 @@
+import os
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake, runCmd
+
+# This test builds an image with using the "container" IMAGE_FSTYPE, and
+# ensures that then files in the image are only the ones expected.
+#
+# The only package added to the image is container_image_testpkg, which
+# contains one file. However, due to some other things not cleaning up during
+# rootfs creation, there is some kruft. Ideally bugs will be filed and the
+# kruft removed, but for now we whitelist some known set.
+#
+# Also for performance reason we're only checking the kruft when using ipk.
+# When using deb, and rpm it is a bit different and we could test all
+# of them, but this test is more to catch if other packages get added by
+# default other than what is in ROOTFS_BOOTSTRAP_INSTALL.
+#
+class ContainerImageTests(oeSelfTest):
+
+    # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
+    # the conversion type bar gets added as a dep as well
+    def test_expected_files(self):
+
+        expected_files = [
+                    './',
+                    './bin/',
+                    './bin/theapp',
+                    './etc/',
+                    './etc/default/',
+                    './etc/default/postinst',
+                    './etc/ld.so.cache',
+                    './etc/timestamp',
+                    './etc/version',
+                    './run/',
+                    './var/',
+                    './var/cache/',
+                    './var/cache/ldconfig/',
+                    './var/cache/ldconfig/aux-cache',
+                    './var/cache/opkg/',
+                    './var/lib/',
+                    './var/lib/opkg/'
+                ]
+
+        self.write_config('PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"')
+        self.append_config('MACHINE = "qemux86"')
+        self.append_config('IMAGE_FSTYPES = "container"')
+        self.append_config('PACKAGE_CLASSES = "package_ipk"')
+
+        # Build the image of course
+        bitbake('container-test-image')
+
+        image = os.path.join(self.builddir, "tmp/deploy/images/qemux86/container-test-image-qemux86.tar.bz2")
+
+        # Ensure the files in the image are what we expect
+        result = runCmd("tar tf {} | sort".format(image), shell=True)
+        self.assertEqual(result.output.split('\n'), expected_files)
-- 
2.9.3


