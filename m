Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOX-0004D6-6U
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:49:45 +0100
Received: by daln34 with SMTP id n34so1809173dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=19QxHBTFUeSy6sGaPBkDOKETVFdvY/tL+xfR+hQZkXw=;
	b=Mume6Op4VOvV5nP7AMafqKSBoPCYXnk3h+zBjHK41zAuF69s2nP4FL/WpEqhkE2qgW
	X27WMfhpA7dw4WZ4nRG4Z3co0yCRwntD820yOu5GequSHEJtni1bJgzWRtuQXsvTj0Oe
	cIBQx/C10FeD8IStWwPTQyGtsq68kQrryJ4q8=
Received: by 10.68.73.100 with SMTP id k4mr45541279pbv.55.1328510503840;
	Sun, 05 Feb 2012 22:41:43 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.41.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:41:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:27 -0800
Message-Id: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 01/20] task-core-tools: Divide it into 3 recipes
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
X-List-Received-Date: Mon, 06 Feb 2012 06:49:45 -0000

task-core-tools-debug, task-core-tools-profile, task-core-tools-testapps
otherwise if we choose one through PACKAGE_GROUPS all packages
are built since they are in same recipe.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   26 +++++--
 meta/conf/multilib.conf                            |    4 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |   26 ++++++
 ...sk-core-tools.bb => task-core-tools-profile.bb} |   81 ++++++--------------
 .../recipes-core/tasks/task-core-tools-testapps.bb |   46 +++++++++++
 5 files changed, 119 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
 rename meta/recipes-core/tasks/{task-core-tools.bb => task-core-tools-profile.bb} (48%)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-testapps.bb

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 42f7e65..09b5bfc 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2467,12 +2467,26 @@ RECIPE_LATEST_RELEASE_DATE_pn-task-core-nfs="n/a"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-nfs="n/a"
 RECIPE_MAINTAINER_pn-task-core-nfs = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-task-core-tools="green"
-RECIPE_LATEST_VERSION_pn-task-core-tools="1.0"
-RECIPE_NO_OF_PATCHES_pn-task-core-tools="0"
-RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools="n/a"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools="n/a"
-RECIPE_MAINTAINER_pn-task-core-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_STATUS_pn-task-core-tools-debug="green"
+RECIPE_LATEST_VERSION_pn-task-core-tools-debug="1.0"
+RECIPE_NO_OF_PATCHES_pn-task-core-tools-debug="0"
+RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools-debug="n/a"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools-debug="n/a"
+RECIPE_MAINTAINER_pn-task-core-tools-profile = "Dongxiao Xu <dongxiao.xu@intel.com>"
+
+RECIPE_STATUS_pn-task-core-tools-profile="green"
+RECIPE_LATEST_VERSION_pn-task-core-tools-profile="1.0"
+RECIPE_NO_OF_PATCHES_pn-task-core-tools-profile="0"
+RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools-profile="n/a"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools-profile="n/a"
+RECIPE_MAINTAINER_pn-task-core-tools-profile = "Dongxiao Xu <dongxiao.xu@intel.com>"
+
+RECIPE_STATUS_pn-task-core-tools-testapps="green"
+RECIPE_LATEST_VERSION_pn-task-core-tools-testapps="1.0"
+RECIPE_NO_OF_PATCHES_pn-task-core-tools-testapps="0"
+RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools-testapps="n/a"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools-testapps="n/a"
+RECIPE_MAINTAINER_pn-task-core-tools-testapps = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gst-meta-base="green"
 DISTRO_PN_ALIAS_pn-gst-meta-base = "Meego=gstreamer Fedora=gstreamer OpenSuSE=gstreamer Ubuntu=gstreamer0.10 Mandriva=gstreamer0.10 Debian=gstreamer0.10"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 9554519..d366fd3 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -393,7 +393,9 @@ BBCLASSEXTEND_append_pn-task-core-lsb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-nfs = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-ssh-dropbear = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-ssh-openssh = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-task-core-tools = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-task-core-tools-debug = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-task-core-tools-profile = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-task-core-tools-testapps = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-x11 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-task-core-x11-sato = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tasks = " ${MULTILIBS}"
diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb b/meta/recipes-core/tasks/task-core-tools-debug.bb
new file mode 100644
index 0000000..3c92f3f
--- /dev/null
+++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
@@ -0,0 +1,26 @@
+#
+# Copyright (C) 2008 OpenedHand Ltd.
+#
+
+DESCRIPTION = "Debug tools tasks for OE-Core"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGES = "\
+    ${PN} \
+    ${PN}-dbg \
+    ${PN}-dev \
+    "
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ALLOW_EMPTY = "1"
+
+RDEPENDS_${PN} = "\
+    gdb \
+    gdbserver \
+    tcf-agent \
+    rsync \
+    strace \
+    "
diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools-profile.bb
similarity index 48%
rename from meta/recipes-core/tasks/task-core-tools.bb
rename to meta/recipes-core/tasks/task-core-tools-profile.bb
index 1a42f15..254d3f5 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools-profile.bb
@@ -2,42 +2,30 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Tools tasks for OE-Core"
+DESCRIPTION = "Profile tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r15"
 
 PACKAGES = "\
-    task-core-tools-debug \
-    task-core-tools-debug-dbg \
-    task-core-tools-debug-dev \
-    task-core-tools-profile \
-    task-core-tools-profile-dbg \
-    task-core-tools-profile-dev \
-    task-core-tools-testapps \
-    task-core-tools-testapps-dbg \
-    task-core-tools-testapps-dev \
+    ${PN} \
+    ${PN}-dbg \
+    ${PN}-dev \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 ALLOW_EMPTY = "1"
 
-# kexec-tools doesn't work on Mips
-KEXECTOOLS ?= "kexec"
-KEXECTOOLS_mips ?= ""
-KEXECTOOLS_mipsel ?= ""
-KEXECTOOLS_powerpc ?= ""
-
-RDEPENDS_task-core-tools-debug = "\
-    gdb \
-    gdbserver \
-    tcf-agent \
-    rsync \
-    strace"
+RRECOMMENDS_${PN} = "\
+    perf \
+    trace-cmd \
+    kernel-module-oprofile \
+    blktrace \
+    sysprof \
+    "
 
-RDEPENDS_task-core-tools-profile = "\
+PROFILETOOLS = "\
     oprofile \
     oprofileui-server \
     powertop \
@@ -45,14 +33,6 @@ RDEPENDS_task-core-tools-profile = "\
     lttng-control \
     lttng-viewer"
 
-RRECOMMENDS_task-core-tools-profile = "\
-    perf \
-    trace-cmd \
-    kernel-module-oprofile \
-    blktrace \
-    sysprof \
-    "
-
 # systemtap needs elfutils which is not fully buildable on uclibc
 # hence we exclude it from uclibc based builds
 SYSTEMTAP = "systemtap"
@@ -66,6 +46,13 @@ SYSTEMTAP_libc-uclibc = ""
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
+LTTNGUST_mips = ""
+
+# valgrind does not work on mips
+
+VALGRIND = "valgrind"
+VALGRIND_libc-uclibc = ""
+VALGRIND_mips = ""
 
 #    exmap-console
 #    exmap-server
@@ -74,29 +61,9 @@ LTTNGUST_libc-uclibc = ""
 # qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstream liburcu
 # (which is required by lttng-ust) may not build on other platforms, like
 # MIPS.
-RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemux86-64 = " ${LTTNGUST} ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemuppc = " ${LTTNGUST} ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemuarm = " ${LTTNGUST} ${SYSTEMTAP}"
-
-RDEPENDS_task-core-tools-testapps = "\
-    blktool \
-    fstests \
-    tslib-calibrate \
-    tslib-tests \
-    lrzsz \
-    ${KEXECTOOLS} \
-    alsa-utils-amixer \
-    alsa-utils-aplay \
-    owl-video \
-    gst-meta-video \
-    gst-meta-audio \
-    mesa-demos \
-    x11perf \
-    xrestop \
-    xwininfo \
-    xprop \
-    xvideo-tests \
-    clutter-box2d \
-    ltp \
+RDEPENDS_${PN} = "\
+    ${PROFILETOOLS} \
+    ${LTTNGUST} \
+    ${SYSTEMTAP} \
+    ${VALGRIND} \
     "
diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb b/meta/recipes-core/tasks/task-core-tools-testapps.bb
new file mode 100644
index 0000000..b5847f8
--- /dev/null
+++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
@@ -0,0 +1,46 @@
+#
+# Copyright (C) 2008 OpenedHand Ltd.
+#
+
+DESCRIPTION = "Test apps task for OE-Core"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGES = "\
+    ${PN} \
+    ${PN}-dbg \
+    ${PN}-dev \
+    "
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ALLOW_EMPTY = "1"
+
+# kexec-tools doesn't work on Mips
+KEXECTOOLS ?= "kexec"
+KEXECTOOLS_mips ?= ""
+KEXECTOOLS_mipsel ?= ""
+KEXECTOOLS_powerpc ?= ""
+
+RDEPENDS_${PN} = "\
+    blktool \
+    fstests \
+    tslib-calibrate \
+    tslib-tests \
+    lrzsz \
+    ${KEXECTOOLS} \
+    alsa-utils-amixer \
+    alsa-utils-aplay \
+    owl-video \
+    gst-meta-video \
+    gst-meta-audio \
+    mesa-demos \
+    x11perf \
+    xrestop \
+    xwininfo \
+    xprop \
+    xvideo-tests \
+    clutter-box2d \
+    ltp \
+    "
-- 
1.7.5.4



