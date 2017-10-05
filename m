Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53E60719B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 23:28:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2017 16:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,482,1500966000"; d="scan'208";a="1022180804"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 05 Oct 2017 16:28:22 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 16:28:12 -0700
Message-Id: <1507246092-71662-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bash-ptest: install additional locales
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
X-List-Received-Date: Thu, 05 Oct 2017 23:28:21 -0000

bash-ptest fails several tests. This patch fixes:

FAIL: run-intl

The test used to fail because of missing locales (fr_FR, de_DE)

[YOCTO #12145]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/bash/bash.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index f6cb7e4..f5338c8 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -24,6 +24,8 @@ ALTERNATIVE_PRIORITY = "100"
 RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest_append_libc-glibc += " locale-base-fr-fr locale-base-de-de"
+DEPENDS_ptest_append_libc-glibc += " locale-base-fr-fr locale-base-de-de"
 
 USERADD_PACKAGES = "${PN}-ptest"
 USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
-- 
2.7.4


