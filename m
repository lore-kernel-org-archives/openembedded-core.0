Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CD9BC779BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 18:14:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2017 11:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,250,1488873600"; d="scan'208";a="960974569"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga003.jf.intel.com with ESMTP; 25 Apr 2017 11:14:13 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 11:14:08 -0700
Message-Id: <1493144048-12455-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 4/4] rootfs-postcommands.bbclass: support binary reproducibility
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
X-List-Received-Date: Tue, 25 Apr 2017 18:14:23 -0000

Conditionally support binary reproducibility of rootfs images.
If BUILD_REPRODUCIBLE_BINARIES = 1 then:

1. set /etc/timestamp to a reproducible value
2. set /etc/version to a reproducible value

The value for /etc/version is modified in a designated catch-all
post-rootfs function "rootfs_reproducible". This function is expected
to provide additional functionality to improve the determinism based
on future needs

[YOCTO#11176]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 498174a..be1e8dd 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -28,6 +28,8 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
+ROOTFS_POSTPROCESS_COMMAND += 'rootfs_reproducible;'
+
 # Disable DNS lookups, the SSH_DISABLE_DNS_LOOKUP can be overridden to allow
 # distros to choose not to take this change
 SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
@@ -246,7 +248,12 @@ python write_image_manifest () {
 # Can be use to create /etc/timestamp during image construction to give a reasonably
 # sane default time setting
 rootfs_update_timestamp () {
-	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		bbnote " rootfs_update_timestamp: BUILD_REPRODUCIBLE_BINARIES..."
+		git log -1 --pretty=%cd --date=format:%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+	else
+		date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+	fi
 }
 
 # Prevent X from being started
@@ -286,7 +293,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-
 # Generated test data json file
 python write_image_test_data() {
     from oe.data import export2json
@@ -302,3 +308,11 @@ python write_image_test_data() {
        os.remove(testdata_link)
     os.symlink(os.path.basename(testdata), testdata_link)
 }
+
+# Perform any additional adjustments needed to make rootf binary reproducible
+rootfs_reproducible () {
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		bbnote " rootfs_reproducible: set /etc/version..."
+		git log -1 --pretty=%cd --date=format:%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/version
+	fi
+}
-- 
2.7.4


