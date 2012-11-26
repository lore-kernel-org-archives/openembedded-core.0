Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Td37V-0005PW-Fa
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 19:09:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Nov 2012 09:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,321,1352102400"; d="scan'208";a="252706610"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2012 09:54:06 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2012 19:54:22 +0200
Message-Id: <1353952462-18652-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bitbake: fix for mixed-up wget commands
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
X-List-Received-Date: Mon, 26 Nov 2012 18:09:25 -0000

wget commands for check and resume were
mixed-up, leading to the following issues:

1. long running "NOTE: Preparing runqueue"
reason: objects were downloaded, not spidered on the mirror
2. Failing network test in Build Appliance, because wget 1.14
(in use in BA) will fail if a file already exists.
During the network connectivity test, index.php file was
actually downloaded, not spidered (checked for existence on
yoctoproject.org website), leading to wget failure.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 bitbake/lib/bb/fetch2/wget.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index ea99198..2808df6 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -69,10 +69,10 @@ class Wget(FetchMethod):
             basecmd += " -O ${DL_DIR}/" + ud.localfile
 
         if checkonly:
-            fetchcmd = d.getVar("CHECKCOMMAND_wget", True) or d.expand(basecmd + " -c -P ${DL_DIR} '${URI}'")
+            fetchcmd = d.getVar("CHECKCOMMAND_wget", True) or d.expand(basecmd + " --spider '${URI}'")
         elif os.path.exists(ud.localpath):
             # file exists, but we didnt complete it.. trying again..
-            fetchcmd = d.getVar("RESUMECOMMAND_wget", True) or d.expand(basecmd + " --spider -P ${DL_DIR} '${URI}'")
+            fetchcmd = d.getVar("RESUMECOMMAND_wget", True) or d.expand(basecmd + " -c -P ${DL_DIR} '${URI}'")
         else:
             fetchcmd = d.getVar("FETCHCOMMAND_wget", True) or d.expand(basecmd + " -P ${DL_DIR} '${URI}'")
 
-- 
1.7.10.4



