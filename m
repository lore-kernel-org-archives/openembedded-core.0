Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3CDC607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 06:47:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M6lsTf013142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 23:47:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 21 Jul 2016 23:47:54 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2016 14:45:10 +0800
Message-ID: <4d9a08b5ba025fb3a5cb3759947827e34c0601b2.1469169732.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
In-Reply-To: <cover.1469169732.git.kai.kang@windriver.com>
References: <cover.1469169732.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kdump: don't set default values for KDUMP_CMDLINE and KDUMP_KIMAGE
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
X-List-Received-Date: Fri, 22 Jul 2016 06:47:55 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Do not set default values of KDUMP_CMDLINE and KDUMP_KIMAGE, and leave
them set by configure file since they are different for different
architectures. Take KDUMP_KIMAGE kdump kernel image for example:

    x86 is bzImage
    mips64 is vmlinux
    ppc is uImage
    arm is zImage

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools/kdump      | 52 ++++++++----------------
 meta/recipes-kernel/kexec/kexec-tools/kdump.conf |  6 +--
 2 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump b/meta/recipes-kernel/kexec/kexec-tools/kdump
index 3fb133f..2347205 100755
--- a/meta/recipes-kernel/kexec/kexec-tools/kdump
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump
@@ -8,23 +8,7 @@
 #
 
 #default
-KDUMP_KVER="`uname -r`"
-KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
-KDUMP_CMDLINE="`cat /proc/cmdline`"
-KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
-KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
-
-#get right kernel image
-march="`uname -m`"
-case ${march} in
-	x86*|i?86)
-		;;
-		*)
-		KDUMP_KIMAGE="/boot/uImage-${KDUMP_KVER}"
-		;;
-esac
-
-KEXEC=usr/sbin/kexec
+KEXEC=/usr/sbin/kexec
 KEXEC_ARGS="-p"
 
 MAKEDUMPFILE=/usr/bin/makedumpfile
@@ -34,6 +18,9 @@ LOGGER="logger -p info -t kdump"
 
 if [ -f /etc/sysconfig/kdump.conf ]; then
 	. /etc/sysconfig/kdump.conf
+else
+	echo "no /etc/sysconfig/kdump.conf"
+	exit 1;
 fi
 
 do_check()
@@ -41,24 +28,33 @@ do_check()
 	#check makedumpfile
 	if [ ! -e ${MAKEDUMPFILE} -o ! -x ${MAKEDUMPFILE} ] ;then
 		echo "No makedumpfile found."
-		return 1;
+		exit 0
 	fi
 
 	#check kexec
 	if [ ! -e ${KEXEC} -o ! -x ${KEXEC} ] ;then
 		echo "No kexec found."
-		return 1;
+		exit 0
 	fi
 
 	#check whether kdump kernel image exists on the system
-	if [ ! -f ${KDUMP_KIMAGE} ]; then
+	if [ -z "${KDUMP_KIMAGE}" -o ! -f "${KDUMP_KIMAGE}" ]; then
 		echo "No kdump kernel image found."
-		return 1
+		exit 0
+	fi
+
+	if [ "${KDUMP_CMDLINE}"x = "x" ] ; then
+		echo "KDUMP_CMDLINE is not configured"
+		exit 0
 	fi
 }
 
 do_save_vmcore()
 {
+	if [ ${KDUMP_VMCORE_PATH}x = x ]; then
+		KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
+	fi
+
 	mkdir -p ${KDUMP_VMCORE_PATH}
 	echo "Saving a vmcore to ${KDUMP_VMCORE_PATH}."
 
@@ -101,20 +97,6 @@ do_start()
 		return 1
 	fi
 
-	#handle kdump cmdline parameters, remove some useless options
-	kcmdline=""
-	for x in `cat /proc/cmdline`; do
-		case $x in
-			crashkernel*)
-				;;
-			*)
-				kcmdline="${kcmdline} $x"
-				;;
-		esac
-	done
-
-	KDUMP_CMDLINE="${kcmdline} ${KDUMP_CMDLINE_APPEND}"
-
 	#Load the kdump kernel image
 	${KEXEC} ${KEXEC_ARGS} "${KDUMP_KIMAGE}" --append="${KDUMP_CMDLINE}"
 	if [ $? != 0 ]; then
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump.conf b/meta/recipes-kernel/kexec/kexec-tools/kdump.conf
index 42a2435..38190d2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kdump.conf
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump.conf
@@ -1,13 +1,9 @@
 #the kdump kernel version string.
 #KDUMP_KVER="`uname -r`"
 
-#this will be passed to the kdump kernel as kdump kernel command line, it
-#usually comes from /proc/cmdline
+#this will be passed to the kdump kernel as kdump kernel command line
 #KDUMP_CMDLINE="`cat /proc/cmdline`"
 
-# append arguments to the kdump commandline
-#KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
-
 #the kernel image for kdump
 #KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
 
-- 
2.9.2.368.g08bb350


