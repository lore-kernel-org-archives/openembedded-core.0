Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 159136FFFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 22:47:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8FMlfpo006789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 15:47:41 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 15:47:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2016 17:47:39 -0500
Message-ID: <1473979659-120831-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473979659-120831-1-git-send-email-mark.hatle@windriver.com>
References: <1473979659-120831-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] package_manager.py: Change diagnostic messages per IRC
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
X-List-Received-Date: Thu, 15 Sep 2016 22:47:41 -0000
Content-Type: text/plain

Based on a discussion with IRC user: Ulfalizer

It was suggested that removing the diagnostic list, and replacing it with a
simple hint to what might be causing the problem was a better solution.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/package_manager.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index d609593..dc88f62 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -838,11 +838,13 @@ class RpmPM(PackageManager):
                     new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
                     if not new_pkg:
                         # Failed to translate, package not found!
-                        err_msg = '%s not found in the %s feeds (%s).' % \
-                                  (pkg, mlib, " ".join(feed_archs))
+                        err_msg = '%s not found in the %s feeds (%s) in %s.' % \
+                                  (pkg, mlib, " ".join(feed_archs), self.d.getVar('DEPLOY_DIR_RPM', True))
                         if not attempt_only:
-                            bb.error("List of available packages: " + " ".join(self.fullpkglist))
-                            bb.fatal(err_msg)
+                            bb.error(err_msg)
+                            bb.fatal("This is often caused by an empty package declared " \
+                                     "in a recipe's PACKAGES variable. (Empty packages are " \
+                                     "not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)")
                         bb.warn(err_msg)
                     else:
                         new_pkgs.append(new_pkg)
@@ -855,11 +857,13 @@ class RpmPM(PackageManager):
                 default_archs = self.ml_prefix_list['default']
                 new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
                 if not new_pkg:
-                    err_msg = '%s not found in the feeds (%s).' % \
-                              (pkg, ' '.join(default_archs))
+                    err_msg = '%s not found in the feeds (%s) in %s.' % \
+                                  (pkg, " ".join(default_archs), self.d.getVar('DEPLOY_DIR_RPM', True))
                     if not attempt_only:
-                        bb.error("List of available packages: " + " ".join(self.fullpkglist))
-                        bb.fatal(err_msg)
+                        bb.error(err_msg)
+                        bb.fatal("This is often caused by an empty package declared " \
+                                 "in a recipe's PACKAGES variable. (Empty packages are " \
+                                 "not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)")
                     bb.warn(err_msg)
                 else:
                     new_pkgs.append(new_pkg)
-- 
2.5.5


