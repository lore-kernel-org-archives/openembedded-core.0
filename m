Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 65DD27EADB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:24:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="157502508"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga008.jf.intel.com with ESMTP; 01 Jul 2019 21:24:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:23:59 +1200
Message-Id: <d08a9825c7632ce886ec1749bdbb73beb54eab3f.1562041417.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562041417.git.paul.eggleton@linux.intel.com>
References: <cover.1562041417.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] recipetool: ignore zero-length setup.py files
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
X-List-Received-Date: Tue, 02 Jul 2019 04:24:31 -0000
Content-Transfer-Encoding: 8bit

If a setup.py file exists it ought to have something in it before we
consider the source tree to be a Python module and treating it as such.
(A counter-example is https://www.bro.org/downloads/binpac-0.50.tar.gz -
it's not clear why this has a zero-length setup.py in it but we should
pay no attention to it.)

Fixes [YOCTO #12923].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index ac9bc9237ce..adfa3779561 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -154,8 +154,13 @@ class PythonRecipeHandler(RecipeHandler):
         if 'buildsystem' in handled:
             return False
 
-        if not RecipeHandler.checkfiles(srctree, ['setup.py']):
-            return
+        # Check for non-zero size setup.py files
+        setupfiles = RecipeHandler.checkfiles(srctree, ['setup.py'])
+        for fn in setupfiles:
+            if os.path.getsize(fn):
+                break
+        else:
+            return False
 
         # setup.py is always parsed to get at certain required information, such as
         # distutils vs setuptools
-- 
2.20.1


