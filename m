Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC1-0004tn-Ng
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652344"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:06 -0800
Message-Id: <8ca57f1a8640ae5554d0e500253609d0b0d7a9ea.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/25] initscripts: Make /etc/timestamp consistent again.
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:53 -0000

From: Gary Thomas <gary@mlbassoc.com>

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
1.7.6.5



