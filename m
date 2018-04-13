Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7B4747D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 22:47:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 15:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="43179889"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2018 15:47:27 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 15:47:44 -0700
Message-Id: <1523659664-39532-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v5] rootfs-postcommands.bbclass: improve binary reproducibility
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
X-List-Received-Date: Fri, 13 Apr 2018 22:47:28 -0000

Conditionally support binary reproducibility of rootfs images.
If REPRODUCIBLE_TIMESTAMP_ROOTFS is specified then:

1. set /etc/timestamp to a reproducible value
2. set /etc/version to a reproducible value
3. set /etc/gconf: set mtime in all %gconf.xml to reproducible values

The reproducible value is taken from the variable REPRODUCIBLE_TIMESTAMP_ROOTFS.

[YOCTO #11176]
[YOCTO #12422]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a4e627f..5522209 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -56,6 +56,7 @@ ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 SORT_PASSWD_POSTPROCESS_COMMAND ??= " sort_passwd; "
 python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
+    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
 }
 
 systemd_create_users () {
@@ -256,10 +257,17 @@ python write_image_manifest () {
         os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
-# Can be use to create /etc/timestamp during image construction to give a reasonably
+# Can be used to create /etc/timestamp during image construction to give a reasonably
 # sane default time setting
 rootfs_update_timestamp () {
-	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
+		# Convert UTC into %4Y%2m%2d%2H%2M%2S
+		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
+	else
+		sformatted=`date -u +%4Y%2m%2d%2H%2M%2S`
+	fi
+	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
+	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
 }
 
 # Prevent X from being started
@@ -328,3 +336,16 @@ python rootfs_log_check_recommends() {
             if 'unsatisfied recommendation for' in line:
                 bb.warn('[log_check] %s: %s' % (d.getVar('PN'), line))
 }
+
+# Perform any additional adjustments needed to make rootf binary reproducible
+rootfs_reproducible () {
+	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
+		# Convert UTC into %4Y%2m%2d%2H%2M%2S
+		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
+		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
+		bbnote "rootfs_reproducible: set /etc/version to $sformatted"
+
+		find ${IMAGE_ROOTFS}/etc/gconf -name '%gconf.xml' -print0 | xargs -0r \
+		sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
+	fi
+}
-- 
2.7.4


