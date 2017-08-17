Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F0E4C73120
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:48:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 17 Aug 2017 12:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,389,1498546800"; d="scan'208";a="301535553"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.corp.intel.com)
	([10.254.118.231])
	by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2017 12:48:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 17 Aug 2017 12:48:29 -0700
Message-Id: <1502999309-10153-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH] insane.bbclass: Warn if ${COREBASE}/LICENSE is used
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
X-List-Received-Date: Thu, 17 Aug 2017 19:48:30 -0000

The top level LICENSE file is not actually a license, it refers
other licenses that are used by Bitbake and Meta-data. Relying
on this file could cause problems for recipes when this file
changes, which it is about to.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/insane.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 479d39c..6d20eb6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -659,7 +659,7 @@ python populate_lic_qa_checksum() {
         sane = package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S')
-
+    corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
     for url in lic_files.split():
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
@@ -670,6 +670,10 @@ python populate_lic_qa_checksum() {
         if not os.path.isfile(srclicfile):
             package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
+        
+        if (srclicfile == corebase_licensefile):
+            bb.warn("${COREBASE}/LICENSE is not a valid license file, please use '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in LIC_FILES_CHKSUM")
+            bb.warn("This will become an error in the next release")
 
         recipemd5 = parm.get('md5', '')
         beginline, endline = 0, 0
-- 
2.7.5


