Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F020572F18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 08:09:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 04 Apr 2017 01:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="951480392"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2017 01:09:39 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 214B66A4006;
	Tue,  4 Apr 2017 01:09:30 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 11:09:29 +0300
Message-Id: <1491293369-7857-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] net-tools: Fix build with USE_NLS="no"
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
X-List-Received-Date: Tue, 04 Apr 2017 08:09:39 -0000

The configuration change was already done for -native but
we really want it when USE_NLS is set.

Fixes [YOCTO #11285].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 115b398..45d7bf4 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -70,21 +70,15 @@ python do_patch() {
     bb.build.exec_func('patch_do_patch', d)
 }
 
-# i18n only enabled for the target, doesn't build for native
-# and isn't needed there.
-disable_i18n() {
-	sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
-}
-disable_i18n_class-target () {
-	:
-}
-
 do_configure() {
 	# net-tools has its own config mechanism requiring "make config"
 	# we pre-generate desired options and copy to source directory instead
 	cp ${WORKDIR}/net-tools-config.h    ${S}/config.h
 	cp ${WORKDIR}/net-tools-config.make ${S}/config.make
-	disable_i18n
+
+	if [ "${USE_NLS}" = "no" ]; then
+		sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
+	fi
 }
 
 do_compile() {
-- 
2.1.4


