Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB84C48BE6
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mailfilter02-out31.webhostingserver.nl
 (mailfilter02-out31.webhostingserver.nl [141.138.168.75])
 by mx.groups.io with SMTP id smtpd.web09.26554.1649015472638609662
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 12:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 141.138.168.75, mailfrom: fntoth@gmail.com)
X-Halon-ID: 68c03ff5-b387-11ec-8db1-001a4a4cb922
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl
 [141.138.168.154])
	by mailfilter02.webhostingserver.nl (Halon) with ESMTPSA
	id 68c03ff5-b387-11ec-8db1-001a4a4cb922;
	Sun, 03 Apr 2022 21:51:10 +0200 (CEST)
Received: from [2a02:a466:68ed:1:a97:eb0e:d916:69ac] (helo=delfion.fritz.box)
	by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
	(envelope-from <fntoth@gmail.com>)
	id 1nb6Fh-009Srb-OM; Sun, 03 Apr 2022 21:51:09 +0200
From: Ferry Toth <fntoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Xavier Berger <xavier.berger@bio-logic.net>,
	Alexander Kanavin <alex@linutronix.de>,
	Ferry Toth <ftoth@exalondelft.nl>
Subject: [PATCH v2 2/3] package_manager: sign DEB package feeds
Date: Sun,  3 Apr 2022 21:50:45 +0200
Message-Id: <20220403195046.7060-4-fntoth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403195046.7060-1-fntoth@gmail.com>
References: <20220403195046.7060-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163970

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


