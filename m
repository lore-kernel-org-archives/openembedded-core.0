Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3A64D7850B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401120"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:18 +1300
Message-Id: <1cc24454e92b2477ce91b347b062804f3c320df8.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 17/24] recipetool: create: show a warning for github archive URLs
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:05 -0000

github archive URLs are not guaranteed to be stable [1] and thus we
should show a warning if a user specifies one to recipetool create (or
devtool add).

[1] http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142519.html

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 055bdef..54e7e85 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -433,6 +433,9 @@ def create_recipe(args):
         source = 'file://%s' % os.path.abspath(source)
 
     if scriptutils.is_src_url(source):
+        # Warn about github archive URLs
+        if re.match('https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
+            logger.warn('github archive files are not guaranteed to be stable and may be re-generated over time. If the latter occurs, the checksums will likely change and the recipe will fail at do_fetch. It is recommended that you point to an actual commit or tag in the repository instead (using the repository URL in conjunction with the -S/--srcrev option).')
         # Fetch a URL
         fetchuri = reformat_git_uri(urldefrag(source)[0])
         if args.binary:
-- 
2.9.5


