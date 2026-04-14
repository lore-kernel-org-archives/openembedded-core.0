Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BAFF9D0FB
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 22:14:43 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6420.1776204880962897018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 15:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 15 Apr 2026 07:14:38 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 15 Apr 2026 07:14:38 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [RESEND PATCH] package/classextend: Extend package variables for a multilib variant
Date: Wed, 15 Apr 2026 07:14:36 +0900
Message-ID: <20260414221436.3182560-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 22:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235174

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

It extends package variables in case missing for a dynamic package added
during do_split_packages. It's needed for a multilib build where some
per-package variables should be treated as multilib variants.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-global/package.bbclass | 11 +++++++++++
 meta/lib/oe/classextend.py          |  5 +++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 67148fc1ac..cfadd36c16 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -169,6 +169,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 
     for o in sorted(objs):
         import re, stat
+        import oe.package
         if match_path:
             m = re.match(file_regex, o)
         else:
@@ -225,6 +226,16 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             hook(f, pkg, file_regex, output_pattern, m.group(1))
 
     d.setVar('PACKAGES', ' '.join(packages))
+
+    variant = d.getVar("BBEXTENDVARIANT")
+    prefixes = (d.getVar("MULTILIB_VARIANTS") or "").split()
+    if variant and prefixes:
+        import oe.classextend
+
+        # Extend package variables for the given variant if unset
+        clsextend = oe.classextend.ClassExtender(variant, prefixes, d)
+        clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split(), overwrite=False)
+
     return list(split_packages)
 
 PACKAGE_DEPENDS += "file-native"
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index ddca10dee5..8b9602e316 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -128,7 +128,7 @@ class ClassExtender(object):
         self.set_filter("RCONFLICTS", deps=True)
         self.set_filter("PKG", deps=True)
 
-    def rename_package_variables(self, variables):
+    def rename_package_variables(self, variables, overwrite=True):
         pkgs_mapping = get_package_mappings(self.d.getVar('PACKAGES'), self.extname)
         self.d.setVarFilter('PACKAGES', "package_suffix_filter(val, '" + self.extname + "')")
         self.d.setVarFilter('PACKAGES_DYNAMIC', "suffix_filter_regex(val, '" + self.extname + "', " + str(self.prefixes) + ")")
@@ -137,4 +137,5 @@ class ClassExtender(object):
             if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
                 continue
             for subs in variables:
-                self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "%s:%s" % (subs, pkg_mapping[1]))
+                if overwrite or not self.d.getVar("%s:%s" % (subs, pkg_mapping[1])):
+                    self.d.renameVar("%s:%s" % (subs, pkg_mapping[0]), "%s:%s" % (subs, pkg_mapping[1]))

