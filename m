Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9BD7F18D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:47:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6J9lUYn030272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:47:41 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 19 Jul 2019 02:47:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 18:00:08 +0800
Message-ID: <7d2e3f5bf31ffabdb3dfc9a4b0a08021be7418da.1563530365.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1563530365.git.Qi.Chen@windriver.com>
References: <cover.1563530365.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] runtime_test.py: use track_for_cleanup for temp dir
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
X-List-Received-Date: Fri, 19 Jul 2019 09:47:50 -0000
Content-Type: text/plain

Use track_for_cleanup for temp dir to avoid such temp
dir being not cleaned up when something goes wrong, e.g.,
building image failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d817b75..20969d2 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -153,6 +153,7 @@ class TestImage(OESelftestTestCase):
 
         # Enable package feed signing
         self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
+        self.track_for_cleanup(self.gpg_home)
         signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
         runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
         features += 'INHERIT += "sign_package_feed"\n'
@@ -165,9 +166,6 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
-        # remove the oeqa-feed-sign temporal directory
-        shutil.rmtree(self.gpg_home, ignore_errors=True)
-
     def test_testimage_virgl_gtk(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
-- 
1.9.1


