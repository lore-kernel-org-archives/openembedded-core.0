Return-Path: <vedang.patel@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C8C76719B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 00:00:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 23 Mar 2017 17:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,212,1486454400"; d="scan'208";a="64331131"
Received: from vpatel-dev2.jf.intel.com ([10.7.159.64])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2017 17:00:51 -0700
From: Vedang Patel <vedang.patel@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 17:00:49 -0700
Message-Id: <1490313649-32458-1-git-send-email-vedang.patel@intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1490306205.12818.5.camel@intel.com>
References: <1490306205.12818.5.camel@intel.com>
Subject: [PATCH] libxslt: Add PACKAGECONFIG support for python
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
X-List-Received-Date: Fri, 24 Mar 2017 00:00:52 -0000

Add support to enable python bindings for libxslt using PACKAGECONFIG.
This will include --with-python argument while compiling the package.
The support is disabled by default.

Signed-off-by: Vedang Patel <vedang.patel@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.29.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
index be747e608d9d..707f2f97b7fc 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
 
-inherit autotools pkgconfig binconfig-disabled lib_package
+inherit autotools pkgconfig binconfig-disabled lib_package distutils-common-base
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
@@ -33,7 +33,9 @@ do_configure_prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+EXTRA_OECONF = "--without-debug --without-mem-debug --without-crypto"
+PACKAGECONFIG[python] = "--with-python=${PYTHON_BASE_VERSION}, --without-python"
+
 # older versions of this recipe had ${PN}-utils
 RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
-- 
2.7.3


