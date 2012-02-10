Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1RvtMD-0006oN-0p
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:29:57 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 57EFDF812B1; Fri, 10 Feb 2012 09:16:11 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 09:16:05 -0700
Message-Id: <1328890565-8304-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] initscripts: Make /etc/timestamp consistent again.
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
X-List-Received-Date: Fri, 10 Feb 2012 16:29:57 -0000

Commit cc8695 changed the way timestamps were handled
and added some extra munging to be able to compare them
reliably.  This change makes the timestamp value the same
everywhere and simplifies how the check to set the system
clock based on the timestamp is done.

Also, if the value stored in /etc/timestamp is newer
[at all] than the current system time, set the system clock
from the stored value, down to the minute, not just the day.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index d9e8ffa..20ec0a0 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -68,9 +68,9 @@ fi
 /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
-	SYSTEMDATE=`date -u +%4Y%2m%2d`
+	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
 	read TIMESTAMP < /etc/timestamp
-	if [ ${TIMESTAMP#????????}${TIMESTAMP%????????} -gt $SYSTEMDATE ]; then
+	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
 		date -u $TIMESTAMP
 		/etc/init.d/hwclock.sh stop
 	fi
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index 3d8e850..1f804e2 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -10,4 +10,4 @@
 ### END INIT INFO
 
 # Update the timestamp
-date -u +%2m%2d%2H%2M%4Y > /etc/timestamp
+date -u +%4Y%2m%2d%2H%2M > /etc/timestamp
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 203c605..b56c55c 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r129"
+PR = "r130"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.7.6



