Received: from bluegiga.fi ([194.100.31.45] helo=blue-gw.bluegiga.fi)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lauri.hintsala@bluegiga.com>) id 1RaMRY-00058B-6V
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 08:06:28 +0100
Received: from bgtlh.bgt.local (unknown [10.1.1.28])
	by blue-gw.bluegiga.fi (Postfix) with ESMTP id 663E47BE2C1;
	Tue, 13 Dec 2011 08:59:31 +0200 (EET)
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 08:58:59 +0200
Message-Id: <1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
Subject: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 07:06:28 -0000

Timestamp checking has been broken by the commit
2078af333d704fd894a2dedbc19cef5775cdadbb. Fix timestamp checking
and clean the code.

cc: sgw@linux.intel.com
cc: gary@mlbassoc.com

Signed-off-by: Lauri Hintsala <lauri.hintsala@bluegiga.com>
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 03fd67c..6d68b35 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -62,16 +62,16 @@ then
 fi
 
 # Set the system clock from hardware clock
-# If the timestamp is 1 day or more recent than the current time,
+# If the timestamp is more recent than the current time,
 # use the timestamp instead.
 /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
-	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
-	read TIMESTAMP < /etc/timestamp
-        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE + 10000 \)`
-        if [ $NEEDUPDATE -eq 1 ]; then 
-		date -u $TIMESTAMP
+	SYSTEMDATE=`date -u +%4Y%2m%2d`
+	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4); }'`
+	NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`
+	if [ $NEEDUPDATE -eq 1 ]; then
+		date -u `cat /etc/timestamp`
 		/etc/init.d/hwclock.sh stop
 	fi
 fi
-- 
1.7.4.1



