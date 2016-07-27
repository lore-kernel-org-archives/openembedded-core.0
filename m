Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3959A73199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:40:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 15:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="146562749"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.54])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2016 15:40:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:40:42 -0500
Message-Id: <1469659242-12350-6-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
References: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] oeqa/utils/commands.py: Command class improve validations/decoding in output
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
X-List-Received-Date: Wed, 27 Jul 2016 22:40:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When run a command sometimes the output isn't provided so validate
before trying to encode to utf-8, also some output like BIOS/EFI
contains characters that can't be codified into utf-8 for this reason
set errors='replace'.

[YOCTO #10019]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 4f79d15..a8e184d 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -78,7 +78,10 @@ class Command(object):
                 self.process.kill()
                 self.thread.join()
 
-        self.output = self.output.decode("utf-8").rstrip()
+        if not self.output:
+            self.output = ""
+        else:
+            self.output = self.output.decode("utf-8", errors='replace').rstrip()
         self.status = self.process.poll()
 
         self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
-- 
2.1.4


