Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr2-0004L1-7k
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752124"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:44 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:18:56 -0800
Message-Id: <fdb12302674101feb85f4e83936652474ffd231d.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 010/113] Add "builder" user for specific purpose.
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:12 -0000

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
1.7.6.4



