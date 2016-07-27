Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 511CF606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 07:51:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R7pBVq012097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 00:51:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 00:51:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 00:51:10 -0700
Message-ID: <274458451c02374349858ee559bd98dd6e1de77a.1469605567.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469605567.git.liezhi.yang@windriver.com>
References: <cover.1469605567.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagefeed-stability.bbclass: fix multilib + rpm
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
X-List-Received-Date: Wed, 27 Jul 2016 07:51:11 -0000
Content-Type: text/plain

* Fix multilib + rpm since its multilib package name is special.
* Update SSTATE_DUPWHITELIST to avoid shared location conflicted error.
* Fix message when "not copying", now the messages are:
  Copying packages for recipe <foo>
  Not copying packages for recipe <foo>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/packagefeed-stability.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index df4c2ba..bcd3e44 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -56,8 +56,11 @@ python() {
                 continue
 
             if deploydirvarref in sstate_outputdirs:
+                deplor_dir_pkgtype = d.expand(deploydirvarref + '-prediff')
                 # Set intermediate output directory
-                d.setVarFlag(pkgwritefunc, 'sstate-outputdirs', sstate_outputdirs.replace(deploydirvarref, deploydirvarref + '-prediff'))
+                d.setVarFlag(pkgwritefunc, 'sstate-outputdirs', sstate_outputdirs.replace(deploydirvarref, deplor_dir_pkgtype))
+                # Update SSTATE_DUPWHITELIST to avoid shared location conflicted error
+                d.appendVar('SSTATE_DUPWHITELIST', ' %s' % deplor_dir_pkgtype)
 
             d.setVar(pkgcomparefunc, d.getVar('do_package_compare', False))
             d.setVarFlags(pkgcomparefunc, d.getVarFlags('do_package_compare', False))
@@ -135,6 +138,7 @@ def package_compare_impl(pkgtype, d):
     files = []
     docopy = False
     manifest, _ = oe.sstatesig.sstate_get_manifest_filename(pkgwritetask, d)
+    mlprefix = d.getVar('MLPREFIX', True)
     # Copy recipe's all packages if one of the packages are different to make
     # they have the same PR.
     with open(manifest, 'r') as f:
@@ -150,6 +154,8 @@ def package_compare_impl(pkgtype, d):
                     pkgbasename = os.path.basename(destpath)
                     pkgname = None
                     for rpkg, pkg in rpkglist:
+                        if mlprefix and pkgtype == 'rpm' and rpkg.startswith(mlprefix):
+                            rpkg = rpkg[len(mlprefix):]
                         if pkgbasename.startswith(rpkg):
                             pkgr = pkgrvalues[pkg]
                             destpathspec = destpath.replace(pkgr, '*')
@@ -205,6 +211,12 @@ def package_compare_impl(pkgtype, d):
             for pkgname, pkgbasename, srcpath, destpath in files:
                 destdir = os.path.dirname(destpath)
                 bb.utils.mkdirhier(destdir)
+                # Remove allarch rpm pkg if it is already existed (for
+                # multilib), they're identical in theory, but sstate.bbclass
+                # copies it again, so keep align with that.
+                if os.path.exists(destpath) and pkgtype == 'rpm' \
+                        and d.getVar('PACKAGE_ARCH', True) == 'all':
+                    os.unlink(destpath)
                 if (os.stat(srcpath).st_dev == os.stat(destdir).st_dev):
                     # Use a hard link to save space
                     os.link(srcpath, destpath)
@@ -212,7 +224,7 @@ def package_compare_impl(pkgtype, d):
                     shutil.copyfile(srcpath, destpath)
                 f.write('%s\n' % destpath)
     else:
-        bb.plain('Not copying packages for %s' % pn)
+        bb.plain('Not copying packages for recipe %s' % pn)
 
 do_cleanall_append() {
     import errno
-- 
2.9.0


