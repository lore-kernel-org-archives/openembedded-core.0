Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D48A977BB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365082; x=1521901082;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QH1p144JcPLYlmHlKPyft0zDfq/P32X7T5s6NnaO4Lc=;
	b=Hx2en1HEQqs7SVXv0fmksbgwevB0hVPVGCpMhlCosQATNBPaTbOP2NBg
	CeJ7wfBCWnF+ve0APekmAGNRxn2jkQ==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511868"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:41 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:30 +0200
Message-Id: <1490365050-11776-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 6/6] build-perf-test-wrapper.sh: store buildstats under git-notes
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
X-List-Received-Date: Fri, 24 Mar 2017 14:18:01 -0000

In order to dramatically reduce the data footprint of the result
branches. This makes cloning/pulling result repositories a lot faster.
Buildstats can still be accessed, when needed by doing
git fetch refs/notes/buildstats/*:refs/notes/buildstats/*

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 240d669..234652d 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -143,6 +143,8 @@ if [ -n "$results_repo" ]; then
         --git-dir "$results_repo" \
         --branch-name "{hostname}/{branch}/{machine}" \
         --tag-name "{hostname}/{branch}/{machine}/{commit_count}-g{commit}/{tag_number}" \
+        --exclude "buildstats.json" \
+        --notes "buildstats/{branch_name}" "$results_dir/buildstats.json" \
         "$results_dir"
 fi
 
-- 
2.6.6


