Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2FE7787E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 19:49:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 11:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,405,1505804400"; 
   d="scan'208";a="3105424"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2017 11:49:03 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 11:48:47 -0800
Message-Id: <1510861730-82471-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/4] gnutls: improve reproducibility
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
X-List-Received-Date: Thu, 16 Nov 2017 19:49:03 -0000

Sanitize generated config.h containing build host reference such as:

 #define POSIX_SHELL "<builddir>/tmp/hosttools/bash"

The path for POSIX_SHELL is not only wrong for the cross-compiled target,
it also prevents reproducible build.

Prior the compilation we edit the value to:

 #define POSIX_SHELL "bash"

With this change we can build reproducible libgnutls-bin, libgnutls-dev
and libgnutls-dbg packages.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 29b5dd6..5b45b27 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -53,6 +53,11 @@ do_configure_prepend() {
 	done
 }
 
+do_configure_append_class-target () {
+	# Remove build host references from config.h
+	sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${B}/config.h
+}
+
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
-- 
2.7.4


