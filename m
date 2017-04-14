Return-Path: <yin.thong.choong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7152177E7D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 07:38:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Apr 2017 00:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,197,1488873600"; d="scan'208";a="87394962"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 14 Apr 2017 00:38:13 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 17:26:39 -0700
Message-Id: <1492129599-191738-2-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492129599-191738-1-git-send-email-yin.thong.choong@intel.com>
References: <1492129599-191738-1-git-send-email-yin.thong.choong@intel.com>
Cc: otc.embedded.malaysia@intel.com
Subject: [PATCH] start_getty: Over added SERIAL_CONSOLE cause error in userspace log
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
X-List-Received-Date: Fri, 14 Apr 2017 07:38:13 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Error log will be logged into /var/log/message.
Added in more condition checking on the script. Check
/proc/tty/drivers and /proc/tty/driver/*
file system to retrieve active targeted serial.
Only establish getty with active serial in runtime.

[YOCTO #10844]

Reviewed-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 .../sysvinit/sysvinit-inittab/start_getty          | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index e3d052a..31b4413 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,5 +1,35 @@
 #!/bin/sh
-if [ -c /dev/$2 ]
-then 
-	/sbin/getty -L $1 $2 $3
-fi
+####################################################################################
+# This script is use to automatic start serial console once power up.
+# Script enhancement has been done base on Bug YOCTO 10844.
+# Configuration can be done in meta/conf/machine/*.conf variable SERIAL_CONSOLES.
+# Most of the information is retrieve from /proc virtual filesystem which
+# contain all the runtime system information (eg. system memory, device mount, etc).
+####################################################################################
+
+# Get active serial filename.
+active_serial=$(grep "serial" /proc/tty/drivers | grep -oh "^\s*\S*")
+
+# Re-phrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
+runtime_tty=$(echo $2 | grep -oh '[0-9]')
+
+for line in $active_serial; do
+	# File is availability, file content current active serial target index.
+	if [ -e /proc/tty/driver/$line ]
+        then
+		# File content a lot of unknown serial. We use -v to remove all unmatch and get left off.
+		# Tail use to avoid 1st line included into the filter because 1st line is file description.
+		activetty=$(grep -v "unknown" /proc/tty/driver/$line | tail -n +2 | grep -oh "^\s*\S*[0-9]")
+		for active in $activetty; do
+			# Check if both index is match then proceed to enable the serial console.
+			if [ $active -eq $runtime_tty ] 
+			then
+				if [ -c /dev/$2 ]
+				then
+				    /sbin/getty -L $1 $2 $3
+				fi
+				break
+			fi
+		done
+	fi
+done
-- 
2.7.4


