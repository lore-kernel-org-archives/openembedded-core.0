Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tfre2-0005kh-UQ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 13:30:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Dec 2012 04:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="251675672"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2012 04:16:14 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 14:16:12 +0200
Message-Id: <1354623372-31497-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] populate_sdk_base: mkdir was missing $SUDO_EXEC prefix
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
X-List-Received-Date: Tue, 04 Dec 2012 12:30:40 -0000

mkdir was in the wrong place and missing sudo rights. Hence, the
installation to default location (or any other for which the user didn't
have rights) would fail. Unless the installer itself is run with sudo.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 691ae45..f0b88b3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -187,9 +187,6 @@ if [ "$answer" != "Y" -a "$answer" != "y" ]; then
 	exit 1
 fi
 
-# create dir and don't care about the result. 
-mkdir -p $target_sdk_dir >/dev/null 2>&1
-
 # if don't have the right to access dir, gain by sudo 
 if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
 	SUDO_EXEC=$(which "sudo")
@@ -203,6 +200,9 @@ if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; the
 	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
 fi
 
+# create dir and don't care about the result.
+$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
+
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-- 
1.7.9.5



