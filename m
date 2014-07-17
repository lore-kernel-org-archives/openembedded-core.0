Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD4F70660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 21:57:18 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6HLvJf0015835 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:57:19 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071716571965-513274 ;
	Thu, 17 Jul 2014 16:57:19 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 16:56:53 -0500
Message-Id: <c417e9dd139050026787229778db277911302044.1405633546.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <cover.1405633546.git.ben.shelton@ni.com>
References: <cover.1405633546.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize complete at 07/17/2014 04:57:19 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-17_06:2014-07-17, 2014-07-17,
	1970-01-01 signatures=0
Subject: [PATCH v2 2/6] initscripts: save /etc/timestamp with seconds accuracy
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
X-List-Received-Date: Thu, 17 Jul 2014 21:57:22 -0000

From: Blair Elliott <blair.elliott@ni.com>

Currently, /etc/timestamp is saved with minutes accuracy.  To increase
the accuracy, modify the save-rtc.sh and bootmisc.sh scripts to save and
read /etc/timestamp respectively with seconds accuracy.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/classes/image.bbclass                                | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 +++--
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a03b880..772c3ed 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -359,7 +359,7 @@ set_image_autologin () {
 # Can be use to create /etc/timestamp during image construction to give a reasonably 
 # sane default time setting
 rootfs_update_timestamp () {
-	date -u +%4Y%2m%2d%2H%2M >${IMAGE_ROOTFS}/etc/timestamp
+	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
 }
 
 # Prevent X from being started
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 5211824..ccc7f9f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -66,10 +66,11 @@ fi
 test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
-	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
+	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M%2S`
 	read TIMESTAMP < /etc/timestamp
 	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
-		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
+		# format the timestamp as date expects it (2m2d2H2M4Y.2S)
+		date -u ${TIMESTAMP:4:8}${TIMESTAMP:0:4}.${TIMESTAMP:(-2)}
 		test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh stop
 	fi
 fi
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index 1f804e2..b038fc5 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -10,4 +10,4 @@
 ### END INIT INFO
 
 # Update the timestamp
-date -u +%4Y%2m%2d%2H%2M > /etc/timestamp
+date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
-- 
2.0.2


