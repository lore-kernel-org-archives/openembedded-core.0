Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7XJd-00010W-9V
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 20:23:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 20:14:40 +0100
Message-Id: <1331666080-25116-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] initscripts: test whether /etc/init.d/hwclock.sh exists
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
X-List-Received-Date: Tue, 13 Mar 2012 19:23:25 -0000

* bootmisc.sh executes /etc/init.d/hwclock.sh, which
  is optional (depends on CONFIG_HWCLOCK in busybox).

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 5b86e79..4f76cb4 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -65,14 +65,14 @@ fi
 # Set the system clock from hardware clock
 # If the timestamp is more recent than the current time,
 # use the timestamp instead.
-/etc/init.d/hwclock.sh start
+test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
 	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
 	read TIMESTAMP < /etc/timestamp
 	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
 		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
-		/etc/init.d/hwclock.sh stop
+		test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh stop
 	fi
 fi
 : exit 0
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index f3dc852..829694b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r133"
+PR = "r134"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.5.4



