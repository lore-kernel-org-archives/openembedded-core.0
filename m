Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3957FCD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:40:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:39 -0800
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="201485408"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.245])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 19:39:08 +0800
Message-Id: <3413cd334f70f67eb6befae818b30a82d113c6c3.1574422359.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1574422359.git.anuj.mittal@intel.com>
References: <cover.1574422359.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 09/15] cve-check: neaten get_cve_info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2019 11:40:37 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Remove obsolete Python 2 code, and use convenience methods for neatness.

(From OE-Core rev: f19253cc9e70c974a8e21a142086c13d7cde04ff)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c1cbdbde7b..e95716d9de 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -261,23 +261,15 @@ def check_cves(d, patched_cves):
 def get_cve_info(d, cves):
     """
     Get CVE information from the database.
-
-    Unfortunately the only way to get CVE info is set the output to
-    html (hard to parse) or query directly the database.
     """
 
-    try:
-        import sqlite3
-    except ImportError:
-        from pysqlite2 import dbapi2 as sqlite3
+    import sqlite3
 
     cve_data = {}
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
-    placeholder = ",".join("?" * len(cves))
-    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholder
-    conn = sqlite3.connect(db_file)
-    cur = conn.cursor()
-    for row in cur.execute(query, tuple(cves)):
+    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
+    placeholders = ",".join("?" * len(cves))
+    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholders
+    for row in conn.execute(query, tuple(cves)):
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
         cve_data[row[0]]["scorev2"] = row[2]
-- 
2.21.0


