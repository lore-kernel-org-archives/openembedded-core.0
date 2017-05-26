Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 548A978305
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887820"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:46 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:46 -0500
Message-Id: <54bef22d0f306bab3ebca11f8eabdb291828a966.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 20/36] classes/test{export, images}: Change modules to list
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
X-List-Received-Date: Fri, 26 May 2017 20:38:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the new filters by <module>.[class].[testname] the modules
arg is expected to be a list so use split into TEST_SUITES variable.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testexport.bbclass | 2 +-
 meta/classes/testimage.bbclass  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 56edda9..d070f07 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -113,7 +113,7 @@ def copy_needed_files(d, tc):
     oe.path.remove(cases_path)
     bb.utils.mkdirhier(cases_path)
     test_paths = get_runtime_paths(d)
-    test_modules = d.getVar('TEST_SUITES')
+    test_modules = d.getVar('TEST_SUITES').split()
     tc.loadTests(test_paths, modules=test_modules)
     for f in getSuiteCasesFiles(tc.suites):
         shutil.copy2(f, cases_path)
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index d42907c..1185593 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -257,7 +257,7 @@ def testimage_main(d):
 
     # Load tests before starting the target
     test_paths = get_runtime_paths(d)
-    test_modules = d.getVar('TEST_SUITES')
+    test_modules = d.getVar('TEST_SUITES').split()
     tc.loadTests(test_paths, modules=test_modules)
 
     if not getSuiteCases(tc.suites):
-- 
2.1.4


