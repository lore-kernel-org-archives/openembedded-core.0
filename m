Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A234C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 03:53:38 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50033.1790567609207970395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 20:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 28 Sep 2026 12:53:26 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.121 with ESMTP; 28 Sep 2026 12:53:26 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] multilib: skip cross-canadian recipes when renaming package variables
Date: Mon, 28 Sep 2026 12:53:17 +0900
Message-ID: <20260928035317.4007911-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 03:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246720

From: "mark.yang" <mark.yang@lge.com>

Return early from do_rename_package_variables() for cross-canadian
recipes, as multilib_virtclass_handler_postkeyexp() does before it
calls rename_package_variables().

Commit 432ab37a46 ("multilib: extend variables after packages split")
added do_rename_package_variables() without the cross-canadian check.
add_suffix() returns package names that contain "-cross-" unchanged,
so every renameVar() call gets identical old and new keys.

On qemux86-64 with the multilib-x86-lib32 fragment,
binutils-cross-canadian-i686:do_package prints 1258 warnings like:

  WARNING: binutils-cross-canadian-i686-2.47-r0 do_package: Calling renameVar with equivalent keys (LICENSE:binutils-cross-canadian-i686) is invalid

renameVar() returns right after the warning, so skipping these calls
does not change the packaged output.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
blacksail has 432ab37a46 as well, and this applies there without changes.

 meta/classes/multilib.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 55b8aee882..0d5f1290fa 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -218,6 +218,9 @@ def reset_alternative_priority(d):
 PACKAGESPLITFUNCS:append = " do_rename_package_variables"
 
 python do_rename_package_variables() {
+    if bb.data.inherits_class('cross-canadian', d):
+        return
+
     variant = d.getVar("BBEXTENDVARIANT")
     prefixes = (d.getVar("MULTILIB_VARIANTS") or "").split()
     if variant and prefixes:

base-commit: fb479118c94f5448759a3ce8f1aad89d5aebdf75

