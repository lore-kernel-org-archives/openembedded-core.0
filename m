Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 805BE701DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:54:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LGs5Y6015104 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:54:06 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072111540573-36074 ;
	Mon, 21 Jul 2014 11:54:05 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 11:53:47 -0500
Message-Id: <1405961628-25284-3-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
References: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 11:54:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 11:54:06 AM,
	Serialize complete at 07/21/2014 11:54:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [PATCH 3/4] busybox: mdev: Ensure /dev/initctl exists after tmpfs mount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 16:54:09 -0000

During boot, there is a brief window during which /dev/initctl is
missing, which breaks initscripts that would need to access it. This
occurs because /etc/init.d/mountall.sh (rcS.d/S02...) attempts to ensure
/dev/initctl is present, but /etc/init.d/mdev (rcS.d/S06...) mounts over
/dev and clobbers the work done by mountall, and then does not wait
synchronously until initctl is ready before continuing.

To close this window, in /etc/init.d/mdev, we check whether /dev/initctl
is present, and if not, we remove it and recreate it.  This is the same
thing that is done by /etc/init.d/mountall.sh, and we have verified that
any writers of /dev/initctl will wait synchronously until sysvinit
notices the change in fd and does the read, so no race exists.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/busybox/files/mdev | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
index c4447ef..9625247 100755
--- a/meta/recipes-core/busybox/files/mdev
+++ b/meta/recipes-core/busybox/files/mdev
@@ -7,3 +7,13 @@ mount -t devpts devpts /dev/pts
 touch /dev/mdev.seq
 echo "/sbin/mdev" > /proc/sys/kernel/hotplug
 mdev -s
+
+#
+# We might have mounted something over /dev, see if /dev/initctl is there.
+#
+if test ! -p /dev/initctl
+then
+        rm -f /dev/initctl
+        mknod -m 600 /dev/initctl p
+fi
+
-- 
2.0.2


