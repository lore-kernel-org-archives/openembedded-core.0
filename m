Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 12bt86IYOfAPbkUgTov+ahUI0e03v/EoHyqF4SRoh//OqaBzJ6xG1ShLy6WfXuWED/5h47KUj1
 fYaU9DBCIu5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568897"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568897"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:14 -0700
IronPort-SDR: xcF6KKOsjP7bLR/nPzgAq+xaXmJPO2cjek5eVhUFd91UQm+MlOQZYHqaGHmrBY/cDxbz6vQWhs
 mf/d34SkmV4g==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067583"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 57/64] cve-update-db-native: skip on empty cpe23Uri
Date: Mon, 26 Apr 2021 08:53:28 +0800
Message-Id: <650eaa56b83b5698ad7b95337607959e018ff6c0.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
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
index 25ec6bac71..e5822cee58 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -139,7 +139,12 @@ def parse_node_and_insert(c, node, cveId):
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

