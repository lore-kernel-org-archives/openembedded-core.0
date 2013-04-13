Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UQv9b-0007a0-DE
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 09:46:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2013 00:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,466,1363158000"; d="scan'208";a="317622766"
Received: from unknown (HELO swold-linux.site.stayonline.net) ([10.255.14.4])
	by orsmga002.jf.intel.com with ESMTP; 13 Apr 2013 00:28:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2013 00:28:16 -0700
Message-Id: <1365838096-11843-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 1/2] udev-extraconf: Add -o silent to auto mount for mount.util-linux
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
X-List-Received-Date: Sat, 13 Apr 2013 07:46:03 -0000

This will silence some of the noisy output from mount.util-linux and the kernel
when trying to automount filesystems or devices. Busybox does not accept the silent
option, it uses a "loud" option instead.

[YOCTO #3935]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 99c76b2..7b58361 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -22,7 +22,7 @@ automount() {
 
 	! test -d "/media/$name" && mkdir -p "/media/$name"
 	
-	if ! $MOUNT -t auto $DEVNAME "/media/$name"
+	if ! $MOUNT -o silent -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
 		rm_dir "/media/$name"
-- 
1.8.0.2



