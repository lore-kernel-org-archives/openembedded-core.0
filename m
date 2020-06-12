Received: from dl160g6.localdomain (dl160g6.localdomain [219.123.27.194])
 by mx.groups.io with SMTP id smtpd.web11.15774.1591949873588836670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 01:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: miraclelinux.com, ip: 219.123.27.194, mailfrom: yuki.hoshino@miraclelinux.com)
Received: from tcpu-ubuntu.lxd (dhcp-201.miraclelinux.com [10.2.0.201])
	by dl160g6.localdomain (Postfix) with ESMTP id F063FFF970;
	Fri, 12 Jun 2020 17:17:36 +0900 (JST)
From: yuki.hoshino@miraclelinux.com
To: openembedded-core@lists.openembedded.org
Cc: Yuki Hoshino <yuki.hoshino@miraclelinux.com>
Subject: [PATCH] sysvinit-inittab: Add support for tty devices with 10 or more number.
Date: Fri, 12 Jun 2020 08:16:57 +0000
Message-Id: <1591949817-18462-1-git-send-email-yuki.hoshino@miraclelinux.com>
X-Mailer: git-send-email 2.7.4

"start_getty" support for tty devices with under 10 number.
When SERIAL_CONSOLES has tty devices with 10 or more number,
do not't start getty and output the following message.
----------
sh 1: unknown operand
----------

Signed-off-by: Yuki Hoshino <yuki.hoshino@miraclelinux.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index 96fd6cf..dfa799a 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -11,7 +11,7 @@
 active_serial=$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ *$//")
 
 # Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
-runtime_tty=$(echo $2 | grep -oh '[0-9]')
+runtime_tty=$(echo $2 | grep -oh '[0-9]\+')
 
 # busybox' getty does this itself, util-linux' agetty needs extra help
 getty="/sbin/getty"
@@ -36,7 +36,7 @@ for line in $active_serial; do
         then
 		# Remove all unknown entries and discard the first line (desc).
 		activetty=$(grep -v "unknown" "/proc/tty/driver/$line" \
-			    | tail -n +2 | grep -oh "^\s*\S*[0-9]")
+			    | tail -n +2 | grep -oh "^\s*\S*[0-9]\+")
 		for active in $activetty; do
 			# If indexes do match then enable the serial console.
 			if [ $active -eq $runtime_tty ]
-- 
2.7.4

