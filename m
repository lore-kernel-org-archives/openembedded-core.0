Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxRk-0006Jg-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 18:00:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2013 08:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="284331513"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2013 08:42:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:42:28 +0100
Message-Id: <23e03f4a9118bbae6033f9d88925d6f8b542ee5d.1365608262.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] initscripts: fix read-only-rootfs-hook.sh to start earlier
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

Mount /var/volatile ourselves so that we can set up the writable area
first. This fixes the urandom service not starting properly when
read-only-rootfs is enabled.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh             |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb                     |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 4f3e0d9..9cf0921 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -5,6 +5,7 @@
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
 if [ "$1" = "start" ] ; then
+	grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
 	mkdir -p /var/volatile/lib
 	cp -a /var/lib/* /var/volatile/lib
 	mount --bind /var/volatile/lib /var/lib
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 649e182..531b2b6 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -118,7 +118,7 @@ do_install () {
 	update-rc.d -r ${D} bootmisc.sh start 55 S .
 	update-rc.d -r ${D} sysfs.sh start 02 S .
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
-	update-rc.d -r ${D} read-only-rootfs-hook.sh start 41 S .
+	update-rc.d -r ${D} read-only-rootfs-hook.sh start 29 S .
 	update-rc.d -r ${D} devpts.sh start 38 S .
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 	        update-rc.d -r ${D} alignment.sh start 06 S .
-- 
1.7.10.4



