Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECC878757
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:59:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 08:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,326,1511856000"; d="scan'208";a="25150519"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2018 08:59:25 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 08:59:18 -0800
Message-Id: <1515344359-82351-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/2] icu-dbg: improve reproducibility
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
X-List-Received-Date: Sun, 07 Jan 2018 16:59:25 -0000

Make sure build host references do not end up being compiled in the image.
This only affects libicutu and icu-dbg.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/icu/icu.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 3fb16b0..5cf7b11 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -38,6 +38,15 @@ do_configure_prepend_libc-musl () {
     sed -i -e 's,DU_HAVE_STRTOD_L=1,DU_HAVE_STRTOD_L=0,' ${S}/configure.ac
 }
 
+do_compile_prepend_class-target () {
+	# Make sure certain build host references do not end up being compiled
+	# in the image. This only affects libicutu and icu-dbg
+	sed  \
+	    -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
+	    -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -i ${B}/tools/toolutil/Makefile
+}
+
 PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install_append_class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
-- 
2.7.4


