Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8CC76DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:28:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384222"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:28:00 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:37 -0600
Message-Id: <d18f40f54e777e30f70cd0400b78e80b6b6ce4e5.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH v3 20/22] oeqa/sdkext/devtool.py: Add location test to ensure that devtool is the eSDK one.
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
X-List-Received-Date: Thu, 04 Feb 2016 22:28:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdkext/devtool.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index 0262ed3..c5bb310 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -11,10 +11,17 @@ class DevtoolTest(oeSDKExtTest):
         self.myapp_dst = os.path.join(self.tc.sdktestdir, "myapp")
         shutil.copytree(self.myapp_src, self.myapp_dst)
 
+    def test_devtool_location(self):
+        output = self._run('which devtool')
+        self.assertEqual(output.startswith(self.tc.sdktestdir), True, \
+            msg="Seems that devtool isn't the eSDK one: %s" % output)
+
+    @skipUnlessPassed('test_devtool_location')
     def test_devtool_add_reset(self):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
 
+    @skipUnlessPassed('test_devtool_location')
     def test_devtool_build(self):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool build myapp')
-- 
2.1.4


