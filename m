Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 48CA06FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:59:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2016 12:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,332,1455004800"; d="scan'208";a="909365483"
Received: from jschew-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.99])
	by orsmga001.jf.intel.com with ESMTP; 13 Mar 2016 12:59:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 08:59:03 +1300
Message-Id: <b6fd81017bc104a88bfb87a9e1567386e5514ab8.1457899086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457899086.git.paul.eggleton@linux.intel.com>
References: <cover.1457899086.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457899086.git.paul.eggleton@linux.intel.com>
References: <cover.1457899086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] recipetool: create: don't create extra files directory unconditionally
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
X-List-Received-Date: Sun, 13 Mar 2016 19:59:32 -0000

The extra directory next to the recipe should only be created if there
are files to put into it; currently only the npm plugin does this. I
didn't notice the issue earlier because the test was actually able to
succeed under these circumstances if the recipe file came first in the
directory listing, which was a fault in my original oe-selftest test;
apparently on some YP autobuilder machines the order came out reversed.

With this change we can put the oe-selftest test that highlighted the
issue back to the way it was, with an extra check to reinforce that only
a single file should be created.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py |  6 ++++--
 scripts/lib/recipetool/create.py     | 15 ++++++++-------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 72ee110..a04ee87 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -410,9 +410,11 @@ class RecipetoolTests(RecipetoolBase):
         srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
         result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
         dirlist = os.listdir(temprecipe)
-        if len(dirlist) < 1 or not os.path.isfile(os.path.join(temprecipe, 'socat_%s.bb' % pv)):
+        if len(dirlist) > 1:
+            self.fail('recipetool created more than just one file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
+        if len(dirlist) < 1 or not os.path.isfile(os.path.join(temprecipe, dirlist[0])):
             self.fail('recipetool did not create recipe file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
-        self.assertIn('socat_%s.bb' % pv, dirlist, 'Recipe file incorrectly named')
+        self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['LICENSE'] = set(['Unknown', 'GPLv2'])
         checkvars['LIC_FILES_CHKSUM'] = set(['file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4', 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'])
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1649e40..bb9fb9b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -604,13 +604,14 @@ def create_recipe(args):
                 sys.exit(1)
 
     # Move any extra files the plugins created to a directory next to the recipe
-    if outfile == '-':
-        extraoutdir = pn
-    else:
-        extraoutdir = os.path.join(os.path.dirname(outfile), pn)
-    bb.utils.mkdirhier(extraoutdir)
-    for destfn, extrafile in extrafiles.iteritems():
-        shutil.move(extrafile, os.path.join(extraoutdir, destfn))
+    if extrafiles:
+        if outfile == '-':
+            extraoutdir = pn
+        else:
+            extraoutdir = os.path.join(os.path.dirname(outfile), pn)
+        bb.utils.mkdirhier(extraoutdir)
+        for destfn, extrafile in extrafiles.iteritems():
+            shutil.move(extrafile, os.path.join(extraoutdir, destfn))
 
     lines = lines_before
     lines_before = []
-- 
2.5.0


