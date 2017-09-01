Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A81A477D6E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 21:53:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 01 Sep 2017 14:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,459,1498546800"; d="scan'208";a="147256204"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.126.139])
	by fmsmga006.fm.intel.com with ESMTP; 01 Sep 2017 14:53:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri,  1 Sep 2017 14:53:25 -0700
Message-Id: <1504302805-8518-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH v2] insane.bbclass: Warn if ${COREBASE}/LICENSE is used
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
X-List-Received-Date: Fri, 01 Sep 2017 21:53:26 -0000

The top level LICENSE file is not actually a license, it refers
other licenses that are used by Bitbake and Meta-data. Relying
on this file could cause problems for recipes when this file
changes, which it is about to.

(From OE-Core rev: a1948ab38c9cb7f0b16cce9dadc03ae6e2fe44ad)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Made one bb.warn instead of 2 and changed up comment

Available in poky-contrib/sgw/insane

 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3906ba7..aa304f1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -589,7 +589,7 @@ python populate_lic_qa_checksum() {
         sane = package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S')
-
+    corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
     for url in lic_files.split():
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
@@ -601,6 +601,9 @@ python populate_lic_qa_checksum() {
             package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
 
+        if (srclicfile == corebase_licensefile):
+            bb.warn("${COREBASE}/LICENSE is not a valid license file, please use '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in LIC_FILES_CHKSUM. This will become an error in the future")
+
         recipemd5 = parm.get('md5', '')
         beginline, endline = 0, 0
         if 'beginline' in parm:
-- 
2.7.5


