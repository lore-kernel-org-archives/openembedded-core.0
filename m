Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F545E92727
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 03:20:12 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18692.1766892001608077806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 19:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 28 Dec 2025 12:19:58 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.121 with ESMTP; 28 Dec 2025 12:19:58 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] package.py: skip dwarfsrcfiles for Clang LTO static libraries
Date: Sun, 28 Dec 2025 12:19:53 +0900
Message-Id: <20251228031953.4024552-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 03:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228580

From: "mark.yang" <mark.yang@lge.com>

When using Clang toolchain with LTO enabled, static libraries (.a) contain
LLVM bitcode objects instead of ELF objects. dwarfsrcfiles cannot process
these files and fails with "not a valid ELF file" error.

Rather than catching the error message, guard the dwarfsrcfiles call by
checking for the specific conditions: static library (using is_static_lib()
magic check) + clang toolchain + lto in DISTRO_FEATURES. When all conditions
are met, skip the call silently.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/lib/oe/package.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index baaa0cba02..279cd567b3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -770,6 +770,14 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
     return debugfiles.keys()
 
 def source_info(file, d, fatal=True):
+    # Skip static libraries when using Clang toolchain with LTO enabled.
+    # In this case, .a files contain LLVM bitcode instead of ELF objects,
+    # and dwarfsrcfiles cannot process them.
+    if is_static_lib(file):
+        if d.getVar('TOOLCHAIN') == "clang" and bb.utils.contains('DISTRO_FEATURES', 'lto', True, False, d):
+            bb.debug(1, "Skipping dwarfsrcfiles for Clang LTO archive: %s" % file)
+            return []
+
     cmd = ["dwarfsrcfiles", file]
     try:
         output = subprocess.check_output(cmd, universal_newlines=True, stderr=subprocess.STDOUT)

