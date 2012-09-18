Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TE5hj-0007My-V0
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 23:51:40 +0200
Received: from cougar.plausible.org (unknown [67.171.188.207])
	(Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id EFB4D28E61;
	Tue, 18 Sep 2012 14:39:00 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 14:38:45 -0700
Message-Id: <1348004325-30668-3-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1348004325-30668-2-git-send-email-andy.ross@windriver.com>
References: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-2-git-send-email-andy.ross@windriver.com>
Subject: [PATCH 2/2] udev-extraconf: Don't mount root filesystem under /media
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
X-List-Received-Date: Tue, 18 Sep 2012 21:51:40 -0000

The mount.sh handler attempts to prevent already-mounted filesystems
from being mounted as dynamic/removable "/media".  But it misses the
case where the kernel has mounted the root filesystem (e.g. with
"root=/dev/sda1").  In that situation, /proc/mounts has a device name
of "/dev/root" instead of the proper $DEVNAME string exposed by udev.
So we must also test the root filesystem device number vs. the
$MAJOR/$MINOR udev tells us.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 8 ++++++--
 meta/recipes-core/udev/udev-extraconf_1.0.bb   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 2eb9aff..99c76b2 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -49,8 +49,12 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
     		$MOUNT $DEVNAME 2> /dev/null
 	fi
 	
-	# If the device isn't mounted at this point, it isn't configured in fstab
-	grep -q "^$DEVNAME " /proc/mounts || automount
+	# If the device isn't mounted at this point, it isn't
+	# configured in fstab (note the root filesystem can show up as
+	# /dev/root in /proc/mounts, so check the device number too)
+	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
+		grep -q "^$DEVNAME " /proc/mounts || automount
+	fi
 fi
 
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index 9995899..2c4a4f1 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit allarch
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = " \
        file://automount.rules \
-- 
1.7.11.4



