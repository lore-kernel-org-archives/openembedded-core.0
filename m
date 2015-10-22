Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD5477194
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5FCD9600F52
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:22:05 +0100
Message-Id: <ad33259b507914bfc8de92d1df12e0974157900e.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 44/52] oeqa/selftest: improve config writing and cleanup
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:28 -0000

From: Ross Burton <ross.burton@intel.com>

The selftest.inc configuration file is deleted in both tearDown() and setUp() so
there's no need to use addCleanup() to remove statements from it.

Use write_config instead of append_config if the intention is to start from an
empty config file, for clarity.

Finally remove some misleading comments that claim that append_config() writes
to local.conf when it doesn't.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py       |  9 +++------
 meta/lib/oeqa/selftest/buildoptions.py  |  4 ++--
 meta/lib/oeqa/selftest/imagefeatures.py | 16 ++++------------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 1c0e588..94ca79c 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -156,8 +156,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1028)
     def test_environment(self):
-        self.append_config("TEST_ENV=\"localconf\"")
-        self.addCleanup(self.remove_config, "TEST_ENV=\"localconf\"")
+        self.write_config("TEST_ENV=\"localconf\"")
         result = runCmd('bitbake -e | grep TEST_ENV=')
         self.assertTrue('localconf' in result.output, msg = "bitbake didn't report any value for TEST_ENV variable. To test, run 'bitbake -e | grep TEST_ENV='")
 
@@ -184,8 +183,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertTrue('prefile' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration. ")
-        self.append_config("TEST_PREFILE=\"localconf\"")
-        self.addCleanup(self.remove_config, "TEST_PREFILE=\"localconf\"")
+        self.write_config("TEST_PREFILE=\"localconf\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertTrue('localconf' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration.")
 
@@ -194,8 +192,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
-        self.append_config("TEST_POSTFILE=\"localconf\"")
-        self.addCleanup(self.remove_config, "TEST_POSTFILE=\"localconf\"")
+        self.write_config("TEST_POSTFILE=\"localconf\"")
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertTrue('postfile' in result.output, "Postconfigure file \"postfile.conf\"was not taken into consideration.")
 
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index fbe0cd7..acf481f 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -39,7 +39,7 @@ class ImageOptionsTests(oeSelfTest):
         for image_file in deploydir_files:
             if imagename in image_file and os.path.islink(os.path.join(deploydir, image_file)):
                 track_original_files.append(os.path.realpath(os.path.join(deploydir, image_file)))
-        self.append_config("RM_OLD_IMAGE = \"1\"")
+        self.write_config("RM_OLD_IMAGE = \"1\"")
         bitbake("-C rootfs core-image-minimal")
         deploydir_files = os.listdir(deploydir)
         remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
@@ -97,7 +97,7 @@ class SanityOptionsTest(oeSelfTest):
 
     @testcase(278)
     def test_sanity_userspace_dependency(self):
-        self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
+        self.write_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
         bitbake("-ccleansstate gzip nfs-utils")
         res = bitbake("gzip nfs-utils")
         self.assertTrue("WARNING: QA Issue: gzip" in res.output, "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index fcffc42..4efb0d9 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -25,9 +25,7 @@ class ImageFeatures(oeSelfTest):
         features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
-
-        # Append 'features' to local.conf
-        self.append_config(features)
+        self.write_config(features)
 
         # Build a core-image-minimal
         bitbake('core-image-minimal')
@@ -53,9 +51,7 @@ class ImageFeatures(oeSelfTest):
         features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
-
-        # Append 'features' to local.conf
-        self.append_config(features)
+        self.write_config(features)
 
         # Build a core-image-minimal
         bitbake('core-image-minimal')
@@ -87,9 +83,7 @@ class ImageFeatures(oeSelfTest):
         features += 'IMAGE_INSTALL_append = " openssh"\n'
         features += 'EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password package-management"\n'
         features += 'RPMROOTFSDEPENDS_remove = "rpmresolve-native:do_populate_sysroot"'
-
-        # Append 'features' to local.conf
-        self.append_config(features)
+        self.write_config(features)
 
         # Build a core-image-minimal
         bitbake('core-image-minimal')
@@ -159,9 +153,7 @@ class ImageFeatures(oeSelfTest):
 
         features = 'DISTRO_FEATURES_append = " wayland"\n'
         features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
-
-        # Append 'features' to local.conf
-        self.append_config(features)
+        self.write_config(features)
 
         # Build a core-image-weston
         bitbake('core-image-weston')
-- 
2.1.4


