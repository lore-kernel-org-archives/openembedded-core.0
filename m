Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E76556D160
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 14:58:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Nov 2013 06:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="384922764"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 05 Nov 2013 06:58:08 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 16:58:05 +0200
Message-Id: <f61f1d9fc224cc017996769e23b08d0af13f3722.1383663447.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383663447.git.laurentiu.palcu@intel.com>
References: <cover.1383663447.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383663447.git.laurentiu.palcu@intel.com>
References: <cover.1383663447.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Tue, 05 Nov 2013 14:58:09 -0000

Flex needs m4 to run (see below) and, since the create_wrapper
introduces a bash dependency, export the right m4 path when /etc/profile
is sourced by the shell.

Snippet from the flex documentation:
"The macro processor m4 must be installed wherever flex is installed.
<...>
m4 is only required at the time you run flex."

[YOCTO #5329]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/flex/flex.inc |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 43f1dda..eed2908 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -13,6 +13,11 @@ inherit autotools gettext
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
 
+do_install_append_class-target() {
+	install -d ${D}${sysconfdir}/profile.d
+	echo "export M4=${M4}" > ${D}${sysconfdir}/profile.d/flex.sh
+}
+
 do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
@@ -20,3 +25,5 @@ do_install_append_class-native() {
 do_install_append_class-nativesdk() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
 }
+
+RDEPENDS_${PN} += "m4"
-- 
1.7.9.5


