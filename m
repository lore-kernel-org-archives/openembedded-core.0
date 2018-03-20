Return-Path: <juro.bystricky@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C79ED77CCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 22:36:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 15:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,337,1517904000"; d="scan'208";a="26639136"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga007.jf.intel.com with ESMTP; 20 Mar 2018 15:36:37 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 15:36:36 -0700
Message-Id: <1521585396-40433-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libical-dev_2.0: improve reproducibility
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
X-List-Received-Date: Tue, 20 Mar 2018 22:36:36 -0000

Remove build host references from distributed files.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/libical/libical_2.0.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
index dcc21cc..daa47ab 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -17,3 +17,10 @@ SRC_URI[sha256sum] = "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf2
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
+
+do_install_append_class-target () {
+    # Remove build host references
+    sed -i \
+       -e 's,${STAGING_LIBDIR},${libdir},g' \
+       ${D}${libdir}/cmake/LibIcal/LibIcalTargets-noconfig.cmake
+}
-- 
2.7.4


