Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F995731D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 22:47:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8FMletT001193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 15:47:40 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 15:47:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2016 17:47:38 -0500
Message-ID: <1473979659-120831-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] package_manager.py: Adjust error message order
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
X-List-Received-Date: Thu, 15 Sep 2016 22:47:43 -0000
Content-Type: text/plain

Move the debug before the error (as it can take many pages.)  This makes it
much easier for the user to see the actual error message as it is still on
the screen.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/package_manager.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2802254..d609593 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -838,10 +838,10 @@ class RpmPM(PackageManager):
                     new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
                     if not new_pkg:
                         # Failed to translate, package not found!
-                        err_msg = '%s not found in the %s feeds (%s).\n' % \
+                        err_msg = '%s not found in the %s feeds (%s).' % \
                                   (pkg, mlib, " ".join(feed_archs))
                         if not attempt_only:
-                            err_msg += " ".join(self.fullpkglist)
+                            bb.error("List of available packages: " + " ".join(self.fullpkglist))
                             bb.fatal(err_msg)
                         bb.warn(err_msg)
                     else:
@@ -855,10 +855,10 @@ class RpmPM(PackageManager):
                 default_archs = self.ml_prefix_list['default']
                 new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
                 if not new_pkg:
-                    err_msg = '%s not found in the base feeds (%s).\n' % \
+                    err_msg = '%s not found in the feeds (%s).' % \
                               (pkg, ' '.join(default_archs))
                     if not attempt_only:
-                        err_msg += " ".join(self.fullpkglist)
+                        bb.error("List of available packages: " + " ".join(self.fullpkglist))
                         bb.fatal(err_msg)
                     bb.warn(err_msg)
                 else:
-- 
2.5.5


