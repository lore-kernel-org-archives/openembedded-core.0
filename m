Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0530473200
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:49:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2017 12:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="37939486"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.122])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2017 12:49:51 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 14:52:55 -0600
Message-Id: <1485895975-7611-4-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1485895975-7611-1-git-send-email-anibal.limon@linux.intel.com>
References: <1485895975-7611-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] oeqa/runtime/cases: Rename syslog module to oe_syslog
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
X-List-Received-Date: Tue, 31 Jan 2017 20:49:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Debian based distros has a builtin syslog module so when
try to load tests using unittest it references the builtin
module instead of runtime/cases.

[YOCTO #10964]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass                          | 2 +-
 meta/lib/oeqa/runtime/cases/{syslog.py => oe_syslog.py} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{syslog.py => oe_syslog.py} (92%)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 7495fe1..c6e4cec 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -38,7 +38,7 @@ TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
 SYSTEMDSUITE = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 MINTESTSUITE = "ping"
-NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog ${SYSTEMDSUITE}"
+NETTESTSUITE = "${MINTESTSUITE} ssh df date scp oe_syslog ${SYSTEMDSUITE}"
 DEVTESTSUITE = "gcc kernelmodule ldd"
 
 DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
diff --git a/meta/lib/oeqa/runtime/cases/syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
similarity index 92%
rename from meta/lib/oeqa/runtime/cases/syslog.py
rename to meta/lib/oeqa/runtime/cases/oe_syslog.py
index 537c519..005b697 100644
--- a/meta/lib/oeqa/runtime/cases/syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -18,7 +18,7 @@ class SyslogTest(OERuntimeTestCase):
 class SyslogTestConfig(OERuntimeTestCase):
 
     @OETestID(1149)
-    @OETestDepends(['syslog.SyslogTest.test_syslog_running'])
+    @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_logger(self):
         status, output = self.target.run('logger foobar')
         msg = "Can't log into syslog. Output: %s " % output
@@ -35,7 +35,7 @@ class SyslogTestConfig(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(1150)
-    @OETestDepends(['syslog.SyslogTest.test_syslog_running'])
+    @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
         if "systemd" != self.tc.td.get("VIRTUAL-RUNTIME_init_manager", ""):
             (_, _) = self.target.run('/etc/init.d/syslog restart')
@@ -44,7 +44,7 @@ class SyslogTestConfig(OERuntimeTestCase):
 
 
     @OETestID(202)
-    @OETestDepends(['syslog.SyslogTestConfig.test_syslog_logger'])
+    @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
     @OEHasPackage(["!sysklogd", "busybox"])
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
                    'Not appropiate for systemd image')
-- 
2.1.4


