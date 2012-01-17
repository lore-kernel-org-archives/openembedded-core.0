Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4az-0006gw-W4
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632985"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:20 -0800
Message-Id: <37d3cd88ff4d88031f2de3b309aff705c7b92720.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 35/62] package.bbclass: quote pathname given to objdump
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
X-List-Received-Date: Tue, 17 Jan 2012 08:48:15 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Packaging will fail with executable files containing spaces in their
names. Patch quotes the parameter passed to 'objdump'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f8f0a12..1088470 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1205,7 +1205,7 @@ SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
 SHLIBSWORKDIR = "${WORKDIR}/shlibs"
 
 python package_do_shlibs() {
-	import re
+	import re, pipes
 
 	exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', 0)
 	if exclude_shlibs:
@@ -1234,7 +1234,7 @@ python package_do_shlibs() {
 	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
 
 	def linux_so(root, path, file):
-		cmd = d.getVar('OBJDUMP', True) + " -p " + os.path.join(root, file) + " 2>/dev/null"
+		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
 		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
 		fd = os.popen(cmd)
 		lines = fd.readlines()
-- 
1.7.6.5



