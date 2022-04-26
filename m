Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6CBC43219
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.1700.1650941656313754698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IgkkR5wH;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941662; x=1682477662;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=m+Wf6Ks6dNnAYfgph0M7xFRpr4TVueaXELbNgCMdjgA=;
  b=IgkkR5wHbu5vsUcQy3w0PiOmG7CZpoRKCu/PqVTsYMhcYTsVzQRqZCWQ
   lUEd4Ex/CiIe1knWqV9Ag8MtOonV+o6lxW23wMrbtoBH4lM/e+bZjlMiQ
   2skM/WJvaWU5PaBxn9E8/lKpj9BL1mK9p//fF5Z5OnBmU9KVWpzP3cKFe
   bANRMo+qLA9wbUtN2LEzBJwntKBGFEkh3QKX5D9TbQjgyGN818R11Thgk
   Gs3McTkDkRkQ5q9Rzq9OnpT9St220Wc4yMnT60wEfJBa+QbsevUPadtjH
   ky/eI11O0qsG3f2qyT15J0tfAG5/Xj7ADpXq0AbqRAUb6dTuapHIiOw/z
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950981"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950981"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439898"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:20 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 7/7] shadow-native: Simplify and fix syslog disable
 patch
Date: Tue, 26 Apr 2022 10:54:05 +0800
Message-Id: 
 <d411ea3114cde55ae68a2d437e854c5b17f78131.1650941226.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650941226.git.anuj.mittal@intel.com>
References: <cover.1650941226.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 02:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164854

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Shadow is happily spamming the host syslog with messages and shouldn't be
which suggests the patch isn't working. Redo it to work at the configure
level which is simpler and hopefully more effective.

This is a squashed cherry-pick of commit 8f181686 (shadow-native:
Simplify and fix syslog disable patch) and commit e1f21d0d (shadow:
Disable the use of syslog() for the native tools).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch | 150 +++++-------------
 1 file changed, 39 insertions(+), 111 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index 95728bcd3f..628db42136 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,124 +1,52 @@
-From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
-From: Scott Garman <scott.a.garman@intel.com>
-Date: Thu, 14 Apr 2016 12:28:57 +0200
-Subject: [PATCH] Disable use of syslog for sysroot
+From 8b845fff891798a03bdf21354b52e4487c2c0200 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 14 Apr 2022 23:11:53 +0000
+Subject: [PATCH] Disable use of syslog for shadow-native tools
 
 Disable use of syslog to prevent sysroot user and group additions from
 writing entries to the host's syslog. This patch should only be used
 with the shadow-native recipe.
 
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Upstream-Status: Inappropriate [OE specific configuration]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
- src/groupadd.c  | 3 +++
- src/groupdel.c  | 3 +++
- src/groupmems.c | 3 +++
- src/groupmod.c  | 3 +++
- src/useradd.c   | 3 +++
- src/userdel.c   | 4 ++++
- src/usermod.c   | 3 +++
- 7 files changed, 22 insertions(+)
+ configure.ac      | 2 +-
+ src/login_nopam.c | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/src/groupadd.c b/src/groupadd.c
-index d7f68b1..5fe5f43 100644
---- a/src/groupadd.c
-+++ b/src/groupadd.c
-@@ -34,6 +34,9 @@
- 
- #ident "$Id$"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <ctype.h>
- #include <fcntl.h>
- #include <getopt.h>
-diff --git a/src/groupdel.c b/src/groupdel.c
-index 5c89312..2aefc5a 100644
---- a/src/groupdel.c
-+++ b/src/groupdel.c
-@@ -34,6 +34,9 @@
- 
+diff --git a/configure.ac b/configure.ac
+index 5dcae19..b2c58f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
+ 	[Path to passwd program.])
+ 
+ dnl XXX - quick hack, should disappear before anyone notices :).
+-AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
++#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
+ if test "$ac_cv_func_ruserok" = "yes"; then
+ 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
+ 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
+diff --git a/src/login_nopam.c b/src/login_nopam.c
+index df6ba88..fc24e13 100644
+--- a/src/login_nopam.c
++++ b/src/login_nopam.c
+@@ -29,7 +29,6 @@
+ #ifndef USE_PAM
  #ident "$Id$"
  
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <ctype.h>
- #include <fcntl.h>
- #include <grp.h>
-diff --git a/src/groupmems.c b/src/groupmems.c
-index 654a8f3..6b2026b 100644
---- a/src/groupmems.c
-+++ b/src/groupmems.c
-@@ -32,6 +32,9 @@
- 
- #include <config.h>
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <fcntl.h>
- #include <getopt.h>
- #include <grp.h>
-diff --git a/src/groupmod.c b/src/groupmod.c
-index acd6f35..a2c5247 100644
---- a/src/groupmod.c
-+++ b/src/groupmod.c
-@@ -34,6 +34,9 @@
- 
- #ident "$Id$"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <ctype.h>
- #include <fcntl.h>
- #include <getopt.h>
-diff --git a/src/useradd.c b/src/useradd.c
-index 127177e..b80e505 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -34,6 +34,9 @@
- 
- #ident "$Id$"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
-diff --git a/src/userdel.c b/src/userdel.c
-index 79a7c89..c1e010a 100644
---- a/src/userdel.c
-+++ b/src/userdel.c
-@@ -31,6 +31,10 @@
-  */
- 
- #include <config.h>
-+
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <assert.h>
- #include <dirent.h>
- #include <errno.h>
-diff --git a/src/usermod.c b/src/usermod.c
-index 03bb9b9..e15fdd4 100644
---- a/src/usermod.c
-+++ b/src/usermod.c
-@@ -34,6 +34,9 @@
- 
- #ident "$Id$"
+-#include "prototypes.h"
+     /*
+      * This module implements a simple but effective form of login access
+      * control based on login names and on host (or domain) names, internet
+@@ -57,6 +56,8 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>		/* for inet_ntoa() */
  
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
++#include "prototypes.h"
 +
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
+ #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
+ #undef MAXHOSTNAMELEN
+ #define MAXHOSTNAMELEN 256
-- 
2.35.1


