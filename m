Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 57F9B60722
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 16:48:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 08 Sep 2016 09:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; d="scan'208";a="876496340"
Received: from fsorel-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.23.35])
	by orsmga003.jf.intel.com with ESMTP; 08 Sep 2016 09:47:49 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 19:47:46 +0300
Message-Id: <1473353266-4786-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oeqa.buildperf: another fix for splitting 'nevr' string
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
X-List-Received-Date: Thu, 08 Sep 2016 16:48:15 -0000

When processing buildstats we determine recipe name, epoch, version and
revision from the per-recipe buildstat directory name.  One previous
patch made an assumption that package version starts with a number.
That might not be true because of a packaging mistake or whatever
reason. Thus, if a version starting with a number is not found, fall
back to the "old" method of just taking the second-last dash-delimited
part (the one before revision).

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 9700c05..2c10255 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -428,6 +428,11 @@ class BuildPerfTestCase(unittest.TestCase):
             n_e_v, revision = nevr.rsplit('-', 1)
             match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[0-9]\S*)$',
                              n_e_v)
+            if not match:
+                # If we're not able to parse a version starting with a number, just
+                # take the part after last dash
+                match = re.match(r'^(?P<name>\S+)-((?P<epoch>[0-9]{1,5})_)?(?P<version>[^-]+)$',
+                                 n_e_v)
             name = match.group('name')
             version = match.group('version')
             epoch = match.group('epoch')
-- 
2.6.6


