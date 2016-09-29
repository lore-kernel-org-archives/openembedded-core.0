Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4666D60069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040352"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:18 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:06 +0300
Message-Id: <1475159288-31921-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 09/11] scripts/buildstats-diff: use exception for internal error handling
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:17 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index f26a6c1..3c6cb1e 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -30,6 +30,11 @@ logging.basicConfig(level=logging.INFO)
 log = logging.getLogger()
 
 
+class ScriptError(Exception):
+    """Exception for internal error handling of this script"""
+    pass
+
+
 class TimeZone(tzinfo):
     """Simple fixed-offset tzinfo"""
     def __init__(self, seconds, name):
@@ -161,8 +166,7 @@ def read_buildstats_dir(bs_dir):
             log.warning("Multiple buildstats found, using the first one")
         top_dir = subdirs[0]
     else:
-        log.error("No such directory: %s", bs_dir)
-        sys.exit(1)
+        raise ScriptError("No such directory: {}".format(bs_dir))
     log.debug("Reading buildstats directory %s", top_dir)
     subdirs = os.listdir(top_dir)
 
@@ -187,9 +191,8 @@ def read_buildstats_dir(bs_dir):
             recipe_bs['tasks'][task] = read_buildstats_file(
                     os.path.join(recipe_dir, task))
         if name in buildstats:
-            log.error("Cannot handle multiple versions of the same package (%s)",
-                      name)
-            sys.exit(1)
+            raise ScriptError("Cannot handle multiple versions of the same "
+                              "package ({})".format(name))
         buildstats[name] = recipe_bs
 
     return buildstats
@@ -202,9 +205,8 @@ def read_buildstats_json(path):
         bs_json = json.load(fobj)
     for recipe_bs in bs_json:
         if recipe_bs['name'] in buildstats:
-            log.error("Cannot handle multiple versions of the same package (%s)",
-                      recipe_bs['name'])
-            sys.exit(1)
+            raise ScriptError("Cannot handle multiple versions of the same "
+                              "package ({})".format(recipe_bs['name']))
 
         if recipe_bs['epoch'] is None:
             recipe_bs['nevr'] = "{}-{}-{}".format(recipe_bs['name'], recipe_bs['version'], recipe_bs['revision'])
@@ -497,16 +499,18 @@ def main(argv=None):
             sys.exit(1)
         sort_by.append(field)
 
+    try:
+        bs1 = read_buildstats(args.buildstats1)
+        bs2 = read_buildstats(args.buildstats2)
 
-    bs1 = read_buildstats(args.buildstats1)
-    bs2 = read_buildstats(args.buildstats2)
-
-    if args.ver_diff:
-        print_ver_diff(bs1, bs2)
-    else:
-        print_task_diff(bs1, bs2, args.diff_attr, args.min_val,
-                        args.min_absdiff, sort_by)
-
+        if args.ver_diff:
+            print_ver_diff(bs1, bs2)
+        else:
+            print_task_diff(bs1, bs2, args.diff_attr, args.min_val,
+                            args.min_absdiff, sort_by)
+    except ScriptError as err:
+        log.error(str(err))
+        return 1
     return 0
 
 if __name__ == "__main__":
-- 
2.6.6


