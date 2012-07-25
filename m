Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3o-0004Xl-JP
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897600"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:20 -0700
Message-Id: <0b8d6e3e9c0d27934bfb5217a6dc42b4ff8d4c34.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/28] busybox:udhcpc: fix the root_is_nfs() function
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
X-List-Received-Date: Wed, 25 Jul 2012 07:35:09 -0000

From: "Roy.Li" <rongqing.li@windriver.com>

[YOCTO #2788]

The system will be hung when udhcpc starts, if nfs is mounted
at "/" directory and default route is different after starting
udhcpc.

The cause is that root_is_nfs() does not work after kernel-2.6.37,
since the device name has been changed from /dev/root to
${IPADDR}:${NFSDIR} on /proc/mounts. which leads to remove
the default routes to nfs server,

Now we use a loose match to check if rootfs is nfs.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox_1.19.4.bb   |    2 +-
 meta/recipes-core/busybox/files/simple.script |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index cc97e2a..7bdfbda 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 27368f0..6973985 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -10,7 +10,8 @@ RESOLV_CONF="/etc/resolv.conf"
 
 # return 0 if root is mounted on a network filesystem
 root_is_nfs() {
-	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
+	sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |
+	grep -q "^/ \(nfs\|smbfs\|ncp\|coda\)$"
 }
 
 have_bin_ip=0
-- 
1.7.7.6



