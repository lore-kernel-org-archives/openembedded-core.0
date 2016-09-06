Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EA57377502
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:04:05 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042747"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:04:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:25 +1200
Message-Id: <4057cd1ba3160d517d101ffc8706967682731da9.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/9] recipetool: create: fix mapping python dependencies to python-dbg package
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
X-List-Received-Date: Tue, 06 Sep 2016 10:04:06 -0000

When trying to map python module dependencies to the packages that
provide them, if we're looking for .so files that satisfy
dependencies then we need to exclude files found under the .debug
directory, otherwise the dependency will get mapped to the python-dbg
package which isn't correct.

For example, this fixes creating a recipe for pyserial and not getting
python-fcntl in RDEPENDS_${PN}, leading to errors when trying to use the
serial module on the target.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index aff13cf..fb9806d 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -504,8 +504,10 @@ class PythonRecipeHandler(RecipeHandler):
         for dep in scanned_deps:
             mapped = provided_packages.get(dep)
             if mapped:
+                logger.debug('Mapped %s to %s' % (dep, mapped))
                 mapped_deps.add(mapped)
             else:
+                logger.debug('Could not map %s' % dep)
                 unmapped_deps.add(dep)
         return mapped_deps, unmapped_deps
 
@@ -566,6 +568,8 @@ class PythonRecipeHandler(RecipeHandler):
                     continue
 
                 if fn.startswith(dynload_dir + os.sep):
+                    if '/.debug/' in fn:
+                        continue
                     base = os.path.basename(fn)
                     provided = base.split('.', 1)[0]
                     packages[provided] = os.path.basename(pkgdatafile)
-- 
2.5.5


