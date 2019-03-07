Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BACF7CE33
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 03:22:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x273MAqa013327
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2019 19:22:10 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 6 Mar 2019 19:22:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 11:41:21 +0800
Message-ID: <c0f7327fe54df3dd65b7650175968e8231f712f1.1551929817.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1551929817.git.liezhi.yang@windriver.com>
References: <cover.1551929817.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] insane.bbclass: Make INSANE_SKIP work for qa pkgconfig and la
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
X-List-Received-Date: Thu, 07 Mar 2019 03:22:10 -0000
Content-Type: text/plain

The INSANE_SKIP = "pkgconfig" or "la" didn't work, this patch fixes the problem.

[YOCTO #13087]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6411884..fd9c5f0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -570,7 +570,7 @@ python populate_lic_qa_checksum() {
         bb.fatal("Fatal QA errors found, failing task.")
 }
 
-def package_qa_check_staged(path,d):
+def qa_check_staged(path,d):
     """
     Check staged la and pc files for common problems like references to the work
     directory.
@@ -589,20 +589,31 @@ def package_qa_check_staged(path,d):
     else:
         pkgconfigcheck = tmpdir
 
+    skip = (d.getVar('INSANE_SKIP') or "").split()
+    skip_la = False
+    if 'la' in skip:
+        bb.note("Recipe %s skipping qa chekcing: la" % d.getVar('PN'))
+        skip_la = True
+
+    skip_pkgconfig = False
+    if 'pkgconfig' in skip:
+        bb.note("Recipe %s skipping qa chekcing: pkgconfig" % d.getVar('PN'))
+        skip_pkgconfig = True
+
     # find all .la and .pc files
     # read the content
     # and check for stuff that looks wrong
     for root, dirs, files in os.walk(path):
         for file in files:
             path = os.path.join(root,file)
-            if file.endswith(".la"):
+            if file.endswith(".la") and not skip_la:
                 with open(path) as f:
                     file_content = f.read()
                     file_content = file_content.replace(recipesysroot, "")
                     if workdir in file_content:
                         error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
                         sane &= package_qa_handle_error("la", error_msg, d)
-            elif file.endswith(".pc"):
+            elif file.endswith(".pc") and not skip_pkgconfig:
                 with open(path) as f:
                     file_content = f.read()
                     file_content = file_content.replace(recipesysroot, "")
@@ -1034,8 +1045,7 @@ addtask do_package_qa_setscene
 
 python do_qa_staging() {
     bb.note("QA checking staging")
-
-    if not package_qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d):
+    if not qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d):
         bb.fatal("QA staging was broken by the package built above")
 }
 
-- 
2.7.4


