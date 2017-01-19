Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEFB71D9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 19 Jan 2017 14:53:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,256,1477983600"; d="scan'208";a="924551135"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2017 14:53:07 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 14:52:53 -0800
Message-Id: <be9e6961aeb991fc0e0acc1118aa01cefe945593.1484866303.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1484866303.git.randy.e.witt@linux.intel.com>
References: <cover.1484866303.git.randy.e.witt@linux.intel.com>
Subject: [PATCH v2 3/3] selftest/containerimage.py: Add container IMAGE_FSTYPES test
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:07 -0000

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
 meta/lib/oeqa/selftest/containerimage.py           | 82 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 meta-selftest/recipes-test/container-image/container-image-testpkg.bb
 create mode 100644 meta-selftest/recipes-test/container-image/container-test-image.bb
 create mode 100644 meta/lib/oeqa/selftest/containerimage.py

diff --git a/meta-selftest/recipes-test/container-image/container-image-testpkg.bb b/meta-selftest/recipes-test/container-image/container-image-testpkg.bb
new file mode 100644
index 0000000..f8dd229
--- /dev/null
+++ b/meta-selftest/recipes-test/container-image/container-image-testpkg.bb
@@ -0,0 +1,8 @@
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    touch ${D}${bindir}/theapp
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
index 0000000..6a85222
--- /dev/null
+++ b/meta/lib/oeqa/selftest/containerimage.py
@@ -0,0 +1,82 @@
+import os
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
+
+# This test builds an image with using the "container" IMAGE_FSTYPE, and
+# ensures that then files in the image are only the ones expected.
+#
+# The only package added to the image is container_image_testpkg, which
+# contains one file. However, due to some other things not cleaning up during
+# rootfs creation, there is some cruft. Ideally bugs will be filed and the
+# cruft removed, but for now we whitelist some known set.
+#
+# Also for performance reasons we're only checking the cruft when using ipk.
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
+        def get_each_path_part(path):
+            if path:
+                part = [ '.' + path + '/' ]
+                result = get_each_path_part(path.rsplit('/', 1)[0])
+                if result:
+                    return part + result
+                else:
+                    return part
+            else:
+                return None
+
+        bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
+                              'DEPLOY_DIR_IMAGE'])
+        expected_files = [
+                    './',
+                    '.{bindir}/theapp',
+                    '.{sysconfdir}/default/',
+                    '.{sysconfdir}/default/postinst',
+                    '.{sysconfdir}/ld.so.cache',
+                    '.{sysconfdir}/timestamp',
+                    '.{sysconfdir}/version',
+                    './run/',
+                    '.{localstatedir}/cache/',
+                    '.{localstatedir}/cache/ldconfig/',
+                    '.{localstatedir}/cache/ldconfig/aux-cache',
+                    '.{localstatedir}/cache/opkg/',
+                    '.{localstatedir}/lib/',
+                    '.{localstatedir}/lib/opkg/'
+                ]
+
+        expected_files = [ x.format(bindir=bbvars['bindir'],
+                                    sysconfdir=bbvars['sysconfdir'],
+                                    localstatedir=bbvars['localstatedir'])
+                                    for x in expected_files ]
+
+        # Since tar lists all directories individually, make sure each element
+        # from bindir, sysconfdir, etc is added
+        expected_files += get_each_path_part(bbvars['bindir'])
+        expected_files += get_each_path_part(bbvars['sysconfdir'])
+        expected_files += get_each_path_part(bbvars['localstatedir'])
+
+        expected_files = sorted(expected_files)
+
+
+        self.write_config('PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"')
+        self.append_config('MACHINE = "qemux86"')
+        self.append_config('IMAGE_FSTYPES = "container"')
+        self.append_config('PACKAGE_CLASSES = "package_ipk"')
+
+        # Build the image of course
+        bitbake('container-test-image')
+
+        image = os.path.join(bbvars['DEPLOY_DIR_IMAGE'],
+                             'container-test-image-qemux86.tar.bz2')
+
+        # Ensure the files in the image are what we expect
+        result = runCmd("tar tf {} | sort".format(image), shell=True)
+        self.assertEqual(result.output.split('\n'), expected_files)
-- 
2.9.3


