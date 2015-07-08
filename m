Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9828775D07
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 11:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68BuMsg001186 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 12:56:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xEYth0NCZRwc
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 12:56:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68BuDgP001149
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 12:56:24 +0100
Message-ID: <1436356573.27597.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Jul 2015 12:56:13 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/sstatetests: Add test for comparing 32 and 64 bit sstate checksums
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
X-List-Received-Date: Wed, 08 Jul 2015 11:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The sstate checksums for both native and target should not vary whether
they're built on a 32 or 64 bit system. Rather than requiring two different
build machines and running a builds, override the variables calling uname()
manually and check using bitbake -S.

[YOCTO #5970]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index d578ddd..6281d50 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -202,3 +202,38 @@ class SStateTests(SStateBase):
         global_config.append('MACHINE = "qemux86"')
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+
+    def test_sstate_32_64_same_hash(self):
+        """
+        The sstate checksums for both native and target should not vary whether
+        they're built on a 32 or 64 bit system. Rather than requiring two different 
+        build machines and running a builds, override the variables calling uname()
+        manually and check using bitbake -S.
+        """
+
+        topdir = get_bb_var('TOPDIR')
+        targetvendor = get_bb_var('TARGET_VENDOR')
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+BUILD_ARCH = \"x86_64\"
+BUILD_OS = \"linux\"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        bitbake("core-image-sato -S printdiff", ignore_status=True)
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+BUILD_ARCH = \"i686\"
+BUILD_OS = \"linux\"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        bitbake("core-image-sato -S printdiff", ignore_status=True)
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                f.extend(os.path.join(root, name) for name in files)
+            return f
+        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
+        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + targetvendor + "-linux", "x86_64" + targetvendor + "-linux", ) for x in files2]
+        self.assertItemsEqual(files1, files2)



