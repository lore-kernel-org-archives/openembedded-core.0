Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9C471BA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 18:38:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 14 Oct 2016 11:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,346,1473145200"; d="scan'208";a="1053926248"
Received: from shealy-mobl4.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.27.118])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2016 11:38:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 21:38:40 +0300
Message-Id: <20161014183840.18056-1-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] libxml2: Make tests non-executable
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
X-List-Received-Date: Fri, 14 Oct 2016 18:38:46 -0000

The XML W3C conformance test suite contains thousands of xml files all
marked executable. We dutifully try to strip all these files of debug
info in do_package.

"chmod -x" improves build time by ~40 seconds.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Let me know if do_configure_prepend() is not an appropriate place for
a hack like this.

This patch also in:

  git://git.yoctoproject.org/poky-contrib jku/libxml-chmod
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/libxml-chmod



 meta/recipes-core/libxml/libxml2_2.9.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 265d2b7..59874be 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -63,6 +63,11 @@ FILES_${PN}-dev += "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
 FILES_${PN}-utils += "${bindir}/*"
 FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
 
+do_configure_prepend () {
+	# executables take longer to package: these should not be executable
+	find ${WORKDIR}/xmlconf/ -type f -exec chmod -x {} \+
+}
+
 do_install_ptest () {
 	cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
 }
-- 
2.9.3


