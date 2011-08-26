Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Ke-0006Xu-2U
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450528"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:40 -0700
Message-Id: <74ff1bc8c248824116ba4b787b10fa6ee0c13ce1.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/21] scripts/runqemu: disable unfs boot mode for qemuppc
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:49 -0000

From: Liming Wang <liming.wang@windriver.com>

Because unfs boot mode is unstable for qemuppc, disable
it temporarily.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 scripts/runqemu |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 91c3c9e..113088e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -354,6 +354,12 @@ if [ -z "$FSTYPE" ]; then
         usage
     fi
 fi
+
+if [ "$FSTYPE" = "nfs" -a "$MACHINE" = "qemuppc" ]; then
+    echo "Error: usermode NFS boot is not available for qemuppc."
+    exit 1
+fi
+
 # FSTYPE is now set for all cases
 
 # Handle cases where a ROOTFS type is given instead of a filename, e.g.
-- 
1.7.6



