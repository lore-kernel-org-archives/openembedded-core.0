Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F14676017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 13:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6AD7ebT010519 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:07:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kQd7fAwslRtm
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:07:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6AD7PW2010512
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:07:36 +0100
Message-ID: <1436533645.3310.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 14:07:25 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/sstatetests: Add NATIVELSB sstate signature equivalence test
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
X-List-Received-Date: Fri, 10 Jul 2015 13:07:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The sstate checksums should be independent of whichever NATIVELSBSTRING is
detected. Add an automated QA test which tests this using bitbake -S.

To make this possible, we need to be able to override the value of 
NATIVELSBSTRING so make a small change to allow this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 446e39e..7e15006 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -212,7 +212,8 @@ python base_eventhandler() {
     import bb.runqueue
 
     if isinstance(e, bb.event.ConfigParsed):
-        e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
+        if not e.data.getVar("NATIVELSBSTRING", False):
+            e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
         e.data.setVar('BB_VERSION', bb.__version__)
         pkgarch_mapping(e.data)
         oe.utils.features_backfill("DISTRO_FEATURES", e.data)
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 6281d50..7a1f49e 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -237,3 +237,37 @@ BUILD_OS = \"linux\"
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + targetvendor + "-linux", "x86_64" + targetvendor + "-linux", ) for x in files2]
         self.assertItemsEqual(files1, files2)
+
+
+    def test_sstate_nativelsbstring_same_hash(self):
+        """
+        The sstate checksums should be independent of whichever NATIVELSBSTRING is
+        detected. Rather than requiring two different build machines and running 
+        builds, override the variables manually and check using bitbake -S.
+        """
+
+        topdir = get_bb_var('TOPDIR')
+        targetvendor = get_bb_var('TARGET_VENDOR')
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+NATIVELSBSTRING = \"DistroA\"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        bitbake("core-image-sato -S printdiff", ignore_status=True)
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+NATIVELSBSTRING = \"DistroB\"
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
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.assertItemsEqual(files1, files2)
+



