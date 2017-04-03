Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84B7A600EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 13:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491225159; x=1522761159;
	h=from:to:cc:subject:date:message-id;
	bh=VpGuxVlrdU2XNewZMDXHWcPHpGJEV9cmJRsIMU8frG0=;
	b=Ut+XQcgAEqjDeZOeua7uNbFAD93w27EPoMYyy/8orR4zPB/3QZo9PKXh
	nGHdpcctBd/GbvpCXEOTICS/sdPYHQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 06:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,270,1486454400"; d="scan'208";a="1114849422"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2017 06:12:37 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 16:12:25 +0300
Message-Id: <20170403131225.29128-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] libxml2: make dependencies on python conditional
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
X-List-Received-Date: Mon, 03 Apr 2017 13:12:37 -0000

The library libxml2 can provide its own bindings for python2 in addition
to the third party python-lxml and python3-lxml packages if this
functionality is enabled in PACKAGECONFIG.

But in case the functionality is disabled there's no need to depend
on python2.

Make the dependency on python2 enabled only if the python feature
is added to PACKAGECONFIG. Also don't produce the binary
package libxml2-python if it's not needed.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.4.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 023fe99..1c629d1 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -32,9 +32,11 @@ SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c
 
 BINCONFIG = "${bindir}/xml2-config"
 
-inherit autotools pkgconfig binconfig-disabled pythonnative ptest
+inherit autotools pkgconfig binconfig-disabled ptest
 
-RDEPENDS_${PN}-ptest += "python-core"
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'pythonnative', '', d)}
+
+RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-core', '', d)}"
 
 RDEPENDS_${PN}-python += "python-core"
 
@@ -60,7 +62,8 @@ python populate_packages_prepend () {
         d.setVar('PKG_libxml2', '${MLPREFIX}libxml2')
 }
 
-PACKAGES += "${PN}-utils ${PN}-python"
+PACKAGES += "${PN}-utils \
+             ${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES_${PN}-dev += "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
-- 
2.9.3


