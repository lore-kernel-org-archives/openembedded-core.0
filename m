Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB2177FF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279732"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:37 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:28 -0500
Message-Id: <1b1829720497e93c27a6d51ccd2b54c597986868.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 13/30] oeqa/selftest/case: tearDown extra commands print what actually fails
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Its better to have the output to see what actually fails in a
command that is aim to execute at end of a test case.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index bbdce4cf9e8..c6f2d184ea3 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -224,13 +224,18 @@ to ensure accurate results.")
 
     def tearDown(self):
         if self._extra_tear_down_commands:
-            failed_extra_commands = []
+            failed_extra_commands = {}
             for command in self._extra_tear_down_commands:
                 result = self.runCmd(command, ignore_status=True)
-                if not result.status ==  0:
-                    failed_extra_commands.append(command)
+                if not result.status == 0:
+                    failed_extra_commands[command] = result
             if failed_extra_commands:
-                self.logger.warning("tearDown commands have failed: %s" % ', '.join(map(str, failed_extra_commands)))
+                self.logger.warning("%s: tearDown commands have failed" % \
+                        self.id())
+                for cmd in failed_extra_commands:
+                    result = failed_extra_commands[cmd]
+                    self.logger.warning("%s: %s\n%s" % (self.id(), cmd,
+                        result.output))
                 self.logger.debug("Trying to move on.")
             self._extra_tear_down_commands = []
 
-- 
2.11.0


