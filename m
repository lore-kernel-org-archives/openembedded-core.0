Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D4D2B78544
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 20:24:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 12:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,315,1511856000"; d="scan'208";a="164250104"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2018 12:24:09 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:24:04 -0800
Message-Id: <1515097444-25092-6-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
References: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 5/5] openssl-ptest: improve reproducibility
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
X-List-Received-Date: Thu, 04 Jan 2018 20:24:09 -0000

Remove buildhost references from Makefile and Configure.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-connectivity/openssl/openssl10.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 4697755..bd96551 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -261,6 +261,12 @@ do_install_ptest () {
 	for d in ssltest_old v3ext x509aux; do
 		rm -rf ${D}${libdir}/${BPN}/ptest/test/$d
 	done
+
+	# Remove build host references
+	sed -i \
+       -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+       -e 's|${DEBUG_PREFIX_MAP}||g' \
+       ${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
 }
 
 do_install_append_class-native() {
-- 
2.7.4


