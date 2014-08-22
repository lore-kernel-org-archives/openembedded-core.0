Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id F3B6F70F67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKbM009129; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312023-290490 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:47 -0500
Message-Id: <ad8654548b05e140dd50098eb8d258762bdb4059.1408742574.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1408742574.git.rich.tollerton@ni.com>
References: <cover.1408742574.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize complete at 08/22/2014 04:31:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-22_06:2014-08-22, 2014-08-22,
	1970-01-01 signatures=0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 01/12] udev-cache: Update cache tarball atomically
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
X-List-Received-Date: Fri, 22 Aug 2014 21:31:23 -0000

Overwriting the tarball in-place could cause a partial write, if the
system stops at an inopportune time. This is mitigated by first writing
to a temporary file, then moving that file on top of the final location.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index db5a513..c08cef2 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -16,6 +16,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 
 [ -f /etc/default/rcS ] && . /etc/default/rcS
+DEVCACHE_TMP="/dev/shm/udev-cache-tmp.tar"
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
@@ -25,7 +26,8 @@ fi
 
 if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
 	echo "Populating dev cache"
-	(cd /; tar cf "$DEVCACHE" dev)
+	(cd /; tar cf "${DEVCACHE_TMP}" dev)
+	mv -f "${DEVCACHE_TMP}" "$DEVCACHE"
 	mv /dev/shm/udev.cache /etc/udev/cache.data
 fi
 
-- 
2.0.4


