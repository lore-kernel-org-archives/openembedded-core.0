Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B45C64ED4
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.1606.1649979247090288964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UKUduJcO;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649979247;
  x=1681515247;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gLUgTio8mvsX+2Ewlx7C1btKr7Zpwa9cljPBAZc6fDQ=;
  b=UKUduJcOm6gNk7dm8BAdr8XxiuP6p6WpoqleXyg/I9p8j0WyGmoWZEc1
   1+ZWQbAP8DOHlHCaDJeiuBqggqDXxkEymWCBkwUxG00Bvz/LwsAh9AmWO
   SB1Xj3169Fz4ByHTw+maXvXda7x8gtumEroNRAuh+gMYtvIl1hHoLjvgN
   O1FxbRUrUP4fmU4C5D7nbeb6JN8RLBvovhWcLxYqyUlewmNATvGGQo4Qi
   fyGscSVwuEaer7bmjSoK42AYzGFoGBaMzLocTdwHtXbLwZ9AKICBDQO1M
   hc6WUtA5fneXsQ4S6lg3buU98ryvnByOpQ03zVIlCucu1g+nkjeRpBwnZ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] shadow: Disable the use of syslog() for the native tools
Date: Fri, 15 Apr 2022 01:34:02 +0200
Message-ID: <20220414233402.7028-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164414

An attempt to disable the use of syslog() was made in commit 8f181686
(shadow-native: Simplify and fix syslog disable patch). However,
because the code checks if USE_SYSLOG is defined rather than checking
if it evaluates to TRUE the patch did not work as intended.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch | 44 ++++++++++++++++---
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index 4bb6be43ed..628db42136 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,4 +1,7 @@
-Disable use of syslog for shadow-native tools
+From 8b845fff891798a03bdf21354b52e4487c2c0200 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 14 Apr 2022 23:11:53 +0000
+Subject: [PATCH] Disable use of syslog for shadow-native tools
 
 Disable use of syslog to prevent sysroot user and group additions from
 writing entries to the host's syslog. This patch should only be used
@@ -6,17 +9,44 @@ with the shadow-native recipe.
 
 Upstream-Status: Inappropriate [OE specific configuration]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 
-Index: shadow-4.11.1/configure.ac
-===================================================================
---- shadow-4.11.1.orig/configure.ac
-+++ shadow-4.11.1/configure.ac
-@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$sha
+---
+ configure.ac      | 2 +-
+ src/login_nopam.c | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5dcae19..b2c58f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
  	[Path to passwd program.])
  
  dnl XXX - quick hack, should disappear before anyone notices :).
 -AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
-+AC_DEFINE(USE_SYSLOG, 0, [Define to use syslog().])
++#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
  if test "$ac_cv_func_ruserok" = "yes"; then
  	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
  	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
+diff --git a/src/login_nopam.c b/src/login_nopam.c
+index df6ba88..fc24e13 100644
+--- a/src/login_nopam.c
++++ b/src/login_nopam.c
+@@ -29,7 +29,6 @@
+ #ifndef USE_PAM
+ #ident "$Id$"
+ 
+-#include "prototypes.h"
+     /*
+      * This module implements a simple but effective form of login access
+      * control based on login names and on host (or domain) names, internet
+@@ -57,6 +56,8 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>		/* for inet_ntoa() */
+ 
++#include "prototypes.h"
++
+ #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
+ #undef MAXHOSTNAMELEN
+ #define MAXHOSTNAMELEN 256

