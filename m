Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35506C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.64842.1722010961472792667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46QGMcnq026618
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:22:40 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 7/8] pseudo: Fix to work with glibc 2.40
Date: Fri, 26 Jul 2024 11:22:37 -0500
Message-Id: <1722010958-23635-7-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202556

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc 2.40 renames some internal header variables. Update our hack to
work with the new version. These kinds of problems illustrate we need to
address the issue properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35021d650de3eecc3f42000181b39a5db5a8eaa0)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index da4b8ca..dfb5c28 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -9,7 +9,7 @@ Index: git/pseudo_wrappers.c
 ===================================================================
 --- git.orig/pseudo_wrappers.c
 +++ git/pseudo_wrappers.c
-@@ -6,6 +6,15 @@
+@@ -6,6 +6,18 @@
   * SPDX-License-Identifier: LGPL-2.1-only
   *
   */
@@ -21,6 +21,9 @@ Index: git/pseudo_wrappers.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
 +
  #include <assert.h>
  #include <stdlib.h>
@@ -29,7 +32,7 @@ Index: git/pseudo_util.c
 ===================================================================
 --- git.orig/pseudo_util.c
 +++ git/pseudo_util.c
-@@ -8,6 +8,14 @@
+@@ -8,6 +8,17 @@
   */
  /* we need access to RTLD_NEXT for a horrible workaround */
  #define _GNU_SOURCE
@@ -41,6 +44,9 @@ Index: git/pseudo_util.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
  
  #include <ctype.h>
  #include <errno.h>
-- 
1.8.3.1


