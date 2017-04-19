Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDAA71C54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:46:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 12:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="76410979"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2017 12:46:16 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 12:49:03 -0700
Message-Id: <662f8c98f7fd4a5c6117f7cb63e3f04ef8cf357c.1492631156.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492631156.git.brian.avery@intel.com>
References: <cover.1492631156.git.brian.avery@intel.com>
Subject: [PATCH 2/3] rootfs-postcommands.bbclass: save relative paths
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
X-List-Received-Date: Wed, 19 Apr 2017 19:46:15 -0000

We pass the TOPDIR to do a search/replace in export2json so that we save
relative paths in the testdata.json file rather than absolute paths.
This is to allow the images and kernels to be relocated yet still allow
testimage to work.

[YOCTO #11375]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c42829d..498174a 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -132,7 +132,7 @@ zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
 		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
 	fi
-} 
+}
 
 #
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
@@ -243,7 +243,7 @@ python write_image_manifest () {
         os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
-# Can be use to create /etc/timestamp during image construction to give a reasonably 
+# Can be use to create /etc/timestamp during image construction to give a reasonably
 # sane default time setting
 rootfs_update_timestamp () {
 	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
@@ -286,6 +286,7 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
+
 # Generated test data json file
 python write_image_test_data() {
     from oe.data import export2json
@@ -294,7 +295,8 @@ python write_image_test_data() {
     testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
 
     bb.utils.mkdirhier(os.path.dirname(testdata))
-    export2json(d, testdata)
+    searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
+    export2json(d, testdata,searchString=searchString,replaceString="")
 
     if os.path.lexists(testdata_link):
        os.remove(testdata_link)
-- 
1.9.1


