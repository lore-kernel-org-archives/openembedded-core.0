Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QX8dM-0006Nv-I5
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:13:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jun 2011 02:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,374,1304319600"; d="scan'208";a="14196025"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga002.jf.intel.com with ESMTP; 16 Jun 2011 02:08:32 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 17:20:35 +0800
Message-Id: <24c31ebbed038d3dda2e9a0a97bcd9fe4fe89a8d.1308215406.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
Subject: [PATCH 6/6] initscript: Change some order of init scripts
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
X-List-Received-Date: Thu, 16 Jun 2011 09:13:07 -0000

Move udev script to execute ealier since module autoload needs it to
create device nodes.

Also move sysfs before udev which has dependency on it.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +++---
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../modutils/modutils-initscripts.bb               |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 48b65b9..9e535af 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r126"
+PR = "r127"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -119,8 +119,8 @@ do_install () {
 	ln -sf		../init.d/bootmisc.sh	${D}${sysconfdir}/rcS.d/S55bootmisc.sh
 #	ln -sf		../init.d/urandom	${D}${sysconfdir}/rcS.d/S55urandom
 #	ln -sf		../init.d/finish.sh	${D}${sysconfdir}/rcS.d/S99finish.sh
-	# udev will run at S04 if installed
-	ln -sf		../init.d/sysfs.sh	${D}${sysconfdir}/rcS.d/S03sysfs.sh
+	ln -sf		../init.d/sysfs.sh	${D}${sysconfdir}/rcS.d/S02sysfs.sh
+	# udev will run at S03 if installed
 	ln -sf		../init.d/populate-volatile.sh	${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
 	ln -sf		../init.d/devpts.sh	${D}${sysconfdir}/rcS.d/S38devpts.sh
 	if [ "${TARGET_ARCH}" = "arm" ]; then
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 1b94f1b..4c4451f 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -40,7 +40,7 @@ PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
-INITSCRIPT_PARAMS_udev = "start 04 S ."
+INITSCRIPT_PARAMS_udev = "start 03 S ."
 INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 76fd907..567e62e 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb b/meta/recipes-kernel/modutils/modutils-initscripts.bb
index 5ae34b4..89d38cf 100644
--- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
@@ -4,10 +4,10 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
 SRC_URI = "file://modutils.sh \
 	   file://PD.patch"
-PR = "r5"
+PR = "r6"
 
 INITSCRIPT_NAME = "modutils.sh"
-INITSCRIPT_PARAMS = "start 2 S ."
+INITSCRIPT_PARAMS = "start 4 S ."
 
 inherit update-rc.d
 
-- 
1.7.1



