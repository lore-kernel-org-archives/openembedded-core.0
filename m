Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2E8E6010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:25:53 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAIAPsbW026477 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 04:25:54 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015111804255382-105943 ;
	Wed, 18 Nov 2015 04:25:53 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 12:25:51 +0200
Message-Id: <5725c294cf5d9fdb98cb5531f30f8f46e66a20fb.1447842013.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e54ec1320521a08198512388736dbf21e832fe94.1447842013.git.adrian.ratiu@ni.com>
References: <e54ec1320521a08198512388736dbf21e832fe94.1447842013.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/18/2015 04:25:53 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/18/2015 04:25:54 AM,
	Serialize complete at 11/18/2015 04:25:54 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-18_06:, , signatures=0
Subject: [oe][PATCH v2 2/2] package_manager: support for signed IPK package feeds
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
X-List-Received-Date: Wed, 18 Nov 2015 10:25:54 -0000

Create gpg signed package feeds if configured. Very similar to
how rpm does it. Most of the config variables are shared with
the rpm backend (like PACKAGE_FEED_GPG_NAME), with the exception
of PACKAGE_FEED_GPG_PUBKEY which is not needed in this case.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/lib/oe/package_manager.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 964fddc..a0fe0eb 100644
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
@@ -206,7 +209,21 @@ class OpkgIndexer(Indexer):
         if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
             raise NotImplementedError('Package feed signing not implementd for ipk')
 
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


