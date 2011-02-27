Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtdDb-0007bf-Nq
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:47:11 +0100
Received: by wyb38 with SMTP id 38so2805344wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:45:48 -0800 (PST)
Received: by 10.216.22.131 with SMTP id t3mr3743960wet.2.1298798974926;
	Sun, 27 Feb 2011 01:29:34 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f52sm1282660wes.35.2011.02.27.01.29.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:34 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:09 +0100
Message-Id: <7790c11deb665f5847f31a84a08884a62ab7ec43.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 04/50] xserver-nodm-init: add rootless-x support
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
X-List-Received-Date: Sun, 27 Feb 2011 09:47:11 -0000

From: Yu Ke <ke.yu@intel.com>

most rootless X work are already done in the kernel, xserver and
graphics driver, this patches add the the remaining userspace setting:

- create /etc/X11/Xusername to set rootless X user
- add rootless X user to group video, tty to access /dev/tty[0-4]
  and /dev/dri/card0
- grant rootless X user access right to /dev/input/*, /var/log

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |   22 +++++++++++++++++++-
 .../x11-common/xserver-nodm-init/Xusername         |    1 +
 .../x11-common/xserver-nodm-init/xserver-nodm      |    4 +++
 3 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 03a6ca3..a93acc9 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -3,10 +3,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 PRIORITY = "optional"
-PR = "r23"
+PR = "r24"
 RDEPENDS_${PN} = "dbus-wait sudo"
 
 SRC_URI = "file://xserver-nodm \
+           file://Xusername \
            file://gplv2-license.patch"
 
 S = ${WORKDIR}
@@ -17,6 +18,25 @@ do_install() {
     install -d ${D}/etc
     install -d ${D}/etc/init.d
     install xserver-nodm ${D}/etc/init.d
+    if [ "${ROOTLESS_X}" = "1" ] ; then
+        install -d ${D}/etc/X11
+        install Xusername ${D}/etc/X11
+    fi
+}
+
+pkg_postinst_${PN} () {
+    if [ "x$D" != "x" ] ; then
+        exit 1
+    fi
+
+    if [ -f /etc/X11/Xusername ]; then
+        # create the rootless X user, and add user to group tty, video
+        username=`cat /etc/X11/Xusername`
+        adduser --disabled-password $username
+        # FIXME: use addgroup if busybox addgroup is ready
+        sed -i -e "s/^video:.*/&${username}/g" /etc/group
+        sed -i -e "s/^tty:.*/&${username}/g" /etc/group
+    fi
 }
 
 inherit update-rc.d
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername b/meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
new file mode 100644
index 0000000..7060e5e
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
@@ -0,0 +1 @@
+xuser
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index 69ea949..d8c4ba0 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -30,6 +30,10 @@ case "$1" in
        echo "Starting Xserver"
        if [ -f /etc/X11/Xusername ]; then
            username=`cat /etc/X11/Xusername`
+           # setting for rootless X
+           chmod o+w /var/log
+           chmod g+r /dev/tty[0-3]
+           chmod o+rw /dev/input/*
        fi
        # Using sudo -i here has the nice side effect of making sire
        # HOME, USER and other previously problematic variables
-- 
1.6.6.1



