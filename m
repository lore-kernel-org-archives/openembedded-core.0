Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B655773A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 01:54:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAG1sTPI001696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Nov 2015 17:54:29 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 15 Nov 2015 17:54:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 09:44:09 +0800
Message-ID: <8bce2ad60dbf1ba7d56b7d8b5dcdac99ee6670ca.1447638105.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1447638105.git.kai.kang@windriver.com>
References: <cover.1447638105.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: fix an exception of the mode configured
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
X-List-Received-Date: Mon, 16 Nov 2015 01:54:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

If ARCHIVER_MODE[src] is set with 'configured', the task
do_ar_configured depends on do_configure. Package gcc-source
has deleted task do_configure, then causes error:

| ERROR: Task do_ar_configured in .../meta/recipes-devtools/gcc/gcc-source_5.2.bb
| depends upon non-existent task do_configure in .../meta/recipes-devtools/gcc/gcc-source_5.2.bb

Only add the dependency when the task exits.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/archiver.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 41a552c..0874553 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -73,8 +73,13 @@ python () {
         # We can't use "addtask do_ar_configured after do_configure" since it
         # will cause the deptask of do_populate_sysroot to run not matter what
         # archives we need, so we add the depends here.
-        d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
-        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
+        #
+        # For some specific packages like gcc-source, do_configure may be deleted.
+        if 'do_configure' not in (d.getVar('__BBTASKS', False) or []):
+            pass
+        else:
+            d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
+            d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
     elif ar_src:
         bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
 
-- 
2.6.1


