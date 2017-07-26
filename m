Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E52C378164
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 15:03:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 08:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,415,1496127600"; d="scan'208";a="129729220"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 26 Jul 2017 08:03:30 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 10:04:10 -0500
Message-Id: <20170726150410.5492-2-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170726150410.5492-1-anibal.limon@linux.intel.com>
References: <20170726150410.5492-1-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, paul.eggleton@linux.intel.com
Subject: [PATCH 2/2] oeqa/core/runner: OEStreamLogger don't buffer test execution writes
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
X-List-Received-Date: Wed, 26 Jul 2017 15:03:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since OEQA framework uses Python logging functionality to report test
results there is a class that wraps PyUnit writes into logging commands
(OEStreamLogger), so don't buffer the actual test execution to have
insight of what is currently executing.

This fix will change a little the test output format adding an '\n'
previous the test result, for example:

From:

test_nonmatching_checksum (lic_checksum.LicenseTests) ... ok

To:

test_nonmatching_checksum (lic_checksum.LicenseTests)
 ... ok

This is because the new line added by the PyUnit StreamLogger because
currently we don't have a manner to identify when a test execution
starts at report level (write msg).

[YOCTO #11827]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/runner.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 8a55c24c788..f6539e60b6b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -25,10 +25,14 @@ class OEStreamLogger(object):
 
     def write(self, msg):
         if len(msg) > 1 and msg[0] != '\n':
-            self.buffer += msg
-        else:
-            self.logger.log(logging.INFO, self.buffer.rstrip("\n"))
-            self.buffer = ""
+            if '...' in msg:
+                self.buffer += msg
+            elif self.buffer:
+                self.buffer += msg
+                self.logger.log(logging.INFO, self.buffer)
+                self.buffer = ""
+            else:
+                self.logger.log(logging.INFO, msg)
 
     def flush(self):
         for handler in self.logger.handlers:
-- 
2.11.0


