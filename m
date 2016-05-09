Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 42881731D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 22:25:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 09 May 2016 15:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,602,1455004800"; d="scan'208";a="962245421"
Received: from hlim7-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.117])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2016 15:25:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:25:05 +1200
Message-Id: <f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462832624.git.paul.eggleton@linux.intel.com>
References: <cover.1462832624.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462832624.git.paul.eggleton@linux.intel.com>
References: <cover.1462832624.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/2] classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Mon, 09 May 2016 22:25:36 -0000

Recipes such as images and packagegroups don't actually fetch or build
any source, so there's really no point having LIC_FILES_CHKSUM set.
Forcing users to set it (as we have done for images inheriting
image.bbclass) just makes things more difficult for the user for no
discernable benefit. The easiest way to adjust this check is simply to
skip it if SRC_URI is not set since this is a pretty good indicator that
no source is being pulled in.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 097dc3a..0b151c2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -681,15 +681,15 @@ python populate_lic_qa_checksum() {
     import tempfile
     sane = True
 
-    lic_files = d.getVar('LIC_FILES_CHKSUM', True)
+    lic_files = d.getVar('LIC_FILES_CHKSUM', True) or ''
     lic = d.getVar('LICENSE', True)
     pn = d.getVar('PN', True)
 
     if lic == "CLOSED":
         return
 
-    if not lic_files:
-        package_qa_handle_error("license-checksum", pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)", d)
+    if not lic_files and d.getVar('SRC_URI', True):
+        package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
         return
 
     srcdir = d.getVar('S', True)
-- 
2.5.5


