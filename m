Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3E93F77D82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490952714; x=1522488714;
	h=from:to:cc:subject:date:message-id;
	bh=902xNJfk2o6PfjgWaSuKYP67LujNKSiXerKh7yl0wN8=;
	b=xnfJXNOwPHTRrIlHgzGAJxonhMZjhqHuU8kcAbStZS9iqoGX0jbgu+o9
	QdJXP6U51EjySXuMZD2rhUiXbwzl5A==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2017 02:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,251,1486454400"; d="scan'208";a="1113952603"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2017 02:31:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 12:31:13 +0300
Message-Id: <20170331093113.9167-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] openssl: add a "openssl10" PROVIDES
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
X-List-Received-Date: Fri, 31 Mar 2017 09:31:52 -0000

In 2.4 development cycle openssl 1.1 will replace openssl 1.0 as the
default openssl version. Openssl 1.0 will stay but will be renamed
to openssl10, and eventually it will be removed (hopefully much
sooner than the official end of support date of Dec 2019, as we do not
want an unsupported openssl version in supported Yocto releases).

There are several recipes that are not API compatible with 1.1; some
of them will eventually be fixed, but others will never be (such as Qt4).
To avoid breaking such recipes when openssl 1.1 is added to oe-core,
let's provide "openssl10" already now and change the recipes to depend
on that where necessary; Qt4 is a particularly pressing issue as it is
causing failures on the autobuilder with my work in progress
openssl 1.1 branch, and so I'm not able to see what else would fail
later in the build process.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 28421dab338..481a4445605 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -37,6 +37,8 @@ FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc"
 RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 
+PROVIDES += "openssl10"
+
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
 # package RRECOMMENDS on this package.  This will enable the configuration
 # file to be installed for both the base openssl package and the libcrypto
-- 
2.11.0


