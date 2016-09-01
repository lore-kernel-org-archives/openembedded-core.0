Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 61AC773243
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 06:53:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 31 Aug 2016 23:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,265,1470726000"; d="scan'208";a="1044268616"
Received: from heimdall.fi.intel.com ([10.237.68.41])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2016 23:53:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 09:53:04 +0300
Message-Id: <20160901065304.3578-1-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <0350ac493ad4d15fe3d5c75f4861ed6aabbe2004.1472467394.git.jussi.kukkonen@intel.com>
References: <0350ac493ad4d15fe3d5c75f4861ed6aabbe2004.1472467394.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/3] xserver-nodm-init: Deprecate /etc/X11/Xserver
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
X-List-Received-Date: Thu, 01 Sep 2016 06:53:11 -0000

This commit should provide the same functionality as before, but
should make meta-oe xserver-nodm-init-2.0 obsolete as well as
keep systemd and sysvinit startup better in sync.

/etc/X11/Xserver is not called anymore: it is provided by both
x11-common and xserver-common with no useful differences (but some
annoying ones). Instead xserver-nodm-init provides
/etc/xserver-nodm/Xserver as the startup script and
/etc/default/xserver-nodm as the default settings file. These are
used by both init systems.

The Xserver script could be completely removed (with sysv and
systemd calling xinit directly), but to keep compatibility with
meta-oes xserver-nodm-init-2.0 the Xserver script sources
/etc/X11/xserver-common if one exists -- and systemd EnvironmentFile
cannot do that.

x11-common used to have a packageconfig to easily control screen
blanking. Move this to xserver-nodm-init.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v1:
* Require distro feature x11 so 'world' can build without x11.

I've force-modified the branch at
  git://git.yoctoproject.org/poky-contrib jku/xserver-nodm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xserver-nodm

Thanks, Jussi



 .../x11-common/xserver-nodm-init.bb                | 51 +++++++++++++---------
 .../x11-common/xserver-nodm-init/Xserver           | 25 +++++++++++
 .../x11-common/xserver-nodm-init/Xusername         |  1 -
 .../x11-common/xserver-nodm-init/xserver-nodm      | 10 +++--
 .../x11-common/xserver-nodm-init/xserver-nodm.conf |  1 -
 .../xserver-nodm-init/xserver-nodm.conf.in         |  7 +++
 ...server-nodm.service => xserver-nodm.service.in} |  4 +-
 7 files changed, 70 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
 rename meta/recipes-graphics/x11-common/xserver-nodm-init/{xserver-nodm.service => xserver-nodm.service.in} (76%)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index b68d40e..a6d0d5e 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -5,10 +5,10 @@ SECTION = "x11"
 PR = "r31"
 
 SRC_URI = "file://xserver-nodm \
-           file://Xusername \
+           file://Xserver \
            file://gplv2-license.patch \
-           file://xserver-nodm.service \
-           file://xserver-nodm.conf \
+           file://xserver-nodm.service.in \
+           file://xserver-nodm.conf.in \
 "
 
 S = "${WORKDIR}"
@@ -16,35 +16,44 @@ S = "${WORKDIR}"
 # Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit update-rc.d systemd
+inherit update-rc.d systemd distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PACKAGECONFIG ??= "blank"
+# dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
+PACKAGECONFIG[blank] = ""
 
 do_install() {
-    install -d ${D}${sysconfdir}/init.d
-    install xserver-nodm ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/default
+    install xserver-nodm.conf.in ${D}${sysconfdir}/default/xserver-nodm
+    install -d ${D}${sysconfdir}/xserver-nodm
+    install Xserver ${D}${sysconfdir}/xserver-nodm/Xserver
+
+    BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"
+    if [ "${ROOTLESS_X}" = "1" ] ; then
+        XUSER_HOME="/home/xuser"
+        XUSER="xuser"
+    else
+        XUSER_HOME=${ROOT_HOME}
+        XUSER="root"
+    fi
+    sed -i "s:@HOME@:${XUSER_HOME}:; s:@USER@:${XUSER}:; s:@BLANK_ARGS@:${BLANK_ARGS}:" \
+        ${D}${sysconfdir}/default/xserver-nodm
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${sysconfdir}/default
-        install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
-        if [ "${ROOTLESS_X}" = "1" ] ; then
-            sed -i 's!^HOME=.*!HOME=/home/xuser!' ${D}${sysconfdir}/default/xserver-nodm
-            sed -i 's!^User=.*!User=xuser!' ${D}${systemd_unitdir}/system/xserver-nodm.service
-        else
-            sed -i 's!^HOME=.*!HOME=${ROOT_HOME}!' ${D}${sysconfdir}/default/xserver-nodm
-            sed -i '/^User=/d' ${D}${systemd_unitdir}/system/xserver-nodm.service
-        fi
+        install -m 0644 ${WORKDIR}/xserver-nodm.service.in ${D}${systemd_unitdir}/system/xserver-nodm.service
+        sed -i "s:@USER@:${XUSER}:" ${D}${systemd_unitdir}/system/xserver-nodm.service
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-        if [ "${ROOTLESS_X}" = "1" ] ; then
-            install -d ${D}${sysconfdir}/X11
-            install Xusername ${D}${sysconfdir}/X11
-        fi
+        install -d ${D}${sysconfdir}/init.d
+        install xserver-nodm ${D}${sysconfdir}/init.d
     fi
 }
 
