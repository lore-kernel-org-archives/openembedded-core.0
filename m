Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.9256.1585135797109716687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 04:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: za1QZ9+k2cZzaT5Jt9RDUnaZ6tAN/BT0fh3+uwVRYW7gOvPx6RcwQArs+bPntlUjla+90CFHQH
 lmDc2iVktgYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 04:29:56 -0700
IronPort-SDR: klJ2ubgLvjEO6mRzi8LlLUfVJsJJ9hrIlP36lEVZyMvRCyE0W+2p6JmLxyZhHhbiaafCoY1AuI
 /0Fbq6c2prCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="240589575"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga008.jf.intel.com with ESMTP; 25 Mar 2020 04:29:55 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-update-db-native: prevent fatal error cause by network
Date: Wed, 25 Mar 2020 19:29:54 +0800
Message-Id: <1585135794-17402-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

prevent cve-check from fatal error cause by network issue.

[YOCTO #13680]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 575254a..95a0dfc 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -59,7 +59,13 @@ python do_populate_cve_db() {
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        response = urllib.request.urlopen(meta_url)
+        try:
+            response = urllib.request.urlopen(meta_url)
+        except urllib.error.URLError as e:
+            cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
+            bb.warn("Failed to fetch CVE data (%s)" % e.reason)
+            return
+
         if response:
             for l in response.read().decode("utf-8").splitlines():
                 key, value = l.split(":", 1)
-- 
2.7.4

