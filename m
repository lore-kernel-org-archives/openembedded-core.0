Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E84877710D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 18:35:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2015 10:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="681579025"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 09 Nov 2015 10:35:09 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 10:23:49 +0000
Message-Id: <d56a69e41e2825948b16cc9718a5ba4947fe575c.1447063562.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447063562.git.mariano.lopez@linux.intel.com>
References: <cover.1447063562.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447063562.git.mariano.lopez@linux.intel.com>
References: <cover.1447063562.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 4/6] license.bbclass: Added get_package_from_deployed
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
X-List-Received-Date: Mon, 09 Nov 2015 18:35:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This function will verify if the dependency is
a package by itself or if the dependency installed
more packages. This is special useful with the kernels
because the dependency could be "linux-yocto" that in
fact installed other packages. This function will be
useful to get the version of the packages.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4e00170..d384491 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -95,6 +95,21 @@ def get_deployed_dependencies(d):
 
     return deploy
 
+def get_package_from_deployed(d, dep):
+    """ Get just one package from a dependency """
+
+    import oe.packagedata
+
+    # Only one package is neccesary to get the version
+    data_file = os.path.join(d.getVar("PKGDATA_DIR",True),
+            "runtime", dep)
+    if os.path.exists(data_file):
+        return dep
+    else:
+        pkg_file = os.path.join(d.getVar("PKGDATA_DIR",True), dep)
+        pkgdata = oe.packagedata.read_pkgdatafile(pkg_file)
+        return pkgdata["PACKAGES"].split()[0]
+
 def get_boot_dependencies(d):
     """ Return the dependencies from boot tasks """
 
-- 
1.8.4.5


