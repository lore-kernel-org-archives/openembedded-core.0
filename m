Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B8FC371DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:08:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 19 Dec 2016 13:08:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,375,1477983600"; d="scan'208";a="44344220"
Received: from jairdeje-mobl1.amr.corp.intel.com (HELO
	jairdeje-mobl1.zpn.intel.com) ([10.219.128.79])
	by orsmga005.jf.intel.com with ESMTP; 19 Dec 2016 13:08:03 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:07:34 -0600
Message-Id: <d7fc60594f046c477a791fe69f6c6a13a2e59c2c.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [PATCH v2 4/4] selftest/wic: extending test coverage for WIC script options
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
X-List-Received-Date: Mon, 19 Dec 2016 21:08:01 -0000

The previous WIC script selftest didn't cover all of its command line
options. Some option variants were included in existing test cases and
the following tests were added to complete covering them:

1552 Test wic --version
1553 Test wic help create
1554 Test wic help list
1555 Test wic list images
1556 Test wic list source-plugins
1557 Test wic listed images help
1558 Test debug
1563 Test skip build check
1564 Test build rootfs
1559 Test image vars directory selection
1562 Test alternate output directory

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 142 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 128 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 52b9538..3db00a6 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -37,7 +37,9 @@ class Wic(oeSelfTest):
     """Wic test class."""
 
     resultdir = "/var/tmp/wic/build/"
+    alternate_resultdir = "/var/tmp/wic/build/alt/"
     image_is_ready = False
+    wicenv_cache = {}
 
     def setUpLocal(self):
         """This code is executed before each test method."""
@@ -56,10 +58,16 @@ class Wic(oeSelfTest):
 
         rmtree(self.resultdir, ignore_errors=True)
 
+    @testcase(1552)
+    def test_version(self):
+        """Test wic --version"""
+        self.assertEqual(0, runCmd('wic --version').status)
+
     @testcase(1208)
     def test_help(self):
-        """Test wic --help"""
+        """Test wic --help and wic -h"""
         self.assertEqual(0, runCmd('wic --help').status)
+        self.assertEqual(0, runCmd('wic -h').status)
 
     @testcase(1209)
     def test_createhelp(self):
@@ -71,6 +79,16 @@ class Wic(oeSelfTest):
         """Test wic list --help"""
         self.assertEqual(0, runCmd('wic list --help').status)
 
+    @testcase(1553)
+    def test_help_create(self):
+        """Test wic help create"""
+        self.assertEqual(0, runCmd('wic help create').status)
+
+    @testcase(1554)
+    def test_help_list(self):
+        """Test wic help list"""
+        self.assertEqual(0, runCmd('wic help list').status)
+
     @testcase(1215)
     def test_help_overview(self):
         """Test wic help overview"""
@@ -86,6 +104,24 @@ class Wic(oeSelfTest):
         """Test wic help kickstart"""
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
+    @testcase(1555)
+    def test_list_images(self):
+        """Test wic list images"""
+        self.assertEqual(0, runCmd('wic list images').status)
+
+    @testcase(1556)
+    def test_list_source_plugins(self):
+        """Test wic list source-plugins"""
+        self.assertEqual(0, runCmd('wic list source-plugins').status)
+
+    @testcase(1557)
+    def test_listed_images_help(self):
+        """Test wic listed images help"""
+        output = runCmd('wic list images').output
+        imagelist = [line.split()[0] for line in output.splitlines()]
+        for image in imagelist:
+            self.assertEqual(0, runCmd('wic list %s help' % image).status)
+
     @testcase(1213)
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
@@ -99,8 +135,8 @@ class Wic(oeSelfTest):
 
     @testcase(1211)
     def test_build_image_name(self):
