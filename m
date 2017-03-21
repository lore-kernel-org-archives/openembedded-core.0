Return-Path: <vedang.patel@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D76F779C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490056292; x=1521592292;
	h=from:to:cc:subject:date:message-id;
	bh=+4o6Hsc5S3lv1zBT7oFdfdAVMGAoGCTbQsVWO1MpoIU=;
	b=tiNjaX1KevnyseD1Y4kt9vgvB1+zLsGBrrDe/vDxRwxmkga/A4W0DIX7
	8XmMDO0D2jmoD0PA8xc+85AT2nztcQ==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 17:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="69213378"
Received: from vpatel-dev2.jf.intel.com ([10.7.159.64])
	by orsmga004.jf.intel.com with ESMTP; 20 Mar 2017 17:31:31 -0700
From: Vedang Patel <vedang.patel@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:31:26 -0700
Message-Id: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Tue, 21 Mar 2017 00:31:30 -0000

Some options like python bindings, debug support, crypto are hardcoded
inside the recipe. Change that to make those option configurable using
PACKAGECONFIG.

Signed-off-by: Vedang Patel <vedang.patel@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.29.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
index be747e608d9d..d362118aa307 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
 
-inherit autotools pkgconfig binconfig-disabled lib_package
+inherit autotools pkgconfig binconfig-disabled lib_package distutils-common-base
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
@@ -33,7 +33,12 @@ do_configure_prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+PACKAGECONFIG ??= "python libxslt-debug libxslt-mem-debug libxslt-crypto"
+PACKAGECONFIG[libxslt-python] = "--with-python=${PYTHON_BASE_VERSION}, --without-python"
+PACKAGECONFIG[libxslt-debug] = "--with-debug, --without-debug"
+PACKAGECONFIG[libxslt-mem-debug] = "--with-mem-debug, --without-mem-debug"
+PACKAGECONFIG[libxslt-crypto] = "--with-crypto, --without-crypto"
+
 # older versions of this recipe had ${PN}-utils
 RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
-- 
2.7.3


