Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RdHcw-000776-DU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 09:34:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 00:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88828066"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 00:27:12 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 16:18:07 +0800
Message-Id: <f13de6bacfca9935698b1f30f2729b28d9e9a71f.1324454963.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324454963.git.edwin.zhai@intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324454963.git.edwin.zhai@intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
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
X-List-Received-Date: Wed, 21 Dec 2011 08:34:18 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

"builder" can start some auto stuff by mini X session.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb      |   27 +++++++++++++++++++++
 meta/recipes-graphics/builder/files/auto_start.sh |   11 ++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/builder/builder_0.1.bb
 create mode 100644 meta/recipes-graphics/builder/files/auto_start.sh

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
new file mode 100644
index 0000000..abe329f
--- /dev/null
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "New user to do specific job"
+DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
+SECTION = "x11"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://auto_start.sh;endline=5;md5=66d6c43a8b2583e3bd70c6b020f679a4"
+
+SRC_URI = "file://auto_start.sh"
+
+S = "${WORKDIR}"
+
+RDEPENDS_${PN} = "minix-session"
+
+inherit useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --create-home \
+                       --groups video,tty,audio \
+                       --user-group ${PN}"
+
+do_install () {
+	install -d -m 755 ${D}/etc/minix/session.d
+	install -p -m 755 auto_start.sh ${D}/etc/minix/session.d/
+
+	chown  ${PN}.${PN} ${D}/etc/minix/session.d/auto_start.sh
+}
+
diff --git a/meta/recipes-graphics/builder/files/auto_start.sh b/meta/recipes-graphics/builder/files/auto_start.sh
new file mode 100644
index 0000000..7247d1c
--- /dev/null
+++ b/meta/recipes-graphics/builder/files/auto_start.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+#This script will be called via minix X session on behalf of file owner, after
+#installed in /etc/minix/session.d/. Any auto start jobs including X apps can
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



