Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D561BCD13CF
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:32:04 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12653.1777473120943923762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 29 Apr 2026 23:31:59 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 29 Apr 2026 23:31:59 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH 3/3] package.bbclass: extend package variables for multilib variants
Date: Wed, 29 Apr 2026 23:31:04 +0900
Message-ID: <20260429143104.684760-4-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429143104.684760-1-jaeyoon.jung@lge.com>
References: <20260429143104.684760-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 14:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236108

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Ensure PACKAGEVARS are extended for multilib variants during
do_split_packages so that per-package metadata is correctly
renamed when BBEXTENDVARIANT is in use.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/classes-global/package.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 67148fc1ac..d981424290 100644
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
+
+    if variant and prefixes:
+        import oe.classextend
+        # Extend package variables for the given variant if unset
+        clsextend = oe.classextend.ClassExtender(variant, prefixes, d)
+        clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
+
     return list(split_packages)
 
 PACKAGE_DEPENDS += "file-native"

