Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A968C799B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 08:40:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8E8e7Kp027154
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Sep 2018 01:40:17 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 14 Sep 2018 01:39:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Sep 2018 16:49:41 +0800
Message-ID: <9ebbb0a3ad3ce5d6c6d0cb7cad4be3d7b231bc93.1536913629.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536913629.git.hongxu.jia@windriver.com>
References: <cover.1536913629.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] selftest/package: improve case to test debug package splitting
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
X-List-Received-Date: Fri, 14 Sep 2018 08:40:58 -0000
Content-Type: text/plain

Tweak recipe selftest-hardlink
- Add ${PN}-bin, ${PN}-bin-dbg

Tweak case test_gdb_hardlink_debug
- Test gdb debug package separately, verify the debug
  package splitting works correctly.

[Test without commit `package.bbclass: improve auto debug package splitting order']
2018-09-14 15:58:06,233 - oe-selftest - INFO - ======================================================================
2018-09-14 15:58:06,233 - oe-selftest - INFO - FAIL: test_gdb_hardlink_debug (package.PackageTests)
2018-09-14 15:58:06,233 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-09-14 15:58:06,233 - oe-selftest - INFO - Traceback (most recent call last):
  File "oe-core/meta/lib/oeqa/selftest/cases/package.py", line 123, in test_gdb_hardlink_debug
    self._test_gdb_debug(packages, binaries)
  File "oe-core/meta/lib/oeqa/selftest/cases/package.py", line 162, in _test_gdb_debug
    self.fail('GDB %s failed' % binary)
AssertionError: GDB /usr/libexec/hello3 failed
[Test without commit `package.bbclass: improve auto debug package splitting order']

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../selftest-hardlink/selftest-hardlink.bb         |  4 +++-
 meta/lib/oeqa/selftest/cases/package.py            | 27 ++++++++++++++++------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index 842a977..7d544b4 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -26,5 +26,7 @@ do_install () {
 }
 
 RDEPENDS_${PN}-gdb += "gdb"
-PACKAGES =+ "${PN}-gdb"
+PACKAGES =+ "${PN}-gdb ${PN}-bin ${PN}-bin-dbg"
 FILES_${PN}-gdb = "${bindir}/gdb.sh"
+FILES_${PN}-bin-dbg = "${bindir}/.debug/*"
+
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 0a88dc2..d00cd49 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -115,9 +115,25 @@ class PackageTests(OESelftestTestCase):
 
     # Verify gdb to read symbols from separated debug hardlink file correctly
     def test_gdb_hardlink_debug(self):
-        features = 'IMAGE_INSTALL_append = " selftest-hardlink"\n'
-        features += 'IMAGE_INSTALL_append = " selftest-hardlink-dbg"\n'
-        features += 'IMAGE_INSTALL_append = " selftest-hardlink-gdb"\n'
+        packages = ['selftest-hardlink',
+                    'selftest-hardlink-dbg',
+                    'selftest-hardlink-gdb']
+        binaries = ['/usr/libexec/hello3',
+                    '/usr/libexec/hello4']
+        self._test_gdb_debug(packages, binaries)
+
+        packages = ['selftest-hardlink-bin',
+                    'selftest-hardlink-bin-dbg',
+                    'selftest-hardlink-gdb']
+        binaries = ['/usr/bin/hello1',
+                    '/usr/bin/hello2']
+        self._test_gdb_debug(packages, binaries)
+
+    def _test_gdb_debug(self, packages, binaries):
+        features = ""
+        for pkg in packages:
+            features += 'IMAGE_INSTALL_append = " %s"\n' % pkg
+
         self.write_config(features)
         bitbake("core-image-minimal")
 
@@ -141,9 +157,6 @@ class PackageTests(OESelftestTestCase):
             return False
 
         with runqemu('core-image-minimal') as qemu:
-            for binary in ['/usr/bin/hello1',
-                           '/usr/bin/hello2',
-                           '/usr/libexec/hello3',
-                           '/usr/libexec/hello4']:
+            for binary in binaries:
                 if not gdbtest(qemu, binary):
                     self.fail('GDB %s failed' % binary)
-- 
2.7.4


