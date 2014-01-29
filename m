Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E14496EA0A
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:57:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0TEvai1000100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jan 2014 06:57:37 -0800 (PST)
Received: from ord-jrw.corp.ad.wrs.com (147.11.118.124) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 29 Jan 2014 06:57:36 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jan 2014 08:57:33 -0600
Message-ID: <1391007453-14585-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] unfs3: Fix dependencies and allow target builds
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
X-List-Received-Date: Wed, 29 Jan 2014 14:57:36 -0000
Content-Type: text/plain

Fixed in this patch:
  * All patches marked as submitted to the upstream
  * Remove the pseudo dependency because unfs3 can fully stand alone
    or be used with pseudo and it does not link against pseudo
  * Dependencies to flex for nativesdk and target builds are fixed
    such that unfs3 can be deployed into an image
  * Add unfs3 references in separatebuilddir.inc because unfs3
    works correctly with autotools.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/conf/distro/include/seperatebuilddir.inc      |    7 +++----
 .../unfs3/unfs3/alternate_rpc_ports.patch          |    2 +-
 .../unfs3/unfs3/fix_compile_warning.patch          |    2 +-
 .../fix_pid_race_parent_writes_child_pid.patch     |    2 +-
 .../unfs3/unfs3/fix_warnings.patch                 |    2 +-
 .../unfs3/unfs3/relative_max_socket_path_len.patch |    2 +-
 .../unfs3/unfs3/rename_fh_cache.patch              |    2 +-
 .../unfs3/unfs3/tcp_no_delay.patch                 |    2 +-
 .../unfs3/unfs3/unfs3_parallel_build.patch         |    2 +-
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   17 ++---------------
 10 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 64e8f6d..c6897a5 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -527,8 +527,7 @@ B_pn-nativesdk-readline = "${SEPB}"
 B_pn-nativesdk-renderproto = "${SEPB}"
 B_pn-nativesdk-sqlite3 = "${SEPB}"
 B_pn-nativesdk-systemtap = "${SEPB}"
-# Not automake, no out of tree build support
-#B_pn-nativesdk-unfs3 = "${SEPB}"
+B_pn-nativesdk-unfs3 = "${SEPB}"
 B_pn-nativesdk-util-macros = "${SEPB}"
 B_pn-nativesdk-xcb-proto = "${SEPB}"
 B_pn-nativesdk-xcmiscproto = "${SEPB}"
@@ -675,8 +674,8 @@ B_pn-time = "${SEPB}"
 B_pn-tremor = "${SEPB}"
 B_pn-tslib = "${SEPB}"
 B_pn-udev = "${SEPB}"
-# Not automake, no out of tree build support
-#B_pn-unfs3-native = "${SEPB}"
+B_pn-unfs3 = "${SEPB}"
+B_pn-unfs3-native = "${SEPB}"
 B_pn-usbutils = "${SEPB}"
 B_pn-util-linux = "${SEPB}"
 B_pn-util-linux-native = "${SEPB}"
diff --git a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
index 029582e..ff745d4 100644
--- a/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
@@ -5,7 +5,7 @@ be able to specify alternate rpc port numbers.
 
 Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  daemon.c |   44 +++++++++++++++++++++++++++++++-------------
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
index 604824a..aada014 100644
--- a/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/fix_compile_warning.patch
@@ -5,7 +5,7 @@ If this one does fail something is very, very wrong.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  daemon.c |    3 ++-
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
index 76d7555..46b187e 100644
--- a/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/fix_pid_race_parent_writes_child_pid.patch
@@ -10,7 +10,7 @@ on a busy system.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  daemon.c |   12 +++++++++---
diff --git a/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
index ed61ea1..cda8655 100644
--- a/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
@@ -10,7 +10,7 @@ exports.y:350: warning: large integer implicitly truncated to unsigned type
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  Config/exports.l |    3 +++
diff --git a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
index 17ad7b6..219dd35 100644
--- a/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/relative_max_socket_path_len.patch
@@ -12,7 +12,7 @@ heavy use of named sockets with long names.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  nfs.c |   29 +++++++++++++++++++++++++++--
diff --git a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
index 37de8c3..e6d8953 100644
--- a/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/rename_fh_cache.patch
@@ -13,7 +13,7 @@ location of the inode, when it moves directories.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  fh_cache.c |   12 ++++++++++++
diff --git a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
index bc78dee..b3521c6 100644
--- a/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/tcp_no_delay.patch
@@ -2,7 +2,7 @@ daemon.c: Add option for tcp no delay
 
 Allow the NFS tcp sockets to conditionally use TCP_NODELAY
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  daemon.c |    9 ++++++++-
diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
index c7fe3d7..6777769 100644
--- a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
@@ -4,7 +4,7 @@ If building with make -j2 the lib.a will not get built in time.
 
 Jason Wessel <jason.wessel@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted http://sourceforge.net/p/unfs3/bugs/5/
 
 ---
  Config/Makefile.in |    2 ++
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
index 3d88b42..af2f3bb 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
@@ -3,11 +3,8 @@ SECTION = "console/network"
 LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
 
-RDEPENDS_${PN} = "pseudo"
-RDEPENDS_${PN}_class-native = "pseudo-native"
-RDEPENDS_${PN}_class-nativesdk = "pseudo-nativesdk"
-DEPENDS = "flex-native bison-native"
-DEPENDS_class-nativesdk += "flex-nativesdk"
+DEPENDS = "flex-native bison-native flex"
+DEPENDS_append_class-nativesdk += "flex-nativesdk"
 
 SRC_URI[md5sum] = "3687acc4ee992e536472365dd99712a7"
 SRC_URI[sha256sum] = "274b43ada9c6eea1da26eb7010d72889c5278984ba0b50dff4e093057d4d64f8"
@@ -32,13 +29,3 @@ inherit autotools
 # will walk entire file systems and this is a real problem
 # if you have 2 TB of files to walk in your file system
 CACHED_CONFIGUREVARS = "ac_cv_header_mntent_h=no ac_cv_header_sys_mnttab_h=no"
-
-# This recipe is intended for -native and -nativesdk builds only,
-# not target installs:
-python __anonymous () {
-    import re
-
-    pn = d.getVar("PN", True)
-    if not pn.endswith('-native') and not pn.startswith('nativesdk-'):
-        raise bb.parse.SkipPackage("unfs3 is intended for native/nativesdk builds only")
-}
-- 
1.7.9.5


