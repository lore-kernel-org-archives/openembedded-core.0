Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TF83Y-0008Q6-SE
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 20:34:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2012 11:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,463,1344236400"; d="scan'208";a="225171345"
Received: from unknown (HELO localhost) ([10.255.13.250])
	by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2012 11:21:35 -0700
From: tom.zanussi@intel.com
To: scott.a.garman@intel.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 13:21:34 -0500
Message-Id: <fe693132c2f388a2b66fa61a81c60a4a197bca8c.1348251066.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1348251066.git.tom.zanussi@intel.com>
References: <cover.1348251066.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] udev: don't mount with -o sync
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
X-List-Received-Date: Fri, 21 Sep 2012 18:34:29 -0000

From: Jesse Zhang <sen.zhang@windriver.com>

mount.sh mounts all partitions with -o sync, which is bad for system
performance.

(From OE-Core rev: d49cf73754150b50a911d326aaa666f5da78855c)

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/udev/udev/mount.sh | 2 +-
 meta/recipes-core/udev/udev_164.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/mount.sh b/meta/recipes-core/udev/udev/mount.sh
index 53fefa3..c13b8bb 100644
--- a/meta/recipes-core/udev/udev/mount.sh
+++ b/meta/recipes-core/udev/udev/mount.sh
@@ -23,7 +23,7 @@ automount() {
 
 	! test -d "/media/$name" && mkdir -p "/media/$name"
 	
-	if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
+	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
 		rm_dir "/media/$name"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c5813ec..0462ff2 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.11.4



