Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BF8CA78745
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306949"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:45:55 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:18 -0800
Message-Id: <b6aafa468a6e62db3e0e93a46d3bd519e12bc294.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 06/19] pypi.bbclass: bring in from meta-python
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:54 -0000

The pypi.bbclass has usefullness in many meta layers, not
just meta-python. Add it to oe-core for the benefit of
everyone.

Documentation strings for PYPI_PACKAGE, PYPI_PACKAGE_EXT and
PYPI_SRC_URI added to meta/conf/documentation.conf

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/pypi.bbclass    | 26 ++++++++++++++++++++++++++
 meta/conf/documentation.conf |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/classes/pypi.bbclass

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
new file mode 100644
index 00000000000..e5d7ab3ce10
--- /dev/null
+++ b/meta/classes/pypi.bbclass
@@ -0,0 +1,26 @@
+def pypi_package(d):
+    bpn = d.getVar('BPN')
+    if bpn.startswith('python-'):
+        return bpn[7:]
+    elif bpn.startswith('python3-'):
+        return bpn[8:]
+    return bpn
+
+PYPI_PACKAGE ?= "${@pypi_package(d)}"
+PYPI_PACKAGE_EXT ?= "tar.gz"
+
+def pypi_src_uri(d):
+    package = d.getVar('PYPI_PACKAGE')
+    package_ext = d.getVar('PYPI_PACKAGE_EXT')
+    pv = d.getVar('PV')
+    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+
+PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
+
+HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+SECTION = "devel/python"
+SRC_URI += "${PYPI_SRC_URI}"
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
+
+UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index a55e2836b5e..081e726d4b8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -338,6 +338,9 @@ PRIORITY[doc] = "Indicates the importance of a package.  The default value is 'o
 PROVIDES[doc] = "A list of aliases that a recipe also provides. These aliases are useful for satisfying dependencies of other recipes during the build as specified by DEPENDS."
 PRSERV_HOST[doc] = "The network based PR service host and port."
 PV[doc] = "The version of the recipe. The version is normally extracted from the recipe filename."
+PYPI_PACKAGE[doc] = "The python package name to use for fetching from pypi. Default is parsed from the recipe name, but can be overridden if upstream name is different than recipe name."
+PYPI_PACKAGE_EXT[doc] = "The archive file extension to use for fetching from pypi. Default is tar.gz, but can be overridden if upstream uses a different compression scheme."
+PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhosted.org and is constructed from PYPI_PACKAGE, PYPI_PACKAGE_EXT and PV."
 
 #Q
 
-- 
2.13.6


