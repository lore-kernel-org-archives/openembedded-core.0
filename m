Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0622060125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 06:23:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA26NenF007627
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Nov 2015 22:23:40 -0800 (PST)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 1 Nov 2015 22:23:39 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Nov 2015 14:23:38 +0800
Message-ID: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Mon, 02 Nov 2015 06:23:43 -0000
Content-Type: text/plain

The repo of kernel is bare git repository and we need to checkout to get
the source code.

Signed-off-by: Jian Liu <jian.liu@windriver.com>

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 41a552c..7387fbf 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -66,6 +66,11 @@ python () {
     ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
 
     if ar_src == "original":
+        # For kernel, it is bare repo, we need to checkout
+        if bb.data.inherits_class('kernel-yocto', d):
+            bb.build.addtask('do_ar_original', 'do_kernel_metadata', 'do_validate_branches', d)
+        else:
+            bb.build.addtask('do_ar_original', None, 'do_unpack', d)
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_original' % pn)
     elif ar_src == "patched":
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
@@ -113,6 +118,12 @@ python do_ar_original() {
 
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
     bb.note('Archiving the original source...')
+    # For kernel, the source code is shared
+    if bb.data.inherits_class('kernel-yocto', d):
+        srcdir = d.getVar('S', True)
+        create_tarball(d, srcdir, 'original', ar_outdir)
+        return
+
     fetch = bb.fetch2.Fetch([], d)
     for url in fetch.urls:
         local = fetch.localpath(url).rstrip("/");
@@ -346,7 +357,6 @@ python do_deploy_archives_setscene () {
 do_deploy_archives[sstate-inputdirs] = "${ARCHIVER_TOPDIR}"
 do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 
-addtask do_ar_original after do_unpack
 addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_dumpdata

