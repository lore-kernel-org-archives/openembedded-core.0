Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 24FA26FFFB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhbif021808; Fri, 30 Sep 2016 17:43:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8lZmtlM1Z1sr; Fri, 30 Sep 2016 17:43:38 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhYOG021793
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Sep 2016 17:43:35 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1bq0uM-0007D0-Gd; Fri, 30 Sep 2016 17:43:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 17:43:27 +0100
Message-Id: <1475253808-27642-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/7] oeqa/sstatetests: Add test for multilib allarch checksums
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
X-List-Received-Date: Fri, 30 Sep 2016 16:43:39 -0000

Switching between multilib configurations should not change allarch recipe
or nativesdk checksums. Add a new sstate test for this based on the standard
allarch test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/sstatetests.py | 45 ++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index a353f67..ca43450 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -311,19 +311,48 @@ NATIVELSBSTRING = \"DistroB\"
         the two MACHINE values.
         """
 
+        configA = """
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+MACHINE = \"qemux86-64\"
+"""
+        configB = """
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+MACHINE = \"qemuarm\"
+"""
+        self.sstate_allarch_samesigs(configA, configB):
+
+    def test_sstate_allarch_samesigs_multilib(self):
+        """
+        The sstate checksums of allarch multilib packages should be independent of whichever
+        MACHINE is set. Check this using bitbake -S.
+        Also, rather than duplicate the test, check nativesdk stamps are the same between
+        the two MACHINE values.
+        """
+
+        configA = """
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+MACHINE = \"qemux86-64\"
+require conf/multilib.conf
+MULTILIBS = \"multilib:lib32\"
+DEFAULTTUNE_virtclass-multilib-lib32 = \"x86\"
+"""
+        configB = """
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+MACHINE = \"qemuarm\"
+require conf/multilib.conf
+MULTILIBS = \"\"
+"""
+        self.sstate_allarch_samesigs(configA, configB):
+
+    def sstate_allarch_samesigs(self, configA, configB):
+
         topdir = get_bb_var('TOPDIR')
         targetos = get_bb_var('TARGET_OS')
         targetvendor = get_bb_var('TARGET_VENDOR')
-        self.write_config("""
-TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86\"
-""")
+        self.write_config(configA)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
-        self.write_config("""
-TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemuarm\"
-""")
+        self.write_config(configB)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
         bitbake("world meta-toolchain -S none")
 
-- 
2.7.4


