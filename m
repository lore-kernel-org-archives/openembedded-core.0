Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UQuZo-0003pP-0s
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 09:08:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Apr 2013 23:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,466,1363158000"; d="scan'208";a="294364059"
Received: from unknown (HELO swold-linux.site.stayonline.net) ([10.255.14.4])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2013 23:51:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 23:51:16 -0700
Message-Id: <1365835876-28667-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] udev: Update initscript to check for devtmpfs
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
X-List-Received-Date: Sat, 13 Apr 2013 07:08:46 -0000

This is needed because the udev_182 now requires devtmpfs and will not work correctly
with out, so ensure that the kernel contains devtmpfs by checking /proc/filesystems.

[YOCTO #4125]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev/init | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 37b5231..2a95ab7 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -35,6 +35,14 @@ case "$1" in
     # propagate /dev from /sys
     echo "Starting udev"
 
+    # Check for requireed devtmpfs before trying to start udev and
+    # mount a no-existant fs.
+    if ! grep -q devtmpfs /proc/filesystems
+    then
+        echo "Missing devtmpfs, which is required for udev to run";
+        echo "Halting..."
+        halt
+    fi
     # mount the tmpfs on /dev, if not already done
     LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
             mount -n -o mode=0755 -t tmpfs none "/dev"
-- 
1.8.0.2



