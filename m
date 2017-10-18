Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 594EE78302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 23:55:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 16:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,398,1503385200"; d="scan'208";a="1026693491"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 18 Oct 2017 16:55:13 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 16:55:13 -0700
Message-Id: <1508370913-63172-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508370913-63172-1-git-send-email-juro.bystricky@intel.com>
References: <1508370913-63172-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] util-linux-ptest: various fixes
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
X-List-Received-Date: Wed, 18 Oct 2017 23:55:14 -0000

The original code enabled only a sub-set of all available tests.
It also copied executables to be tested into a local folder although
the executables were expected to be already installed in the image.
In addition, the original code copied libtool scripts instead of already
cross-compiled images.

This patch modifies some test scripts so there is no need to copy
images already installed: instead it tests images already installed.
As the executables are scattered in /bin, usr/bin, /sbin/ usr/sbin folders,
we use 'which' to determine the absolute path.
We also copy some cross-compiled tests that were previously missing.

By the virtue of not copying the libtools scripts we also managed
the achieve binary reproducible package, as previously leaked build host
info was contained in libtool scripts, which are not copied anymore.

[YOCTO #10953]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 45 +++++++++++++++++------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5c4694b..f0ffd25 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -304,7 +304,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
@@ -312,23 +312,30 @@ do_compile_ptest() {
 
 do_install_ptest() {
     mkdir -p ${D}${PTEST_PATH}/tests/ts
-    find . -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
-    cp ${S}/tests/functions.sh ${D}${PTEST_PATH}/tests/
-    cp ${S}/tests/commands.sh ${D}${PTEST_PATH}/tests/
-    cp ${S}/tests/run.sh ${D}${PTEST_PATH}/tests/
-    cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
+    find . -name 'test*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
+    find ./.libs -name 'sample*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
+    find ./.libs -name 'test*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
 
-    list="bitops build-sys cal col colrm column dmesg fsck hexdump hwclock ipcs isosize login look md5 misc more namei paths schedutils script swapon"
-    # The following tests are not installed  yet:
-    # blkid scsi_debug module dependent
-    # cramfs gcc dependent
-    # eject gcc dependent
-    # fdisk scsi_debug module and gcc dependent
-    # lscpu gcc dependant
-    # libmount uuidgen dependent
-    # mount gcc dependant
-    # partx blkid dependant
-    for d in $list; do
-        cp -pR ${S}/tests/ts/$d ${D}${PTEST_PATH}/tests/ts/
-    done
+    cp ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
+    cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
+    cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
+    cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
+
+    # The original paths of executables to be tested point to a local folder containing
+    # the executables. We want to test the installed executables, not the local copies.
+    # So strip the paths, the executables will be located via "which"
+    sed  -i \
+         -e '/^TS_CMD/ s|$top_builddir/||g' \
+         -e '/^TS_HELPER/ s|$top_builddir|${PTEST_PATH}|g' \
+         ${D}${PTEST_PATH}/tests/commands.sh
+
+    # Change 'if [ ! -x "$1" ]' to 'if [ ! -x "`which $1 2>/dev/null`"]'
+    sed -i -e \
+        '/^\tif[[:space:]]\[[[:space:]]![[:space:]]-x[[:space:]]"$1"/s|$1|`which $1 2>/dev/null`|g' \
+         ${D}${PTEST_PATH}/tests/functions.sh
+
+    # "kill -L" behaves differently than "/bin/kill -L" so we need an additional fix
+    sed -i -e \
+         '/^TS_CMD_KILL/ s|kill|/bin/kill|g' \
+         ${D}${PTEST_PATH}/tests/commands.sh
 }
-- 
2.7.4


