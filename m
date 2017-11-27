Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8011E7807C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423482"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:03 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:06:46 +0200
Message-Id: <0ab11c4b7bd34aad7bd72af6a83afd038c414b39.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 02/16] python3: fix depends of python3-tests
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:02 -0000

Similar to an earlier fix for Python 2.7. Make the tests subpackage
depend on all modules as test.regrtest uses most (if not all) of them.

Some tests also depend on libgcc so add that as a runtime dependency as
well.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0260e87e75..067f6c58c5 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -241,7 +241,7 @@ RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
 FILES_${PN}-terminal="${libdir}/python3.5/pty.* ${libdir}/python3.5/__pycache__/pty.* ${libdir}/python3.5/tty.* ${libdir}/python3.5/__pycache__/tty.* "
 
 SUMMARY_${PN}-tests="Python tests"
-RDEPENDS_${PN}-tests="${PN}-core ${PN}-compression"
+RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules libgcc"
 FILES_${PN}-tests="${libdir}/python3.5/test ${libdir}/python3.5/test/__pycache__ "
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 6352f8f120..1890b91109 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -403,7 +403,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-terminal", "Python terminal controlling support", "${PN}-core ${PN}-io",
     "pty.* tty.*" )
 
-    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-compression",
+    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-modules libgcc",
     "test", True ) # package
 
     m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
-- 
2.13.6


