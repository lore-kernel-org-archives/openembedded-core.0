Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15A1C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 17:57:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.29583.1647280656987639702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=glyJXgZ9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id q14so25318225wrc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KyDnS2h++bH1Qf0lfcvAT65rJYva4f4pXjVolwerv+I=;
        b=glyJXgZ9Rd/2UBTVsvQs03QOgxhUFVvJOW/MFgzQEH6fURSYa4V2CX6yrieJOh/5G+
         tzroDbhFYOhqRyAjssu457c1H30qkOYwV5IuVRv1X3ga/PHtSzinKpBDQlk4Ua5My/Dk
         xiQS83HuSPhvJvuYUgQrRjtT9vq019Qmz4cLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyDnS2h++bH1Qf0lfcvAT65rJYva4f4pXjVolwerv+I=;
        b=zDJwOFkslsTVZhcOYqvPxgDlqooOA+UiH5ByYCdPinbMavm2qu/X1F/EcRf0KNqApw
         CflPWs2Ces313kQZ4yFDgrqVSh2Bo/ELOplZVnkJ9jWVdOQcWk64Q8ckVAJon9kmC+lB
         CFV0xYHJdwjVaMWUMDE0A4W/xzRptf8R0XEOY7/LJFSb63M6yCCc4pxR9dXRl6Rxc4Uw
         qTly7pX/xDtjgPMLSuHmUDLmGmY4ulCtG5veZLYUfLClYps/7M5fn+1/DgL0zqXLuYND
         icnSJrK/VvV24MCtjw2w8pslgfE2VkEnNCQThW1GFIJyGtldpZ2LaDzBzwKOOh2RDKSi
         3Mgg==
X-Gm-Message-State: AOAM531uTZvPEHkmaL0e8htvQnHMoMbt0xswPoKHdoF6gClbXOu6uMrz
	kAh/krAJtck//+K4G4qqZUkdEGt9lQ5wiTIW
X-Google-Smtp-Source: 
 ABdhPJzk2llTa/h5NlHP0gUzmpYeRGl2ctnfiyRDfE0fCPqG3UN5lHcK1VlKnv0ORFxL/RRbq8bKzw==
X-Received: by 2002:adf:e646:0:b0:1f1:d6fa:2bc6 with SMTP id
 b6-20020adfe646000000b001f1d6fa2bc6mr16753179wrn.458.1647280655105;
        Mon, 14 Mar 2022 10:57:35 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5edf:6bc1:541a:c26f])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c2c4c00b003816932de9csm166718wmg.24.2022.03.14.10.57.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 10:57:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] shadow-native: Simplify and fix syslog disable patch
Date: Mon, 14 Mar 2022 17:57:32 +0000
Message-Id: <20220314175732.827665-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314175732.827665-1-richard.purdie@linuxfoundation.org>
References: <20220314175732.827665-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 17:57:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163162

Shadow is happily spamming the host syslog with messages and shouldn't be
which suggests the patch isn't working. Redo it to work at the configure
level which is simpler and hopefully more effective.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch | 122 ++----------------
 1 file changed, 13 insertions(+), 109 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index 4d6f6d68ec2..23640824f14 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -13,112 +13,16 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
----
- src/groupadd.c  | 3 +++
- src/groupdel.c  | 3 +++
- src/groupmems.c | 3 +++
- src/groupmod.c  | 3 +++
- src/useradd.c   | 3 +++
- src/userdel.c   | 4 ++++
- src/usermod.c   | 3 +++
- 7 files changed, 22 insertions(+)
-
-diff --git a/src/groupadd.c b/src/groupadd.c
-index 66ccb53..776ea51 100644
---- a/src/groupadd.c
-+++ b/src/groupadd.c
-@@ -11,6 +11,9 @@
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
-index c84faa7..1076f4b 100644
---- a/src/groupdel.c
-+++ b/src/groupdel.c
-@@ -11,6 +11,9 @@
- 
- #ident "$Id$"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <ctype.h>
- #include <fcntl.h>
- #include <grp.h>
-diff --git a/src/groupmems.c b/src/groupmems.c
-index a0e3266..6540cb1 100644
---- a/src/groupmems.c
-+++ b/src/groupmems.c
-@@ -9,6 +9,9 @@
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
-index 006eca1..78b1ad6 100644
---- a/src/groupmod.c
-+++ b/src/groupmod.c
-@@ -11,6 +11,9 @@
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
-index 456b9de..2b0d703 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -11,6 +11,9 @@
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
-index 7012b0e..08bb5d1 100644
---- a/src/userdel.c
-+++ b/src/userdel.c
-@@ -8,6 +8,10 @@
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
-index 9473a7d..7d4f7b5 100644
---- a/src/usermod.c
-+++ b/src/usermod.c
-@@ -11,6 +11,9 @@
- 
- #ident "$Id$"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
+Index: shadow-4.11.1/configure.ac
+===================================================================
+--- shadow-4.11.1.orig/configure.ac
++++ shadow-4.11.1/configure.ac
+@@ -204,7 +204,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$sha
+ 	[Path to passwd program.])
+ 
+ dnl XXX - quick hack, should disappear before anyone notices :).
+-AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
++AC_DEFINE(USE_SYSLOG, 0, [Define to use syslog().])
+ if test "$ac_cv_func_ruserok" = "yes"; then
+ 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
+ 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
-- 
2.32.0


