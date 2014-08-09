Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2082A65E2E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:56:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2014 01:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="370120939"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2014 01:53:06 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id D5FA56A4007;
	Sat,  9 Aug 2014 01:55:32 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 14:01:25 +0300
Message-Id: <1407582085-12150-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] oeqa/runtime: add new cpp test and file
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
X-List-Received-Date: Sat, 09 Aug 2014 08:56:10 -0000

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/files/test.cpp | 3 +++
 meta/lib/oeqa/runtime/gcc.py         | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/files/test.cpp

diff --git a/meta/lib/oeqa/runtime/files/test.cpp b/meta/lib/oeqa/runtime/files/test.cpp
new file mode 100644
index 0000000..9e1a764
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/test.cpp
@@ -0,0 +1,3 @@
+#include <limits>
+
+int main() {}
\ No newline at end of file
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime/gcc.py
index 08b3cf1..a7f62e1 100644
--- a/meta/lib/oeqa/runtime/gcc.py
+++ b/meta/lib/oeqa/runtime/gcc.py
@@ -14,6 +14,7 @@ class GccCompileTest(oeRuntimeTest):
     def setUpClass(self):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.c"), "/tmp/test.c")
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "testmakefile"), "/tmp/testmakefile")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.cpp"), "/tmp/test.cpp")
 
     @testcase(203)
     def test_gcc_compile(self):
@@ -29,6 +30,12 @@ class GccCompileTest(oeRuntimeTest):
         (status, output) = self.target.run('/tmp/test')
         self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
 
+    def test_gpp2_compile(self):
+        (status, output) = self.target.run('g++ /tmp/test.cpp -o /tmp/test -lm')
+        self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
+        (status, output) = self.target.run('/tmp/test')
+        self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
+
     @testcase(204)
     def test_make(self):
         (status, output) = self.target.run('cd /tmp; make -f testmakefile')
-- 
1.8.3.2


