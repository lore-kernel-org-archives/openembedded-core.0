Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1B8D6D674
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 13:08:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2013 05:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="404450840"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 06 Nov 2013 05:08:03 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 15:07:58 +0200
Message-Id: <0dcafa1bce7a6ae871ee0f6b20eab8834860b334.1383742507.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383742507.git.laurentiu.palcu@intel.com>
References: <cover.1383742507.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383742507.git.laurentiu.palcu@intel.com>
References: <cover.1383742507.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Wed, 06 Nov 2013 13:08:24 -0000

Flex needs m4 to run (see below) and, since the create_wrapper
introduces a bash dependency on target, give the path to m4 binary in
the configure command line.

Snippet from the flex documentation:
"The macro processor m4 must be installed wherever flex is installed.
<...>
m4 is only required at the time you run flex."

[YOCTO #5329]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/flex/flex.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 43f1dda..96d5de5 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -13,6 +13,9 @@ inherit autotools gettext
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
 
+EXTRA_OECONF += "ac_cv_path_M4=${M4}"
+EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
+
 do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
@@ -20,3 +23,5 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
+
+RDEPENDS_${PN} += "m4"
-- 
1.7.9.5


