Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 313DF77DBC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491565905; x=1523101905;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9eeZp7yY4YvIK6IvhZ9uKON9nGyTvkmSgBzNnfCtJTk=;
	b=tiKtEi8cAvUglMxjYrMg4fLDSUUZNO5vqwayEKI8jnnoYoz4Ytpuvttf
	gppXRfYc74tUThNGAFj5flkBPA42bA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 04:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="85948596"
Received: from cleane-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.237])
	by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2017 04:51:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 14:51:39 +0300
Message-Id: <20170407115141.2564-2-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
References: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/3] build-perf-test-wrapper.sh: support extra args for email script
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
X-List-Received-Date: Fri, 07 Apr 2017 11:51:44 -0000

Make it possible to provide (extra) command line arguments to the
oe-build-perf-test-email script via a new environment variable
OE_BUILD_PERF_REPORT_EMAIL_EXTRA_ARGS.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 49bc298c5b..3da32532be 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -193,7 +193,7 @@ if [ -n "$results_repo" ]; then
         os_name=`get_os_release_var PRETTY_NAME`
         oe-build-perf-report -r "$results_repo" > report.txt
         oe-build-perf-report -r "$results_repo" --html > report.html
-        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text report.txt --html report.html
+        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text report.txt --html report.html "${OE_BUILD_PERF_REPORT_EMAIL_EXTRA_ARGS[@]}"
     fi
 fi
 
-- 
2.12.0


