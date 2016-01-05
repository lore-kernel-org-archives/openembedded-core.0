Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6751173175
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 08:38:53 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u058csMA022086 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 02:38:54 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010502385453-1694275 ;
	Tue, 5 Jan 2016 02:38:54 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 5 Jan 2016 10:38:52 +0200
Message-Id: <413d016d3d00be2f5d3dfa9d1dcb5a038681d291.1451983009.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <88b6d7a2acf46e3623c02685cff661a958f9a7ea.1451983009.git.adrian.ratiu@ni.com>
References: <88b6d7a2acf46e3623c02685cff661a958f9a7ea.1451983009.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2016 02:38:54 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2016 02:38:54 AM,
	Serialize complete at 01/05/2016 02:38:54 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_02:, , signatures=0
Subject: [RESEND PATCH v3 2/2] package_manager: support for signed IPK package feeds
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
X-List-Received-Date: Tue, 05 Jan 2016 08:38:54 -0000

Create gpg signed package feeds if configured. Very similar to
how rpm does it. Most of the config variables are shared with
the rpm backend (like PACKAGE_FEED_GPG_NAME), with the exception
of PACKAGE_FEED_GPG_PUBKEY which is not needed in this case.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/lib/oe/package_manager.py | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 32afeaf..8c8ecce 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -178,6 +178,7 @@ class OpkgIndexer(Indexer):
             open(os.path.join(self.deploy_dir, "Packages"), "w").close()
 
         index_cmds = []
+        index_sign_files = []
         for arch_var in arch_vars:
             archs = self.d.getVar(arch_var, True)
             if archs is None:
@@ -196,6 +197,8 @@ class OpkgIndexer(Indexer):
                 index_cmds.append('%s -r %s -p %s -m %s' %
                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
 
+                index_sign_files.append(pkgs_file)
+
         if len(index_cmds) == 0:
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
@@ -203,10 +206,22 @@ class OpkgIndexer(Indexer):
         result = oe.utils.multiprocess_exec(index_cmds, create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            raise NotImplementedError('Package feed signing not implementd for ipk')
-
 
+        # all these variables are needed to succesfully sign the index, otherwise skip signing
+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1' and \
+           self.d.getVar('PACKAGE_FEED_GPG_NAME', True) and \
+           self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True):
+                pkgfeed_gpg_name = self.d.getVar('PACKAGE_FEED_GPG_NAME', True)
+                pkgfeed_gpg_pass = self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True)
+                gpg_bin = self.d.getVar('GPG_BIN', True) or bb.utils.which(os.getenv('PATH'), "gpg")
+
+                gpg_cmd = "%s --no-use-agent --batch --yes -ab -u %s --passphrase-file '%s'" % \
+                          (gpg_bin, pkgfeed_gpg_name, pkgfeed_gpg_pass)
+
+                for f in index_sign_files:
+                    result = oe.utils.multiprocess_exec([gpg_cmd + ' ' + f], create_index)
+                    if result:
+                        bb.fatal('%s' % ('\n'.join(result)))
 
 class DpkgIndexer(Indexer):
     def _create_configs(self):
-- 
2.1.4


