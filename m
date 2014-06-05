Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6356B7A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 07:25:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2014 00:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,979,1392192000"; d="scan'208";a="542761877"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2014 00:25:31 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id B61EC6A4087;
	Thu,  5 Jun 2014 00:25:04 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 12:29:44 +0300
Message-Id: <1401960584-23974-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] oeqa/utils/commands.py: add support for postconfig option
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
X-List-Received-Date: Thu, 05 Jun 2014 07:25:51 -0000

Adding support for postconfig option to the bitbake() and related methods.

This enables us to use 'bitbake -R postconfig_file <command>'.

Usage: bitbake(cmd, postconfig="some confguration")

'postconfig_file' would contain what we add in 'postconfig'

Other methods affected: get_bb_env(), get_bb_var()

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 7637b9d..802bc2f 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -15,6 +15,7 @@ import subprocess
 import threading
 import logging
 from oeqa.utils import CommandError
+from oeqa.utils import ftools
 
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, **options):
@@ -106,24 +107,36 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, **opti
     return result
 
 
-def bitbake(command, ignore_status=False, timeout=None, **options):
+def bitbake(command, ignore_status=False, timeout=None, postconfig=None, **options):
+
+    if postconfig:
+	postconfig_file = os.path.join(os.environ.get('BUILDDIR'), 'oeqa-post.conf')
+	ftools.write_file(postconfig_file, postconfig)
+	extra_args = "-R %s" % postconfig_file
+    else:
+	extra_args = ""
+
     if isinstance(command, basestring):
-        cmd = "bitbake " + command
+        cmd = "bitbake " + extra_args + " " + command
     else:
-        cmd = [ "bitbake" ] + command
+        cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
 
-    return runCmd(cmd, ignore_status, timeout, **options)
+    try:
+	return runCmd(cmd, ignore_status, timeout, **options)
+    finally:
+        if postconfig:
+            os.remove(postconfig_file)
 
 
-def get_bb_env(target=None):
+def get_bb_env(target=None, postconfig=None):
     if target:
-        return runCmd("bitbake -e %s" % target).output
+        return bitbake("-e %s" % target, postconfig=postconfig).output
     else:
-        return runCmd("bitbake -e").output
+        return bitbake("-e", postconfig=postconfig).output
 
-def get_bb_var(var, target=None):
+def get_bb_var(var, target=None, postconfig=None):
     val = None
-    bbenv = get_bb_env(target)
+    bbenv = get_bb_env(target, postconfig=postconfig)
     for line in bbenv.splitlines():
         if line.startswith(var + "="):
             val = line.split('=')[1]
-- 
1.8.3.2


