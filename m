Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4251971C1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:18:56 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 08 Dec 2016 08:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496518"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:57 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:43 -0600
Message-Id: <1ba6a6485b10c8ba1b5415a45c3f3e4a7c77f9c3.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 15/30] classes/populate_sdk_base: Add write_sdk_test_data to postprocess
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
X-List-Received-Date: Thu, 08 Dec 2016 16:18:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function will generates testdata.json per SDK type.

[YOCTO #10231]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 220cde6..f0fc089 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -73,6 +73,13 @@ python write_target_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
+python write_sdk_test_data() {
+    from oe.data import export2json
+    testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR', True), d.getVar('TOOLCHAIN_OUTPUTNAME', True))
+    bb.utils.mkdirhier(os.path.dirname(testdata))
+    export2json(d, testdata)
+}
+
 python write_host_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -84,7 +91,7 @@ python write_host_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
-POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; write_sdk_test_data ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
-- 
2.1.4


