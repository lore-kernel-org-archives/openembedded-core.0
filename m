Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TgCvs-0006m3-Bp
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 12:14:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 03:00:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="257574942"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 03:00:01 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 13:00:00 +0200
Message-Id: <1354705200-18575-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] populate_sdk_base: fix directory creation as normal user
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
X-List-Received-Date: Wed, 05 Dec 2012 11:14:28 -0000

My previous patch removed the mkdir and added it at the end of the
"gaining SUDO rights" block in order to fix directory creation when
installing in a location without proper rights. Unfortunately this
messed up the directory creation as normal user as it will ask for
sudo right in order to create it...

Hopefully, this will fix both cases.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f0b88b3..c15a4d4 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -187,6 +187,9 @@ if [ "$answer" != "Y" -a "$answer" != "y" ]; then
 	exit 1
 fi
 
+# Try to create the directory (this will not succeed if user doesn't have rights)
+mkdir -p $target_sdk_dir >/dev/null 2>&1
+
 # if don't have the right to access dir, gain by sudo 
 if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
 	SUDO_EXEC=$(which "sudo")
@@ -198,10 +201,10 @@ if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; the
 	# test sudo could gain root right
 	$SUDO_EXEC pwd >/dev/null 2>&1
 	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
-fi
 
-# create dir and don't care about the result.
-$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
+	# now that we have sudo rights, create the directory
+	$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
+fi
 
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
-- 
1.7.9.5



