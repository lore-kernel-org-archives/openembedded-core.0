Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id B947A74B83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:53:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c13-v6so3689392wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q8WL7tCmvNT2eXQMrwvIBFAztAQ0wzVXYJ9vECywkFo=;
	b=Z7pCSoYmddZqKifLHMLP8p08qdMngjSWELb05sovDLT9FhQuEIYJwOG3oNJ8xcch0c
	N87lMzcD5BSZeJIz2ZnA6PDFu9cKnvMP6/h+O34EYyMq/uRk6T25i2dNQtXRvbL6YH1r
	3qd/7iglMfMNTwPrDzWQ3dr6rJFaGNeHah5+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q8WL7tCmvNT2eXQMrwvIBFAztAQ0wzVXYJ9vECywkFo=;
	b=QvKtUYPpDbTcrtvNWRVaD6yqUS1f9j+hXQ0ohJ4AnfcHpoCzoOXRX+W4NTmk3PCfFK
	jACUMRapRMdq5t8XndeEIiGfiLOQW3QBJJEuXzJjcDTiZIyC6IVWiIEKfoFmWYv/2GP5
	nCdr665vlEJW0SZHIIZorTW4ue1SJ+k2p71PToZMWFoYvqWy2g4SCBY/HRKMgDBGl6+a
	fGwLukglmvyYqntJxFH9Omz1U01gipKVxJbXd6/PJWzdA6N90e3OSnhg3fn3sspXYM17
	86+XPfj7CERanX/cWz/mHcXZ6pduP6gsq6b3IW628gPkLXHmNfmN/mDn8+H+DSv+nbht
	wfNA==
X-Gm-Message-State: AOUpUlHd5+J/zmiUqTTTVJYTMGOIH7HJ3IjrW0Mlr4e0jgn4erxp8kdO
	uRpNIXQ5pIM4ZfuQopE+hlAOyVimNvY78g==
X-Google-Smtp-Source: AAOMgpfO4IhJcEWPhT4wvzUmp2jjpF4Fw8SHrU4xVBVR10HHOseJ8avIo3cmgJOsLCEBAx78BvIKiA==
X-Received: by 2002:a5d:50cd:: with SMTP id
	f13-v6mr11889018wrt.73.1532429599820; 
	Tue, 24 Jul 2018 03:53:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm2037488wmh.19.2018.07.24.03.53.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 03:53:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 11:53:12 +0100
Message-Id: <20180724105316.2085-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
References: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] selftest/wic: clean up runCmd error code handling
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
X-List-Received-Date: Tue, 24 Jul 2018 10:53:20 -0000

runCmd handles checking exit 0 internally unless specified otherwise and its
error messages are much more useful including the failed command output.

Clean up the unneeded 0 exit code checks in the wic tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 192 ++++++++++++----------------
 1 file changed, 82 insertions(+), 110 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 6793efb62e9..cfee9d1e71d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -99,58 +99,58 @@ class Wic(WicTestCase):
     @OETestID(1552)
     def test_version(self):
         """Test wic --version"""
-        self.assertEqual(0, runCmd('wic --version').status)
+        runCmd('wic --version')
 
     @OETestID(1208)
     def test_help(self):
         """Test wic --help and wic -h"""
-        self.assertEqual(0, runCmd('wic --help').status)
-        self.assertEqual(0, runCmd('wic -h').status)
+        runCmd('wic --help')
+        runCmd('wic -h')
 
     @OETestID(1209)
     def test_createhelp(self):
         """Test wic create --help"""
-        self.assertEqual(0, runCmd('wic create --help').status)
+        runCmd('wic create --help')
 
     @OETestID(1210)
     def test_listhelp(self):
         """Test wic list --help"""
-        self.assertEqual(0, runCmd('wic list --help').status)
+        runCmd('wic list --help')
 
     @OETestID(1553)
     def test_help_create(self):
         """Test wic help create"""
-        self.assertEqual(0, runCmd('wic help create').status)
+        runCmd('wic help create')
 
     @OETestID(1554)
     def test_help_list(self):
         """Test wic help list"""
