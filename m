Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 110E865C7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 18:09:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2014 11:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,758,1400050800"; d="scan'208";a="580767814"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.64])
	by orsmga002.jf.intel.com with ESMTP; 29 Jul 2014 11:09:17 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 11:07:07 -0700
Message-Id: <0c4db4388792b00a72afdb379d1094efa2649cbf.1406657048.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1406657048.git.max.eliaser@intel.com>
References: <cover.1406657048.git.max.eliaser@intel.com>
In-Reply-To: <cover.1406657048.git.max.eliaser@intel.com>
References: <cover.1406657048.git.max.eliaser@intel.com>
Subject: [PATCH 2/2] bootchart2: create recipe for bootchart2
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
X-List-Received-Date: Tue, 29 Jul 2014 18:09:16 -0000

This recipe creates packages for the bootchart2 system-wide profiler daemon
and related utilities. It fetches the Git revision corresponding to the
0.14.6 release of bootchart2.

The recipe contains three packages:
   *   bootchart2 - The daemon itself.
   *   pybootchartgui - Python program to visualize and display the data
       collected by bootchart2 or compatible daemons such as the original
       bootchart.
   *   bootchartd-stop-initscript - A SysV init script to stop data collection
       when booting completes.

Depending on how you wish to use bootchart2, you may not end up having all
three of those packages installed on your image.

There is also a bootchart2-native variant, which is intended solely to provide
a native version of the pybootchartgui utility. The non-cross-compiled version
of the bootchart2 daemon has not been tested at all, don't use it.

The recipe is extensively documented. Read the comments at the beginning of
bootchart2_git.bb or else you'll have no idea how to use it.

This recipe is based on a recipe from meta-WebOS. The WebOS people had some
extra code (including patches against the bootchart2 code) to support the
Upstart init system. However, since upstream Poky does not support Upstart,
that stuff is being left behind. The WebOS people can write a bbappend to re-
add it.

