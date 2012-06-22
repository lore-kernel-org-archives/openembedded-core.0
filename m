Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8A-0007hH-1f
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173232"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:42 -0700
Message-Id: <b6748ff02cd7d4433894571b42533edf4ac6a541.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/17] cml1.bbclass: Only delay exit if the command fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 22:15:06 -0000

From: Darren Hart <dvhart@linux.intel.com>

Rather than pause for 5 seconds, test the return code of the command and
require user input before exiting on failure. This avoids pausing after
successful command execution as well as possibly not waiting long enough
if the user happens to be doing something else for 5 seconds.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/cml1.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index fd80c18..67f17ad 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -20,7 +20,7 @@ python do_menuconfig() {
         except OSError:
             mtime = 0
 
-        oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)
+        oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; echo -n 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
 
         # FIXME this check can be removed when the minimum bitbake version has been bumped
         if hasattr(bb.build, 'write_taint'):
-- 
1.7.7.6



