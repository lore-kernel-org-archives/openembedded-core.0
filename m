Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1BC60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 11:24:17 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 04:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,435,1500966000"; d="scan'208";a="155126796"
Received: from lmazlan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.104])
	by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2017 04:24:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 00:23:35 +1300
Message-Id: <82a4fb8902cdf033251c407a3e192226857d0f0d.1506338334.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1506338334.git.paul.eggleton@linux.intel.com>
References: <cover.1506338334.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes: drop image dependencies on TOPDIR variable
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
X-List-Received-Date: Mon, 25 Sep 2017 11:24:17 -0000

We don't need a dependency on this variable changing, and having one
causes locked signature warnings during eSDK installation if you have
INITRAMFS_IMAGE_* set (since TOPDIR will always be different between
the eSDK and the environment in which it was built).

Relates to [YOCTO #12102].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass     | 2 +-
 meta/classes/qemuboot.bbclass            | 1 +
 meta/classes/rootfs-postcommands.bbclass | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b825b47..e60dca7 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -33,7 +33,7 @@ IMAGE_CMD_wic () {
 	mv "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 	rm -rf "$out/"
 }
-IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
+IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index bd2f01d..7243cc5 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -79,6 +79,7 @@ def qemuboot_vars(d):
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
+do_write_qemuboot_conf[vardepsexclude] += "TOPDIR"
 python do_write_qemuboot_conf() {
     import configparser
 
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index f6d31a0..3755f94 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -307,6 +307,7 @@ python write_image_test_data() {
            os.remove(testdata_link)
         os.symlink(os.path.basename(testdata), testdata_link)
 }
+write_image_test_data[vardepsexclude] += "TOPDIR"
 
 # Check for unsatisfied recommendations (RRECOMMENDS)
 python rootfs_log_check_recommends() {
-- 
2.9.5


