Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 516BF76DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384216"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:59 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:36 -0600
Message-Id: <f63cb5712780243e6b1db55b7d5112e35b3f48f0.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v3 19/22] oeqa/sdkext: Add devtool basic tests for eSDK.
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Add simple myapp application is a C app that prints hello world
and exit.

Add devtool test for that this app to the workspace, build and
reset it.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/lib/oeqa/sdkext/devtool.py           | 25 +++++++++++++++++++++++++
 meta/lib/oeqa/sdkext/files/myapp/Makefile | 10 ++++++++++
 meta/lib/oeqa/sdkext/files/myapp/myapp.c  |  9 +++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/sdkext/devtool.py
 create mode 100644 meta/lib/oeqa/sdkext/files/myapp/Makefile
 create mode 100644 meta/lib/oeqa/sdkext/files/myapp/myapp.c

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
new file mode 100644
index 0000000..0262ed3
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -0,0 +1,25 @@
+import shutil
+
+from oeqa.oetest import oeSDKExtTest
+from oeqa.utils.decorators import *
+
+class DevtoolTest(oeSDKExtTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.myapp_src = os.path.join(self.tc.sdkextfilesdir, "myapp")
+        self.myapp_dst = os.path.join(self.tc.sdktestdir, "myapp")
+        shutil.copytree(self.myapp_src, self.myapp_dst)
+
+    def test_devtool_add_reset(self):
+        self._run('devtool add myapp %s' % self.myapp_dst)
+        self._run('devtool reset myapp')
+
+    def test_devtool_build(self):
+        self._run('devtool add myapp %s' % self.myapp_dst)
+        self._run('devtool build myapp')
+        self._run('devtool reset myapp')
+
+    @classmethod
+    def tearDownClass(self):
+        shutil.rmtree(self.myapp_dst)
diff --git a/meta/lib/oeqa/sdkext/files/myapp/Makefile b/meta/lib/oeqa/sdkext/files/myapp/Makefile
new file mode 100644
index 0000000..abd91be
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/files/myapp/Makefile
@@ -0,0 +1,10 @@
+all: myapp
+
+myapp: myapp.o
+	$(CC) $(LDFLAGS) $< -o $@
+
+myapp.o: myapp.c
+	$(CC) $(CFLAGS) -c $< -o $@
+
+clean:
+	rm -rf myapp.o myapp
diff --git a/meta/lib/oeqa/sdkext/files/myapp/myapp.c b/meta/lib/oeqa/sdkext/files/myapp/myapp.c
new file mode 100644
index 0000000..f0b63f0
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/files/myapp/myapp.c
@@ -0,0 +1,9 @@
+#include <stdio.h>
+
+int
+main(int argc, char *argv[])
+{
+	printf("Hello world\n");
+
+	return 0;
+}
-- 
2.1.4


