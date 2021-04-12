Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: qfC5KlITeatA4XF87rNuJZv+eDLdVtGeQxusHrvNEIlQwCpbhBYBGUgtARn1x5R44+iWI0rolh
 kwWANt26IzXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467901"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467901"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:44 -0700
IronPort-SDR: ue6CPFZnB1Q5zjggoITx4T/CDxHpYng94KTBdJ3byWADcn3Kecw+dvWpaRh0q3GduvR+nDTyq1
 EhAFtzthgDGw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809082"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:43 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/18] cve-update-db-native: consider version suffix when update CVE db
Date: Mon, 12 Apr 2021 17:08:15 +0800
Message-Id: <ecb41c87695c483959e2d96fcb6ca7cd92fd7315.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

some record from NVD can merge or split suffix from version, for
example:
  CVE-2017-15906
  "cpe23Uri" : "cpe:2.3:a:openbsd:openssh:5.0:p1:*:*:*:*:*:*"
  "cpe23Uri" : "cpe:2.3:a:openbsd:openssh:4.7p1:*:*:*:*:*:*:*"

in such case include the suffix into version when update local CVE db.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13cc68197f81bb7c76fa1abecc5dd720b8bdb8d5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

