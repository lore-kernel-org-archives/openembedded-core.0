Return-Path: <niko.mauno@iki.fi>
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net
	[83.102.40.152])
	by mail.openembedded.org (Postfix) with ESMTP id AB61B7F9DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 18:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 86C5CF9A5;
	Sun,  8 Dec 2019 20:40:29 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id nDg_jOZyMKT5; Sun,  8 Dec 2019 20:40:29 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 3346810992;
	Sun,  8 Dec 2019 20:40:29 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 5613B74;
	Sun,  8 Dec 2019 20:40:24 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 20:35:52 +0200
Message-Id: <20191208183557.32589-6-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191208183557.32589-1-niko.mauno@iki.fi>
References: <20191208183557.32589-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [thud-next][PATCH 06/11] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Sun, 08 Dec 2019 18:40:28 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Don't hardcode the database filename, there's a variable for this in
cve-check.bbclass.

(From OE-Core rev: 0d188a9dc4ae64c64cd661e9d9c3841e86f226ab)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 19875a49b1..c15534de08 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -28,8 +28,8 @@ python do_populate_cve_db() {
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
 
-    db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
-    db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_dir = os.path.dirname(db_file)
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
     # Don't refresh the database more than once an hour
-- 
2.20.1


