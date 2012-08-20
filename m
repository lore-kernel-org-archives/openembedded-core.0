Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PTR-0000IZ-CJ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:44:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 03:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206305468"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 03:32:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:32:31 +0100
Message-Id: <b9fbd5e485d46850ad515b42abe99b8870e6c92e.1345458715.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 4/7] oprofileui-server: move initscript from qemu-config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 10:44:47 -0000

The qemu-config initscript was only starting oprofile-server, so move it
to the oprofileui-server recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb        |   11 ++---------
 .../oprofile/oprofileui-server/init}               |    8 ++++----
 .../oprofile/oprofileui-server_git.bb              |   13 ++++++++++++-
 3 files changed, 18 insertions(+), 14 deletions(-)
 rename meta/{recipes-bsp/qemu-config/qemu-config/qemu-autostart => recipes-kernel/oprofile/oprofileui-server/init} (74%)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 3e44d7c..036d281 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -11,8 +11,7 @@ PR = "r25"
 
 SRC_URI = "file://distcc.sh \
            file://exports \
-           file://shutdown.desktop \
-           file://qemu-autostart"
+           file://shutdown.desktop"
 
 S = "${WORKDIR}"
 
@@ -24,9 +23,6 @@ do_install() {
     
     install -d ${D}${datadir}/applications
     install -m 0644 shutdown.desktop ${D}${datadir}/applications/
-
-    install -d ${D}${sysconfdir}/init.d
-    install qemu-autostart ${D}${sysconfdir}/init.d/
 }
 
 pkg_postinst_${PN} () {
@@ -36,7 +32,4 @@ pkg_postinst_${PN} () {
 
 RDEPENDS_${PN} = "distcc task-core-nfs-server oprofileui-server bash"
 
-inherit update-rc.d allarch
-
-INITSCRIPT_NAME = "qemu-autostart"
-INITSCRIPT_PARAMS = "start 999 5 2 . stop 20 0 1 6 ."
+inherit allarch
diff --git a/meta/recipes-bsp/qemu-config/qemu-config/qemu-autostart b/meta/recipes-kernel/oprofile/oprofileui-server/init
similarity index 74%
rename from meta/recipes-bsp/qemu-config/qemu-config/qemu-autostart
rename to meta/recipes-kernel/oprofile/oprofileui-server/init
index db2668e..2544ea4 100755
--- a/meta/recipes-bsp/qemu-config/qemu-config/qemu-autostart
+++ b/meta/recipes-kernel/oprofile/oprofileui-server/init
@@ -1,11 +1,11 @@
 #!/bin/sh
 ### BEGIN INIT INFO
-# Provides:          hddtemp
+# Provides:          oprofile-server
 # Required-Start:    $network
 # Required-Stop:     $network
 # Default-Start:     2 3 4 5
 # Default-Stop:      0 1 6
-# Short-Description: OProfile server
+# Short-Description: OProfileUI server
 # Description:       
 ### END INIT INFO
 
@@ -13,13 +13,13 @@
 
 case "$1" in
   start)
-        echo "Starting automatic qemu services"
+        echo "Starting OProfileUI server"
 	. /etc/profile
 	/usr/bin/oprofile-server &
   ;;
 
   stop)
-        echo "Stopping qemu services"
+        echo "Stopping OProfileUI server"
         killproc oprofile-server
   ;;
 
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index b9f6a81..e75923f 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -6,8 +6,19 @@ PR = "r0"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git \
+           file://init"
 
 EXTRA_OECONF += "--disable-client --enable-server"
 
 RDEPENDS_${PN} = "oprofile"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/oprofileui-server
+}
+
+INITSCRIPT_NAME = "oprofileui-server"
+INITSCRIPT_PARAMS = "start 999 5 2 . stop 20 0 1 6 ."
+
+inherit update-rc.d
-- 
1.7.9.5



