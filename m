Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id F2DEB70F65
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKbY009132; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312040-290500 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:57 -0500
Message-Id: <6822c2d4645105e779ce13935e5631dbf08fb049.1408742574.git.rich.tollerton@ni.com>
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
Subject: [PATCH v2 11/12] udev-cache: Update cache asynchronously
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

Don't hold up the boot while the cache is being updated.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index c499676..baeb125 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -43,14 +43,17 @@ fi
 
 if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_REGEN" ]; then
 	echo "Populating dev cache"
-	# Run sysconf_cmd before `tar`, not after, so that as little time as
-	# possible elapses between creating $SYSCONF_CACHED and $DEVCACHE.
-	sysconf_cmd > "$SYSCONF_CACHED"
-	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
-		| xargs tar cf "${DEVCACHE_TMP}" -T-
-	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
-	rm -f "${DEVCACHE_TMP}"
-	rm -f "$DEVCACHE_REGEN"
+	(
+		# Run sysconf_cmd before `tar`, not after, so that as little
+		# time as possible elapses between creating $SYSCONF_CACHED and
+		# $DEVCACHE.
+		sysconf_cmd > "$SYSCONF_CACHED"
+		find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
+			| xargs tar cf "${DEVCACHE_TMP}" -T-
+		gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
+		rm -f "${DEVCACHE_TMP}"
+		rm -f "$DEVCACHE_REGEN"
+	) &
 fi
 
 exit 0
-- 
2.0.4


