Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 65E576612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462031"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:30 +1300
Message-Id: <9eef6fc54eeef4dfbec86c19c0851fd5d61a0ace.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/11] recipetool: create: determine name/version from github/bitbucket URLs
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:21 -0000

Both BitBucket and GitHub provide "release" downloads that unfortunately
don't include the actual project name. For recipetool this means we have
to have special handling for these URLs or else the current code assumes
the name of the project is something like "v0.9.1". Borrow and adapt
some code from autospec to do this, and put it in its own function for
clarity.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5f90b10..ee27f8d 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -247,6 +247,35 @@ def determine_from_filename(srcfile):
         pv = None
     return (pn, pv)
 
+def determine_from_url(srcuri):
+    """Determine name and version from a URL"""
+    pn = None
+    pv = None
+    parseres = urlparse.urlparse(srcuri.lower())
+    if parseres.path:
+        if 'github.com' in parseres.netloc:
+            res = re.search(r'.*/(.*?)/archive/(.*)-final\.(tar|zip)', parseres.path)
+            if res:
+                pn = res.group(1).strip().replace('_', '-')
+                pv = res.group(2).strip().replace('_', '.')
+            else:
+                res = re.search(r'.*/(.*?)/archive/v?(.*)\.(tar|zip)', parseres.path)
+                if res:
+                    pn = res.group(1).strip().replace('_', '-')
+                    pv = res.group(2).strip().replace('_', '.')
+        elif 'bitbucket.org' in parseres.netloc:
+            res = re.search(r'.*/(.*?)/get/[a-zA-Z_-]*([0-9][0-9a-zA-Z_.]*)\.(tar|zip)', parseres.path)
+            if res:
+                pn = res.group(1).strip().replace('_', '-')
+                pv = res.group(2).strip().replace('_', '.')
+
+        if not pn and not pv:
+            srcfile = os.path.basename(parseres.path.rstrip('/'))
+            pn, pv = determine_from_filename(srcfile)
+
+    logger.debug('Determined from source URL: name = "%s", version = "%s"' % (pn, pv))
+    return (pn, pv)
+
 def supports_srcrev(uri):
     localdata = bb.data.createCopy(tinfoil.config_data)
     # This is a bit sad, but if you don't have this set there can be some
@@ -430,15 +459,12 @@ def create_recipe(args):
         realpv = None
 
     if srcuri and not realpv or not pn:
-        parseres = urlparse.urlparse(srcuri)
-        if parseres.path:
-            srcfile = os.path.basename(parseres.path.rstrip('/'))
-            name_pn, name_pv = determine_from_filename(srcfile)
-            logger.debug('Determined from filename: name = "%s", version = "%s"' % (name_pn, name_pv))
-            if name_pn and not pn:
-                pn = name_pn
-            if name_pv and not realpv:
-                realpv = name_pv
+        name_pn, name_pv = determine_from_url(srcuri)
+        if name_pn and not pn:
+            pn = name_pn
+        if name_pv and not realpv:
+            realpv = name_pv
+
 
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
-- 
2.5.0


