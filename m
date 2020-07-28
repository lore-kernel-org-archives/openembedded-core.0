Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.8058.1595926407431632661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: nVCgpBut5I6w9O5jdejeFXETGrmSKqsvkpxIdeF4jGRgpswClTwZrdweh11ed3adeVpRNSDKsk
 fkN1ealjihoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699786"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699786"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:27 -0700
IronPort-SDR: UFW0+o8RYKpurQM1xsd+RjJMJ95mnjxSuwSjC5TGDefhi+9Q7krevbsr+a0EoAvnGRhgmr0EPA
 +g6alsHEwyHQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245975"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 28/32] cve-update: handle baseMetricV2 as optional
Date: Tue, 28 Jul 2020 16:51:29 +0800
Message-Id: <e1c507da9fa5fd12dd42037d0476d94fe3aac730.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
Let the parser handle it as an optional item.
In case use baseMetricV2 before baseMetricV3

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fdcbf3f28289188c5a97664d1421d4a5c4991eda)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index d69d79cb31..0577a5ccac 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -167,15 +167,20 @@ def update_db(c, jsondata):
         if not elt['impact']:
             continue
 
+        accessVector = None
         cveId = elt['cve']['CVE_data_meta']['ID']
         cveDesc = elt['cve']['description']['description_data'][0]['value']
         date = elt['lastModifiedDate']
-        accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
-        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
-
         try:
+            accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+            cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
+        except KeyError:
+            cvssv2 = 0.0
+        try:
+            accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
             cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
-        except:
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
 
         c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-- 
2.25.4

