Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 91939785D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:52 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341181"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:53 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:22 -0800
Message-Id: <89713a022f58d2b76ab9b08aa8427719706c3198.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 01/13] pypi.bbclass: bring in from meta-python
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
X-List-Received-Date: Thu, 23 Nov 2017 18:14:52 -0000

The pypi.bbclass has usefullness in many meta layers, not
just meta-python. Add it to oe-core for the benefit of
everyone.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/pypi.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/classes/pypi.bbclass

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
new file mode 100644
index 0000000000..e5d7ab3ce1
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
-- 
2.13.6


