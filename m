Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLOfo-0003OV-6x
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:27:20 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Nov 2011 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="69498961"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by azsmga001.ch.intel.com with ESMTP; 01 Nov 2011 17:21:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 17:21:07 -0700
Message-Id: <2dd3e61a4e2e7e87d0bfbfc736ac2060e6f1292b.1320191934.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
Subject: [Pull v3 2/4] xserver-nodm-init: Use useradd to add the xuser for rootless X
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
X-List-Received-Date: Wed, 02 Nov 2011 00:27:20 -0000

This also address an issue with dbus and connman, since connmand
needs to start as the xuser in the rootless X situation.

Fixes: [YOCTO #1699]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |   28 +++++++------------
 1 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index ea4222d..dbc1c42 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r26"
+PR = "r28"
 RDEPENDS_${PN} = "sudo"
 
 SRC_URI = "file://xserver-nodm \
@@ -23,23 +23,15 @@ do_install() {
     fi
 }
 
-pkg_postinst_${PN} () {
-    if [ "x$D" != "x" ] ; then
-        exit 1
-    fi
-
-    if [ -f /etc/X11/Xusername ]; then
-        # create the rootless X user, and add user to group tty, video, audio
-        username=`cat /etc/X11/Xusername`
-        adduser --disabled-password $username
-        # FIXME: use addgroup if busybox addgroup is ready
-        sed -i -e "s/^video:.*/&${username}/g" /etc/group
-        sed -i -e "s/^tty:.*/&${username}/g" /etc/group
-        sed -i -e "s/^audio:.*/&${username}/g" /etc/group
-    fi
-}
-
-inherit update-rc.d
+inherit update-rc.d useradd
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+
+# Use fixed Xusername of xuser for now, this will need to be
+# fixed if the Xusername changes from xuser
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home \
+                       --shell /bin/false --groups video,tty,audio \
+                       --user-group xuser"
+
-- 
1.7.6.4