-RDEPENDS_${PN} = "${@base_conditional('ROOTLESS_X', '1', 'xuser-account', '', d)}"
+RDEPENDS_${PN} = "xinit ${@base_conditional('ROOTLESS_X', '1', 'xuser-account', '', d)}"
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver b/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
new file mode 100644
index 0000000..0edbfbf
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+# This script is only needed to make sure /etc/X11/xserver-common
+# can affect XSERVER, ARGS & DPI: otherwise systemd could just use
+# /etc/default/xserver-nodm as EnvironmentFile and sysvinit could just
+# source the same file
+
+. /etc/profile
+
+# load default values for XSERVER, ARGS, DISPLAY...
+. /etc/default/xserver-nodm
+
+# Allow xserver-common to override ARGS, XSERVER, DPI
+if [ -e /etc/X11/xserver-common ] ; then
+    . /etc/X11/xserver-common
+    if [ ! -e $XSERVER ] ; then
+        XSERVER=$(which $XSERVER)
+    fi
+fi
+
+if [ -n "$DPI" ] ; then
+    ARGS="$ARGS -dpi $DPI"
+fi
+
+exec xinit /etc/X11/Xsession -- $XSERVER $DISPLAY $ARGS $*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername b/meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
deleted file mode 100644
index 7060e5e..0000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
+++ /dev/null
@@ -1 +0,0 @@
-xuser
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index bfa0a8d..6c54855 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -26,10 +26,11 @@ done
 case "$1" in
   start)
        . /etc/profile
-       username=root
+
+       #default for USER
+       . /etc/default/xserver-nodm
        echo "Starting Xserver"
-       if [ -f /etc/X11/Xusername ]; then
-           username=`cat /etc/X11/Xusername`
+       if [ "$USER" != "root" ]; then
            # setting for rootless X
            chmod o+w /var/log
            chmod g+r /dev/tty[0-3]
@@ -38,8 +39,9 @@ case "$1" in
                chmod o+rw /dev/hidraw*
            fi
        fi
+
        # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
-       su -l -c '/etc/X11/Xserver&' $username 
+       su -l -c '/etc/xserver-nodm/Xserver &' $USER
        # Wait for the desktop to say its finished loading
        # before loading the rest of the system
        # dbus-wait org.matchbox_project.desktop Loaded
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
deleted file mode 100644
index 3c0582a..0000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
+++ /dev/null
@@ -1 +0,0 @@
-HOME=/home/root
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
new file mode 100644
index 0000000..757c23d
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
@@ -0,0 +1,7 @@
+# common environment file for sysvinit and systemd
+
+XSERVER=/usr/bin/Xorg
+DISPLAY=:0
+ARGS=" -br -pn @BLANK_ARGS@ "
+HOME=@HOME@
+USER=@USER@
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
similarity index 76%
rename from meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
index 62d979f..324a26f 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
@@ -2,9 +2,9 @@
 Description=Xserver startup without a display manager
 
 [Service]
-User=root
 EnvironmentFile=/etc/default/xserver-nodm
-ExecStart=/etc/X11/Xserver
+User=@USER@
+ExecStart=/etc/xserver-nodm/Xserver
 
 [Install]
 Alias=display-manager.service
-- 
2.9.3


