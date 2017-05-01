Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 54AD371DEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 20:59:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 13:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="94327309"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 01 May 2017 13:59:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:59:02 -0700
Message-Id: <1493672344-21965-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2 4/6] rootfs-postcommands.bbclass: support binary reproducibility
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
X-List-Received-Date: Mon, 01 May 2017 20:59:06 -0000

Conditionally support binary reproducibility of rootfs images.
If BUILD_REPRODUCIBLE_BINARIES = 1 then:

1. set /etc/timestamp to a reproducible value
2. set /etc/version to a reproducible value

The reproducible value is taken from the variable REPRODUCIBLE_TIMESTAMP_ROOTFS.
If the variable is not specified, the timestamp value is derived from
the top git commit.

[YOCTO#11176]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 498174a..072b43d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -48,6 +48,7 @@ ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "
 python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
 }
 
 systemd_create_users () {
@@ -243,10 +244,12 @@ python write_image_manifest () {
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
@@ -286,7 +289,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-
 # Generated test data json file
 python write_image_test_data() {
     from oe.data import export2json
@@ -302,3 +304,19 @@ python write_image_test_data() {
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
+	fi
+}
-- 
2.7.4


