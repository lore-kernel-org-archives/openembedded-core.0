Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49F1E794DB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 17:13:48 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7PHDmH1011091;
	Sat, 25 Aug 2018 10:13:48 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sat, 25 Aug 2018 10:13:48 -0700
From: Kai Kang <kai.kang@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat, 25 Aug 2018 10:13:40 -0700
Message-Id: <2b96c261680c5d41b697faad03de94b1b37ed98a.1535216766.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
In-Reply-To: <cover.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] statetests.py: drop test_sstate_allarch_samesigs_multilib
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
X-List-Received-Date: Sat, 25 Aug 2018 17:13:48 -0000

allarch is disabled when multilib is used, so sstate oeqa case
test_sstate_allarch_samesigs_multilib is useless. Remove check for
allarch part and rename to test_sstate_nativesdk_samesigs_multilib.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7b008e409f4..7194225c0a6 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -349,12 +349,9 @@ MACHINE = \"qemuarm\"
         self.sstate_allarch_samesigs(configA, configB)
 
     @OETestID(1645)
-    def test_sstate_allarch_samesigs_multilib(self):
+    def test_sstate_nativesdk_samesigs_multilib(self):
         """
-        The sstate checksums of allarch multilib packages should be independent of whichever
-        MACHINE is set. Check this using bitbake -S.
-        Also, rather than duplicate the test, check nativesdk stamps are the same between
-        the two MACHINE values.
+        check nativesdk stamps are the same between the two MACHINE values.
         """
 
         configA = """
@@ -392,10 +389,6 @@ MULTILIBS = \"\"
                         (_, task, _, shash) = name.rsplit(".", 3)
                         f[os.path.join(os.path.basename(root), task)] = shash
             return f
-        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/all" + self.target_vendor + "-" + self.target_os)
-        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/all" + self.target_vendor + "-" + self.target_os)
-        self.maxDiff = None
-        self.assertEqual(files1, files2)
 
         nativesdkdir = os.path.basename(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux")[0])
 
-- 
2.11.0