-        self.assertEqual(0, runCmd('wic help list').status)
+        runCmd('wic help list')
 
     @OETestID(1215)
     def test_help_overview(self):
         """Test wic help overview"""
-        self.assertEqual(0, runCmd('wic help overview').status)
+        runCmd('wic help overview')
 
     @OETestID(1216)
     def test_help_plugins(self):
         """Test wic help plugins"""
-        self.assertEqual(0, runCmd('wic help plugins').status)
+        runCmd('wic help plugins')
 
     @OETestID(1217)
     def test_help_kickstart(self):
         """Test wic help kickstart"""
-        self.assertEqual(0, runCmd('wic help kickstart').status)
+        runCmd('wic help kickstart')
 
     @OETestID(1555)
     def test_list_images(self):
         """Test wic list images"""
-        self.assertEqual(0, runCmd('wic list images').status)
+        runCmd('wic list images')
 
     @OETestID(1556)
     def test_list_source_plugins(self):
         """Test wic list source-plugins"""
-        self.assertEqual(0, runCmd('wic list source-plugins').status)
+        runCmd('wic list source-plugins')
 
     @OETestID(1557)
     def test_listed_images_help(self):
@@ -158,7 +158,7 @@ class Wic(WicTestCase):
         output = runCmd('wic list images').output
         imagelist = [line.split()[0] for line in output.splitlines()]
         for image in imagelist:
-            self.assertEqual(0, runCmd('wic list %s help' % image).status)
+            runCmd('wic list %s help' % image)
 
     @OETestID(1213)
     def test_unsupported_subcommand(self):
@@ -174,7 +174,7 @@ class Wic(WicTestCase):
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
         cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1157)
@@ -182,7 +182,7 @@ class Wic(WicTestCase):
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @OETestID(1346)
@@ -196,7 +196,7 @@ class Wic(WicTestCase):
         bitbake('core-image-minimal core-image-minimal-initramfs')
         self.remove_config(config)
         cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
@@ -205,7 +205,7 @@ class Wic(WicTestCase):
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
     @OETestID(1350)
@@ -213,7 +213,7 @@ class Wic(WicTestCase):
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
     @OETestID(1385)
@@ -225,7 +225,7 @@ class Wic(WicTestCase):
         bitbake('core-image-minimal')
         self.remove_config(config)
         cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
     @OETestID(1560)
@@ -237,7 +237,7 @@ class Wic(WicTestCase):
         bitbake('core-image-minimal')
         self.remove_config(config)
         cmd = "wic create systemd-bootdisk -e core-image-minimal -o %s" % self.resultdir
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
     @OETestID(1561)
@@ -246,7 +246,7 @@ class Wic(WicTestCase):
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
         kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
         self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
     @OETestID(1562)
@@ -260,7 +260,7 @@ class Wic(WicTestCase):
         bitbake('core-image-minimal')
         self.remove_config(config)
         cmd = "wic create directdisk -e core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
     @OETestID(1212)
@@ -273,37 +273,36 @@ class Wic(WicTestCase):
                                    'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['resultdir'] = self.resultdir
-        status = runCmd("wic create directdisk "
+        runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(recipe_sysroot_native)s "
                         "-r %(image_rootfs)s "
-                        "-o %(resultdir)s" % bbvars).status
-        self.assertEqual(0, status)
+                        "-o %(resultdir)s" % bbvars)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @OETestID(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
-                                   "-c gzip -o %s" % self.resultdir).status)
+                                   "-c gzip -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.gz")))
 
     @OETestID(1265)
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-c bzip2 -o %s" % self.resultdir).status)
+                                   "-c bzip2 -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.bz2")))
 
     @OETestID(1266)
     def test_compress_xz(self):
         """Test compressing an image with xz"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "--compress-with=xz -o %s" % self.resultdir).status)
+                                   "--compress-with=xz -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.xz")))
 
     @OETestID(1267)
@@ -317,63 +316,62 @@ class Wic(WicTestCase):
     @OETestID(1558)
     def test_debug_short(self):
         """Test -D option"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1658)
     def test_debug_long(self):
         """Test --debug option"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "--debug -o %s" % self.resultdir).status)
+                                   "--debug -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1563)
     def test_skip_build_check_short(self):
         """Test -s option"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-s -o %s" % self.resultdir).status)
