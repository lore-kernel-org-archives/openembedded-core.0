Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B441165CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGv5N1015071 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:57:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ani6Y8-ls5UT
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:57:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGurkS015064
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:57:04 +0100
Message-ID: <1440521813.12105.435.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:56:53 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa: Add allarch sstate sig test
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
X-List-Received-Date: Tue, 25 Aug 2015 16:57:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"allarch" targets should be MACHINE invariant. This means their sstate
signature should not change regardless of which MACHINE is built.

Errors keep creeping in around this area so automating this as part
of self test seems the best way to maintain this.

The "do_build" stamps are known to differ and are harmless so those
are excluded from the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 0a76167..1ce8773 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -272,3 +272,37 @@ NATIVELSBSTRING = \"DistroB\"
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.assertItemsEqual(files1, files2)
 
+    def test_sstate_allarch_samesigs(self):
+        """
+        The sstate checksums off allarch packages should be independent of whichever 
+        MACHINE is set. Check this using bitbake -S.
+        """
+
+        topdir = get_bb_var('TOPDIR')
+        targetos = get_bb_var('TARGET_OS')
+        targetvendor = get_bb_var('TARGET_VENDOR')
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+MACHINE = \"qemux86\"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        bitbake("world -S none")
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+MACHINE = \"qemuarm\"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        bitbake("world -S none")
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    if "do_build" not in name:
+                        f.append(os.path.join(root, name))
+            return f
+        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/all" + targetvendor + "-" + targetos)
+        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/all" + targetvendor + "-" + targetos)
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
+        self.assertItemsEqual(files1, files2)




