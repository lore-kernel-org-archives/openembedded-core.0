Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.4596.1585828137819974945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 04:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: bK1RSesXjPUXnMo2RQI4OArM5siFO6YHOjhtGouiHfI5Whyht/6040YmC6EWfmWbjgjMihNeWj
 lzykTY2yWKNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 04:48:57 -0700
IronPort-SDR: t0ZFDn2LRPLjjYgbUp/VE8uvgDioYZ24+L64U7LWxpXZnce9F6LiGVjPjFxjyGU7k62XsxEqCD
 OT4yfWRNDmyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="238501893"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 02 Apr 2020 04:48:56 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-update-db-native: fix DB file version for '-'
Date: Thu,  2 Apr 2020 19:48:55 +0800
Message-Id: <1585828135-77360-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix logic for CVE DB update so that when the CPE version is '-',
it keeps the version as '-' in the DB file too and leave other
operation as blank.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 497d957..f27ade4 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -138,6 +138,9 @@ def parse_node_and_insert(c, node, cveId):
             if version != '*' and version != '-':
                 # Version is defined, this is a '=' match
                 yield [cveId, vendor, product, version, '=', '', '']
+            elif version == '-':
+                # no version information is available
+                yield [cveId, vendor, product, version, '', '', '']
             else:
                 # Parse start version, end version and operators
                 op_start = ''
-- 
2.7.4

