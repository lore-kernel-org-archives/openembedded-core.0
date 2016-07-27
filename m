Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2913E606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:40:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 15:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="146562671"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.54])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2016 15:40:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:40:38 -0500
Message-Id: <1469659242-12350-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
References: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] oeqa/runtime/syslog.py: Improve test_syslog_logger
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
X-List-Received-Date: Wed, 27 Jul 2016 22:40:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of make all the testing in a shell one liner, divide the
test into 3 operations to be able to know in what part is failing.

Parts,
	- Log message to syslog
	- Review if message exist in /var/log/messages
		- Review if message exist using logread

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index f7421ec..202a63f 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -18,8 +18,13 @@ class SyslogTestConfig(oeRuntimeTest):
     @testcase(1149)
     @skipUnlessPassed("test_syslog_running")
     def test_syslog_logger(self):
-        (status,output) = self.target.run('logger foobar && test -e /var/log/messages && grep foobar /var/log/messages || logread | grep foobar')
-        self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages. Output: %s " % output)
+        (status, output) = self.target.run('logger foobar')
+        self.assertEqual(status, 0, msg="Can't log into syslog. Output: %s " % output)
+
+        (status, output) = self.target.run('grep foobar /var/log/messages')
+        if status != 0:
+            (status, output) = self.target.run('logread | grep foobar')
+        self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages or logread. Output: %s " % output)
 
     @testcase(1150)
     @skipUnlessPassed("test_syslog_running")
-- 
2.1.4


