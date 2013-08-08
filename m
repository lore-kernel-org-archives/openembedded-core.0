Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1813D608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 06:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r786FlaV009631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2013 02:15:47 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 23:15:46 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2013 14:15:59 +0800
Message-ID: <f6ebcbd70720b23fc6c0c95d8554a9395b6495b0.1375941355.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375941355.git.Qi.Chen@windriver.com>
References: <cover.1375941355.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 02/10] use a uniform way to determine whether rootfs is read-only
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
X-List-Received-Date: Thu, 08 Aug 2013 06:15:48 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, we had two ways to check whether the rootfs was read-only.
In some part of the system, we determined whether the rootfs is read-only
by checking the fstab or /proc/mounts; in other part of the system, we
used the value of ROOTFS_READ_ONLY in /etc/default/rcS as a criteria.

Having two ways to check the rootfs is confusing and makes systems inconsistent.

We should drop the use of ROOTFS_READ_ONLY and figure out a uniform and
consistent way to determine whether rootfs is read-only.

This patch fixes this problem by using the following strategy.

On target, we use /proc/mounts to check whether / is read-only; on host, we
use $ROOT_DIR/etc/fstab to check whether the rootfs is going to be mounted
as read-only or not.

[YOCTO #4880]
[YOCTO #4103]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass                         |    4 ---
 .../initscripts/initscripts-1.0/functions          |   14 ++++++++
 .../initscripts-1.0/populate-volatile.sh           |    4 +++
 .../initscripts-1.0/read-only-rootfs-hook.sh       |    4 ++-
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 ---
 meta/recipes-core/udev/udev/init                   |    5 +++
 meta/recipes-core/udev/udev/udev-cache             |    5 +++
 .../0001-add-is_rootfs_readonly-to-functions.patch |   37 ++++++++++++++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |    1 +
 9 files changed, 69 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cf02f88..15fe51a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -259,10 +259,6 @@ read_only_rootfs_hook () {
 	if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 	        # Tweak the mount option and fs_passno for rootfs in fstab
 		sed -i -e '/^[#[:space:]]*rootfs/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
-	        # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
-		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
-			sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
-		fi
 	        # Run populate-volatile.sh at rootfs time to set up basic files
 	        # and directories to support read-only rootfs.
 		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 8e15762..1bab4ba 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -58,3 +58,17 @@ status() {
     fi
     return 3
 }
+
+# Determine whether rootfs is read-only or not according to /proc/mounts or /etc/fstab.
+is_rootfs_readonly () {
+    local DIRNAME=`dirname $0`
+    local ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
+    local criteria_file
+    [ -n "$ROOT_DIR" ] && criteria_file="$ROOT_DIR/etc/fstab" || criteria_file="/proc/mounts"
+    local flag
+    for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < $criteria_file`; do
+	[ "$flag" = "ro" ] && { echo "yes"; return 0; }
+    done
+    echo "no"
+    return 0
+}
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 91c70efb..392879f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -13,8 +13,12 @@ DIRNAME=`dirname $0`
 ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
 
 [ -e ${ROOT_DIR}/etc/default/rcS ] && . ${ROOT_DIR}/etc/default/rcS
+FUNCTIONS_FILE="${ROOT_DIR}`readlink ${ROOT_DIR}/etc/init.d/functions`"
+. $FUNCTIONS_FILE
 # When running populate-volatile.sh at rootfs time, disable cache.
 [ -n "$ROOT_DIR" ] && VOLATILE_ENABLE_CACHE=no
+# Determine whether the rootfs is read-only
+ROOTFS_READ_ONLY=`is_rootfs_readonly`
 # If rootfs is read-only, disable cache.
 [ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
 
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 9cf0921..d523924 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -1,6 +1,8 @@
 #!/bin/sh
 
-. /etc/default/rcS
+. /etc/init.d/functions
+
+ROOTFS_READ_ONLY=`is_rootfs_readonly`
 
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index 709cdf6..3c9dea9 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -23,7 +23,3 @@ FSCKFIX=yes
 #TICKADJ=10000
 # Enable caching in populate-volatile.sh
 VOLATILE_ENABLE_CACHE=yes
-# Indicate whether the rootfs is intended to be read-only or not.
-# Setting ROOTFS_READ_ONLY to yes and rebooting will give you a read-only rootfs.
-# Normally you should not change this value.
-ROOTFS_READ_ONLY=no
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index d90d446..4e5094a 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -79,6 +79,11 @@ case "$1" in
 			    echo "$NEWDATA" > /dev/shm/udev.cache
                     fi
 	    else
+		    # Determine whether the rootfs is read-only or not
+		    ROOTFS_READ_ONLY="no"
+		    for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
+			    [ "$flag" = "ro" ] && ROOTFS_READ_ONLY="yes"
+		    done
 		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index db5a513..862e0e6 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -18,6 +18,11 @@ export TZ=/etc/localtime
 [ -f /etc/default/rcS ] && . /etc/default/rcS
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
+ROOTFS_READ_ONLY="no"
+for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
+    [ "$flag" = "ro" ] && ROOTFS_READ_ONLY="yes"
+done
+
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     [ "$VERBOSE" != "no" ] && echo "udev-cache: read-only rootfs, skip generating udev-cache"
     exit 0
diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch
new file mode 100644
index 0000000..f076b0d
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch
@@ -0,0 +1,37 @@
+From b8e8e7f93aca54561cc1d7945ef3ec7aca5f6f43 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 23 Jul 2013 10:48:32 +0800
+Subject: [PATCH V5 V3] add is_rootfs_readonly to functions
+
+---
+ rc.d/init.d/functions |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
+index a5b2b9e..0663c7f 100644
+--- a/rc.d/init.d/functions
++++ b/rc.d/init.d/functions
+@@ -577,6 +577,20 @@ apply_sysctl() {
+     fi
+ }
+ 
++# Determine whether rootfs is read-only or not according to /proc/mounts or /etc/fstab.
++is_rootfs_readonly () {
++    local DIRNAME=`dirname $0`
++    local ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
++    local criteria_file
++    [ -n "$ROOT_DIR" ] && criteria_file="$ROOT_DIR/etc/fstab" || criteria_file="/proc/mounts"
++    local flag
++    for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < $criteria_file`; do
++	[ "$flag" = "ro" ] && { echo "yes"; return 0; }
++    done
++    echo "no"
++    return 0
++}
++
+ # A sed expression to filter out the files that is_ignored_file recognizes
+ __sed_discard_ignored_files='/\(~\|\.bak\|\.orig\|\.rpmnew\|\.rpmorig\|\.rpmsave\)$/d'
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
index 3011f98..927c9db 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 S="${WORKDIR}/initscripts-${PV}"
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.48.tar.bz2/7dfab81a5a8d3f0dea5ba55e391c26f3/initscripts-9.48.tar.bz2 \
            file://functions.patch \
+           file://0001-add-is_rootfs_readonly-to-functions.patch \
           " 
 
 SRC_URI[md5sum] = "7dfab81a5a8d3f0dea5ba55e391c26f3"
-- 
1.7.9.5


