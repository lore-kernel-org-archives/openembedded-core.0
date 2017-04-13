Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 483D571D4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:34:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 01:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="73542421"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by orsmga002.jf.intel.com with ESMTP; 13 Apr 2017 01:34:30 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 11:33:44 +0300
Message-Id: <20170413083344.22737-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] python: make python2 and python3 alternatives to python
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
X-List-Received-Date: Thu, 13 Apr 2017 08:34:32 -0000

If only python3 is installed on an image nothing provides
/usr/bin/python even though many scripts compatible with
both python2 and python3 just state `#!/usr/bin/env python`
in their shebang line.

Make python and python3 recipes provide alternatives for
/usr/bin/python and /usr/bin/python-config. By default
python2 has higher priority over python3.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta/recipes-devtools/python/python3_3.5.2.bb | 9 +++++++++
 meta/recipes-devtools/python/python_2.7.13.bb | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 2ff7c9e..310d43f 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -221,4 +221,13 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_${PN}-core = "python python_config"
+ALTERNATIVE_LINK_NAME[python] = "${bindir}/python"
+ALTERNATIVE_LINK_NAME[python_config] = "${bindir}/python-config"
+ALTERNATIVE_TARGET[python] = "${bindir}/python3"
+ALTERNATIVE_TARGET[python_config] = "${bindir}/python3-config"
+
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 4ef9952..0cf7498 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -168,4 +168,11 @@ do_install_ptest() {
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN}-core = "python python_config"
+ALTERNATIVE_LINK_NAME[python] = "${bindir}/python"
+ALTERNATIVE_LINK_NAME[python_config] = "${bindir}/python-config"
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.9.3


