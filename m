Return-Path: <ken.sharp@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 04DE360167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 15:35:47 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t3LFZmOw026955 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:35:48 -0500
Received: from linux-mint-17-vm.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015042110354800-87199 ;
	Tue, 21 Apr 2015 10:35:48 -0500 
From: Ken Sharp <ken.sharp@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 10:35:44 -0500
Message-Id: <1429630545-17151-1-git-send-email-ken.sharp@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 04/21/2015 10:35:48 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 04/21/2015 10:35:48 AM,
	Serialize complete at 04/21/2015 10:35:48 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-04-21_06:, , signatures=0
Cc: Ken Sharp <ken.sharp@ni.com>
Subject: [PATCH 1/2] udev-cache: Remove unnecessary tar read from stdin
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
X-List-Received-Date: Tue, 21 Apr 2015 15:35:48 -0000

xargs already formats the inputs to tar correctly, so the
'-T -' argument to tar is unnecessary.

Signed-off-by: Ken Sharp <ken.sharp@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index df97000..12f68fb 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -57,7 +57,7 @@ echo "Populating dev cache"
 	udevadm control --stop-exec-queue
 	sysconf_cmd > "$SYSCONF_TMP"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
-		| xargs tar cf "${DEVCACHE_TMP}" -T-
+		| xargs tar cf "${DEVCACHE_TMP}"
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
 	rm -f "${DEVCACHE_TMP}"
 	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
-- 
1.9.1


