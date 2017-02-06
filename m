Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3BF6093C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:45:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="817761516"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2017 12:45:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:45:42 +1300
Message-Id: <ede21e1bb24714c94f2fe7a97749127a03ccd8fb.1486413875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486413875.git.paul.eggleton@linux.intel.com>
References: <cover.1486413875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] recipetool: create: do not treat numbers in SCM URLs as versions
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
X-List-Received-Date: Mon, 06 Feb 2017 20:45:50 -0000

Numbers within SCM (e.g. git) URLs are extremely unlikely to be valid
version numbers - more likely they are just part of the name, thus don't
try to extract them and use them as the version - doing so causes pretty
bad behaviour within devtool:

--------- snip ---------
$ devtool add https://github.com/inhedron/libtr50
NOTE: Fetching git://github.com/inhedron/libtr50;protocol=https...
...
NOTE: Using default source tree path .../build/workspace/sources/libtr
...
RecursionError: maximum recursion depth exceeded while calling a Python object
--------- snip ---------

(This was because ${PV} was being substituted into the URL, but PV's
value was being set to include ${SRCPV}, so there was a circular
reference.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 0801223..5bd3853 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -336,7 +336,7 @@ def determine_from_url(srcuri):
                 pn = res.group(1).strip().replace('_', '-')
                 pv = res.group(2).strip().replace('_', '.')
 
-        if not pn and not pv:
+        if not pn and not pv and parseres.scheme not in ['git', 'gitsm', 'svn', 'hg']:
             srcfile = os.path.basename(parseres.path.rstrip('/'))
             pn, pv = determine_from_filename(srcfile)
 
@@ -567,7 +567,6 @@ def create_recipe(args):
         if name_pv and not realpv:
             realpv = name_pv
 
-
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
-- 
2.9.3