+                                   "-s -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1671)
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--skip-build-check "
-                                   "--outdir %s" % self.resultdir).status)
+                                   "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1564)
     def test_build_rootfs_short(self):
         """Test -f option"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-f -o %s" % self.resultdir).status)
+                                   "-f -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1656)
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--build-rootfs "
-                                   "--outdir %s" % self.resultdir).status)
+                                   "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @OETestID(1268)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
-        status = runCmd("wic create directdisk-multi-rootfs "
+        runCmd("wic create directdisk-multi-rootfs "
                         "--image-name=core-image-minimal "
                         "--rootfs rootfs1=core-image-minimal "
                         "--rootfs rootfs2=core-image-minimal "
-                        "--outdir %s" % self.resultdir).status
-        self.assertEqual(0, status)
+                        "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
     @OETestID(1269)
@@ -387,14 +385,13 @@ class Wic(WicTestCase):
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['wks'] = "directdisk-multi-rootfs"
         bbvars['resultdir'] = self.resultdir
-        status = runCmd("wic create %(wks)s "
+        runCmd("wic create %(wks)s "
                         "--bootimg-dir=%(staging_datadir)s "
                         "--kernel-dir=%(deploy_dir_image)s "
                         "--native-sysroot=%(recipe_sysroot_native)s "
                         "--rootfs-dir rootfs1=%(image_rootfs)s "
                         "--rootfs-dir rootfs2=%(image_rootfs)s "
-                        "--outdir %(resultdir)s" % bbvars).status
-        self.assertEqual(0, status)
+                        "--outdir %(resultdir)s" % bbvars)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
     @OETestID(1661)
@@ -413,8 +410,8 @@ part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
 part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
 part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
                           % (rootfs_dir, rootfs_dir))
-            self.assertEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir)).status)
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
 
             os.remove(wks_file)
             wicout = glob(self.resultdir + "%s-*direct" % 'temp')
@@ -424,7 +421,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             # verify partition size with wic
             res = runCmd("parted -m %s unit b p 2>/dev/null" % wicimg)
-            self.assertEqual(0, res.status)
 
             # parse parted output which looks like this:
             # BYT;\n
@@ -440,8 +436,8 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 self.assertEqual(7, len(partln))
                 start = int(partln[1].rstrip("B")) / 512
                 length = int(partln[3].rstrip("B")) / 512
-                self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
-                                           (wicimg, part_file, start, length)).status)
+                runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                           (wicimg, part_file, start, length))
 
             def extract_files(debugfs_output):
                 """
@@ -465,7 +461,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             # /usr.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
                              os.path.join(self.resultdir, "selftest_img.part1"))
-            self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertIn("etc", files)
             self.assertNotIn("usr", files)
@@ -474,7 +469,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             # directories.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
                              os.path.join(self.resultdir, "selftest_img.part2"))
-            self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
@@ -484,7 +478,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             # directory, but not the files inside it.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
                              os.path.join(self.resultdir, "selftest_img.part3"))
-            self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
@@ -492,7 +485,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertIn("bin", files)
             res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % \
                              os.path.join(self.resultdir, "selftest_img.part3"))
-            self.assertEqual(0, res.status)
             files = extract_files(res.output)
             self.assertIn(".", files)
             self.assertIn("..", files)
@@ -530,8 +522,7 @@ class Wic2(WicTestCase):
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
         cmd = "wic create wictestdisk -e core-image-minimal -m -o %s" % self.resultdir
