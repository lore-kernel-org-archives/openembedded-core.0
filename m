Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Rdhp0-0001bx-PN
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:32:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Dec 2011 04:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88519436"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 22 Dec 2011 04:25:23 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 20:16:03 +0800
Message-Id: <fb2e9d6deddc3958e06c5559b58d9e260dbc50f5.1324555824.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324555824.git.edwin.zhai@intel.com>
References: <cover.1324555824.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324555824.git.edwin.zhai@intel.com>
References: <cover.1324555824.git.edwin.zhai@intel.com>
Subject: [PATCH 3/4] Add "builder" user for specific purpose.
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
X-List-Received-Date: Thu, 22 Dec 2011 12:32:31 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

"builder" can start some auto stuff by mini X session.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb       |   27 ++++++++++++++++++++
 .../builder/files/builder_hob_start.sh             |   11 ++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/builder/builder_0.1.bb
 create mode 100644 meta/recipes-graphics/builder/files/builder_hob_start.sh

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
new file mode 100644
index 0000000..ceb9612
--- /dev/null
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "New user to do specific job"
+DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
+SECTION = "x11"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
+
+SRC_URI = "file://builder_hob_start.sh"
+
+S = "${WORKDIR}"
+
+RDEPENDS_${PN} = "mini-x-session"
+
+inherit useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --create-home \
+                       --groups video,tty,audio \
+                       --user-group ${PN}"
+
+do_install () {
+	install -d -m 755 ${D}/etc/mini_x/session.d
+	install -p -m 755 builder_hob_start.sh ${D}/etc/mini_x/session.d/
+
+	chown  ${PN}.${PN} ${D}/etc/mini_x/session.d/builder_hob_start.sh
+}
+
diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
new file mode 100644
index 0000000..fdafc4e
--- /dev/null
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+#This script will be called via mini X session on behalf of file owner, after
+#installed in /etc/mini_x/session.d/. Any auto start jobs including X apps can
+#be put here
+
+# start hob here
+#cd /intel/poky/poky
+#. ./oe-init-build-env
+#../scripts/hob
+
+matchbox-terminal&
-- 
1.7.1



