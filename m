Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47D227404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:09:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2015 14:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="807751777"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2015 14:09:12 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 21:06:50 +0000
Message-Id: <e7d0f62d64ada4a2510df21bd8222d2d49a032ef.1442610380.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1442610380.git.alejandro.hernandez@linux.intel.com>
References: <cover.1442610380.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3-debugger: fix importlib dependency
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
X-List-Received-Date: Fri, 18 Sep 2015 21:09:14 -0000

python3-debugger (pdb) needs importlib as a dependency, if not included
it produces an error when importing pdb, making pdb unusable, this patch
adds importlib dependency fixing the issue.

{YOCT0 #8333]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.4-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.4.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
index 07e1490..f828623 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -58,7 +58,7 @@ RDEPENDS_${PN}-db="${PN}-core"
 FILES_${PN}-db="${libdir}/python3.4/anydbm.* ${libdir}/python3.4/dumbdbm.* ${libdir}/python3.4/whichdb.* ${libdir}/python3.4/dbm ${libdir}/python3.4/lib-dynload/_dbm.*.so "
 
 SUMMARY_${PN}-debugger="Python debugger"
-RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
+RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib"
 FILES_${PN}-debugger="${libdir}/python3.4/bdb.* ${libdir}/python3.4/pdb.* "
 
 SUMMARY_${PN}-dev="Python development package"
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
index 06eecdc..9e9debd 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -238,7 +238,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
 
-    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
+    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib",
     "bdb.* pdb.*" )
 
     m.addPackage( "${PN}-difflib", "Python helpers for computing deltas between objects", "${PN}-lang ${PN}-re",
-- 
1.8.4.5


