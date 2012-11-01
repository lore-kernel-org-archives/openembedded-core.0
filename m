Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TTq1b-0006gp-6F
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 09:21:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA16lT8A014883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 23:47:29 -0700 (PDT)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 31 Oct 2012 23:47:29 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2012 14:47:46 +0800
Message-ID: <4c6572c176b6c3eb26024a1bf35f3768e0432463.1351749303.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351749303.git.Qi.Chen@windriver.com>
References: <cover.1351749303.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] hwclock.sh: improve hwclock.sh script to use UTC variable
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
X-List-Received-Date: Thu, 01 Nov 2012 08:21:15 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Make UTC variable in /etc/default/rcS has effect on hwclock.sh.
This variable declares whether the Hardware Clock is kept in UTC
or local time. Default its value to "yes" and change the comment.

[YOCTO #3341]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox_1.20.2.bb     |    2 +-
 meta/recipes-core/busybox/files/hwclock.sh      |    9 +++++----
 meta/recipes-core/sysvinit/sysvinit/rcS-default |    4 ++--
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb  |    2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 4c0946a..3e628d2 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
index 2e50425..cc6d286 100644
--- a/meta/recipes-core/busybox/files/hwclock.sh
+++ b/meta/recipes-core/busybox/files/hwclock.sh
@@ -22,6 +22,7 @@
 
 . /etc/default/rcS
 
+[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
 case "$1" in
         start)
                 if [ "$VERBOSE" != no ]
@@ -34,9 +35,9 @@ case "$1" in
 		then
 			if [ -z "$TZ" ]
 			then
-	                   hwclock --hctosys
+	                   hwclock $tz --hctosys
 			else
-			   TZ="$TZ" hwclock --hctosys
+			   TZ="$TZ" hwclock $tz --hctosys
 			fi
 		fi
 
@@ -59,7 +60,7 @@ case "$1" in
 		fi
 		if [ "$HWCLOCKACCESS" != no ]
 		then
-			hwclock --systohc
+			hwclock $tz --systohc
 		fi
 		if [ "$VERBOSE" != no ]
 		then
@@ -70,7 +71,7 @@ case "$1" in
 	show)
 		if [ "$HWCLOCKACCESS" != no ]
 		then
-			hwclock --show
+			hwclock $tz --show
 		fi
 		;;
         *)
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index fc6d415..3c9dea9 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -9,8 +9,8 @@ SULOGIN=no
 # Set to no if you want to be able to login over telnet/rlogin
 # before system startup is complete (as soon as inetd is started)
 DELAYLOGIN=no
-# Set UTC=yes if your system clock is set to UTC (GMT), and UTC=no if not.
-# UTC=yes
+# Assume that the BIOS clock is set to UTC time (recommended)
+UTC=yes
 # Set VERBOSE to "no" if you would like a more quiet bootup.
 VERBOSE=no
 # Set EDITMOTD to "no" if you don't want /etc/motd to be edited automatically
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 63333b0..1647a0f 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r7"
+PR = "r8"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
-- 
1.7.9.5



