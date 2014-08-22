Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id F031270F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKbO009129; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312034-290495 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:52 -0500
Message-Id: <a5198a6341134175d468759dfed1630ee3f2b36d.1408742574.git.rich.tollerton@ni.com>
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
Subject: [PATCH v2 06/12] udev-cache: omit sockets and filesystems mounted under /dev
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

Archiving sockets causes tar to report an error and return a nonzero
exit status. Archiving a mounted filesystem is harmless, but may greatly
bloat the size of the cache tarball, and wastes time on boot.

To fix these issues, use `find` to only include the files we want, which
are the file types that udev will create (block/char devices and
symlinks) that are on the same filesystem as /dev.

While we're at it, remove a subshell by archiving /dev as an absolute
path. However, `tar` will complain about stripping the leading slash on
stderr. To inhibit this, `cut` out the leading slash.

An alternative solution is to use `tar --exclude`, but that is modestly
more brittle, since we'd need to explicitly list every socket and
filesystem to exclude. Note that `tar --one-file-system` is
GNU-specific, and tar implementations generally have nothing equivalent
to `find -type`.

If using busybox `find`, this change requires CONFIG_FEATURE_FIND_TYPE=y
and CONFIG_FEATURE_FIND_XDEV=y. If using busybox `tar`, this change
requires CONFIG_FEATURE_TAR_FROM=y.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index ec07f50..aaf1ddd 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -26,7 +26,8 @@ fi
 
 if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
 	echo "Populating dev cache"
-	(cd /; tar cf "${DEVCACHE_TMP}" dev)
+	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
+		| xargs tar cf "${DEVCACHE_TMP}" -T-
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
 	rm -f "${DEVCACHE_TMP}"
 	mv /dev/shm/udev.cache /etc/udev/cache.data
-- 
2.0.4


