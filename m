Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C706A7F8F7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:34 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540232"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:15:05 +0800
Message-Id: <aec350437ec1d96f651ccb193159c4d4168663cb.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576303901.git.anuj.mittal@intel.com>
References: <cover.1576303901.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 11/11] cve-check: Switch to NVD CVE JSON feed version 1.1
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
X-List-Received-Date: Sat, 14 Dec 2019 06:15:33 -0000
Content-Transfer-Encoding: 8bit

From: Niko Mauno <niko.mauno@iki.fi>

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.21.0


