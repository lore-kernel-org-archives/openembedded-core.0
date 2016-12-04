Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8854571A1A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2016 22:11:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 04 Dec 2016 14:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,301,1477983600"; d="scan'208";a="37030939"
Received: from patejona-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.157.67])
	by orsmga004.jf.intel.com with ESMTP; 04 Dec 2016 14:11:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2016 11:11:44 +1300
Message-Id: <8f4183151be62ae0b19cef9975993af141c17790.1480889477.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1480889477.git.paul.eggleton@linux.intel.com>
References: <cover.1480889477.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1480889477.git.paul.eggleton@linux.intel.com>
References: <cover.1480889477.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] recipetool: fix encoding-related errors creating python recipes
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
X-List-Received-Date: Sun, 04 Dec 2016 22:11:52 -0000

Yet another instance of us expecting a string back from subprocess when
in Python 3 what you get back is bytes. Just decode the output within
run_command() so we avoid this everywhere.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index e41d81a..82a2be1 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -512,7 +512,7 @@ class PythonRecipeHandler(RecipeHandler):
         except (OSError, subprocess.CalledProcessError):
             pass
         else:
-            for line in dep_output.decode('utf-8').splitlines():
+            for line in dep_output.splitlines():
                 line = line.rstrip()
                 dep, filename = line.split('\t', 1)
                 if filename.endswith('/setup.py'):
@@ -591,7 +591,7 @@ class PythonRecipeHandler(RecipeHandler):
         if 'stderr' not in popenargs:
             popenargs['stderr'] = subprocess.STDOUT
         try:
-            return subprocess.check_output(cmd, **popenargs)
+            return subprocess.check_output(cmd, **popenargs).decode('utf-8')
         except OSError as exc:
             logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc)
             raise
-- 
2.5.5


