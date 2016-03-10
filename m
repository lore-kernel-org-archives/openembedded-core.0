Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1E87E73192
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:03:24 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2AA3Oba021096; Thu, 10 Mar 2016 04:03:24 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031004032519-1226951 ;
	Thu, 10 Mar 2016 04:03:25 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:02:59 +0200
Message-Id: <5b6f53a8868d953a0cf12a077a61870c97402bfd.1457603028.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <cover.1457603028.git.adrian.ratiu@ni.com>
References: <cover.1457603028.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/10/2016 04:03:25 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/10/2016 04:03:25 AM,
	Serialize complete at 03/10/2016 04:03:25 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-10_07:, , signatures=0
Subject: [PATCH v8 5/6] package_manager: sign IPK package feeds
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
X-List-Received-Date: Thu, 10 Mar 2016 10:03:25 -0000

Create gpg signed ipk package feeds using the gpg backend if configured

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/lib/oe/package_manager.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5cd43e9..dc49903 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -153,11 +153,16 @@ class OpkgIndexer(Indexer):
                      "MULTILIB_ARCHS"]
 
         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        else:
+            signer = None
 
         if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
             open(os.path.join(self.deploy_dir, "Packages"), "w").close()
 
         index_cmds = []
+        index_sign_files = []
         for arch_var in arch_vars:
             archs = self.d.getVar(arch_var, True)
             if archs is None:
@@ -176,6 +181,8 @@ class OpkgIndexer(Indexer):
                 index_cmds.append('%s -r %s -p %s -m %s' %
                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
 
+                index_sign_files.append(pkgs_file)
+
         if len(index_cmds) == 0:
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
@@ -183,9 +190,12 @@ class OpkgIndexer(Indexer):
         result = oe.utils.multiprocess_exec(index_cmds, create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            raise NotImplementedError('Package feed signing not implementd for ipk')
 
+        if signer:
+            for f in index_sign_files:
+                signer.detach_sign(f,
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
 
 
 class DpkgIndexer(Indexer):
-- 
2.7.2


