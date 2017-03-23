Return-Path: <vedang.patel@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B31D477A26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 01:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490231162; x=1521767162;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Flgzsc/woGkdVt6ELCylIazKPeJQ4liZf4cJR0d/Gi4=;
	b=kCyxRyhS+DImKXkHS+pgg/9VSZPfiIiRMguD3bJkSxO6ZP8YVPIrn5JZ
	TqM49Kqhx2GUkCHLglkRwUDsZEloUg==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 18:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,207,1486454400"; d="scan'208";a="1111245785"
Received: from vpatel-dev2.jf.intel.com ([10.7.159.64])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2017 18:06:00 -0700
From: Vedang Patel <vedang.patel@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 18:05:58 -0700
Message-Id: <1490231158-6151-1-git-send-email-vedang.patel@intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1490225634.15509.40.camel@intel.com>
References: <1490225634.15509.40.camel@intel.com>
Subject: [PATCH v2] libxslt: Add PACKAGECONFIG support for python
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
X-List-Received-Date: Thu, 23 Mar 2017 01:06:00 -0000

Add support to enable python bindings for libxslt using PACKAGECONFIG.
This will include --with-python argument while compiling the package.
The support is disabled by default.

Signed-off-by: Vedang Patel <vedang.patel@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.29.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
index be747e608d9d..1e00306207c5 100644
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
+PACKAGECONFIG[libxslt-python] = "--with-python=${PYTHON_BASE_VERSION}, --without-python"
+
 # older versions of this recipe had ${PN}-utils
 RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
-- 
2.7.3


