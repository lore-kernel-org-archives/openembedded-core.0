Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1E4C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 21:20:07 +0000 (UTC)
Received: from mailfilter03-out31.webhostingserver.nl
 (mailfilter03-out31.webhostingserver.nl [141.138.168.202])
 by mx.groups.io with SMTP id smtpd.web12.1099.1647984006641095058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 14:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 141.138.168.202, mailfrom: fntoth@gmail.com)
X-Halon-ID: d6a91383-aa25-11ec-80d2-001a4a4cb9a5
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl
 [141.138.168.154])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id d6a91383-aa25-11ec-80d2-001a4a4cb9a5;
	Tue, 22 Mar 2022 22:20:03 +0100 (CET)
Received: from [2a02:a466:68ed:1:8763:2e5f:5343:9ba]
 (helo=localhost.localdomain)
	by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
	(envelope-from <fntoth@gmail.com>)
	id 1nWlv9-00GRSO-00; Tue, 22 Mar 2022 22:20:03 +0100
From: Ferry Toth <fntoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ferry Toth <ftoth@exalondelft.nl>,
	Xavier Berger <xavier.berger@bio-logic.net>
Subject: [PATCH v1 2/2] package_manager: sign DEB package feeds
Date: Tue, 22 Mar 2022 22:19:49 +0100
Message-Id: <20220322211949.7423-2-fntoth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220322211949.7423-1-fntoth@gmail.com>
References: <20220322211949.7423-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 21:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163576

From: Ferry Toth <ftoth@exalondelft.nl>

Implement debian package repository signature.
For each Release file created in repository subdirectory, a signature
Release.gpg is created.

Signature is performed using gpg backend when the following variables
are set in local.conf:
PACKAGE_CLASSES += "sign_package_feed"
PACKAGE_FEED_GPG_NAME = "<Id of GPG key>"
PACKAGE_FEED_GPG_PASSPHRASE_FILE="<path to password file>"

Signed-off-by: Xavier Berger <xavier.berger@bio-logic.net>
Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 meta/lib/oe/package_manager/deb/__init__.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 9f112ae25b..86ddb130ad 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -53,6 +53,7 @@ class DpkgIndexer(Indexer):
 
         index_cmds = []
         deb_dirs_found = False
+        index_sign_files = set()
         for arch in arch_list:
             arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.isdir(arch_dir):
@@ -62,7 +63,10 @@ class DpkgIndexer(Indexer):
 
             cmd += "%s -fcn Packages > Packages.gz;" % gzip
 
-            with open(os.path.join(arch_dir, "Release"), "w+") as release:
+            release_file = os.path.join(arch_dir, "Release")
+            index_sign_files.add(release_file)
+
+            with open(release_file, "w+") as release:
                 release.write("Label: %s\n" % arch)
 
             cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
@@ -76,8 +80,17 @@ class DpkgIndexer(Indexer):
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
 
 class PMPkgsList(PkgsList):
 
-- 
2.32.0


