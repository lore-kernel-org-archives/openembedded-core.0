Return-Path: <Jian.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC15E772DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:10:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tADAA4PM021867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:10:04 -0800
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.138) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 02:10:03 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 18:09:49 +0800
Message-ID: <1447409389-406-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] archiver.bbclass: fix an exception of the mode configured
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
X-List-Received-Date: Fri, 13 Nov 2015 10:10:05 -0000
Content-Type: text/plain

gcc-source does not have the task do_configure, so if configured mode is set,
the task do_ar_configured depends on do_configure.
This will cause an error.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 archiver.bbclass |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 41a552c..3d1952a 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -73,8 +73,18 @@ python () {
         # We can't use "addtask do_ar_configured after do_configure" since it
         # will cause the deptask of do_populate_sysroot to run not matter what
         # archives we need, so we add the depends here.
-        d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
-        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
+        ##
+        # For some specific packages like gcc-source, do_configure may be deleted.
+        deltask = d.getVar('__BBDELTASKS', False)
+        noexec = d.getVarFlag('do_configure', 'noexec')
+        os.system("echo deltask=%s, noexec=%s, pn=%s >> /tmp/tasks.txt" %(deltask,noexec,pn))
+        #if 'do_configure' in (d.getVar('__BBDELTASKS', False) or []) or d.getVarFlag('do_configure', 'noexec') == '1':
+        if d.getVarFlag('do_configure', 'noexec') == '1' or 'do_configure' not in d.getVar('__BBTASKS', False):
+            pass
+        else:
+            bb.build.addtask('do_ar_configured', None, 'do_unpack_and_patch', d)
+            d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
+            d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
     elif ar_src:
         bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
 
@@ -348,7 +358,6 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 
 addtask do_ar_original after do_unpack
 addtask do_ar_patched after do_unpack_and_patch
-addtask do_ar_configured after do_unpack_and_patch
 addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives before do_build

