Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB0E6A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 13:58:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 06:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,974,1363158000"; d="scan'208";a="262624498"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jul 2013 06:58:42 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 16:57:31 +0300
Message-Id: <b2b193d7632393d1a1ac091ce01eb9d93d44886b.1372686507.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372686507.git.laurentiu.palcu@intel.com>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
	<cover.1372686507.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372686507.git.laurentiu.palcu@intel.com>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Mon, 01 Jul 2013 13:58:42 -0000

People using xserver-xorg that need to calibrate their touchscreen
devices would also need meta-oe. Bringing the recipes to oe-core will
make it easier for them.

Aditionaly:
 * drop xterm RDEPENDS. Terminal is not needed to run the menu item;
 * change xinput_calibrator_pointercal.sh so that it can be run as
   normal user: pointercal.xinput is saved to ~/.pointercal/ and it will
   be used when the system boots;
 * have the calibration run through an Xsession file;
 * remove the systemd service since calibration is run by Xsession;

[YOCTO #4416]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   17 +++++
 .../xinput-calibrator/30xinput_calibrate.sh        |    7 +++
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |   66 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   34 ++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
new file mode 100644
index 0000000..9633fc5
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
@@ -0,0 +1 @@
+# replace with valid machine specific pointercal.xinput
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
new file mode 100644
index 0000000..8423640
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://pointercal.xinput"
+S = "${WORKDIR}"
+
+do_install() {
+    # Only install file if it has a contents
+    if [ -s ${S}/pointercal.xinput ]; then
+        install -d ${D}${sysconfdir}/
+        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
+    fi
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
new file mode 100644
index 0000000..5290726
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+. /etc/formfactor/config
+
+if [ "$HAVE_TOUCHSCREEN" = "1" ]; then
+	/usr/bin/xinput_calibrator_once.sh
+fi
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
new file mode 100644
index 0000000..8698292
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
@@ -0,0 +1,66 @@
+Upstream-Status: Pending
+
+From 14734a93bd3fc323325459e24b04795422e395e6 Mon Sep 17 00:00:00 2001
+From: Laurentiu Palcu <laurentiu.palcu@intel.com>
+Date: Mon, 1 Jul 2013 15:38:02 +0300
+Subject: [PATCH] Allow xinput_calibrator_pointercal.sh to be run as normal
+ user
+
+Allow normal user to create their own pointercal.xinput files that
+override the system pointercal file in /etc.
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+---
+ scripts/xinput_calibrator_pointercal.sh |   33 +++++++++++++++++++++----------
+ 1 file changed, 23 insertions(+), 10 deletions(-)
+
+diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
+index fccb197..0ada7da 100755
+--- a/scripts/xinput_calibrator_pointercal.sh
++++ b/scripts/xinput_calibrator_pointercal.sh
+@@ -11,19 +11,32 @@
+ PATH="/usr/bin:$PATH"
+ 
+ BINARY="xinput_calibrator"
+-CALFILE="/etc/pointercal.xinput"
+-LOGFILE="/var/log/xinput_calibrator.pointercal.log"
++SYS_CALFILE="/etc/pointercal.xinput"
++USER_CALFILE="$HOME/.pointercal/pointercal.xinput"
+ 
+-if [ -e $CALFILE ] ; then
+-  if grep replace $CALFILE ; then
+-    echo "Empty calibration file found, removing it"
+-    rm $CALFILE
+-  else
+-    echo "Using calibration data stored in $CALFILE"
+-    . $CALFILE && exit 0
+-  fi
++if [ "$USER" = "root" ]; then
++  LOGFILE="/var/log/xinput_calibrator.pointercal.log"
++  CALFILES="$SYS_CALFILE"
++else
++  LOGFILE="$HOME/.pointercal/xinput_calibrator.pointercal.log"
++  CALFILES="$USER_CALFILE $SYS_CALFILE"
++  mkdir -p "$HOME/.pointercal"
+ fi
+ 
++for CALFILE in $CALFILES; do
++  if [ -e $CALFILE ]; then
++    if grep replace $CALFILE ; then
++      echo "Empty calibration file found, removing it"
++      rm $CALFILE 2>/dev/null || true
++    else
++      echo "Using calibration data stored in $CALFILE"
++      . $CALFILE && exit 0
++    fi
++  fi
++done
++
++[ "$USER" != "root" ] && CALFILE=$USER_CALFILE
++
+ CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
+ if [ ! -z "$CALDATA" ] ; then
+   echo $CALDATA > $CALFILE
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
new file mode 100644
index 0000000..06872bc
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
+DEPENDS = "virtual/libx11 libxi"
+
+PV = "0.7.5+git${SRCPV}"
+
+inherit autotools systemd
+
+SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
+           file://30xinput_calibrate.sh \
+           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch"
+
+S = "${WORKDIR}/git"
+
+# force native X11 ui as we don't have gtk+ in DEPENDS
+EXTRA_OECONF += "--with-gui=x11"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+
+    install -d ${D}${sysconfdir}/X11/Xsession.d/
+    install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
+}
+
+RDEPENDS_${PN} = "xinput"
+RRECOMMENDS_${PN} = "pointercal-xinput"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.7.9.5


