Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 067897E559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 23:48:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2019 16:48:11 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga005.jf.intel.com with ESMTP; 07 Jun 2019 16:48:11 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 16:47:51 -0700
Message-Id: <7adf2becf20aa4ef98cadca5fed36553f8e4664d.1559950879.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] python3-scons-{native}: add recipe for v3.0.5
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
X-List-Received-Date: Fri, 07 Jun 2019 23:48:10 -0000
Content-Transfer-Encoding: 8bit

SCons has supported python 3 since v3.0.0
https://scons.org/tag/releases.html

Fix shebangs in scripts

[YOCTO #13381]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 ++
 .../python/python3-scons-native_3.0.5.bb      |  8 +++++
 .../python/python3-scons_3.0.5.bb             | 29 +++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-scons_3.0.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d6f66510e3..6ddf9f5fc7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -604,6 +604,8 @@ RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <derek@asterius.io>"
+RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.como>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Derek Straka <derek@asterius.io>"
diff --git a/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb b/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
new file mode 100644
index 0000000000..5cd5956625
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
@@ -0,0 +1,8 @@
+require python3-scons_${PV}.bb
+inherit native python3native
+DEPENDS = "python3-native"
+RDEPENDS_${PN} = ""
+
+do_install_append() {
+    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
+}
diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
new file mode 100644
index 0000000000..91e4a945e3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Software Construction tool (make/autotools replacement)"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
+SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
+SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
+
+S = "${WORKDIR}/scons-${PV}"
+
+UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit setuptools3
+
+do_install_prepend() {
+    sed -i -e "s:/usr/bin/env python:/usr/bin/env python3:g" ${S}/script/*
+}
+
+RDEPENDS_${PN} = "\
+  python3-core \
+  python3-fcntl \
+  python3-io \
+  python3-json \
+  python3-shell \
+  python3-pickle \
+  python3-pprint \
+  "
-- 
2.20.1


