Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4791E7702D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520348"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:29 +0100
Message-Id: <ab1080ee22c01a5caec0d110abcf199cfc35ec8e.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 15/27] recipetool: create: fix handling of URIs containing #
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:15 -0000

The # character in a URI denotes a fragment; we don't care about this
since it is never supposed to be sent to the server, so remove it from
the URI before actually trying to fetch it or use it in SRC_URI within
the recipe.

(This has come up because download links on pypi.python.org seem to have
a fragment containing the md5sum of the download; without stripping this
off the fetcher will choke on it.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 99d9cc8..409b255 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -23,6 +23,7 @@ import fnmatch
 import re
 import logging
 import scriptutils
+import urlparse
 
 logger = logging.getLogger('recipetool')
 
@@ -102,7 +103,8 @@ def create_recipe(args):
     srcrev = '${AUTOREV}'
     if '://' in args.source:
         # Fetch a URL
-        srcuri = args.source
+        fetchuri = urlparse.urldefrag(args.source)[0]
+        srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
         if res:
@@ -111,7 +113,7 @@ def create_recipe(args):
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         logger.info('Fetching %s...' % srcuri)
-        checksums = scriptutils.fetch_uri(tinfoil.config_data, args.source, srctree, srcrev)
+        checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
         dirlist = os.listdir(srctree)
         if 'git.indirectionsymlink' in dirlist:
             dirlist.remove('git.indirectionsymlink')
-- 
2.1.0


