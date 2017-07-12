Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 00E51781DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133804"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:59 -0500
Message-Id: <2559969d7c84a03594f89b161466e32a3e9aeacc.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 13/29] oeqa/selftest/case: tearDown extra commands print what actually fails
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:06 -0000
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


