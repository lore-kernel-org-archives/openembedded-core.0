Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D6CA27319A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 20:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978865"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:02:56 +1300
Message-Id: <5d782ef5e3e79e7aa9c296f36a9b5eb1d00daf37.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/26] recipetool: create: avoid traceback on fetch error
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:17 -0000

If a fetch error occurs, the fetcher already prints a reasonable error -
we don't need the traceback as well, so catch that and exit if it
occurs.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7987fbb..f98f525 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -122,7 +122,11 @@ def create_recipe(args):
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         logger.info('Fetching %s...' % srcuri)
-        checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
+        try:
+            checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
+        except bb.fetch2.FetchError:
+            # Error already printed
+            sys.exit(1)
         dirlist = os.listdir(srctree)
         if 'git.indirectionsymlink' in dirlist:
             dirlist.remove('git.indirectionsymlink')
-- 
2.5.0


