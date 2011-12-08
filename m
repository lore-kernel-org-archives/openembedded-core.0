Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhI-0007dd-CK
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987716"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:11 -0800
Message-Id: <4429aabe260abd25304eeece3b86283fd8fd4c26.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/17] initramfs-framework: provides a modular initramfs
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:22 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Provides the API and modules for a modular initramfs. The currently
included modules are:

 * initramfs-module-debug adds support to dynamic debugging of
   initramfs using bootparams

 * initramfs-module-udev: enables udev usage

 * initramfs-module-mdev: enables mdev usage

 * initramfs-module-e2fs: adds support for ext4, ext3 and ext2
   filesystems

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-framework/debug        |   82 ++++++++++++
 .../initrdscripts/initramfs-framework/e2fs         |   28 ++++
 .../initrdscripts/initramfs-framework/finish       |   46 +++++++
 .../initrdscripts/initramfs-framework/init         |  136 ++++++++++++++++++++
 .../initrdscripts/initramfs-framework/mdev         |   30 +++++
 .../initrdscripts/initramfs-framework/udev         |   22 +++
 .../initrdscripts/initramfs-framework_1.0.bb       |   57 ++++++++
 7 files changed, 401 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/debug
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/e2fs
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/finish
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/init
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/mdev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/udev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/debug b/meta/recipes-core/initrdscripts/initramfs-framework/debug
new file mode 100644
index 0000000..00bfd7d
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/debug
@@ -0,0 +1,82 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+# Adds support to dynamic debugging of initramfs using bootparam in
+# following format:
+#   shell                 : starts a shell before and after each module
+#   shell=before:<module> : starts a shell before <module> is loaded and run
+#   shell=after:<module>  : starts a shell after <module> is loaded and run
+#
+#   shell-debug                 : run set -x as soon as possible
+#   shell-debug=before:<module> : run set -x before <module> is loaded and run
+#   shell-debug=after:<module>  : run set -x after <module> is loaded and run
+
+DEBUG_SHELL="false"
+
+debug_hook_handler() {
+	status=$1
+	module=$2
+
+	if [ -n "$bootparam_shell" ] && [ "$bootparam_shell" != "true" ]; then
+		shell_wanted_status=`expr $bootparam_shell : '\(.*\):.*'`
+		shell_wanted_module=`expr $bootparam_shell : '.*:\(.*\)'`
+
+		if [ "$shell_wanted_status" = "before" ]; then
+			shell_wanted_status=pre
+		else
+			shell_wanted_status=post
+		fi
+	fi
+
+	if [ "$bootparam_shell" = "true" ] ||
+		( [ "$status" = "$shell_wanted_status" ] &&
+			[ "$module" = "$shell_wanted_module" ] ); then
+		if [ "$status" = "pre" ]; then
+			status_msg="before"
+		else
+			status_msg="after"
+		fi
+
+		msg "Starting shell $status_msg $module..."
+		sh
+	fi
+
+	if [ -n "$bootparam_shell_debug" ] && [ "$bootparam_shell_debug" != "true" ]; then
+		shell_debug_wanted_status=`expr $bootparam_shell_debug : '\(.*\):.*'`
+		shell_debug_wanted_module=`expr $bootparam_shell_debug : '.*:\(.*\)'`
+
+		if [ "$shell_debug_wanted_status" = "before" ]; then
+			shell_debug_wanted_status=pre
+		else
+			shell_debug_wanted_status=post
+		fi
+	fi
+
+	if [ "$bootparam_shell_debug" = "true" ] ||
+		( [ "$status" = "$shell_debug_wanted_status" ] &&
+			[ "$module" = "$shell_debug_wanted_module" ] ); then
+		if [ "$DEBUG_SHELL" = "true" ]; then
+			return 0
+		fi
+
+		if [ "$status" = "pre" ]; then
+			status_msg="before"
+		else
+			status_msg="after"
+		fi
+
+		msg "Starting shell debugging $status_msg $module..."
+		DEBUG_SHELL="true"
+		set -x
+	fi
+}
+
+debug_enabled() {
+	return 0
+}
+
+debug_run() {
+	add_module_pre_hook "debug_hook_handler"
+	add_module_post_hook "debug_hook_handler"
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/e2fs b/meta/recipes-core/initrdscripts/initramfs-framework/e2fs
new file mode 100755
index 0000000..29f801a
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/e2fs
@@ -0,0 +1,28 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+e2fs_enabled() {
+	return 0
+}
+
+e2fs_run() {
+	filesystems="ext4 ext3 ext2"
+
+	# load modules
+	for fs in $filesystems; do
+		load_kernel_module $fs
+	done
+
+	for fs in $filesystems; do
+		eval "fs_options=\$bootparam_${fs}"
+		if [ -n "$fs_options" ]; then
+		    dev=`expr "$fs_options" : '\([^:]*\).*'`
+		    path=`expr "$fs_options" : '[^:]*:\([^:]*\).*'`
+
+		    info "Mounting $dev as $fs on $path as $fs..."
+			mkdir -p $path
+		    mount -t $fs $dev $path
+		fi
+	done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
new file mode 100755
index 0000000..bedd803
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -0,0 +1,46 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+finish_enabled() {
+	return 0
+}
+
+finish_run() {
+	if [ -n "$ROOTFS_DIR" ]; then
+		if [ -n "$bootparam_rootdelay" ]; then
+			debug "Sleeping for $rootdelay second(s) to wait root to settle..."
+			sleep $bootparam_rootdelay
+		fi
+
+		if [ -n "$bootparam_root" ]; then
+			debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
+
+			if [ "${bootparam_root:0:5}" = "UUID=" ]; then
+				bootparam_root="/dev/disk/by-uuid/${bootparam_root/UUID=/}"
+			fi
+
+			if [ -e "$bootparam_root" ]; then
+				mount $bootparam_root $ROOTFS_DIR
+			else
+				debug "root '$bootparam_root' doesn't exist."
+			fi
+		fi
+
+		if [ ! -d $ROOTFS_DIR/dev ]; then
+			fatal "ERROR: There's no '/dev' on rootfs."
+		fi
+
+		info "Switching root to '$ROOTFS_DIR'..."
+
+		debug "Moving /dev, /proc and /sys onto rootfs..."
+		mount --move /dev $ROOTFS_DIR/dev
+		mount --move /proc $ROOTFS_DIR/proc
+		mount --move /sys $ROOTFS_DIR/sys
+
+		cd $ROOTFS_DIR
+		exec switch_root -c /dev/console $ROOTFS_DIR /sbin/init
+	else
+		debug "No rootfs has been set"
+	fi
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
new file mode 100755
index 0000000..fc4b0db
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -0,0 +1,136 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+#
+# Provides the API to be used by the initramfs modules
+#
+# Modules need to provide the following functions:
+#
+# <module>_enabled : check if the module ought to run (return 1 to skip)
+# <module>_run     : do what is need
+#
+# Boot parameters are available on environment in the as:
+#
+# 'foo=value' as 'bootparam_foo=value'
+# 'foo' as 'bootparam_foo=true'
+
+# Register a function to be called before running a module
+# The hook is called as:
+#   <function> pre <module>
+add_module_pre_hook() {
+	MODULE_PRE_HOOKS="$MODULE_PRE_HOOKS $1"
+}
+
+# Register a function to be called after running a module
+# The hook is called as:
+#   <function> post <module>
+add_module_post_hook() {
+	MODULE_POST_HOOKS="$MODULE_POST_HOOKS $1"
+}
+
+# Load kernel module
+load_kernel_module() {
+	if modprobe $1 >/dev/null 2>&1; then
+		info "Loaded module $1"
+	else
+		debug "Failed to load module $1"
+	fi
+}
+
+# Prints information
+msg() {
+	echo "$@" >/dev/console
+}
+
+# Prints information if verbose bootparam is used
+info() {
+	[ -n "$bootparam_verbose" ] && echo "$@" >/dev/console
+}
+
+# Prints information if debug bootparam is used
+debug() {
+	[ -n "$bootparam_debug" ] && echo "DEBUG: $@" >/dev/console
+}
+
+# Prints a message and start a endless loop
+fatal() {
+    echo $1 >/dev/console
+    echo >/dev/console
+
+	while [ "true" ]; do
+		sleep 3600
+	done
+}
+
+# Variables shared amoung modules
+ROOTFS_DIR="/rootfs" # where to do the switch root
+MODULE_PRE_HOOKS=""  # functions to call before running each module
+MODULE_POST_HOOKS="" # functions to call after running each module
+MODULES_DIR=/init.d  # place to look for modules
+
+# initialize /proc and /sys
+mkdir -p /proc /sys
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+
+# populate bootparam environment
+for p in `cat /proc/cmdline`; do
+	opt="${p%%=*}"
+	opt=${opt/-/_}
+	if [ "${p/=/}" = "$p" ]; then
+		eval "bootparam_${opt}=true"
+	else
+		eval "bootparam_${opt}=\"${p#*=}\""
+	fi
+done
+
+# use /dev with devtmpfs
+if grep -q devtmpfs /proc/filesystems; then
+	mkdir -p /dev
+	mount -t devtmpfs devtmpfs /dev
+else
+	if [ ! -d /dev ]; then
+		fatal "ERROR: /dev doesn't exist and kernel doesn't has devtmpfs enabled."
+	fi
+fi
+
+mkdir $ROOTFS_DIR
+
+# Load and run modules
+for m in $MODULES_DIR/*; do
+	# Skip backup files
+	if [ "${m/\~/}" != "$m" ]; then
+		continue
+	fi
+
+	module=`basename $m | cut -d'-' -f 2`
+	debug "Loading module $module"
+
+	# pre hooks
+	for h in $MODULE_PRE_HOOKS; do
+		debug "Calling module hook (pre): $h"
+		eval "$h pre $module"
+		debug "Finished module hook (pre): $h"
+	done
+
+	# process module
+	source $m
+
+	if ! eval "${module}_enabled"; then
+		debug "Skipping module $module"
+		continue
+	fi
+
+	debug "Running ${module}_run"
+	eval "${module}_run"
+
+	# post hooks
+	for h in $MODULE_POST_HOOKS; do
+		debug "Calling module hook (post): $h"
+		eval "$h post $module"
+		debug "Finished module hook (post): $h"
+	done
+done
+
+# Catch all
+fatal "ERROR: Initramfs failed to initialize the system."
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/mdev b/meta/recipes-core/initrdscripts/initramfs-framework/mdev
new file mode 100644
index 0000000..a5df1d7
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/mdev
@@ -0,0 +1,30 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+mdev_enabled() {
+	if [ ! -e /sbin/mdev ]; then
+		debug "/sbin/mdev doesn't exist"
+		return 1
+	fi
+
+	return 0
+}
+
+mdev_run() {
+	# setup the environment
+	mount -t tmpfs tmpfs /dev
+
+	mkdir -m 1777 /dev/shm
+
+	mkdir -m 0755 /dev/pts
+	mount -t devpts devpts /dev/pts
+
+	echo /sbin/mdev > /proc/sys/kernel/hotplug
+	mdev -s
+
+	# load modules for devices
+	find /sys -name modalias | while read m; do
+		load_kernel_module $(cat $m)
+	done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
new file mode 100644
index 0000000..9ea8aa3
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -0,0 +1,22 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+udev_enabled() {
+	if [ ! -e /sbin/udevd ]; then
+		debug "/sbin/udev doesn't exist"
+		return 1
+	fi
+
+	return 0
+}
+
+udev_run() {
+	mkdir -p /run
+
+	udevd --daemon > /dev/null
+	udevadm trigger --action=add
+	udevadm settle
+
+	killall udevd 2>/dev/null
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
new file mode 100644
index 0000000..58e41d4
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -0,0 +1,57 @@
+DESCRIPTION = "initramfs modular system"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "busybox"
+
+inherit allarch
+
+SRC_URI = "file://init \
+           file://finish \
+           file://mdev \
+           file://udev \
+           file://e2fs \
+           file://debug"
+
+do_install() {
+    install -d ${D}/init.d
+
+    # base
+    install -m 0755 ${WORKDIR}/init ${D}/init
+    install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
+
+    # mdev
+    install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
+
+    # udev
+    install -m 0755 ${WORKDIR}/udev ${D}/init.d/01-udev
+
+    # e2fs
+    install -m 0755 ${WORKDIR}/e2fs ${D}/init.d/10-e2fs
+
+    # debug
+    install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
+}
+
+PACKAGES = "${PN}-base \
+            initramfs-module-mdev \
+            initramfs-module-udev \
+            initramfs-module-e2fs \
+            initramfs-module-debug"
+
+FILES_${PN}-base = "/init /init.d/99-finish"
+
+DESCRIPTION_initramfs-module-mdev = "initramfs support for mdev"
+RDEPENDS_initramfs-module-mdev = "${PN}-base"
+FILES_initramfs-module-mdev = "/init.d/01-mdev"
+
+DESCRIPTION_initramfs-module-udev = "initramfs support for udev"
+RDEPENDS_initramfs-module-udev = "${PN}-base udev udev-utils"
+FILES_initramfs-module-udev = "/init.d/01-udev"
+
+DESCRIPTION_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
+RDEPENDS_initramfs-module-e2fs = "${PN}-base"
+FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
+
+DESCRIPTION_initramfs-module-debug = "initramfs dynamic debug support"
+RDEPENDS_initramfs-module-debug = "${PN}-base"
+FILES_initramfs-module-debug = "/init.d/00-debug"
-- 
1.7.6.4



