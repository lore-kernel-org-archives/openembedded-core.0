Received: from bluegiga.fi ([194.100.31.45] helo=blue-gw.bluegiga.fi)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lauri.hintsala@bluegiga.com>) id 1RaiQI-0000qz-U2
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 07:34:39 +0100
Received: from bgtlh.bgt.local (unknown [10.1.1.28])
	by blue-gw.bluegiga.fi (Postfix) with ESMTP id E320D7BE256;
	Wed, 14 Dec 2011 08:27:43 +0200 (EET)
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 08:27:27 +0200
Message-Id: <1323844047-16390-1-git-send-email-lauri.hintsala@bluegiga.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
Subject: [PATCH v3] initscripts: fix timestamp checking at bootmisc.sh
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
X-List-Received-Date: Wed, 14 Dec 2011 06:34:39 -0000

Timestamp checking has been broken by the commit
2078af333d704fd894a2dedbc19cef5775cdadbb. Currently the RTC time
is always overwritten with the time from /etc/timestmap. Fix timestamp
checking and clean the code.

Signed-off-by: Lauri Hintsala <lauri.hintsala@bluegiga.com>

---
changes since V2
* reduce number of forks/execs
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 03fd67c..ab18ad9 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -62,15 +62,14 @@ then
 fi
 
 # Set the system clock from hardware clock
-# If the timestamp is 1 day or more recent than the current time,
+# If the timestamp is more recent than the current time,
 # use the timestamp instead.
 /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
-	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
+	SYSTEMDATE=`date -u +%4Y%2m%2d`
 	read TIMESTAMP < /etc/timestamp
-        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE + 10000 \)`
-        if [ $NEEDUPDATE -eq 1 ]; then 
+	if [ ${TIMESTAMP#????????}${TIMESTAMP%????????} -gt $SYSTEMDATE ]; then
 		date -u $TIMESTAMP
 		/etc/init.d/hwclock.sh stop
 	fi
-- 
1.7.4.1



