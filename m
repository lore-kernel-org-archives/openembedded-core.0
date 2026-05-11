Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712DACD37B6
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 03:12:05 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41904.1778469115992098661
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 20:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 11 May 2026 12:11:54 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.125 with ESMTP; 11 May 2026 12:11:54 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v3 1/2] multilib: extend variables after packages split
Date: Mon, 11 May 2026 12:11:50 +0900
Message-ID: <20260511031151.946905-2-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511031151.946905-1-jaeyoon.jung@lge.com>
References: <20260511031151.946905-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 03:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236775

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

A new function do_rename_package_variables() that invokes
ClassExtender.rename_package_variables() is appended to
PACKAGESPLITFUNCS in order to extend per-package variables in
PACKAGEVARS for all packages including dynamically split ones.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/classes/multilib.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 15056dac4d..5c660e7753 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -211,6 +211,18 @@ def reset_alternative_priority(d):
                 bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY[%s] to %s' % (pkg, alt_name, reset_priority))
                 d.setVarFlag('ALTERNATIVE_PRIORITY', alt_name, reset_priority)
 
+PACKAGESPLITFUNCS:append = " do_rename_package_variables"
+
+python do_rename_package_variables() {
+    variant = d.getVar("BBEXTENDVARIANT")
+    prefixes = (d.getVar("MULTILIB_VARIANTS") or "").split()
+    if variant and prefixes:
+        import oe.classextend
+        # Extend package variables for the given variant
+        clsextend = oe.classextend.ClassExtender(variant, prefixes, d)
+        clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
+}
+
 PACKAGEFUNCS:append = " do_package_qa_multilib"
 
 python do_package_qa_multilib() {