-        """Test wic create directdisk --image-name core-image-minimal"""
-        cmd = "wic create directdisk --image-name core-image-minimal"
+        """Test wic create directdisk --image-name=core-image-minimal"""
+        cmd = "wic create directdisk --image-name=core-image-minimal"
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
@@ -162,6 +198,22 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
+    @testcase(1562)
+    def test_alternate_output_dir(self):
+        """Test alternate output directory"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "-e core-image-minimal "
+                                   "-o %s"
+                                   % self.alternate_resultdir).status)
+        self.assertEqual(1, len(glob(self.alternate_resultdir +
+                                     "build/directdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create mkefidisk -e "
+                                   "core-image-minimal "
+                                   "--outdir=%s"
+                                   % self.alternate_resultdir).status)
+        self.assertEqual(1, len(glob(self.alternate_resultdir +
+                                     "build/mkefidisk-*direct")))
+
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
@@ -188,7 +240,7 @@ class Wic(oeSelfTest):
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
+                                   "--image-name=core-image-minimal "
                                    "-c bzip2").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.bz2")))
 
@@ -196,22 +248,58 @@ class Wic(oeSelfTest):
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c xz").status)
+                                   "--image-name=core-image-minimal "
+                                   "--compress-with=xz").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.xz")))
 
     @testcase(1267)
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
+                                   "--image-name=core-image-minimal "
                                    "-c wrong", ignore_status=True).status)
 
+    @testcase(1558)
+    def test_debug(self):
+        """Test debug"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=core-image-minimal "
+                                   "--debug").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    @testcase(1563)
+    def test_skip_build_check(self):
+        """Test skip build check"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-s").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=core-image-minimal "
+                                   "--skip-build-check").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    @testcase(1564)
+    def test_build_rootfs(self):
+        """Test build rootfs"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-f").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=core-image-minimal "
+                                   "--build-rootfs").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
     @testcase(1268)
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         status = runCmd("wic create directdisk-multi-rootfs "
-                        "--image-name core-image-minimal "
+                        "--image-name=core-image-minimal "
                         "--rootfs rootfs1=core-image-minimal "
                         "--rootfs rootfs2=core-image-minimal").status
         self.assertEqual(0, status)
@@ -225,9 +313,9 @@ class Wic(oeSelfTest):
                                   'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         bbvars['wks'] = "directdisk-multi-rootfs"
         status = runCmd("wic create %(wks)s "
-                        "-b %(staging_datadir)s "
-                        "-k %(deploy_dir_image)s "
-                        "-n %(staging_dir_native)s "
+                        "--bootimg-dir=%(staging_datadir)s "
+                        "--kernel-dir=%(deploy_dir_image)s "
+                        "--native-sysroot=%(staging_dir_native)s "
                         "--rootfs-dir rootfs1=%(image_rootfs)s "
                         "--rootfs-dir rootfs2=%(image_rootfs)s"
                         % bbvars).status
@@ -237,19 +325,30 @@ class Wic(oeSelfTest):
     @testcase(1496)
     def test_bmap(self):
         """Test generation of .bmap file"""
+        cmd = "wic create directdisk -e core-image-minimal -m"
+        status = runCmd(cmd).status
+        self.assertEqual(0, status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
         cmd = "wic create directdisk -e core-image-minimal --bmap"
         status = runCmd(cmd).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
 
+    def _get_image_env_path(self, image):
+        """Generate and obtain the path to <image>.env"""
+        if image not in self.wicenv_cache:
+            self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
+            stdir = get_bb_var('STAGING_DIR_TARGET', image)
+            self.wicenv_cache[image] = os.path.join(stdir, 'imgdata')
+        return self.wicenv_cache[image]
+
     @testcase(1347)
     def test_image_env(self):
         """Test generation of <image>.env files."""
         image = 'core-image-minimal'
-        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
-        stdir = get_bb_var('STAGING_DIR_TARGET', image)
-        imgdatadir = os.path.join(stdir, 'imgdata')
+        imgdatadir = self._get_image_env_path(image)
 
         basename = get_bb_var('IMAGE_BASENAME', image)
         self.assertEqual(basename, image)
@@ -267,6 +366,21 @@ class Wic(oeSelfTest):
                 self.assertTrue(var in content, "%s is not in .env file" % var)
                 self.assertTrue(content[var])
 
+    @testcase(1559)
+    def test_image_vars_dir(self):
+        """Test image vars directory selection"""
+        image = 'core-image-minimal'
+        imgenvdir = self._get_image_env_path(image)
+
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=%s "
+                                   "-v %s"
+                                   % (image, imgenvdir)).status)
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name=%s "
+                                   "--vars %s"
+                                   % (image, imgenvdir)).status)
+
     @testcase(1351)
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
-- 
2.7.4


