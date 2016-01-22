Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 04C9C6FF01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272783"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:56 +1300
Message-Id: <aadc6046cd8618cf16be97004d3e8df5d5c84bb8.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/14] gen-lockedsig-cache: copy correct native sstate into ext SDK
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:28 -0000

When constructing the sstate-cache directory for the extensible SDK,
we were copying in any matching native sstate packages, and as the
signature doesn't actually change when the distro changes (since
NATIVELSBSTRING is just a path separator for the artifacts and is not
part of the signature) we ended up copying duplicated packages when the
distro changed e.g. upon host distro upgrade. Only search in the
NATIVELSBSTRING-named subdirectory for native packages and the issue
goes away.

Fixes [YOCTO #8885].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 5 +++--
 scripts/gen-lockedsig-cache     | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 6475510..fb51b51 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -149,8 +149,9 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
 def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring=""):
     bb.note('Generating sstate-cache...')
 
-    bb.process.run("gen-lockedsig-cache %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache))
+    nativelsbstring = d.getVar('NATIVELSBSTRING', True)
+    bb.process.run("gen-lockedsig-cache %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring))
     if fixedlsbstring:
-        nativedir = output_sstate_cache + '/' + d.getVar('NATIVELSBSTRING', True)
+        nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
             os.rename(nativedir, output_sstate_cache + '/' + fixedlsbstring)
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 9c16506..a4e9ded 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -13,9 +13,9 @@ def mkdir(d):
         if e.errno != errno.EEXIST:
             raise e
 
-if len(sys.argv) < 3:
+if len(sys.argv) < 5:
     print("Incorrect number of arguments specified")
-    print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir>")
+    print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir> <nativelsbstring>")
     sys.exit(1)
 
 print('Reading %s' % sys.argv[1])
@@ -30,7 +30,7 @@ files = set()
 for s in sigs:
     p = sys.argv[2] + "/" + s[:2] + "/*" + s + "*"
     files |= set(glob.glob(p))
-    p = sys.argv[2] + "/*/" + s[:2] + "/*" + s + "*"
+    p = sys.argv[2] + "/%s/" % sys.argv[4] + s[:2] + "/*" + s + "*"
     files |= set(glob.glob(p))
 
 print('Processing files')
-- 
2.5.0


