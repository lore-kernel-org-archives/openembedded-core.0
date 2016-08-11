Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DA1A473D27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 20:18:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2016 13:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,506,1464678000"; d="scan'208";a="1034050308"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.36])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2016 13:18:09 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:18:16 -0500
Message-Id: <1470946696-9297-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] oeqa/runtime/syslog.py: Improve test_syslog_logger on systemd
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
X-List-Received-Date: Thu, 11 Aug 2016 20:18:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When an image uses systemd journald acts as a main syslog daemon using
/dev/log.

The test_syslog_logger try to log a predifined message into the syslog
using logger and then search using grep in /var/log/messages if this
fails for some reason (file rotated) now search the predifined message
into the journal.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index cce3c22..8f55032 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -22,8 +22,11 @@ class SyslogTestConfig(oeRuntimeTest):
         self.assertEqual(status, 0, msg="Can't log into syslog. Output: %s " % output)
 
         (status, output) = self.target.run('grep foobar /var/log/messages')
-        if status != 0 and not oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", "") == "systemd":
-            (status, output) = self.target.run('logread | grep foobar')
+        if status != 0:
+            if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", "") == "systemd":
+                (status, output) = self.target.run('journalctl -o cat | grep foobar')
+            else:
+                (status, output) = self.target.run('logread | grep foobar')
         self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages or logread. Output: %s " % output)
 
     @testcase(1150)
-- 
2.1.4


