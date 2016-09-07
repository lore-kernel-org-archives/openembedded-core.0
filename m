Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3408F77717
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 07:28:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 07 Sep 2016 00:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,295,1470726000"; d="scan'208";a="757913277"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2016 00:28:48 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 10:28:45 +0300
Message-Id: <1473233326-16830-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1473233326-16830-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1473233326-16830-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] oeqa.buildperf: try harder when splitting 'nevr' string
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
X-List-Received-Date: Wed, 07 Sep 2016 07:28:53 -0000

Try to be more intelligent when splitting out recipe name, epoch,
version and revision from the buildstat directory name. Previous
assumption was that package versions never contain a dash but obviously
that is not necessarily true. The new assumption is that the package
version starts with a number.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 2325cd1..7dfb2bf 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -425,8 +425,10 @@ class BuildPerfTestCase(unittest.TestCase):
         """Save buildstats"""
         def split_nevr(nevr):
             """Split name and version information from recipe "nevr" string"""
-            name, e_v, revision = nevr.rsplit('-', 2)
-            match = re.match(r'^((?P<epoch>[0-9]{1,5})_)?(?P<version>.*)$', e_v)
+            n_e_v, revision = nevr.rsplit('-', 1)
+            match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[0-9]\S*)$',
+                             n_e_v)
+            name = match.group('name')
             version = match.group('version')
             epoch = match.group('epoch')
             return name, epoch, version, revision
-- 
2.6.6


