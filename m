Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 35B4C783B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494517"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:13 +1200
Message-Id: <8bfdce20a06e094fe7ebfa86293ab4270a637697.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/13] recipetool: create: fix SRCPV prefix for non-git SCMs
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:26 -0000

If you're fetching from an SCM other than git (for example subversion or
mercurial) then we need to use a different prefix for the SRCPV in PV
instead of +git.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4da745b..d8cfcbd 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -423,6 +423,7 @@ def create_recipe(args):
     srcsubdir = ''
     srcrev = '${AUTOREV}'
     srcbranch = ''
+    scheme = ''
     storeTagName = ''
     pv_srcpv = False
 
@@ -682,7 +683,14 @@ def create_recipe(args):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         # Note: we have code to replace realpv further down if it gets set to some other value
-        lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
+        scheme, _, _, _, _, _ = bb.fetch2.decodeurl(srcuri)
+        if scheme in ['git', 'gitsm']:
+            srcpvprefix = 'git'
+        elif scheme == 'svn':
+            srcpvprefix = 'svnr'
+        else:
+            srcpvprefix = scheme
+        lines_before.append('PV = "%s+%s${SRCPV}"' % (realpv or '1.0', srcpvprefix))
         pv_srcpv = True
         if not args.autorev and srcrev == '${AUTOREV}':
             if os.path.exists(os.path.join(srctree, '.git')):
-- 
2.9.5


