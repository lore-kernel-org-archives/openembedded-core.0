Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD61F73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:30:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Sep 2015 14:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="647788015"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 18 Sep 2015 14:30:15 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 21:27:54 +0000
Message-Id: <5344d28603eaca97bae8ad05183859a00552e1db.1442611314.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1442611314.git.alejandro.hernandez@linux.intel.com>
References: <cover.1442611314.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3-debugger: Adds pkgutils dependency to pdb
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
X-List-Received-Date: Fri, 18 Sep 2015 21:30:15 -0000

python3-debugger fails to be invoked to debug other scripts complaining about
not being able to import pkutil, this patch adds pkgutil as a dependency for python3-debugger
fixing the issue.

[YOCTO #8334]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.4-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.4.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
index f828623..97070b6 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -58,7 +58,7 @@ RDEPENDS_${PN}-db="${PN}-core"
 FILES_${PN}-db="${libdir}/python3.4/anydbm.* ${libdir}/python3.4/dumbdbm.* ${libdir}/python3.4/whichdb.* ${libdir}/python3.4/dbm ${libdir}/python3.4/lib-dynload/_dbm.*.so "
 
 SUMMARY_${PN}-debugger="Python debugger"
-RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib"
+RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib ${PN}-pkgutil"
 FILES_${PN}-debugger="${libdir}/python3.4/bdb.* ${libdir}/python3.4/pdb.* "
 
 SUMMARY_${PN}-dev="Python development package"
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
index 9e9debd..ca2fa61 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -238,7 +238,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
 
-    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib",
+    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib ${PN}-pkgutil",
     "bdb.* pdb.*" )
 
     m.addPackage( "${PN}-difflib", "Python helpers for computing deltas between objects", "${PN}-lang ${PN}-re",
-- 
1.8.4.5


