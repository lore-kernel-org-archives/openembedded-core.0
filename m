Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.6573.1603143742162939505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 14:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: jK1JNC9I69TNsxQLwIeazH0D8Y34yrXI8Tb8E70FKCjFEW+7IN+oIaiwh2zqEeEhk9sjNWeOR0
 y+UIf+WkDjoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="251805865"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="251805865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
IronPort-SDR: 2/QjtrMO/hLpC1J5p/J6utykUiuOKng9isn0536MKKi7gt7vlzVVZyixyb2y1VgJVqPunEOEBd
 pePyXXje3W3g==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="358958407"
Received: from rewitt-desk0.jf.intel.com ([10.7.159.148])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
From: "Randy Witt" <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy Witt <randy.e.witt@intel.com>,
	Randy Witt <randy.e.witt@linux.intel.com>
Subject: [PATCH 3/4] numactl: Skip the ptests when numa is not supported
Date: Mon, 19 Oct 2020 14:42:13 -0700
Message-Id: <20201019214214.2528690-4-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
References: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Randy Witt <randy.e.witt@intel.com>

When numa is not supported, there is no reason to run the ptests since
they will fail. While the best scenario would be for the upstream tests
to skip themselves when numa is not supported, for now skip them in
run-ptest.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 .../recipes-support/numactl/numactl/run-ptest | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/run-ptest b/meta/recipes-support/numactl/numactl/run-ptest
index 215f7c25b99..bf269da7559 100755
--- a/meta/recipes-support/numactl/numactl/run-ptest
+++ b/meta/recipes-support/numactl/numactl/run-ptest
@@ -1,9 +1,23 @@
 #!/bin/sh
-make regress1
-make regress2
-if  numademo -t -e 10M; then
-	echo "PASS: numademo"
+
+# If there is numa support, run the tests. Otherwise skip all the tests.
+# Ideally the skipping would happen by the upstream tests.
+if ! numactl -s | grep -q "No NUMA support available on this system."; then
+	make regress1
+	make regress2
+	if  numademo -t -e 10M; then
+		echo "PASS: numademo"
+	else
+		echo "FAIL: numademo"
+	fi
 else
-	echo "FAIL: numademo"
+	echo "SKIP: ./../test/bind_range"
+	echo "SKIP: ./../test/checkaffinity"
+	echo "SKIP: ./../test/checktopology"
+	echo "SKIP: ./../test/distance"
+	echo "SKIP: ./../test/nodemap"
+	echo "SKIP: ./../test/tbitmap"
+	echo "SKIP: numactl_regress"
+	echo "SKIP: numademo"
 fi
 
-- 
2.26.2

