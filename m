Received: from bluegiga.fi ([194.100.31.45] helo=blue-gw.bluegiga.fi)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lauri.hintsala@bluegiga.com>) id 1RYYBm-0005M3-6v
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 08:14:42 +0100
Received: from bgtlh.bgt.local (unknown [10.1.1.28])
	by blue-gw.bluegiga.fi (Postfix) with ESMTP id 833717BE289;
	Thu,  8 Dec 2011 09:07:54 +0200 (EET)
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2011 09:07:25 +0200
Message-Id: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] initscripts: fix timestamp check at bootmisc.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 07:14:42 -0000

cc: sgw@linux.intel.com
cc: gary@mlbassoc.com
Signed-off-by: Lauri Hintsala <lauri.hintsala@bluegiga.com>
---

Hello guys,

It seems that timestamp checking has been broken by the commit
2078af333d704fd894a2dedbc19cef5775cdadbb. Some notes about following
lines.

meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh:

/etc/init.d/hwclock.sh start
if test -e /etc/timestamp
then
	SYSTEMDATE=`date -u +%2m%2d%2H%2M`
	read TIMESTAMP < /etc/timestamp
	# Remove year from timestamp.
	TMP=`echo $TIMESTAMP | cut -c -8`
	NEEDUPDATE=`expr \( $TMP \> $SYSTEMDATE + 10000 \)`
	if [ $NEEDUPDATE -eq 1 ]; then
		date -u $TIMESTAMP
		/etc/init.d/hwclock.sh stop
	fi
fi

1. Overflow happens in expr command of busybox if the length of number
   is over 10 digits (now the length is 12 digits). This could be fixed
   enabling flag CONFIG_EXPR_MATH_SUPPORT_64 from busybox config.

$ expr 120808302011 + 10000
-2147473649

2. Expression is adding +1 to minutes, not to days as supposed.
   If that form is used "100000000" should be added instead of "10000".

3. The year is at the end of timestamp (last 4 least significant digits)
   so it doesn't matter if it is there or not. So I decided to remove
   year from the timestamp we are comparing. Then it is not needed to
   attend to my note number 1.

BR,
Lauri Hintsala
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 03fd67c..e97b5f8 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -67,10 +67,12 @@ fi
 /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
-	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
+	SYSTEMDATE=`date -u +%2m%2d%2H%2M`
 	read TIMESTAMP < /etc/timestamp
-        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE + 10000 \)`
-        if [ $NEEDUPDATE -eq 1 ]; then 
+	# Remove year from timestamp.
+	TMP=`echo $TIMESTAMP | cut -c -8`
+	NEEDUPDATE=`expr \( $TMP \> $SYSTEMDATE + 10000 \)`
+	if [ $NEEDUPDATE -eq 1 ]; then
 		date -u $TIMESTAMP
 		/etc/init.d/hwclock.sh stop
 	fi
-- 
1.7.4.1



