Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1143C77BDE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:07:15 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 11:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="139546300"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2017 11:07:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 11:06:57 -0700
Message-Id: <1503166017-3945-6-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
References: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v4 5/5] rootfs-postcommands.bbclass: support binary reproducibility
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
X-List-Received-Date: Sat, 19 Aug 2017 18:07:15 -0000

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
 meta/classes/rootfs-postcommands.bbclass | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e7999d4..fb260f9 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -48,6 +48,7 @@ ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "
 python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
 }
 
 systemd_create_users () {
@@ -248,10 +249,12 @@ python write_image_manifest () {
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
@@ -308,3 +311,22 @@ python write_image_test_data() {
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


