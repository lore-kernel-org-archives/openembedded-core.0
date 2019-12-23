Return-Path: <niko.mauno@iki.fi>
Received: from tulikuusama2.dnainternet.net (tulikuusama3.dnainternet.net
	[83.102.40.155])
	by mail.openembedded.org (Postfix) with ESMTP id C86F56D666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 11:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 452FF20519;
	Mon, 23 Dec 2019 13:11:22 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from tulikuusama2.dnainternet.net ([83.102.40.155])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id st1U8OkVHrie; Mon, 23 Dec 2019 13:11:21 +0200 (EET)
Received: from oliivipuu2.dnainternet.net (oliivipuu2.dnainternet.net
	[83.102.40.53])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 1F51A27209;
	Mon, 23 Dec 2019 13:11:21 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by oliivipuu2.dnainternet.net (Postfix) with ESMTP id 508D67C;
	Mon, 23 Dec 2019 13:11:17 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2019 13:11:00 +0200
Message-Id: <20191223111100.50108-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [thud][PATCH] cve-check: Switch to NVD CVE JSON feed version 1.1
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
X-List-Received-Date: Mon, 23 Dec 2019 11:11:24 -0000
Content-Transfer-Encoding: 8bit

Switch to recently released version 1.1 of NVD CVE JSON feed, as in
https://nvd.nist.gov/General/News/JSON-1-1-Vulnerability-Feed-Release
it is mentioned that

  Due to changes required to support CVSS v3.1 scoring, the JSON
  vulnerability feeds must be modified. This will require the consumers
  of this data to update their internal processes. We will be providing
  the JSON 1.1 schema on the data feeds page and the information below
  to prepare for this transition.
  ...
  The JSON 1.1 data feeds will be available on September 9th, 2019. At
  that time the current JSON 1.0 data feeds will no longer available.

This change was tested briefly by issuing 'bitbake core-image-minimal'
with 'cve-check.bbclass' inherited via local.conf, and then comparing
the content between the resulting two
'DEPLOY_DIR_IMAGE/core-image-minimal-qemux86.cve' files, which did not
seem to contain any other change, except total of 167 entries like

  CVSS v3 BASE SCORE: 0.0

were replaced with similar 'CVSS v3 BASE SCORE:' entries which had
scores that were greater than '0.0' (up to '9.8').

(From OE-Core rev: cc20e4d8ff2f3aa52a2658404af9a0ff358cc323)

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 19ed5548b3..01b3637469 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index db1d69a28e..575254af40 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -27,7 +27,7 @@ python do_populate_cve_db() {
 
     bb.utils.export_proxies(d)
 
-    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
+    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
     YEAR_START = 2002
 
     db_file = d.getVar("CVE_CHECK_DB_FILE")
-- 
2.20.1


