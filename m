Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF05A65C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 02:08:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1H28KYL025294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 18:08:20 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Feb 2015 18:08:20 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 10:08:13 +0800
Message-ID: <7d69cebc74b1e61acb18e4660a744f9920b56ebe.1424138791.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1424138791.git.Qi.Chen@windriver.com>
References: <cover.1424138791.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/4] package_manager.py: use 'purge' instead of 'remove' in case of deb
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
X-List-Received-Date: Tue, 17 Feb 2015 02:08:22 -0000
Content-Type: text/plain

We need to use 'purge' instead of 'remove' for debian package backend when
removing packages at rootfs time. This is because that 'remove' command for
'dpkg' and 'apt-get' does not remove configuration files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index fcf05dc..070b79d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1628,10 +1628,10 @@ class DpkgPM(PackageManager):
     def remove(self, pkgs, with_dependencies=True):
         if with_dependencies:
             os.environ['APT_CONFIG'] = self.apt_conf_file
-            cmd = "%s remove %s" % (self.apt_get_cmd, ' '.join(pkgs))
+            cmd = "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
         else:
             cmd = "%s --admindir=%s/var/lib/dpkg --instdir=%s" \
-                  " -r --force-depends %s" % \
+                  " -P --force-depends %s" % \
                   (bb.utils.which(os.getenv('PATH'), "dpkg"),
                    self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
 
-- 
1.9.1


