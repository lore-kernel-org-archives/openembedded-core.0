Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409CFE8FDA5
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 07:36:06 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150315.1766734557710894641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Dec 2025 23:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 26 Dec 2025 16:35:54 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.127 with ESMTP; 26 Dec 2025 16:35:54 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] package.py: warn if target is not a valid ELF file in dwarfsrcfiles
Date: Fri, 26 Dec 2025 16:35:45 +0900
Message-Id: <20251226073545.11152-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 07:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228547

From: "mark.yang" <mark.yang@lge.com>

When using the Clang toolchain with LTO, intermediate .o files are generated as
LLVM bitcode files instead of ELF files. While .so libraries are ultimately
ELF, .a files are not. In this case, dwarfsrcfiles always fails.

Adding the -ffat-lto-objects option allows the Clang toolchain to produce .o
files that are recognized as ELF, but this is not always a suitable solution
as it causes issues when used in conjunction with -fsanitize=cfi.

Therefore, we need to handle cases where dwarfsrcfiles encounters a file that
is not a valid ELF. Change the behavior from a fatal error to a warning to
notify the user.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/lib/oe/package.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index baaa0cba02..56b9bcd546 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -782,8 +782,12 @@ def source_info(file, d, fatal=True):
     if retval != 0 and retval != 255:
         msg = "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else "")
         if fatal:
-            bb.fatal(msg)
-        bb.note(msg)
+            if "not a valid ELF file" in output:
+                bb.warn(msg)
+            else:
+                bb.fatal(msg)
+        else:
+            bb.note(msg)
 
     debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
 

