Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3F477D9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 10:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337359"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:25 -0700
Message-Id: <1502300913-40295-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 03/11] rootfs-postcommands.bbclass: support binary reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:03 -0000

Conditionally support binary reproducibility of rootfs images.
If BUILD_REPRODUCIBLE_BINARIES = 1 then:

1. set /etc/timestamp to a reproducible value
2. set /etc/version to a reproducible value
3. set /etc/gconf: set mtime in all %gconf.xml to reproducible values

The reproducible value is taken from the variable REPRODUCIBLE_TIMESTAMP_ROOTFS.
If the variable is not specified, the timestamp value is derived from
the top git commit.

[YOCTO#11176]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 78f7c55..46cb530 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -48,6 +48,7 @@ ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "
 python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
 }
 
 systemd_create_users () {
@@ -245,10 +246,12 @@ python write_image_manifest () {
         os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
-# Can be use to create /etc/timestamp during image construction to give a reasonably
+# Can be used to create /etc/timestamp during image construction to give a reasonably
 # sane default time setting
 rootfs_update_timestamp () {
-	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "0" ]; then
+		date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+	fi
 }
 
 # Prevent X from being started
@@ -288,7 +291,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-
 # Generated test data json file
 python write_image_test_data() {
     from oe.data import export2json
@@ -304,3 +306,22 @@ python write_image_test_data() {
        os.remove(testdata_link)
     os.symlink(os.path.basename(testdata), testdata_link)
 }
+
+# Perform any additional adjustments needed to make rootf binary reproducible
+rootfs_reproducible () {
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+			REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1 --pretty=%ct`
+		fi
+
+		# Convert UTC into %4Y%2m%2d%2H%2M%2S
+		sformatted=`date -u -d @$REPRODUCIBLE_TIMESTAMP_ROOTFS +%4Y%2m%2d%2H%2M%2S`
+		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
+		bbnote "rootfs_reproducible: set /etc/version to $sformatted"
+		echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
+		bbnote "rootfs_reproducible: set /etc/timestamp to $sformatted"
+
+		find ${IMAGE_ROOTFS}/etc/gconf -name '%gconf.xml' -print0 | xargs -0r \
+		sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'$REPRODUCIBLE_TIMESTAMP_ROOTFS'"@g'
+	fi
+}
-- 
2.7.4


