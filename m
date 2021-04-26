Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.3122.1619415957258956165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 22:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GORYkod1boL3qn7D2WKs9tkldu3PsCrLwnG0GqIdLOPEksw68bwhpvVG0cLU43B8MUqKLDtQ96
 x6HZQStV31WQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="281613558"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="281613558"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:45:57 -0700
IronPort-SDR: JwAhc8gZT0EntS+bYiItFwnA+sC6QhEHm2UnEVarGG1bqJFGkLJQwObG/hT9wpjmIMQs1RpNaV
 CxC2PstNC5Yg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="385670670"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:45:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/8] cve-update-db-native: skip on empty cpe23Uri
Date: Mon, 26 Apr 2021 13:45:39 +0800
Message-Id: <e9776c55cf251fc884ac3ce4fd6c96769b1d17ff.1619409036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619409036.git.anuj.mittal@intel.com>
References: <cover.1619409036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

Recently an entry in the NVD DB appeared that looks like that
{'vulnerable': True, 'cpe_name': []}.
As besides all the vulnerable flag no data is present we would get
a KeyError exception on acccess.
Use get method on dictionary and return if no meta data is present
Also quit if the length of the array after splitting is less than 6

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00ce2796d97de2bc376b038d0ea7969088791d34)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index b3dc33734d..b073936298 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -138,7 +138,12 @@ def parse_node_and_insert(c, node, cveId):
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 = cpe['cpe23Uri'].split(':')
+            cpe23 = cpe.get('cpe23Uri')
+            if not cpe23:
+                return
+            cpe23 = cpe23.split(':')
+            if len(cpe23) < 6:
+                return
             vendor = cpe23[3]
             product = cpe23[4]
             version = cpe23[5]
-- 
2.30.2

