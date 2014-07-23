Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8F23F70786
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:50:13 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NEoFU5000919 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 09:50:15 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072309501531-137280 ;
	Wed, 23 Jul 2014 09:50:15 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 09:49:05 -0500
Message-Id: <1406126945-10647-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 09:50:15 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 09:50:15 AM,
	Serialize complete at 07/23/2014 09:50:15 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_05:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Subject: [PATCH] initscripts: fix bashism in bootmisc.sh
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
X-List-Received-Date: Wed, 23 Jul 2014 14:50:22 -0000

In the commit 'initscripts: save /etc/timestamp with seconds accuracy',
a bashism was introduced in the bootmisc.sh script in the code to set
the current date from the stored value in /etc/timestamp.  This causes
that operation to fail with the following message when /bin/sh is not
bash:

/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 73: syntax error: bad substitution

Fixed by using 'cut' (standard under POSIX) rather than bash-specific
substring expansion.

[YOCTO #6566]

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Tested-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index ccc7f9f..923fa88 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -70,7 +70,10 @@ then
 	read TIMESTAMP < /etc/timestamp
 	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
 		# format the timestamp as date expects it (2m2d2H2M4Y.2S)
-		date -u ${TIMESTAMP:4:8}${TIMESTAMP:0:4}.${TIMESTAMP:(-2)}
+		TS_YR=$(echo $TIMESTAMP | cut -c 1-4)
+		TS_SEC=$(echo $TIMESTAMP | cut -c 13-14)
+		TS_REST=$(echo $TIMESTAMP | cut -c 5-12)
+		date -u ${TS_REST}${TS_YR}.${TS_SEC}
 		test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh stop
 	fi
 fi
-- 
2.0.2