Original recipe written by Wonhong Kwon of LG.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 .../bootchart2/bootchart2/bootchartd_stop.sh       |  18 +++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 135 +++++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2_git.bb

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
new file mode 100644
index 0000000..21a7887
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          bootchartd_stop
+# Required-Start:    $remote_fs $all
+# Required-Stop: 
+# Default-Start:     2 3 4 5
+# Default-Stop:
+# Short-Description: Stop bootchartd collection
+# Description:       This script accompanies bootchartd from bootchart2. 
+#                    bootchartd should stop detect the end of the boot process
+#                    automatically if a window manager is launched, but for
+#                    command-line only operating systems, this script should be
+#                    used instead.
+### END INIT INFO
+
+/sbin/bootchartd stop
+
+: exit 0
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
new file mode 100644
index 0000000..0eb67a3
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
@@ -0,0 +1,135 @@
+# Copyright (c) 2013 LG Electronics, Inc.
+# Copyright (C) 2014 Intel Corp.
+
+# This recipe creates packages for the bootchart2 system-wide profiler daemon 
+# and related utilities. Depending on the images you're building, additional
+# configuration may be needed in order to use it.
+#
+# Packages:
+#   *   bootchart2 - The daemon itself.
+#   *   pybootchartgui - Python program to visualize and display the data
+#       collected by bootchart2 or compatible daemons such as the original 
+#       bootchart.
+#   *   bootchartd-stop-initscript - A SysV init script to stop data collection
+#       when booting completes (see below for details.)
+#
+# While bootchart2 is designed to stop collecting data roughly when the boot 
+# process completes, it is not exactly a stopwatch. It has a list of programs 
+# which are supposed signify that the boot process has completed (for example,
+# openbox or gnome-shell,) but it waits a full 20 seconds after such a program
+# is launched before stopping itself, to collect additional data.
+#
+# If you are using a window manager or GUI which isn't included in bootchart2's
+# default configuration file, you should write bbappend file to amend
+# bootchartd.conf and add it to EXIT_PROC. An example of this is shown in this
+# recipe, where the Matchbox window manager (used by Sato) is added.
+#
+# If you want data collection to end at a certain point exactly, you should
+# arrange for the following command to be run:
+#   bootchartd stop
+# You might set this command to be launched by the desktop environment shipped
+# on the image you're building after the other startup programs are complete.
+# This will not incur the 20 second wait period and will cause bootchart2 to
+# behave a bit more like a stopwatch. An example of this is shown in this 
+# recipe, specifically the bootchartd-stop-initscript package, which stops data
+# collection as the last action when switching to runlevels 2 through 5. You can
+# add bootchartd-stop-initscript to IMAGE_INSTALL if you need to use it.
+#
+# Unless you're doing something special, if your image does not launch an X 
+# window manager, you will need to add bootchartd-stop-initscript to your image.
+#
+# Bootchart2 can be started in two ways. Data collection can be initiated by
+# running the following command:
+#   bootchartd start
+# However, for the most complete data, the bootchart2 developers recommend
+# running it as PID 1. This can be done by adding the following to the kernel 
+# command line parameters in the bootloader setup:
+#   init=/sbin/bootchartd
+# When invoked this way, bootchart2 will set itself up and then automatically 
+# run /sbin/init. For example, when booting the default qemux86 image, one might
+# use a command like this:
+#   runqemu qemux86 bootparams="initcall_debug printk.time=y quiet \
+#                               init=/sbin/bootchartd"
+#
+# Neither method is actually implemented here, choose what works for you.
+#
+# By default, when data collection is stopped, a file named bootchart.tgz will
+# be created in /var/log. If pybootchartgui is included in your image,
+# bootchart.png will also be created at the same time. However, this results in
+# a noticeable hitch or pause at boot time, which may not be what you want on an
+# embedded device. So you may prefer to omit pybootchartgui from your image. In
+# that case, copy bootchart.tgz over to your development system and generate
+# bootchart.png there. To get pybootchartgui on your development system, you can
+# either install it directly from some other source, or build bootchart2-native
+# and find pybootchartgui in the native sysroot:
+#    bitbake bootchart2-native
+#   ./tmp/sysroots/x86_64-linux/usr/bin/pybootchartgui /path/to/bootchart.tgz
+# Note that, whether installed on your build system or on your image, the 
+# pybootchartgui provided by this recipe does not support the -i option. You 
+# will need to install pybootchartgui by other means in order to run it in
+# interactive mode.
+
+SUMMARY = "Booting sequence and CPU,I/O usage monitor"
+DESCRIPTION = "Monitors where the system spends its time at start, creating a graph of all processes, disk utilization, and wait time."
+AUTHOR = "Wonhong Kwon <wonhong.kwon@lge.com>"
+HOMEPAGE = "https://github.com/mmeeks/bootchart"
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
+
+PV = "0.14.6+git${SRCPV}"
+
+SRC_URI = "git://github.com/mmeeks/bootchart.git"
+SRC_URI += "file://bootchartd_stop.sh"
+
+SRCREV = "f1bd34503699ac3a6eca427edbb62e09a2771abd"
+
+S = "${WORKDIR}/git"
+
+inherit systemd
+inherit update-rc.d
+inherit pythonnative
+
+# The only reason to build bootchart2-native is for a native pybootchartgui.
+BBCLASSEXTEND = "native"
+
+SYSTEMD_SERVICE_${PN} = "bootchart.service bootchart-done.service bootchart-done.timer"
+
+UPDATERCPN = "bootchartd-stop-initscript"
+INITSCRIPT_NAME = "bootchartd_stop.sh"
+INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
+
+# We want native pybootchartgui to execute with the correct Python interpeter.
+do_compile_append_class-native () {
+    echo "#! ${PYTHON}" | cat - ${S}/pybootchartgui.py > ${WORKDIR}/temp_pybootchartgui
+    mv ${WORKDIR}/temp_pybootchartgui ${S}/pybootchartgui.py
+    chmod +x ${S}/pybootchartgui
+}
+
+do_install () {
+    install -d ${D}${sysconfdir} # needed for -native
+    export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
+    export BINDIR="${bindir}"
+    export DESTDIR="${D}"
+
+    oe_runmake install
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
+
+    echo 'EXIT_PROC="$EXIT_PROC matchbox-window-manager"' >> ${D}${sysconfdir}/bootchartd.conf
+}
+
+PACKAGES =+ "pybootchartgui"
+FILES_pybootchartgui += "${libdir}/python*/site-packages/pybootchartgui ${bindir}/pybootchartgui"
+RDEPENDS_pybootchartgui = "python-pycairo python-compression python-image python-textutils python-shell python-compression python-codecs"
+RDEPENDS_append_class-native = " python-pycairo-native"
+
+PACKAGES =+ "bootchartd-stop-initscript"
+FILES_bootchartd-stop-initscript += "${sysconfdir}/init.d ${sysconfdir}/rc*.d"
+
+FILES_${PN} += "${base_libdir}/bootchart/bootchart-collector"
+FILES_${PN} += "${base_libdir}/bootchart/tmpfs"
+FILES_${PN} += "${libdir}"
+FILES_${PN}-dbg += "${base_libdir}/bootchart/.debug"
+FILES_${PN}-doc += "${datadir}/docs"
+
+RCONFLICTS_${PN} = "bootchart"
-- 
1.8.3.2


