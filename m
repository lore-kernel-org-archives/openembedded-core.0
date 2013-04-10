Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxRZ-0006Je-H8
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 18:00:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2013 08:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="284331507"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2013 08:42:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:42:27 +0100
Message-Id: <0ed65e5bbc29236f77d84ae7c594874d6b627056.1365608262.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] initscripts: fix read-only-rootfs-hook.sh to avoid using unionfs
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
X-List-Received-Date: Wed, 10 Apr 2013 16:00:40 -0000

Unionfs isn't available everywhere, and we can get similar results (if
not quite as neatly) by using bind mounts + tmpfs and copying the data
over.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../initscripts-1.0/read-only-rootfs-hook.sh            |   15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 3a295ee..4f3e0d9 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -4,16 +4,9 @@
 
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
-# Make sure unionfs is in /proc/filesystems
-if ! grep -q unionfs /proc/filesystems; then
-    echo "ERROR: unionfs not supported by kernel!"
-    exit 1
+if [ "$1" = "start" ] ; then
+	mkdir -p /var/volatile/lib
+	cp -a /var/lib/* /var/volatile/lib
+	mount --bind /var/volatile/lib /var/lib
 fi
 
-mkdir -p /var/volatile/lib
-mount -t unionfs -o dirs=/var/volatile/lib:/var/lib=ro none /var/lib
-
-if [ $? != 0 ]; then
-    echo "ERROR: Union mount failed!"
-    exit 1
-fi
-- 
1.7.10.4



