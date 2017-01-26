Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B24E71DB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0QA3BA7007149; Thu, 26 Jan 2017 10:03:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nRLfFO3XDxba; Thu, 26 Jan 2017 10:03:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0QA3994007145
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Jan 2017 10:03:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWgtZ-0000fZ-B5; Thu, 26 Jan 2017 10:03:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 10:03:07 +0000
Message-Id: <1485424987-2502-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] image/packagegroup/populate_sdk: Drop do_populate_sysroot task properly
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
X-List-Received-Date: Thu, 26 Jan 2017 10:03:13 -0000

Setting do_populate_sysroot as noexec means the code keeps thinking it can find
a manifest file for it. It also complicates sstate installtion since the code
would believe there is an sstate object there it should look for.

Instead, delete the task. This causes sdk failures as the dependencies are wrong
so fix those as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass             | 6 +-----
 meta/classes/packagegroup.bbclass      | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fb0cce3..76146c9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -96,10 +96,6 @@ LDCONFIGDEPEND_libc-musl = ""
 # don't want this dependency, which is causing dependency loop
 KERNELDEPMODDEPEND ?= "virtual/kernel:do_packagedata"
 
-# POPULATESYSROOTDEPS fails to expand correctly with multilibs since overrides aren't set for image.bbclass
-# we don't need these depends so just clear them
-do_populate_sysroot[depends] = ""
-
 do_rootfs[depends] += " \
     makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND} \
     virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot \
@@ -625,7 +621,7 @@ do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+deltask do_populate_sysroot
 do_package[noexec] = "1"
 do_package_qa[noexec] = "1"
 do_packagedata[noexec] = "1"
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index a60a52b..ad6c8b0 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -46,7 +46,7 @@ do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+deltask do_populate_sysroot
 
 python () {
     initman = d.getVar("VIRTUAL-RUNTIME_init_manager")
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 5ad08c6..2246eb3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -273,6 +273,6 @@ do_populate_sdk[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-reloca
 
 do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
-do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS').split()])}"
+do_populate_sdk[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('SDK_RDEPENDS').split()])}"
 do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
 addtask populate_sdk
-- 
2.7.4


