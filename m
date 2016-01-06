Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB56731F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594425"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:50 +1300
Message-Id: <4174f572f337f73fe40fbf800960e273166459e7.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/14] recipetool: create: support creating standalone native/nativesdk recipes
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:02 -0000

If the recipe name ends with -native then we should inherit native;
likewise if it starts with nativesdk- then inherit nativesdk.

(Note that the recipe name must actually be specified by the user in
order to trigger this - we won't do it based on any name auto-detected
from e.g. the tarball name.)

Since we're doing this based on the name, "devtool add" will also gain
this functionality automatically.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f342857..775be42 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -232,6 +232,8 @@ def create_recipe(args):
     lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
     lines_before.append('')
 
+    classes = []
+
     # FIXME This is kind of a hack, we probably ought to be using bitbake to do this
     pn = None
     pv = None
@@ -249,6 +251,10 @@ def create_recipe(args):
 
     if args.name:
         pn = args.name
+        if args.name.endswith('-native'):
+            classes.append('native')
+        elif args.name.startswith('nativesdk-'):
+            classes.append('nativesdk')
 
     if pv and pv not in 'git svn hg'.split():
         realpv = pv
@@ -312,7 +318,6 @@ def create_recipe(args):
     handlers = [item[0] for item in handlers]
 
     # Apply the handlers
-    classes = []
     handled = []
 
     if args.binary:
-- 
2.5.0


