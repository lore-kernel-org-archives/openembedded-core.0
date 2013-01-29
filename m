Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0KTK-0004Mx-FN
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 00:20:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jan 2013 15:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,562,1355126400"; d="scan'208";a="283839496"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.123])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2013 15:04:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 15:04:26 -0800
Message-Id: <1359500666-2874-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] rootfs_rpm: Escape the backtick to ensure the ls runs on the target
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
X-List-Received-Date: Tue, 29 Jan 2013 23:20:12 -0000

This change ensures that the ls /etc/rpm-postinsts runs in the target
at first boot time, rather than at the creation time of the script on
the host.

This was causing the following error in the rootfs log:

+ install -d /srv/ssd/sgw/machines/fri2/tmp/work/fri2-poky-linux/core-image-minimal/1.0-r0/rootfs//etc/rcS.d
+ i=
+ ls /etc/rpm-postinsts/
ls: cannot access /etc/rpm-postinsts/: No such file or directory

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index accd7d9..119bf92 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -108,7 +108,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	i=\$i
 	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
 #!/bin/sh
-for i in `ls /etc/rpm-postinsts/`; do
+for i in \`ls /etc/rpm-postinsts/\`; do
 	i=/etc/rpm-postinsts/$i
 	echo "Running postinst $i..."
 	if [ -f $i ] && $i; then
-- 
1.8.0.2



