Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21EEB76F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDnaIE007158 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:49:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uLNkA55FFJdN
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:49:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDnNta007151
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:49:34 +0100
Message-ID: <1443620963.5162.85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:49:23 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/selftest/sstatetests: Add test that MACHINE doesn't change target sigs
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
X-List-Received-Date: Wed, 30 Sep 2015 13:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When we change between two machines with the same tune, we shouldn't see 
rebuilds of binaries. This adds a test for this using the qemux86copy 
machine. We also extend the test to cover multilibs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 1940e66..af68e02 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -329,4 +329,49 @@ MACHINE = \"qemuarm\"
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
         self.assertItemsEqual(files1, files2)
-        
+
+    def test_sstate_sametune_samesigs(self):
+        """
+        The sstate checksums of two identical machines (using the same tune) should be the 
+        same, apart from changes within the machine specific stamps directory. We use the
+        qemux86copy machine to test this. Also include multilibs in the test.
+        """
+
+        topdir = get_bb_var('TOPDIR')
+        targetos = get_bb_var('TARGET_OS')
+        targetvendor = get_bb_var('TARGET_VENDOR')
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+MACHINE = \"qemux86\"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        bitbake("world meta-toolchain -S none")
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+MACHINE = \"qemux86copy\"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        bitbake("world meta-toolchain -S none")
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    if "meta-environment" in root or "cross-canadian" in root:
+                        continue
+                    if "qemux86copy-" in root or "qemux86-" in root:
+                        continue
+                    if "do_build" not in name and "do_populate_sdk" not in name:
+                        f.append(os.path.join(root, name))
+            return f
+        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps")
+        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps")
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
+        self.assertItemsEqual(files1, files2)



