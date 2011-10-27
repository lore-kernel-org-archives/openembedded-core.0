Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYC2-0002rD-9v
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263263"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:38 +0200
Message-Id: <d8a6eb65b86bea7b1262748575a1609c664163ec.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/18] xserver-nodm-init: use useradd to create xuser
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |   26 ++++---------------
 1 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index ea4222d..33252cb 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -2,11 +2,10 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r26"
+PR = "r27"
 RDEPENDS_${PN} = "sudo"
 
 SRC_URI = "file://xserver-nodm \
-           file://Xusername \
            file://gplv2-license.patch"
 
 S = ${WORKDIR}
@@ -19,27 +18,14 @@ do_install() {
     install xserver-nodm ${D}/etc/init.d
     if [ "${ROOTLESS_X}" = "1" ] ; then
         install -d ${D}/etc/X11
-        install Xusername ${D}/etc/X11
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
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /etc/X11 --shell /bin/false --groups video,tty,audio --user-group xuser"
+
-- 
1.7.6.4



