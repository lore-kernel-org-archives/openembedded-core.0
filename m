Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1Szudb-000193-2z
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 21:12:47 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 9DD791E48B;
	Fri, 10 Aug 2012 12:00:58 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2012 12:00:55 -0700
Message-Id: <1344625255-15337-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
Subject: [PATCH] udev: Don't remount root filesystem under /media
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
X-List-Received-Date: Fri, 10 Aug 2012 19:12:47 -0000

The existing logic to avoid mounting already-mounted filesystems
breaks for a kernel-mounted root, which appears as /dev/root in
/proc/mounts.  The effect is that an image booted with
e.g. "root=/dev/mmcblk0p1" will find its root filesystem remount rw
under /media/mmcblk0p1 at boot.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-core/udev/udev/mount.sh | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/mount.sh b/meta/recipes-core/udev/udev/mount.sh
index c13b8bb..61d14a3 100644
--- a/meta/recipes-core/udev/udev/mount.sh
+++ b/meta/recipes-core/udev/udev/mount.sh
@@ -49,9 +49,15 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
 	elif [ -x $MOUNT ]; then
     		$MOUNT $DEVNAME 2> /dev/null
 	fi
-	
-	# If the device isn't mounted at this point, it isn't configured in fstab
-	grep -q "^$DEVNAME " /proc/mounts || automount
+
+	# If the device isn't mounted at this point, it isn't
+	# configured in fstab (note the root filesystem shows up as
+	# /dev/root in /proc/mounts, so parse the command line for
+	# that case)
+	root=`sed 's/\(^\|.* \)root=\([^ ]*\).*/\2/' /proc/cmdline`
+	if [ "$root" != "$DEVNAME" ]; then
+		grep -q "^$DEVNAME " /proc/mounts || automount
+	fi
 fi
 
 
-- 
1.7.11.2



