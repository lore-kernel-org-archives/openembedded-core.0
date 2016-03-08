Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 874EF6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:36:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Mar 2016 21:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,555,1449561600"; d="scan'208";a="919077699"
Received: from jlee45-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.131])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2016 21:36:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 18:36:05 +1300
Message-Id: <072703916f6e0a5d54e9683496cc4fbfadd3d122.1457415260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] recipetool: create: check if npm available if npm:// URL specified
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
X-List-Received-Date: Tue, 08 Mar 2016 05:36:51 -0000

If the user specifies an npm:// URL then the fetcher needs npm to be
available to run, so check if it's available early rather than failing
later.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 43c0784..1d48e36 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -355,6 +355,12 @@ def create_recipe(args):
             srcuri = rev_re.sub('', srcuri)
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
+        if fetchuri.startswith('npm://'):
+            # Check if npm is available
+            npm = bb.utils.which(tinfoil.config_data.getVar('PATH', True), 'npm')
+            if not npm:
+                logger.error('npm:// URL requested but npm is not available - you need to either build nodejs-native or install npm using your package manager')
+                sys.exit(1)
         logger.info('Fetching %s...' % srcuri)
         try:
             checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
-- 
2.5.0


