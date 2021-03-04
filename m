Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.7382.1614869069523213529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 06:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: p4dYoqIEfAw7dYpeznCsQ91mPx37VJJZATaMw3bhAL1YxDYPPpmH6G2R4mjV1n6j16PoI8wEEW
 Y7facokpGxRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="186775391"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="186775391"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 06:44:10 -0800
IronPort-SDR: ykOGzXnTRNuVRpnNcInlOYs5rNV6aVU0j6dVDvftBx40ZQijnhswXnugLLcuH/A/POfuEBxuXg
 q5Mt9sOWyNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="445752966"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 04 Mar 2021 06:44:09 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] cve-update-db-native: consider version suffix when update CVE db
Date: Thu,  4 Mar 2021 22:44:06 +0800
Message-Id: <20210304144407.66850-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304144407.66850-1-chee.yang.lee@intel.com>
References: <20210304144407.66850-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

some record from NVD can merge or split suffix from version, for
example:
  CVE-2017-15906
  "cpe23Uri" : "cpe:2.3:a:openbsd:openssh:5.0:p1:*:*:*:*:*:*"
  "cpe23Uri" : "cpe:2.3:a:openbsd:openssh:4.7p1:*:*:*:*:*:*:*"

in such case include the suffix into version when update local CVE db.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index cf62e1e32c..b3dc33734d 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -143,9 +143,14 @@ def parse_node_and_insert(c, node, cveId):
             product = cpe23[4]
             version = cpe23[5]
 
+            if cpe23[6] == '*' or cpe23[6] == '-':
+                version_suffix = ""
+            else:
+                version_suffix = "_" + cpe23[6]
+
             if version != '*' and version != '-':
                 # Version is defined, this is a '=' match
-                yield [cveId, vendor, product, version, '=', '', '']
+                yield [cveId, vendor, product, version + version_suffix, '=', '', '']
             elif version == '-':
                 # no version information is available
                 yield [cveId, vendor, product, version, '', '', '']
-- 
2.17.1

