Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RXxf7-0004iN-Q4
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:14:34 +0100
Received: by yenq1 with SMTP id q1so2023632yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=qu6eRyV2kChNfFiptVQsDF1GcV4PyffFwRvhBBSuZLc=;
	b=SsrOgbl1XZCN4FvT1hexxkNxUfkXyajqjGtOVO0tjFEnhpdKIeRb2BjEVwl80312ox
	FNEbNsQYOJa6AOuNQ1nwL/9ldCI//xiIi2XgmaBWeKQJq3bsqgJvPyJ5VsL9H1EEJEPZ
	xNI6+0R6ujSlrjh045F5sNT6Cz/rADG4wzFVY=
Received: by 10.236.149.243 with SMTP id x79mr6821415yhj.92.1323187665591;
	Tue, 06 Dec 2011 08:07:45 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm62085463ani.21.2011.12.06.08.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 08:07:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 16:07:27 +0000
Message-Id: <f3df38fe8abc70dd3de57a36de34fa6f60eeea4c.1323187516.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
Subject: [PATCH 1/5] initramfs-base: provides the base for a modular initramfs
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
X-List-Received-Date: Tue, 06 Dec 2011 16:14:34 -0000

Provides the API to be used by the initramfs module. The modules need
to provide the following functions:

 <module>_enabled : check if the module ought to run (return 1 to skip)
 <module>_run     : do what is need

Boot parameters are available on environment in the as:

 'foo=value' as 'bootparam_foo=value'
 'foo' as 'bootparam_foo=true'

Another possibility is to add hooks to be run before and/or after a
module to be run, allowing for fancy features as dynamic debug shells
and like.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-base/finish            |   42 ++++++
 .../recipes-core/initrdscripts/initramfs-base/init |  136 ++++++++++++++++++++
 .../initrdscripts/initramfs-base_1.0.bb            |   17 +++
 3 files changed, 195 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-base/finish
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-base/init
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-base_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-base/finish b/meta/recipes-core/initrdscripts/initramfs-base/finish
new file mode 100755
index 0000000..8139b42
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-base/finish
@@ -0,0 +1,42 @@
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
diff --git a/meta/recipes-core/initrdscripts/initramfs-base/init b/meta/recipes-core/initrdscripts/initramfs-base/init
new file mode 100755
index 0000000..fc4b0db
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-base/init
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
diff --git a/meta/recipes-core/initrdscripts/initramfs-base_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-base_1.0.bb
new file mode 100644
index 0000000..e98e0f5
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-base_1.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "initramfs modular system base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "busybox"
+
+inherit allarch
+
+SRC_URI = "file://init \
+           file://finish"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}/init
+    install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
+}
+
+FILES_${PN} = "/init /init.d/*"
-- 
1.7.2.5



