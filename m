Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKTU2-0006uO-FT
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 14:00:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 05:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="276100084"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.191])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 05:43:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 12:43:04 +0000
Message-Id: <42427ce8cd1e9bf6907e56fb8dc09837c28a72ba.1364301448.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364301448.git.paul.eggleton@linux.intel.com>
References: <cover.1364301448.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1364301448.git.paul.eggleton@linux.intel.com>
References: <cover.1364301448.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] qemuimagetest: fix erroneous ps errors when qemu couldn't be started
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
X-List-Received-Date: Tue, 26 Mar 2013 13:00:20 -0000

The helper script was printing an error to stdout when it couldn't find
any qemu child processes; output this error to stderr instead and
redirect stderr to /dev/null when running from qemuimage-testlib so that
QEMUPID is actually blank if there are no qemu instances found.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/qemuimage-testlib              |    2 +-
 scripts/qemuimage-testlib-pythonhelper |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 551011c..6377c7f 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -420,7 +420,7 @@ Test_Create_Qemu()
 
 	while [ ${up_time} -lt 10 ]
 	do
-		QEMUPID=`qemuimage-testlib-pythonhelper --findqemu $XTERMPID`
+		QEMUPID=`qemuimage-testlib-pythonhelper --findqemu $XTERMPID 2>/dev/null`
 		if [ $? -ne 0 ]; then
 			Test_Info "Wait for qemu up..."
 			up_time=`expr $up_time + 5`
diff --git a/scripts/qemuimage-testlib-pythonhelper b/scripts/qemuimage-testlib-pythonhelper
index 2ca61ca..2c1f557 100755
--- a/scripts/qemuimage-testlib-pythonhelper
+++ b/scripts/qemuimage-testlib-pythonhelper
@@ -34,7 +34,7 @@ if options.findqemu:
         commands[data[0]] = data[2]
 
     if options.findqemu not in pids:
-        print "No children found matching %s" % options.findqemu
+        sys.stderr.write("No children found matching %s" % options.findqemu)
         sys.exit(1)
 
     parents = []
-- 
1.7.10.4



