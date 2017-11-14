Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1F8678546
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 07:59:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE7xCQV011491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 23:59:12 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 23:59:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 15:57:48 +0800
Message-ID: <e08be83f151efe716d5b23197105b893b71a2fd5.1510646201.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510646201.git.liezhi.yang@windriver.com>
References: <cover.1510646201.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/dnf.py/rpm.py: add MLPREFIX to package name
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
X-List-Received-Date: Tue, 14 Nov 2017 07:59:11 -0000
Content-Type: text/plain

The package name is lib32-foo (e.g., lib32-dnf) when run
"bitbake lib32-core-image-sato -ctestimage", add MLPREFIX to package name can
fix the problem, otherwise the test cases would be failed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 4 ++--
 meta/lib/oeqa/runtime/cases/rpm.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 2f87296..7912ad2 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -38,12 +38,12 @@ class DnfBasicTest(DnfTest):
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     @OETestID(1737)
     def test_dnf_info(self):
-        self.dnf('info dnf')
+        self.dnf('info %sdnf' % self.tc.td['MLPREFIX'])
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     @OETestID(1738)
     def test_dnf_search(self):
-        self.dnf('search dnf')
+        self.dnf('search %sdnf' % self.tc.td['MLPREFIX'])
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     @OETestID(1736)
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 05b94c7..137739d 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -25,7 +25,7 @@ class RpmBasicTest(OERuntimeTestCase):
     @OETestID(191)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
     def test_rpm_query(self):
-        status, output = self.target.run('rpm -q rpm')
+        status, output = self.target.run('rpm -q %srpm' % self.tc.td['MLPREFIX'])
         msg = 'status and output: %s and %s' % (status, output)
         self.assertEqual(status, 0, msg=msg)
 
-- 
2.7.4


