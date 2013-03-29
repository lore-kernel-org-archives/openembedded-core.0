Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1ULaH1-0000sE-3W
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 15:27:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Mar 2013 07:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,373,1363158000"; d="scan'208";a="220255361"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Mar 2013 07:10:12 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 16:10:51 +0200
Message-Id: <1364566251-16209-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] meta/lib/oe/lsb.py: extract only the needed info from lsb-release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 14:27:19 -0000

Instead of running lsb_release -a, a lsb_release -ir will be run.
This will prevent issue with distros that don't have all the needed
info in /etc/lsb-release file, in which case lsb_release won't generate
an error code.

Partial fix for [YOCTO #4071]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/lib/oe/lsb.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index ebf90ba..fed1204 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,9 +1,9 @@
 def release_dict():
-    """Return the output of lsb_release -a as a dictionary"""
+    """Return the output of lsb_release -ir as a dictionary"""
     from subprocess import PIPE
 
     try:
-        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
+        output, err = bb.process.run(['lsb_release', '-ir'], stderr=PIPE)
     except bb.process.CmdError as exc:
         return None
 
-- 
1.7.10.4



