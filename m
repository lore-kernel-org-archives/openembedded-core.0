Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67D9574A03
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 07531184C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:35:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4rMphOmR2b7n
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:59 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2D998184AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:59 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19A091A06D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:59 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D3A91A064
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:59 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:34:59 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 011BF912;
	Mon, 25 Jun 2018 13:34:59 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id B37F29C0AD; Mon, 25 Jun 2018 13:34:58 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 13:34:46 +0200
Message-Id: <20180625113446.11638-2-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180625113446.11638-1-olofjn@axis.com>
References: <20180625113446.11638-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 2/2] insane.bbclass: Don't let warnings make previous errors non-fatal
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
X-List-Received-Date: Mon, 25 Jun 2018 11:34:59 -0000

package_qa_handle_error() returns True on non-fatal issues and False on
fatal issues. But the current usage has been to do

  sane = package_qa_handle_error(...)

which would always reset sanity status to be that of the last issue
identified. This change the assignments to use the &= operator instead:

  sane &= package_qa_handle_error(...)

As far as I can tell, this is not a real problem in practice, because
warnings of different levels (WARN_QA, ERROR_QA) does not seem to have
been mixed in a way that triggered this issue.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bdfdc315aae..713b40eac42 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -600,7 +600,7 @@ python populate_lic_qa_checksum() {
         return
 
     if not lic_files and d.getVar('SRC_URI'):
-        sane = package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
+        sane &= package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S')
     corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
@@ -608,11 +608,11 @@ python populate_lic_qa_checksum() {
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            sane = package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
+            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
             continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            sane = package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
+            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
 
         if (srclicfile == corebase_licensefile):
@@ -696,7 +696,7 @@ python populate_lic_qa_checksum() {
             else:
                 msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                 msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
-            sane = package_qa_handle_error("license-checksum", msg, d)
+            sane &= package_qa_handle_error("license-checksum", msg, d)
 
     if not sane:
         bb.fatal("Fatal QA errors found, failing task.")
@@ -733,14 +733,14 @@ def package_qa_check_staged(path,d):
                     file_content = file_content.replace(recipesysroot, "")
                     if workdir in file_content:
                         error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
-                        sane = package_qa_handle_error("la", error_msg, d)
+                        sane &= package_qa_handle_error("la", error_msg, d)
             elif file.endswith(".pc"):
                 with open(path) as f:
                     file_content = f.read()
                     file_content = file_content.replace(recipesysroot, "")
                     if pkgconfigcheck in file_content:
                         error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
-                        sane = package_qa_handle_error("pkgconfig", error_msg, d)
+                        sane &= package_qa_handle_error("pkgconfig", error_msg, d)
 
     return sane
 
-- 
2.11.0


