Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.4461.1585639566423983682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 00:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: Yn/yFUqg0P7oqYQ2rVTTphQu7GHFpKvOD8B/8kSrZWwjZeg5kVPBhLh24T9Sldc1tacx7UFRrK
 gipbsGlzkE4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 00:26:05 -0700
IronPort-SDR: UGnTQAyUc0KMrJ5az75bph2imU/neXsSp/4Mw0ynaEzO+JIPZ+jnNRyepz3mM+Plvg503/wCgR
 NeAH6q9QgQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="272652446"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2020 00:26:04 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: CPE version '-' as all version
Date: Tue, 31 Mar 2020 15:26:03 +0800
Message-Id: <1585639563-13482-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

CPE version could be '-' to mean no version info.
Current cve_check treat it as not valid and does not report these
CVE but some of these could be a valid vulnerabilities.

Since non-valid CVE can be whitelisted, so treat '-' as all version
and report all these CVE to capture possible vulnerabilities.

Non-valid CVE to be whitelisted separately.

[YOCTO #13617]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5d84b93..2a530a0 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -221,7 +221,7 @@ def check_cves(d, patched_cves):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
 
-                if (operator_start == '=' and pv == version_start):
+                if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
                 else:
                     if operator_start:
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 6afe091..497d957 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -135,7 +135,7 @@ def parse_node_and_insert(c, node, cveId):
             product = cpe23[4]
             version = cpe23[5]
 
-            if version != '*':
+            if version != '*' and version != '-':
                 # Version is defined, this is a '=' match
                 yield [cveId, vendor, product, version, '=', '', '']
             else:
-- 
2.7.4

