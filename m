Return-Path: <xavier.berger@bio-logic.net>
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
	[80.12.242.127])
	by mail.openembedded.org (Postfix) with ESMTP id 37EB87D0F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:57:51 +0000 (UTC)
Received: from srvmail.bio-logic.net ([176.149.180.241]) by mwinf5d40 with ME
	id v1qM1z0065Ctoqw031qMJp; Mon, 01 Apr 2019 15:50:21 +0200
X-ME-Helo: srvmail.bio-logic.net
X-ME-Auth: YmlvLWxvZ2ljQHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Apr 2019 15:50:21 +0200
X-ME-IP: 176.149.180.241
Received: from ubuntu.bio-logic.loc (unknown [10.100.11.254])
	by srvmail.bio-logic.net (Postfix) with ESMTP id 5565580478;
	Mon,  1 Apr 2019 15:50:21 +0200 (CEST)
From: Xavier Berger <xavier.berger@bio-logic.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:50:19 +0200
Message-Id: <34d09b9cac98f9ab880cb4c2822a1a0b500fdbaa.1554106752.git.xavier.berger@bio-logic.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554106752.git.xavier.berger@bio-logic.net>
References: <cover.1554106752.git.xavier.berger@bio-logic.net>
Subject: [PATCH 2/2] package_manager: sign DEB package feeds
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
X-List-Received-Date: Mon, 01 Apr 2019 13:57:51 -0000

Implement debian package repository signature.
For each Release file created in repository subdirectory, a signature
Release.gpg is created.

Signature is performed using gpg backend when the following variables
are set in local.conf:
PACKAGE_CLASSES += "sign_package_feed"
PACKAGE_FEED_GPG_NAME = "<Id of GPG key>"
PACKAGE_FEED_GPG_PASSPHRASE_FILE="<path to password file>"

Signed-off-by: Xavier Berger <xavier.berger@bio-logic.net>
---
 meta/lib/oe/package_manager.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2835c1d..215d143 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -281,6 +281,7 @@ class DpkgIndexer(Indexer):
 
         index_cmds = []
         deb_dirs_found = False
+        index_sign_files = set()
         for arch in arch_list:
             arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.isdir(arch_dir):
@@ -290,7 +291,10 @@ class DpkgIndexer(Indexer):
 
             cmd += "%s -fcn Packages > Packages.gz;" % gzip
 
-            with open(os.path.join(arch_dir, "Release"), "w+") as release:
+            release_file = os.path.join(arch_dir, "Release")
+            index_sign_files.add(release_file)
+
+            with open(release_file, "w+") as release:
                 release.write("Label: %s\n" % arch)
 
             cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
@@ -304,8 +308,17 @@ class DpkgIndexer(Indexer):
             return
 
         oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            raise NotImplementedError('Package feed signing not implementd for dpkg')
+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        else:
+            signer = None
+        if signer:
+            for f in index_sign_files:
+                signer.detach_sign(f,
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   output_suffix="gpg",
+                                   use_sha256=True)
 
 
 
-- 
2.7.4


