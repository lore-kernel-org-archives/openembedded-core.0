Return-Path: <brendan.le.foll@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CDD03773A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 15:07:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 25 Feb 2016 07:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="923777860"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2016 07:06:55 -0800
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 15:06:57 +0000
Message-Id: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] npm.bbclass: Add npm class to match fetcher
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
X-List-Received-Date: Thu, 25 Feb 2016 15:07:13 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

npm class supports the npm fetcher, helping doing the basic compile/install
stages of an npm package

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/classes/npm.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/classes/npm.bbclass

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
new file mode 100644
index 0000000..be76056
--- /dev/null
+++ b/meta/classes/npm.bbclass
@@ -0,0 +1,25 @@
+DEPENDS_prepend = "nodejs-native "
+S = "${WORKDIR}/npmpkg"
+
+npm_do_compile() {
+	# changing the home directory to the working directory, the .npmrc will
+	# be created in this directory
+	export HOME=${WORKDIR}
+	npm config set dev false
+	npm set cache ${WORKDIR}/npm_cache
+	# clear cache before every build
+	npm cache clear
+	# Install pkg into ${S} without going to the registry
+	npm --arch=${TARGET_ARCH} --production --no-registry install
+}
+
+npm_do_install() {
+	mkdir -p ${D}${libdir}/node_modules/${PN}/
+	cp -a ${S}/* ${D}${libdir}/node_modules/${PN}/ --no-preserve=ownership
+}
+
+FILES_${PN} += " \
+    ${libdir}/node_modules/${PN} \
+"
+
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.7.1


