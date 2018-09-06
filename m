Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90E13796DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:31:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w86GV7GW011105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:31:07 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:31:06 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:28 +0800
Message-ID: <d5eb112ca9765572178ec8cddc16c9ffdc82bf09.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] statetests.py: drop test_sstate_allarch_samesigs_multilib
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
X-List-Received-Date: Thu, 06 Sep 2018 16:31:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

allarch is disabled when multilib is used, so sstate oeqa case
test_sstate_allarch_samesigs_multilib is useless. Remove check for
allarch part and rename to test_sstate_nativesdk_samesigs_multilib.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7b008e409f..7194225c0a 100644
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
2.18.0


