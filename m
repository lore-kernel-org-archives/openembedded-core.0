Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 27CD077DB2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 11:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491565907; x=1523101907;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oRFQgQKJeOExvbWI5gK2KMzQg8o6jA7fb4H01PQc8Lo=;
	b=bgztoZasuy10v0dMOSj5BFbX6Bo5wDQJqF6BCdKJBreh1e6oJXewVm49
	waI8J6NMytpJITX55dfZlKwgKg0OHg==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 04:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="85948626"
Received: from cleane-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.237])
	by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2017 04:51:46 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 14:51:41 +0300
Message-Id: <20170407115141.2564-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
References: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] scripts/oe-build-perf-report: improve guessing of args
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
X-List-Received-Date: Fri, 07 Apr 2017 11:51:45 -0000

Search remote branches, too, when finding the latest commit.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 6f2db49d5c..ced5ff2e12 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -380,7 +380,7 @@ def auto_args(repo, args):
     """Guess arguments, if not defined by the user"""
     # Get the latest commit in the repo
     log.debug("Guessing arguments from the latest commit")
-    msg = repo.run_cmd(['log', '-1', '--branches', '--format=%b'])
+    msg = repo.run_cmd(['log', '-1', '--branches', '--remotes', '--format=%b'])
     for line in msg.splitlines():
         split = line.split(':', 1)
         if len(split) != 2:
-- 
2.12.0


