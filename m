Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF0565C91
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 21:44:58 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sA6LiuSS002005 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Nov 2014 15:44:56 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014110615445641-761708 ;
	Thu, 6 Nov 2014 15:44:56 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 6 Nov 2014 15:44:39 -0600
Message-Id: <1415310279-31572-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.1.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/06/2014 03:44:56 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/06/2014 03:44:56 PM,
	Serialize complete at 11/06/2014 03:44:56 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-06_07:2014-11-06, 2014-11-06,
	1970-01-01 signatures=0
Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
	Bill Pittman <bill.pittman@ni.com>
Subject: [PATCH] core-image.bbclass: Add empty-root-password IMAGE_FEATURE
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
X-List-Received-Date: Thu, 06 Nov 2014 21:45:01 -0000

From: Bill Pittman <bill.pittman@ni.com>

In some cases, it may be desirable to build an image that has an empty
root password but that is not built with the full set of development-
specific changes that may be made by 'debug-tweaks' now or in the
future.  An example is a user-programmable embedded target that is
shipped with an empty root password that the customer is expected to
change when the target is configured.

To enable this use case, add an 'empty-root-password' IMAGE_FEATURE that
will allow an empty root password (e.g. not zap it during the image
creation step).

Signed-off-by: Bill Pittman <bill.pittman@ni.com>
Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/classes/core-image.bbclass |  7 +++++--
 meta/classes/image.bbclass      |  4 ++--
 meta/conf/local.conf.sample     | 28 +++++++++++++++-------------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 62363fb..cfced2b 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -27,6 +27,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 # - hwcodecs            - Install hardware acceleration codecs
 # - package-management  - installs package management tools and preserves the package manager database
 # - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
+# - empty-root-password - allows passwordless root logins, but does not enable other debug-tweaks
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
@@ -73,8 +74,10 @@ inherit image
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
-# Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_empty_root_password ; ",d)}'
+# Zap the root password if empty-root-password feature is not enabled
+EMPTY_ROOT_PASSWORD_SUPPORT := '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "empty-root-password", "",d)}'
+IMAGE_FEATURES  += '${EMPTY_ROOT_PASSWORD_SUPPORT}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "", "zap_empty_root_password ; ",d)}'
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fc08653..bc14f89 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password"
 
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
@@ -158,7 +158,7 @@ inherit ${IMAGE_CLASSES}
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "ssh_allow_empty_password; ", "",d)}'
 # Enable postinst logging if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
 # Write manifest
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 6b5250a..a1a828e 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -97,19 +97,21 @@ PACKAGE_CLASSES ?= "package_ipk"
 # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
-#  "dbg-pkgs"       - add -dbg packages for all installed packages
-#                     (adds symbol information for debugging/profiling)
-#  "dev-pkgs"       - add -dev packages for all installed packages
-#                     (useful if you want to develop against libs in the image)
-#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
-#                     (useful if you want to run the package test suites)
-#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-#  "tools-debug"    - add debugging tools (gdb, strace)
-#  "eclipse-debug"  - add Eclipse remote debugging support
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
-#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "dbg-pkgs"              - add -dbg packages for all installed packages
+#                            adds symbol information for debugging/profiling)
+#  "dev-pkgs"              - add -dev packages for all installed packages
+#                            (useful if you want to develop against libs in the image)
+#  "ptest-pkgs"            - add -ptest packages for all ptest-enabled packages
+#                            (useful if you want to run the package test suites)
+#  "tools-sdk"             - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"           - add debugging tools (gdb, strace)
+#  "eclipse-debug"         - add Eclipse remote debugging support
+#  "tools-profile"         - add profiling tools (oprofile, exmap, lttng, valgrind)
+#  "tools-testapps"        - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "debug-tweaks"          - make an image suitable for development
+#                            e.g. ssh root access has a blank password
+#  "empty-root-password"   - allow passwordless root logins, but don't enable
+#                            other debug-tweaks
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
 # We default to enabling the debugging tweaks.
-- 
2.1.3


