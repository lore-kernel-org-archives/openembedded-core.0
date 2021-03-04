Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.7392.1614869068912691676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 06:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: z7R5Shh2w8j0Ki5If5FePUSPvMIc2IzWkbcADq1JjozbcxbtZ41tBOmye2SPbxqFUq/R6Ijk/9
 kCATMdeqMNKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="186775387"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="186775387"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 06:44:09 -0800
IronPort-SDR: scv4hZN/tbDEDD24LwOo8khVVKId+IrgxHd7iMlwlnLXCC/QzoieibJsmKJ5czk77usqexitpO
 4exL+UPopXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="445752962"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 04 Mar 2021 06:44:08 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] cve-check: use Version for "=" operator
Date: Thu,  4 Mar 2021 22:44:05 +0800
Message-Id: <20210304144407.66850-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <Chee.Yang.Lee@intel.com>

version string from NVD might not constant all the time, cast them to
Version whenever possible while compare for equal operator.

 CVE-2010-0426
 "cpe23Uri" : "cpe:2.3:a:todd_miller:sudo:1.6.3_p1:*:*:*:*:*:*:*"

 CVE-2010-1646
 "cpe23Uri" : "cpe:2.3:a:todd_miller:sudo:1.6.3p1:*:*:*:*:*:*:*"

Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d..e0c8321e99 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -269,8 +269,15 @@ def check_cves(d, patched_cves):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
 
-                if (operator_start == '=' and pv == version_start) or version_start == '-':
+                if version_start == '-':
+                    # '-' can be any version
                     vulnerable = True
+                elif operator_start == '=':
+                    # it could be unexpected version string which cannot be parse, compare them string to string only in such case
+                    try:
+                        vulnerable = (Version(pv,suffix) == Version(version_start,suffix))
+                    except:
+                        vulnerable = (pv == version_start)
                 else:
                     if operator_start:
                         try:
-- 
2.17.1

