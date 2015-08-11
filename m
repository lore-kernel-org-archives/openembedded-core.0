Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BE8D47693F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:45:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 2E006608E3E
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:45:02 +0100
Message-Id: <7720ff7614d5caad940b7dedd8bdff01ba6768f6.1439282534.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439282534.git.joshua.lock@collabora.co.uk>
References: <cover.1439282534.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1439282534.git.joshua.lock@collabora.co.uk>
References: <cover.1439282534.git.joshua.lock@collabora.co.uk>
Subject: [RFC PATCH 1/1] lib/oe/package_manager: fix opkg feed generation
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
X-List-Received-Date: Tue, 11 Aug 2015 08:45:18 -0000

The insert_feed_uris() method of OpkgPM was creating an initial
entry in the feeds list which pointed to the root of the ipk
directory, however the on-device package manager can't consume
this feed resulting in runtime errors - therefore we remove the
code to generate that initial feed uri.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/lib/oe/package_manager.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 55b8ab0..2ab1d78 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1343,13 +1343,10 @@ class OpkgPM(PackageManager):
         with open(rootfs_config, "w+") as config_file:
             uri_iterator = 0
             for uri in self.feed_uris.split():
-                config_file.write("src/gz url-%d %s/ipk\n" %
-                                  (uri_iterator, uri))
-
                 for arch in self.pkg_archs.split():
                     if not os.path.exists(os.path.join(self.deploy_dir, arch)):
                         continue
-                    bb.note('Note: adding opkg channel url-%s-%d (%s)' %
+                    bb.note('Note: adding opkg feed url-%s-%d (%s)' %
                         (arch, uri_iterator, uri))
 
                     config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
-- 
2.1.4


