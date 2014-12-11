Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EF96B72573
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:08:44 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58jEX026625 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084536-1004401 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:09 -0600
Message-Id: <30e87f4461768ef2bd1d3dd80ee0d2df9ae688e2.1418274272.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418274272.git.rich.tollerton@ni.com>
References: <cover.1418274272.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize complete at 12/10/2014 11:08:45 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-10_09:2014-12-10, 2014-12-10,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH v3 8/9] udev-cache: Update cache asynchronously
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
X-List-Received-Date: Thu, 11 Dec 2014 05:08:48 -0000

Don't hold up the boot while the cache is being updated.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 571463f..3c18061 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -44,15 +44,17 @@ fi
 
 if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_REGEN" ]; then
 	echo "Populating dev cache"
-	udevadm control --stop-exec-queue
-        sysconf_cmd > "$SYSCONF_TMP"
-	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
-		| xargs tar cf "${DEVCACHE_TMP}" -T-
-	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
-	rm -f "${DEVCACHE_TMP}"
-	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
-	udevadm control --start-exec-queue
-	rm -f "$DEVCACHE_REGEN"
+	(
+		udevadm control --stop-exec-queue
+		sysconf_cmd > "$SYSCONF_TMP"
+		find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
+			| xargs tar cf "${DEVCACHE_TMP}" -T-
+			gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
+			rm -f "${DEVCACHE_TMP}"
+			mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
+			udevadm control --start-exec-queue
+			rm -f "$DEVCACHE_REGEN"
+	) &
 fi
 
 exit 0
-- 
2.1.3


