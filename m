Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8M7Wt/xP+0tLon3s+EvSMrWDtwolHKnCG3hF37s1d8OpyWnLhFFs0OUWB0wtjIxiY6IYQgwEM1
 HXW3t6vWh8OA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818209"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818209"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:42 -0700
IronPort-SDR: t6JXybdfM89/a7Cj2cFGlu7otSVF4hS9bYCIdMBdZxh947YFc5WlnntQ4pkKiZJl1IBZH11fdB
 7PsRZDBevnnw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067428"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 35/64] sysvinit-inittab/start_getty: Check /sys for the tty device existence
Date: Mon, 26 Apr 2021 08:53:06 +0800
Message-Id: <ab7a1f14191e882439715e82f1636d7713e1da03.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Hao <kexin.hao@windriver.com>

The hvc tty driver doesn't populate a file like /proc/tty/driver/serial,
so the current implementation of start_getty doesn't work for the hvc
console. By checking the /sys/class/tty/ for the tty device existence,
it should support more console types and also make the codes more simple.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 670ceef0f6584ece5ce4176610255226a6148570)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sysvinit/sysvinit-inittab/start_getty     | 44 ++-----------------
 1 file changed, 3 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index dfa799adac..699a1ead1a 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,17 +1,4 @@
 #!/bin/sh
-###############################################################################
-# This script is used to automatically set up the serial console(s) on startup.
-# The variable SERIAL_CONSOLES can be set in meta/conf/machine/*.conf.
-# Script enhancement has been done based on Bug YOCTO #10844.
-# Most of the information is retrieved from /proc virtual filesystem containing
-# all the runtime system information (eg. system memory, device mount, etc).
-###############################################################################
-
-# Get active serial filename.
-active_serial=$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ *$//")
-
-# Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
-runtime_tty=$(echo $2 | grep -oh '[0-9]\+')
 
 # busybox' getty does this itself, util-linux' agetty needs extra help
 getty="/sbin/getty"
@@ -25,31 +12,6 @@ case $(readlink -f "${getty}") in
         ;;
 esac
 
-# Backup $IFS.
-DEFAULT_IFS=$IFS
-# Customize Internal Field Separator.
-IFS="$(printf '\n\t')"
-
-for line in $active_serial; do
-	# Check we have the file containing current active serial target index.
-	if [ -e "/proc/tty/driver/$line" ]
-        then
-		# Remove all unknown entries and discard the first line (desc).
-		activetty=$(grep -v "unknown" "/proc/tty/driver/$line" \
-			    | tail -n +2 | grep -oh "^\s*\S*[0-9]\+")
-		for active in $activetty; do
-			# If indexes do match then enable the serial console.
-			if [ $active -eq $runtime_tty ]
-			then
-				if [ -c /dev/$2 ]
-				then
-				    ${setsid:-} ${getty} -L $1 $2 $3
-				fi
-				break
-			fi
-		done
-	fi
-done
-
-# Restore $IFS.
-IFS=$DEFAULT_IFS
+if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then
+	${setsid:-} ${getty} -L $1 $2 $3
+fi
-- 
2.30.2

