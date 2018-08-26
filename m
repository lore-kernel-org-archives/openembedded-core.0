Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 922E77943D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 05:05:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7Q55UFq008905
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 25 Aug 2018 22:05:31 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 25 Aug 2018 22:05:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2018 13:05:28 +0800
Message-ID: <1535259928-36808-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] selftest/package: Add package separated debug symbols hardlink test
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
X-List-Received-Date: Sun, 26 Aug 2018 05:05:31 -0000
Content-Type: text/plain

Tweak recipe selftest-hardlink
- addition of libexecdir to simulate multiple directories
- add gdb.sh to run gdb from script which is invoked at test time.
- rename `hello' -> `hello1' to workaround name confliction with the one in lmbench

Add test_gdb_hardlink_debug to selftest/package
- run a qemu and invoke gdb.sh to gdb binaries of selftest-hardlink
- check gdb to read symbols from separated debug hardlink file
- check debug symbols works correctly

[Test without commit `package.bbclass: only one hardlink of separated debug info file in each directory']
2018-08-26 01:27:30,195 - oe-selftest - INFO - test_gdb_hardlink_debug (package.PackageTests)
2018-08-26 01:30:29,005 - oe-selftest - INFO - gdbtest /usr/bin/hello1
2018-08-26 01:30:36,539 - oe-selftest - INFO - gdbtest /usr/bin/hello2
2018-08-26 01:30:43,568 - oe-selftest - INFO - gdbtest /usr/libexec/hello3
2018-08-26 01:30:50,157 - oe-selftest - ERROR - No debugging symbols found. GDB result:
Reading symbols from /usr/libexec/hello3...(no debugging symbols found)...done.^M
(gdb) Function "main" not defined.^M
Make breakpoint pending on future shared library load? (y or [n]) [answered N; input not from terminal]^M
(gdb) Starting program: /usr/libexec/hello3 ^M
Hello World!^M
[Inferior 1 (process 320) exited normally]^M
(gdb) The program is not being run.^M
(gdb)
2018-08-26 01:30:51,180 - oe-selftest - INFO -  ... FAIL
2018-08-26 01:30:51,181 - oe-selftest - INFO - Traceback (most recent call last):
  File "oe-core/meta/lib/oeqa/selftest/cases/package.py", line 148, in test_gdb_hardlink_debug
    self.fail('GDB %s failed' % binary)
AssertionError: GDB /usr/libexec/hello3 failed
[Test without commit `package.bbclass: only one hardlink of separated debug info file in each directory']

[Test with commit `package.bbclass: only one hardlink of separated debug info file in each directory']
2018-08-26 12:40:30,976 - oe-selftest - INFO - test_gdb_hardlink_debug (package.PackageTests)
2018-08-26 12:42:15,149 - oe-selftest - INFO - gdbtest /usr/bin/hello1
2018-08-26 12:42:24,064 - oe-selftest - INFO - gdbtest /usr/bin/hello2
2018-08-26 12:42:31,078 - oe-selftest - INFO - gdbtest /usr/libexec/hello3
2018-08-26 12:42:38,646 - oe-selftest - INFO - gdbtest /usr/libexec/hello4
2018-08-26 12:42:46,824 - oe-selftest - INFO -  ... ok
[Test with commit `package.bbclass: only one hardlink of separated debug info file in each directory']

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../selftest-hardlink/selftest-hardlink.bb         | 22 ++++++++----
 .../selftest-hardlink/selftest-hardlink/gdb.sh     |  8 +++++
 meta/lib/oeqa/selftest/cases/package.py            | 39 ++++++++++++++++++++--
 3 files changed, 61 insertions(+), 8 deletions(-)
 create mode 100755 meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/gdb.sh

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index ec330fa..842a977 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -2,19 +2,29 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-SRC_URI = "file://hello.c"
+SRC_URI = "file://hello.c \
+           file://gdb.sh \
+"
 
 S = "${WORKDIR}"
 
 do_compile () {
-	${CC} hello.c -o hello ${CFLAGS} ${LDFLAGS}
+	${CC} hello.c -o hello1 ${CFLAGS} ${LDFLAGS}
 }
 
 do_install () {
 	install -d ${D}${bindir}
-	install -m 755 hello ${D}${bindir}/hello
-	ln ${D}${bindir}/hello ${D}${bindir}/hello2
-	ln ${D}${bindir}/hello ${D}${bindir}/hello3
-	ln ${D}${bindir}/hello ${D}${bindir}/hello4
+	install -m 755 ${WORKDIR}/gdb.sh ${D}${bindir}/
+	install -m 755 hello1 ${D}${bindir}/hello1
+	ln ${D}${bindir}/hello1 ${D}${bindir}/hello2
+
+	install -d ${D}${libexecdir}
+	ln ${D}${bindir}/hello1 ${D}${libexecdir}/hello3
+	ln ${D}${bindir}/hello1 ${D}${libexecdir}/hello4
+
 	dd if=/dev/zero of=${D}${bindir}/sparsetest bs=1 count=0 seek=1M
 }
+
+RDEPENDS_${PN}-gdb += "gdb"
+PACKAGES =+ "${PN}-gdb"
+FILES_${PN}-gdb = "${bindir}/gdb.sh"
diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/gdb.sh b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/gdb.sh
new file mode 100755
index 0000000..f6417d5
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/gdb.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+gdb -q $1  <<'EOF'
+b main
+r
+c
+q
+EOF
+echo ""
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index ee6430a..0a88dc2 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,6 +1,6 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var
+from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu
 import stat
 import subprocess, os
 import oe.path
@@ -98,7 +98,7 @@ class PackageTests(OESelftestTestCase):
         def checkfiles():
             # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
             # so expect 8 in total.
-            self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello").st_nlink, 8)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello1").st_nlink, 8)
 
             # Test a sparse file remains sparse
             sparsestat = os.stat(dest + "/selftest-hardlink" + bindir + "/sparsetest")
@@ -112,3 +112,38 @@ class PackageTests(OESelftestTestCase):
         bitbake("selftest-hardlink -c package")
 
         checkfiles()
+
+    # Verify gdb to read symbols from separated debug hardlink file correctly
+    def test_gdb_hardlink_debug(self):
+        features = 'IMAGE_INSTALL_append = " selftest-hardlink"\n'
+        features += 'IMAGE_INSTALL_append = " selftest-hardlink-dbg"\n'
+        features += 'IMAGE_INSTALL_append = " selftest-hardlink-gdb"\n'
+        self.write_config(features)
+        bitbake("core-image-minimal")
+
+        def gdbtest(qemu, binary):
+            """
+            Check that gdb ``binary`` to read symbols from separated debug file
+            """
+            self.logger.info("gdbtest %s" % binary)
+            status, output = qemu.run_serial('/usr/bin/gdb.sh %s' % binary, timeout=60)
+            for l in output.split('\n'):
+                # Check debugging symbols exists
+                if '(no debugging symbols found)' in l:
+                    self.logger.error("No debugging symbols found. GDB result:\n%s" % output)
+                    return False
+
+                # Check debugging symbols works correctly
+                elif "Breakpoint 1, main () at hello.c:4" in l:
+                    return True
+
+            self.logger.error("GDB result:\n%s: %s" % output)
+            return False
+
+        with runqemu('core-image-minimal') as qemu:
+            for binary in ['/usr/bin/hello1',
+                           '/usr/bin/hello2',
+                           '/usr/libexec/hello3',
+                           '/usr/libexec/hello4']:
+                if not gdbtest(qemu, binary):
+                    self.fail('GDB %s failed' % binary)
-- 
2.7.4


