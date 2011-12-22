Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Rdhoz-0001bx-Vx
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:32:30 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Dec 2011 04:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88519431"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 22 Dec 2011 04:25:22 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 20:16:01 +0800
Message-Id: <3aa9dedc61c1abc64e19d07e51714e3f883e313b.1324555824.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324555824.git.edwin.zhai@intel.com>
References: <cover.1324555824.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324555824.git.edwin.zhai@intel.com>
References: <cover.1324555824.git.edwin.zhai@intel.com>
Subject: [PATCH 1/4] mini-x-session: Add this recipe as the session file for mini X
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
X-List-Received-Date: Thu, 22 Dec 2011 12:32:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

mini-x-session runs session files on behalf of file owner, so that no rootless X
required.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../mini-x-session/files/mini-x-session            |   32 ++++++++++++++++++++
 .../mini-x-session/mini-x-session_0.1.bb           |   24 +++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-session
 create mode 100644 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb

diff --git a/meta/recipes-graphics/mini-x-session/files/mini-x-session b/meta/recipes-graphics/mini-x-session/files/mini-x-session
new file mode 100644
index 0000000..1940e27
--- /dev/null
+++ b/meta/recipes-graphics/mini-x-session/files/mini-x-session
@@ -0,0 +1,32 @@
+#!/bin/sh
+#
+# Very simple session manager for Mini X
+#
+
+# Uncomment below to enable parsing of debian menu entrys
+# export MB_USE_DEB_MENUS=1 
+
+if [ -e $HOME/.mini_x/session ]
+then
+exec $HOME/.mini_x/session
+fi
+
+if [ -e /etc/mini_x/session ]
+then
+exec /etc/mini_x/session
+fi
+
+MINI_X_SESSION_DIR=/etc/mini_x/session.d
+
+# Execute session file on behalf of file owner
+for SESSIONFILE in $MINI_X_SESSION_DIR/*; do
+    set +e
+    USERNAME=`stat -c %U $SESSIONFILE`
+    sudo -b -i -u $USERNAME $SESSIONFILE& 
+    set -e
+done
+# Default files to run if $HOME/.mini_x/session or /etc/mini_x/session
+# dont exist. 
+
+matchbox-terminal&
+exec matchbox-window-manager
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
new file mode 100644
index 0000000..3818d16
--- /dev/null
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Mini X session files for poky"
+HOMEPAGE = "http://www.yoctoproject.org"
+BUGTRACKER = "http://bugzilla.pokylinux.org"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
+
+SECTION = "x11"
+RCONFLICTS = "matchbox-common"
+
+SRC_URI = "file://mini-x-session"
+S = "${WORKDIR}"
+
+inherit update-alternatives
+
+ALTERNATIVE_NAME = "x-session-manager"
+ALTERNATIVE_LINK = "${bindir}/x-session-manager"
+ALTERNATIVE_PATH = "${bindir}/mini-x-session"
+ALTERNATIVE_PRIORITY = "10"
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/mini-x-session ${D}/${bindir}
+}
-- 
1.7.1



