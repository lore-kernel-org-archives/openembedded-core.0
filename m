Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3737.1604555571239239546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 21:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: rebecca.swee.fun.chang@intel.com)
IronPort-SDR: IT4Ijkd5MLkuK0LI0eOIEBjvwvtX1C83YCpjgTpojnkBUbr4wQHI+qg6mNkF/hfM9G5L3JCUac
 2vUrDwtkwpiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="254039305"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="254039305"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 21:52:48 -0800
IronPort-SDR: iFBgWTP/BgRxkwq2Gr/J26MfNrnKC15UWcNOZW5dnzJDY0GuCyamoRpk6mLKkzREpqD2l2j5QQ
 J2tvYdFoaPKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="358316319"
Received: from unknown (HELO pg-gsrd-build.png.intel.com) ([10.226.216.131])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2020 21:52:48 -0800
From: "Rebecca Chang Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 3/4] numactl: Skip the ptests when numa is not supported
Date: Thu,  5 Nov 2020 13:39:53 +0000
Message-Id: <20201105133954.144390-3-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>
References: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>

From: Randy Witt <randy.e.witt@intel.com>

When numa is not supported, there is no reason to run the ptests since
they will fail. While the best scenario would be for the upstream tests
to skip themselves when numa is not supported, for now skip them in
run-ptest.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1e498be7904bb9e961653f6d64acb6bbfe0894c)
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../recipes-support/numactl/numactl/run-ptest | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/run-ptest b/meta/recipes-support/numactl/numactl/run-ptest
index 215f7c25b9..bf269da755 100755
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
2.17.1

