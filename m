Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U88YS-0001eq-Kq
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 13:13:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2013 03:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,701,1355126400"; d="scan'208";a="293537100"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2013 03:57:31 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2013 13:57:29 +0200
Message-Id: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gconf.bbclass: make postinstall fail silently when running offline
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 12:13:44 -0000

Gconf backend does not accept special characters in configuration source
addresses. When populating SDK target sysroot from core-image-sato, for
example, the configuration source address contains "1.3+snapshot" in it
and '+' is an invalid character. Thus, gconftool-2 will fail and the
build will stop at do_rootfs because the log contains the "ERROR"
string.

Since failing offline will postpone the postinstall execution for
target's first boot, we can silently fail here, so the build can
complete.

[YOCTO #3893]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gconf.bbclass |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index e9076b2..11ad495 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -23,8 +23,14 @@ fi
 SCHEMA_LOCATION=$D/etc/gconf/schemas
 for SCHEMA in ${SCHEMA_FILES}; do
 	if [ -e $SCHEMA_LOCATION/$SCHEMA ]; then
-		HOME=$D/root gconftool-2 \
-			--makefile-install-rule $SCHEMA_LOCATION/$SCHEMA > /dev/null
+		export HOME=$D/root
+		if [ "x$D" != "x" ]; then
+			gconftool-2 \
+				--makefile-install-rule $SCHEMA_LOCATION/$SCHEMA > /dev/null 2>&1 || exit 1
+		else
+			gconftool-2 \
+				--makefile-install-rule $SCHEMA_LOCATION/$SCHEMA > /dev/null
+		fi
 	fi
 done
 }
-- 
1.7.9.5



