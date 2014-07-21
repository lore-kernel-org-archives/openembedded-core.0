Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A207B7023A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:54:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LGs58I002747 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:54:05 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072111540572-36073 ;
	Mon, 21 Jul 2014 11:54:05 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 11:53:46 -0500
Message-Id: <1405961628-25284-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
References: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 11:54:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 11:54:05 AM,
	Serialize complete at 07/21/2014 11:54:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Cc: Bill Pittman <bill.pittman@ni.com>
Subject: [PATCH 2/4] busybox: mdev: Use mdev.seq
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

From: Bill Pittman <bill.pittman@ni.com>

/dev/mdev.seq exists to synchronize concurrently running instances of
mdev and to ensure that they execute in the proper order.  Without this
synchronization, it is possible to have inconsistent mount points, to
leak device nodes, or to have a node erroneously removed in rapid
hotplug scenarios.

Enable the use of mdev.seq by creating an empty /dev/mdev.seq at boot.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/busybox/files/mdev | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
index f7ed1f3..c4447ef 100755
--- a/meta/recipes-core/busybox/files/mdev
+++ b/meta/recipes-core/busybox/files/mdev
@@ -4,5 +4,6 @@ mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
 mkdir /dev/pts /dev/shm
 chmod 777 /dev/shm
 mount -t devpts devpts /dev/pts
+touch /dev/mdev.seq
 echo "/sbin/mdev" > /proc/sys/kernel/hotplug
 mdev -s
-- 
2.0.2


