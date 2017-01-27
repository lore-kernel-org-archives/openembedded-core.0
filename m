Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F37D97743A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHgEAZ019778; Fri, 27 Jan 2017 17:42:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JJTG8dZ2pLy9; Fri, 27 Jan 2017 17:42:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHg9vk019759
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jan 2017 17:42:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cXAXJ-0001WH-L4; Fri, 27 Jan 2017 17:42:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 17:42:01 +0000
Message-Id: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/7] image/kernelsrc/packagegroups/recipes: Remove uneeded noexec tasks
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
X-List-Received-Date: Fri, 27 Jan 2017 17:42:17 -0000

We used to have issues removing tasks like do_fetch due to implications
for targets like world and universe. These have now been resolved.

Removing uneeded tasks has advantages compared to noexec since it means
that accidentally left in dependencies are no longer needed/processed
(e.g. do_patch depends on quilt-native).

This cleans up a number of cases which local analysis highlighted as
being unneeded leading to slightly cleaner task graphs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass                   | 16 ++++++++--------
 meta/classes/kernelsrc.bbclass               |  6 +++---
 meta/classes/packagegroup.bbclass            | 12 ++++++------
 meta/recipes-core/glibc/glibc-collateral.inc |  6 +++---
 meta/recipes-core/meta/meta-environment.bb   | 10 +++++-----
 meta/recipes-core/meta/meta-world-pkgdata.bb | 12 ++++++------
 meta/recipes-core/meta/package-index.bb      | 24 ++++++++++++------------
 7 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 76146c9..b4e5432 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -615,15 +615,15 @@ MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${l
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_install[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-do_package[noexec] = "1"
-do_package_qa[noexec] = "1"
+deltask do_package
+deltask do_package_qa
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 9efd46a..675d40e 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,7 +1,7 @@
 S = "${STAGING_KERNEL_DIR}"
-do_fetch[noexec] = "1"
-do_unpack[depends] += "virtual/kernel:do_patch"
-do_unpack[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+do_patch[depends] += "virtual/kernel:do_patch"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index ad6c8b0..4af4a01 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -40,12 +40,12 @@ python () {
 DEPCHAIN_DBGDEFAULTDEPS = "1"
 
 # We only need the packaging tasks - disable the rest
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_install[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
 
 python () {
diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 60655eb..6b32e4a 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -9,9 +9,9 @@ HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
 ARM_INSTRUCTION_SET = "arm"
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index a2ed229..47086fb 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -71,9 +71,9 @@ FILES_${PN}= " \
     ${SDKPATH}/* \
     "
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
 do_populate_sysroot[noexec] = "1"
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 617f96a..02abd8a 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -25,12 +25,12 @@ python do_collect_packagedata() {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_install[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
 
 do_prepare_recipe_sysroot[deptask] = ""
 
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 3c46b49..fe022ff 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -4,18 +4,18 @@ LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 PACKAGES = ""
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_install[noexec] = "1"
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_package
+deltask do_packagedata
+deltask do_package_write_ipk
+deltask do_package_write_rpm
+deltask do_package_write_deb
+deltask do_populate_sysroot
 
 do_package_index[nostamp] = "1"
 do_package_index[depends] += "${PACKAGEINDEXDEPS}"
-- 
2.7.4


