Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7F70173D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:42:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="721057417"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2015 06:42:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 14:41:59 +0100
Message-Id: <02e02376617dd6e0a1b54443718ddcec569d7dd6.1430314621.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] recipetool: allow specifying SRCREV via rev= in URI
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
X-List-Received-Date: Wed, 29 Apr 2015 13:42:38 -0000

Provide a means to set SRCREV immediately by using rev= in the URI; if
it is specified then it is removed before setting SRC_URI and SRCREV is
set to the same value instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 96062ab..36bd6d9 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -58,13 +58,13 @@ class RecipeHandler():
 
 
 
-def fetch_source(uri, destdir):
+def fetch_source(uri, destdir, srcrev):
     import bb.data
     bb.utils.mkdirhier(destdir)
     localdata = bb.data.createCopy(tinfoil.config_data)
     bb.data.update_data(localdata)
     localdata.setVar('BB_STRICT_CHECKSUM', '')
-    localdata.setVar('SRCREV', '${AUTOREV}')
+    localdata.setVar('SRCREV', srcrev)
     ret = (None, None)
     olddir = os.getcwd()
     try:
@@ -88,6 +88,9 @@ def fetch_source(uri, destdir):
 
 def supports_srcrev(uri):
     localdata = bb.data.createCopy(tinfoil.config_data)
+    # This is a bit sad, but if you don't have this set there can be some
+    # odd interactions with the urldata cache which lead to errors
+    localdata.setVar('SRCREV', '${AUTOREV}')
     bb.data.update_data(localdata)
     fetcher = bb.fetch2.Fetch([uri], localdata)
     urldata = fetcher.ud
@@ -108,13 +111,19 @@ def create_recipe(args):
     checksums = (None, None)
     tempsrc = ''
     srcsubdir = ''
+    srcrev = '${AUTOREV}'
     if '://' in args.source:
         # Fetch a URL
         srcuri = args.source
+        rev_re = re.compile(';rev=([^;]+)')
+        res = rev_re.search(srcuri)
+        if res:
+            srcrev = res.group(1)
+            srcuri = rev_re.sub('', srcuri)
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         logger.info('Fetching %s...' % srcuri)
-        checksums = fetch_source(args.source, srctree)
+        checksums = fetch_source(args.source, srctree, srcrev)
         dirlist = os.listdir(srctree)
         if 'git.indirectionsymlink' in dirlist:
             dirlist.remove('git.indirectionsymlink')
@@ -210,7 +219,7 @@ def create_recipe(args):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
-        lines_before.append('SRCREV = "${AUTOREV}"')
+        lines_before.append('SRCREV = "%s"' % srcrev)
     lines_before.append('')
 
     if srcsubdir and pv:
-- 
2.1.0


