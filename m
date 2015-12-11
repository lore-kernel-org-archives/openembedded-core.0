Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAD8E65CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 06:16:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBB6GwJC008552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:16:58 -0800
Received: from pek-wkang-u14.corp.ad.wrs.com (128.224.162.238) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Dec 2015 22:16:57 -0800
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Dec 2015 14:16:53 +0800
Message-ID: <1449814613-3094-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kexec-tools: added the script kdump
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
X-List-Received-Date: Fri, 11 Dec 2015 06:17:00 -0000
Content-Type: text/plain

Added the script file kdump,it provides the follow support:
1. Load a kdump kernel image into memory;
2. Copy away vmcore when system panic.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc        |   5 +-
 meta/recipes-kernel/kexec/kexec-tools/kdump      | 163 +++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools/kdump.conf |  18 +++
 meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb  |   8 ++
 4 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-kernel/kexec/kexec-tools/kdump
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kdump.conf

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 7797a25..758a3a7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "zlib xz"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
+           file://kdump \
+           file://kdump.conf \
+"
 
 PR = "r1"
 
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump b/meta/recipes-kernel/kexec/kexec-tools/kdump
new file mode 100755
index 0000000..3fb133f
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump
@@ -0,0 +1,163 @@
+#! /bin/sh
+#
+#  kdump
+#
+#  Description: The kdump script provides the support:
+#		1. Load a kdump kernel image into memory;
+#		2. Copy away vmcore when system panic.
+#
+
+#default
+KDUMP_KVER="`uname -r`"
+KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
+KDUMP_CMDLINE="`cat /proc/cmdline`"
+KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
+KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
+
+#get right kernel image
+march="`uname -m`"
+case ${march} in
+	x86*|i?86)
+		;;
+		*)
+		KDUMP_KIMAGE="/boot/uImage-${KDUMP_KVER}"
+		;;
+esac
+
+KEXEC=usr/sbin/kexec
+KEXEC_ARGS="-p"
+
+MAKEDUMPFILE=/usr/bin/makedumpfile
+MAKEDUMPFILE_ARGS="-E -d 1"
+
+LOGGER="logger -p info -t kdump"
+
+if [ -f /etc/sysconfig/kdump.conf ]; then
+	. /etc/sysconfig/kdump.conf
+fi
+
+do_check()
+{
+	#check makedumpfile
+	if [ ! -e ${MAKEDUMPFILE} -o ! -x ${MAKEDUMPFILE} ] ;then
+		echo "No makedumpfile found."
+		return 1;
+	fi
+
+	#check kexec
+	if [ ! -e ${KEXEC} -o ! -x ${KEXEC} ] ;then
+		echo "No kexec found."
+		return 1;
+	fi
+
+	#check whether kdump kernel image exists on the system
+	if [ ! -f ${KDUMP_KIMAGE} ]; then
+		echo "No kdump kernel image found."
+		return 1
+	fi
+}
+
+do_save_vmcore()
+{
+	mkdir -p ${KDUMP_VMCORE_PATH}
+	echo "Saving a vmcore to ${KDUMP_VMCORE_PATH}."
+
+	${MAKEDUMPFILE} ${MAKEDUMPFILE_ARGS} /proc/vmcore ${KDUMP_VMCORE_PATH}/vmcore-"`date +"%H:%M:%S"`"
+#	cp --sparse=always /proc/vmcore ${KDUMP_VMCORE_PATH}/vmcore-"`date +"%H:%M:%S"`"
+	rc=$?
+	if [ ${rc} == 0 ]; then
+		${LOGGER} "Saved a vmcore to ${KDUMP_VMCORE_PATH}."
+	else
+		${LOGGER} "Failed to save vmcore!"
+	fi
+	return ${rc}
+}
+
+do_start()
+{
+	#check file
+	do_check
+
+	#check whether the running kernel supports kdump.
+	if [ ! -e /sys/kernel/kexec_crash_loaded ]; then
+		echo "Kdump isn't supported on the running kernel!!!"
+		${LOGGER} "Kdump isn't supported on the running kernel!!!"
+		return 1
+	fi
+
+	#check whether kdump kernel image has been loaded
+	rc=`cat /sys/kernel/kexec_crash_loaded`
+	if [ ${rc} != 0 ]; then
+		echo "Kdump is already running.";
+		${LOGGER} "Kdump is already running."
+		return 0
+	fi
+
+	#check the running kernel cmdline option,insure "crashkenrel=" always set.
+	grep -q crashkernel= /proc/cmdline
+	if [ $? != 0 ]; then
+		echo "Kdump isn't supported on the running kernel,please check boot option!!!"
+		${LOGGER} "Kdump isn't supported on the running kernel,please check boot option!!!"
+		return 1
+	fi
+
+	#handle kdump cmdline parameters, remove some useless options
+	kcmdline=""
+	for x in `cat /proc/cmdline`; do
+		case $x in
+			crashkernel*)
+				;;
+			*)
+				kcmdline="${kcmdline} $x"
+				;;
+		esac
+	done
+
+	KDUMP_CMDLINE="${kcmdline} ${KDUMP_CMDLINE_APPEND}"
+
+	#Load the kdump kernel image
+	${KEXEC} ${KEXEC_ARGS} "${KDUMP_KIMAGE}" --append="${KDUMP_CMDLINE}"
+	if [ $? != 0 ]; then
+		echo "Failed to load kdump kernel!"
+		${LOGGER} "Failed to load kdump kernel!"
+		return 1
+	fi
+
+	echo "Kdump started up."
+	${LOGGER} "Kdump started up."
+}
+
+do_stop()
+{
+	${KEXEC} -p -u 2>/dev/null
+	if [ $? == 0 ]; then
+		echo "Kdump has been stopped."
+		${LOGGER} "Kdump has been stopped."
+	else
+		echo "Failed to stop kdump!"
+		${LOGGER} "Failed to stop kdump!"
+	fi
+}
+
+case "$1" in
+  start)
+	if [ -s /proc/vmcore ]; then
+		do_save_vmcore
+		reboot
+	else
+		do_start
+	fi
+	;;
+ restart)
+	do_stop
+	do_start
+	;;
+  stop)
+	do_stop
+	;;
+   *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump.conf b/meta/recipes-kernel/kexec/kexec-tools/kdump.conf
new file mode 100644
index 0000000..42a2435
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump.conf
@@ -0,0 +1,18 @@
+#the kdump kernel version string.
+#KDUMP_KVER="`uname -r`"
+
+#this will be passed to the kdump kernel as kdump kernel command line, it
+#usually comes from /proc/cmdline
+#KDUMP_CMDLINE="`cat /proc/cmdline`"
+
+# append arguments to the kdump commandline
+#KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
+
+#the kernel image for kdump
+#KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
+
+#Where to save the vmcore
+#KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
+
+#the arguments to makedumpfile
+MAKEDUMPFILE_ARGS="--dump-dmesg -x /boot/vmlinux-`uname -r`"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
index ffdb983..f211217 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
@@ -17,6 +17,14 @@ PACKAGES =+ "kexec kdump vmcore-dmesg"
 ALLOW_EMPTY_${PN} = "1"
 RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
 
+FILES_${PN} =+ "${sysconfig}/init.d/kdump ${sysconfig}/sysconfig/kdump.conf"
 FILES_kexec = "${sbindir}/kexec"
 FILES_kdump = "${sbindir}/kdump"
 FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
+
+do_install_append () {
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
+        install -d ${D}${sysconfdir}/sysconfig
+        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
+}
-- 
1.9.1


