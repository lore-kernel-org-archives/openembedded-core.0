Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC17770EF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:38:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 24 Jan 2016 11:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="35360044"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2016 11:38:11 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 80ECD2C8001;
	Sun, 24 Jan 2016 12:26:04 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:51 +0200
Message-Id: <1453664991-31706-13-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Subject: [PATCH 13/13] Files to test the patch set.
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
X-List-Received-Date: Sun, 24 Jan 2016 19:38:09 -0000

Please don't include these files. Their sole purpose is to provide
necessary ground to easily test the patch set.

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/runtime/mytest.py                | 25 +++++++++++++++++++++++++
 meta/recipes-test/hello-dut/files/hello.c      |  8 ++++++++
 meta/recipes-test/hello-dut/hello-dut_0.1.bb   | 15 +++++++++++++++
 meta/recipes-test/hello-native/files/hello.c   |  9 +++++++++
 meta/recipes-test/hello-native/hello_0.1.bb    | 16 ++++++++++++++++
 meta/recipes-test/hello-test/files/hello.c     |  9 +++++++++
 meta/recipes-test/hello-test/hello-test_0.1.bb | 16 ++++++++++++++++
 7 files changed, 98 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/mytest.py
 create mode 100644 meta/recipes-test/hello-dut/files/hello.c
 create mode 100644 meta/recipes-test/hello-dut/hello-dut_0.1.bb
 create mode 100644 meta/recipes-test/hello-native/files/hello.c
 create mode 100644 meta/recipes-test/hello-native/hello_0.1.bb
 create mode 100644 meta/recipes-test/hello-test/files/hello.c
 create mode 100644 meta/recipes-test/hello-test/hello-test_0.1.bb

diff --git a/meta/lib/oeqa/runtime/mytest.py b/meta/lib/oeqa/runtime/mytest.py
new file mode 100644
index 0000000..6afb79e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/mytest.py
@@ -0,0 +1,25 @@
+import os
+from time import sleep
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import TestNeedsBin
+
+class mytest(oeRuntimeTest):
+
+############### A simple test for the DUT ######################
+
+    @TestNeedsBin(("hello-dut","rm"),
+                  ("hello-test","rm"),
+                  ("hello-test","rpm","rm"),
+                  ("hello-dut","rpm"),
+                  ("hello","native")
+                  )
+    def test_hello_on_DUT_3(self):
+         (status, output) = self.target.run("hello")
+         self.a=5
+         print("For hello: " + str(output) + "\n")
+         (status1,output1) = self.target.run("hello-test")
+         print("For hello-test: " + str(output1) + "\n")
+         self.assertEqual(status, 0, "failed for hello")
+         self.assertEqual(status1, 0, "failed for hello-test")
+
+       
diff --git a/meta/recipes-test/hello-dut/files/hello.c b/meta/recipes-test/hello-dut/files/hello.c
new file mode 100644
index 0000000..fb89415
--- /dev/null
+++ b/meta/recipes-test/hello-dut/files/hello.c
@@ -0,0 +1,8 @@
+#include <stdio.h>
+
+int main(int argc, char** argv)
+{
+  printf("Hello world on DUT \n");
+  return 0;
+
+}
diff --git a/meta/recipes-test/hello-dut/hello-dut_0.1.bb b/meta/recipes-test/hello-dut/hello-dut_0.1.bb
new file mode 100644
index 0000000..832b62f
--- /dev/null
+++ b/meta/recipes-test/hello-dut/hello-dut_0.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Hello world recipe"
+DESCRIPTION = "test application"
+LICENSE = "CLOSED"
+SRC_URI = "file://hello.c \
+"
+S = "${WORKDIR}"
+do_compile() {
+    ${CC} hello.c -o hello
+}
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 hello ${D}/${bindir}
+}
+
diff --git a/meta/recipes-test/hello-native/files/hello.c b/meta/recipes-test/hello-native/files/hello.c
new file mode 100644
index 0000000..ed30d69
--- /dev/null
+++ b/meta/recipes-test/hello-native/files/hello.c
@@ -0,0 +1,9 @@
+#include <stdio.h>
+
+int main(int argc, char** argv)
+{
+  printf("Hello world on host machine \n");
+
+  return 0;
+
+}
diff --git a/meta/recipes-test/hello-native/hello_0.1.bb b/meta/recipes-test/hello-native/hello_0.1.bb
new file mode 100644
index 0000000..42659b9
--- /dev/null
+++ b/meta/recipes-test/hello-native/hello_0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Hello world recipe"
+DESCRIPTION = "test application"
+LICENSE = "CLOSED"
+SRC_URI = "file://hello.c \
+"
+S = "${WORKDIR}"
+do_compile() {
+    ${CC} hello.c -o hello
+}
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 hello ${D}/${bindir}
+}
+
+BBCLASSEXTEND = "nativesdk native"
diff --git a/meta/recipes-test/hello-test/files/hello.c b/meta/recipes-test/hello-test/files/hello.c
new file mode 100644
index 0000000..405aed1
--- /dev/null
+++ b/meta/recipes-test/hello-test/files/hello.c
@@ -0,0 +1,9 @@
+#include <stdio.h>
+
+int main(int argc, char** argv)
+{
+  printf("Hello test \n");
+
+  return 0;
+
+}
diff --git a/meta/recipes-test/hello-test/hello-test_0.1.bb b/meta/recipes-test/hello-test/hello-test_0.1.bb
new file mode 100644
index 0000000..9832eb0
--- /dev/null
+++ b/meta/recipes-test/hello-test/hello-test_0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Hello world recipe"
+DESCRIPTION = "test application"
+LICENSE = "CLOSED"
+SRC_URI = "file://hello.c \
+"
+S = "${WORKDIR}"
+do_compile() {
+    ${CC} hello.c -o hello-test
+}
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 hello-test ${D}/${bindir}
+}
+
+BBCLASSEXTEND = "nativesdk native"
-- 
2.5.0


