Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ACB88731D8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 23:58:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 08 May 2016 16:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,598,1455004800"; d="scan'208";a="801873924"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2016 16:58:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 11:58:10 +1200
Message-Id: <0348ef35090a51cf4f89fd3beec3e730b4a4d7ff.1462751689.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462751689.git.paul.eggleton@linux.intel.com>
References: <cover.1462751689.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462751689.git.paul.eggleton@linux.intel.com>
References: <cover.1462751689.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Sun, 08 May 2016 23:58:26 -0000

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