-        status = runCmd(cmd).status
-        self.assertEqual(0, status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
@@ -539,8 +530,7 @@ class Wic2(WicTestCase):
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
         cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s" % self.resultdir
-        status = runCmd(cmd).status
-        self.assertEqual(0, status)
+        runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
@@ -584,10 +574,10 @@ class Wic2(WicTestCase):
         imgenvdir = self._get_image_env_path(image)
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=%s -v %s -n %s -o %s"
                                    % (image, imgenvdir, native_sysroot,
-                                      self.resultdir)).status)
+                                      self.resultdir))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @OETestID(1665)
@@ -597,13 +587,13 @@ class Wic2(WicTestCase):
         imgenvdir = self._get_image_env_path(image)
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=%s "
                                    "--vars %s "
                                    "--native-sysroot %s "
                                    "--outdir %s"
                                    % (image, imgenvdir, native_sysroot,
-                                      self.resultdir)).status)
+                                      self.resultdir))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @OETestID(1351)
@@ -685,8 +675,8 @@ class Wic2(WicTestCase):
         """
         wkspath, wksname = Wic2._make_fixed_size_wks(200)
 
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                   % (wkspath, self.resultdir)).status)
+        runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wkspath, self.resultdir))
         os.remove(wkspath)
         wicout = glob(self.resultdir + "%s-*direct" % wksname)
         self.assertEqual(1, len(wicout))
@@ -750,7 +740,7 @@ class Wic2(WicTestCase):
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
-            self.assertEqual(0, runCmd(cmd).status)
+            runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
@@ -770,7 +760,7 @@ class Wic2(WicTestCase):
                             'part emptybtrfs  --fstype btrfs  --size 150M\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
-            self.assertEqual(0, runCmd(cmd).status)
+            runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
@@ -783,7 +773,7 @@ class Wic2(WicTestCase):
                             '--overhead-factor 1.2 --size 100k\n'])
             wks.flush()
             cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
-            self.assertEqual(0, runCmd(cmd).status)
+            runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
@@ -795,7 +785,7 @@ class Wic2(WicTestCase):
         cmd = "wic create sdimage-bootpart -e %s -o %s" % (img, self.resultdir)
         config = 'IMAGE_BOOT_FILES = "%s*"' % get_bb_var('KERNEL_IMAGETYPE', img)
         self.append_config(config)
-        self.assertEqual(0, runCmd(cmd).status)
+        runCmd(cmd)
         self.remove_config(config)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
@@ -831,9 +821,9 @@ class Wic2(WicTestCase):
     @OETestID(1857)
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         images = glob(self.resultdir + "wictestdisk-*.direct")
         self.assertEqual(1, len(images))
 
@@ -841,20 +831,18 @@ class Wic2(WicTestCase):
 
         # list partitions
         result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertEqual(3, len(result.output.split('\n')))
 
         # list directory content of the first partition
         result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertEqual(6, len(result.output.split('\n')))
 
     @OETestID(1856)
     def test_wic_cp(self):
         """Test copy files and directories to the the wic image."""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         images = glob(self.resultdir + "wictestdisk-*.direct")
         self.assertEqual(1, len(images))
 
@@ -862,19 +850,16 @@ class Wic2(WicTestCase):
 
         # list directory content of the first partition
         result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertEqual(6, len(result.output.split('\n')))
 
         with NamedTemporaryFile("w", suffix=".wic-cp") as testfile:
             testfile.write("test")
 
             # copy file to the partition
-            result = runCmd("wic cp %s %s:1/ -n %s" % (testfile.name, images[0], sysroot))
-            self.assertEqual(0, result.status)
+            runCmd("wic cp %s %s:1/ -n %s" % (testfile.name, images[0], sysroot))
 
             # check if file is there
             result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
-            self.assertEqual(0, result.status)
             self.assertEqual(7, len(result.output.split('\n')))
             self.assertTrue(os.path.basename(testfile.name) in result.output)
 
@@ -885,21 +870,19 @@ class Wic2(WicTestCase):
             copy(testfile.name, testdir)
 
             # copy directory to the partition
-            result = runCmd("wic cp %s %s:1/ -n %s" % (testdir, images[0], sysroot))
-            self.assertEqual(0, result.status)
+            runCmd("wic cp %s %s:1/ -n %s" % (testdir, images[0], sysroot))
 
             # check if directory is there
             result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
-            self.assertEqual(0, result.status)
             self.assertEqual(8, len(result.output.split('\n')))
             self.assertTrue(os.path.basename(testdir) in result.output)
 
     @OETestID(1858)
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
-        self.assertEqual(0, runCmd("wic create mkefidisk "
+        runCmd("wic create mkefidisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         images = glob(self.resultdir + "mkefidisk-*.direct")
         self.assertEqual(1, len(images))
 
@@ -907,21 +890,17 @@ class Wic2(WicTestCase):
 
         # list directory content of the first partition
         result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertIn('\nBZIMAGE        ', result.output)
         self.assertIn('\nEFI          <DIR>     ', result.output)
 
         # remove file
-        result = runCmd("wic rm %s:1/bzimage -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
+        runCmd("wic rm %s:1/bzimage -n %s" % (images[0], sysroot))
 
         # remove directory
-        result = runCmd("wic rm %s:1/efi -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
+        runCmd("wic rm %s:1/efi -n %s" % (images[0], sysroot))
 
         # check if they're removed
         result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertNotIn('\nBZIMAGE        ', result.output)
         self.assertNotIn('\nEFI          <DIR>     ', result.output)
 
@@ -940,7 +919,7 @@ class Wic2(WicTestCase):
                  'part emptybtrfs  --fstype btrfs  --size 100M --mkfs-extraopts "--mixed -K"\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
-            self.assertEqual(0, runCmd(cmd).status)
+            runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
@@ -970,7 +949,7 @@ class Wic2(WicTestCase):
 
             sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
             cmd = "wic write -n %s --expand 1:0 %s %s" % (sysroot, image_path, new_image_path)
-            self.assertEqual(0, runCmd(cmd).status)
+            runCmd(cmd)
 
             # check if partitions are expanded
             orig = runCmd("wic ls %s -n %s" % (image_path, sysroot))
@@ -1000,9 +979,9 @@ class Wic2(WicTestCase):
 
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         images = glob(self.resultdir + "wictestdisk-*.direct")
         self.assertEqual(1, len(images))
 
@@ -1010,15 +989,14 @@ class Wic2(WicTestCase):
 
         # list directory content of the second ext4 partition
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(
                             set(line.split()[-1] for line in result.output.split('\n') if line)))
 
     def test_wic_cp_ext(self):
         """Test copy files and directories to the ext partition."""
-        self.assertEqual(0, runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         images = glob(self.resultdir + "wictestdisk-*.direct")
         self.assertEqual(1, len(images))
 
@@ -1026,7 +1004,6 @@ class Wic2(WicTestCase):
 
         # list directory content of the ext4 partition
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         dirs = set(line.split()[-1] for line in result.output.split('\n') if line)
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs))
 
@@ -1034,20 +1011,18 @@ class Wic2(WicTestCase):
             testfile.write("test")
 
             # copy file to the partition
-            result = runCmd("wic cp %s %s:2/ -n %s" % (testfile.name, images[0], sysroot))
-            self.assertEqual(0, result.status)
+            runCmd("wic cp %s %s:2/ -n %s" % (testfile.name, images[0], sysroot))
 
             # check if file is there
             result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
-            self.assertEqual(0, result.status)
             newdirs = set(line.split()[-1] for line in result.output.split('\n') if line)
             self.assertEqual(newdirs.difference(dirs), set([os.path.basename(testfile.name)]))
 
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
-        self.assertEqual(0, runCmd("wic create mkefidisk "
+        runCmd("wic create mkefidisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir).status)
+                                   "-D -o %s" % self.resultdir)
         images = glob(self.resultdir + "mkefidisk-*.direct")
         self.assertEqual(1, len(images))
 
@@ -1055,14 +1030,11 @@ class Wic2(WicTestCase):
 
         # list directory content of the /etc directory on ext4 partition
         result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertTrue('fstab' in [line.split()[-1] for line in result.output.split('\n') if line])
 
         # remove file
-        result = runCmd("wic rm %s:2/etc/fstab -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
+        runCmd("wic rm %s:2/etc/fstab -n %s" % (images[0], sysroot))
 
         # check if it's removed
         result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
-        self.assertEqual(0, result.status)
         self.assertTrue('fstab' not in [line.split()[-1] for line in result.output.split('\n') if line])
-- 
2.17.1


