Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9561D766E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 19:23:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2015 12:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,574,1437462000"; d="scan'208";a="795018174"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2015 12:23:55 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 11:14:15 +0000
Message-Id: <df4f3c9437eab3eb8f400f06052d2a81658c9659.1442920096.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1442920096.git.mariano.lopez@linux.intel.com>
References: <cover.1442920096.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oeqa/utils/dump: Add default commands and directory
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
X-List-Received-Date: Tue, 22 Sep 2015 19:23:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently if qemu fails when running a selftest and
tries to run some commands on the host it will fail
because some variables required by the Dumper class
do not exist because testimage was not included.

This change adds a default parent directory to save
the dumps for the host or target. Also adds default
commands to run if no commands were provided to the
class. With these changes the previous errors using
selftest don't show anymore.

[YOCTO #8306]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/dump.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 4ae871c..3f31e20 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -16,9 +16,18 @@ class BaseDumper(object):
 
     def __init__(self, cmds, parent_dir):
         self.cmds = []
-        self.parent_dir = parent_dir
+        # Some testing doesn't inherit testimage, so it is needed
+        # to set some defaults.
+        self.parent_dir = parent_dir or "/tmp/oe-saved-tests"
+        dft_cmds = """  top -bn1
+                        ps -ef
+                        free
+                        df
+                        memstat
+                        dmesg
+                        netstat -an"""
         if not cmds:
-            return
+            cmds = dft_cmds
         for cmd in cmds.split('\n'):
             cmd = cmd.lstrip()
             if not cmd or cmd[0] == '#':
-- 
1.8.4.5


