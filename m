Return-Path: <niko.mauno@iki.fi>
Received: from tulikuusama2.dnainternet.net (tulikuusama3.dnainternet.net
	[83.102.40.155])
	by mail.openembedded.org (Postfix) with ESMTP id A58DF7F33D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 18:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 7E31229573;
	Sun,  8 Dec 2019 20:41:36 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from tulikuusama2.dnainternet.net ([83.102.40.155])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id FiXClqNnx9Bi; Sun,  8 Dec 2019 20:41:36 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 0A84C2940F;
	Sun,  8 Dec 2019 20:41:36 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 313F674;
	Sun,  8 Dec 2019 20:41:30 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 20:35:57 +0200
Message-Id: <20191208183557.32589-11-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191208183557.32589-1-niko.mauno@iki.fi>
References: <20191208183557.32589-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [thud-next][PATCH 11/11] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Sun, 08 Dec 2019 18:41:35 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

This code used to construct a single SQL statement that fetched the NVD data for
every CVE requested.  For recipes such as the kernel where there are over 2000
CVEs to report this can hit the variable count limit and the query fails with
"sqlite3.OperationalError: too many SQL variables".  The default limit is 999
variables, but some distributions such as Debian set the default to 250000.

As the NVD table has an index on the ID column, whilst requesting the data
CVE-by-CVE is five times slower when working with 2000 CVEs the absolute time
different is insignificant: 0.05s verses 0.01s on my machine.

(From OE-Core rev: 53d0cc1e9b7190fa66d7ff1c59518f91b0128d99)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e95716d9de..19ed5548b3 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -267,17 +267,17 @@ def get_cve_info(d, cves):
 
     cve_data = {}
     conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
-    placeholders = ",".join("?" * len(cves))
-    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholders
-    for row in conn.execute(query, tuple(cves)):
-        cve_data[row[0]] = {}
-        cve_data[row[0]]["summary"] = row[1]
-        cve_data[row[0]]["scorev2"] = row[2]
-        cve_data[row[0]]["scorev3"] = row[3]
-        cve_data[row[0]]["modified"] = row[4]
-        cve_data[row[0]]["vector"] = row[5]
-    conn.close()
 
+    for cve in cves:
+        for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
+            cve_data[row[0]] = {}
+            cve_data[row[0]]["summary"] = row[1]
+            cve_data[row[0]]["scorev2"] = row[2]
+            cve_data[row[0]]["scorev3"] = row[3]
+            cve_data[row[0]]["modified"] = row[4]
+            cve_data[row[0]]["vector"] = row[5]
+
+    conn.close()
     return cve_data
 
 def cve_write_data(d, patched, unpatched, cve_data):
-- 
2.20.1


