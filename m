Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UR419-0005se-7w
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 19:13:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Apr 2013 09:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,468,1363158000"; d="scan'208";a="226819668"
Received: from unknown (HELO swold-linux.site.stayonline.net) ([10.255.14.73])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Apr 2013 09:55:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2013 09:55:55 -0700
Message-Id: <1365872155-17548-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] udev-extraconf: Add -o silent to auto mount for mount.util-linux
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
X-List-Received-Date: Sat, 13 Apr 2013 17:13:41 -0000

This will silence some of the noisy output from mount.util-linux and the kernel
when trying to automount filesystems or devices. Busybox does not accept the silent
option, it uses a loud option instead.

[YOCTO #3935]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 99c76b2..97af608 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -21,6 +21,11 @@ automount() {
 	name="`basename "$DEVNAME"`"
 
 	! test -d "/media/$name" && mkdir -p "/media/$name"
+	# Silent util-linux's version of mounting auto
+	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
+	then
+		MOUNT="$MOUNT -o silent"
+	fi
 	
 	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
-- 
1.8.0.2



