Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.6573.1603143742162939505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 14:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.43, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: zNOTFOtJVBW+1qzRiQVZnAxW1eidKGFtyRrWyWUOK8h178bZ1nh4FVekSwrpDDEoNZJbi7s7if
 4/hQGCDkXT8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="251805864"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="251805864"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
IronPort-SDR: uJKVAwhu3WO/2Ck2j67y5Uv2TBAWJfdx7IZ7MmMspMURoglASdTN9gO13DxnALRBI35cNzHHtX
 urZpRMcXqnXw==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="358958405"
Received: from rewitt-desk0.jf.intel.com ([10.7.159.148])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
From: "Randy Witt" <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy Witt <randy.e.witt@intel.com>,
	Randy Witt <randy.e.witt@linux.intel.com>
Subject: [PATCH 2/4] numactl: Remove COMPATIBLE_HOST restrictions
Date: Mon, 19 Oct 2020 14:42:12 -0700
Message-Id: <20201019214214.2528690-3-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
References: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Randy Witt <randy.e.witt@intel.com>

Since there may be recipes that depend on libnuma, even though the
hardware doesn't support numa, remove the COMPATIBLE_HOST restrictions.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 20b7fed8624..e45afe9ee86 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -23,9 +23,6 @@ SRC_URI = "git://github.com/numactl/numactl \
 
 S = "${WORKDIR}/git"
 
-# ARM does not currently support NUMA
-COMPATIBLE_HOST = "^((?!arm).*)$"
-
 do_install() {
     oe_runmake DESTDIR=${D} prefix=${D}/usr install
     #remove the empty man2 directory
-- 
2.26.2

