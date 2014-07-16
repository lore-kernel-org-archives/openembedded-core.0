Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id ADC6C7028C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:45:43 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6GKxPMk015737 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:59:25 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071615592558-455727 ;
	Wed, 16 Jul 2014 15:59:25 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 15:59:15 -0500
Message-Id: <0ae4bf831ba9b0ffce4eeb6403da183a5e71a445.1405542432.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <cover.1405542432.git.ben.shelton@ni.com>
References: <cover.1405542432.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:25 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:25 PM,
	Serialize complete at 07/16/2014 03:59:25 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-16_07:2014-07-16, 2014-07-16,
	1970-01-01 signatures=0
Subject: [PATCH 2/5] initscripts: save /etc/timestamp with seconds accuracy
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
X-List-Received-Date: Wed, 16 Jul 2014 21:45:50 -0000

From: Blair Elliott <blair.elliott@ni.com>

Currently, /etc/timestamp is saved with minutes accuracy.  To increase
the accuracy, modify the save-rtc.sh and bootmisc.sh scripts to save and
read /etc/timestamp respectively with seconds accuracy.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 +++--
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

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
2.0.1


