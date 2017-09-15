Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DBAC6784DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:54:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792759"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:54:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:51 +0300
Message-Id: <af76aa4e3ee1dc93838cca0e7c5b3400968c6f37.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/7] scripts/oe-build-perf-report: fix handling of --history-length
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
X-List-Received-Date: Fri, 15 Sep 2017 12:54:59 -0000

Don't crash if 'left' revision is older than the range of commits
specified with '--history-length'. In this case the 'left' revision
takes precedence.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 3a76ab621d..defd930b04 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -563,7 +563,7 @@ def main(argv=None):
     xml = is_xml_format(repo, revs[index_r].tags[-1])
 
     if args.html:
-        index_0 = max(0, index_r - args.history_length)
+        index_0 = max(0, min(index_l, index_r - args.history_length))
         rev_range = range(index_0, index_r + 1)
     else:
         # We do not need range of commits for text report (no graphs)
-- 
2.12.3


