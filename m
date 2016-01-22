Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AFD8060088
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272886"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 01:00:01 +1300
Message-Id: <5e1b4c77a27fc68f32710a1a64628a78a0ba999b.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/14] recipetool: create: better fix for fetch error handling
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:40 -0000

I was a little bit hasty in OE-Core revision
c2cc5abe34169eae92067d97ce1e747e7c1413f5 - it turns out BitBake's
fetcher code is not consistent in whether it logs something useful or
not; when fetching from an http URL it does but with a git repository
it doesn't. In advance of any major reworking of fetch error handling in
BitBake, let's just print the text of the exception and then we know we
have shown something to the user.

Additionally, we were only catching FetchException here but there are
several other classes of exception that the fetcher can raise (e.g.
MalformedUrl); catch the parent BBFetchException class instead so we
avoid tracebacks for those other classes as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f0bb58e..5f90b10 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -299,8 +299,8 @@ def create_recipe(args):
         logger.info('Fetching %s...' % srcuri)
         try:
             checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
-        except bb.fetch2.FetchError:
-            # Error already printed
+        except bb.fetch2.BBFetchException as e:
+            logger.error(str(e).rstrip())
             sys.exit(1)
         dirlist = os.listdir(srctree)
         if 'git.indirectionsymlink' in dirlist:
-- 
2.5.0


