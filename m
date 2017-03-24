Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E688177BBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490366607; x=1521902607; h=from:to:subject:date:message-id;
	bh=tj+2gGNKc4UX/EAFmcwhpM7pwM+qUm9zx7edYWN+g2Y=;
	b=d47a+BTrnpsCx0nYNjew7kTcmDlW/vNxeOH7bj407lmVszGys9y6UWys
	Sga95Dt/WAEY8O5Z+VweAuDcdqfMPg==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="947835365"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 24 Mar 2017 07:43:25 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:43:24 +0200
Message-Id: <20170324144325.28637-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 1/2] oeqa.utils.commands: limit runCmd exception output
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
X-List-Received-Date: Fri, 24 Mar 2017 14:43:26 -0000

Make it possible to limit the length of output lines shown in runCmd
exceptions. E.g when running bitbake we easily get thousands of lines of
log output, where only the last few (tens) are interesting or relevant
when an error occurs.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 82c5908..6901f1a 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -97,7 +97,8 @@ class Result(object):
     pass
 
 
-def runCmd(command, ignore_status=False, timeout=None, assert_error=True, native_sysroot=None, **options):
+def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
+          native_sysroot=None, limit_exc_output=0, **options):
     result = Result()
 
     if native_sysroot:
@@ -117,10 +118,16 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, native
     result.pid = cmd.process.pid
 
     if result.status and not ignore_status:
+        exc_output = result.output
+        if limit_exc_output > 0:
+            split = result.output.splitlines()
+            if len(split) > limit_exc_output:
+                exc_output = "\n... (last %d lines of output)\n" % limit_exc_output + \
+                             '\n'.join(split[-limit_exc_output:])
         if assert_error:
-            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, result.output))
+            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
         else:
-            raise CommandError(result.status, command, result.output)
+            raise CommandError(result.status, command, exc_output)
 
     return result
 
-- 
2.10.2


