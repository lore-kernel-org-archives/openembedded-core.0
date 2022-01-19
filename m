Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04706C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.4793.1642588899994054418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=onPOqREC;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so4316046wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j17jfTKplf8BPs6tpFmbxpIyzTUqj6RHI3IgU1ZR5p8=;
        b=onPOqRECL7+QqiLk9nom49wza+xSP0lGjFmJP+jMNOSG7SMG34XQlsmEpyOG9F36Uo
         zx/eni/kjnPXlL7kGrtCt8IDzA1e8YOtbTybL96ZARzjZUKvXFvQOCFFm1Q1zNst/lxW
         eMvCi6DI2amCDXBGVdgGyAxNUQyp8DmTV4oI07h3/w84FqF0QqZRMj/DEDFhEeb3yhhW
         +okyj2h4GPcONOvFEEBE3W5deBPCeTndliPPuJQFGUMT62/ajrs9iDtsHgvyOYZVCT/+
         RZ+0BJAJGUtZ/tH6z4DMjXEzwdbX7VRdJy+jUpIQY+sJqGE1P7gzWgNdB5R3yVDKO90d
         30uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j17jfTKplf8BPs6tpFmbxpIyzTUqj6RHI3IgU1ZR5p8=;
        b=X8ATs2ZIbrfxKa1Sf89LNMN1VS6b4cEel5f7+1vW1aGBSy7ToKw03iNgQrmu9IuBJd
         iDLaOWOZuyTO/1FB3O7NY0ljEwbNV/PE3NjmPHArMRBt9qVo9kBXMaoAaksAXk6PoAKE
         Tdf3Al69V92ac9+pNxHRL/E1NJUKKhdNGCoFgSg+Xxlj6gZSZi7VIqwlW49NbnmABEsr
         FuHA6ij6WsJlu5KCirYuWhNRAup2n7VG9XJzS4fdNgv2QZUI0z6ID/lG9ItOo/TP3fwg
         dTf4xvtNCu7DSVJskdEkv9Nbd8TzCsv38tcqCFQV8b0LJjgC3MyMjlffGwXMwrcubWRU
         VjfQ==
X-Gm-Message-State: AOAM533ySTj5hUAzmz3gztchb8rxguOa3owNwppRvpUCEPgx+eQTnKuq
	jMXIzXYPnGTojIPhpA4WT5GlvQTHNSE=
X-Google-Smtp-Source: 
 ABdhPJxsM5yMO3w4wFDJZzDcwFAqtvsX0nmVDOC93yaZxYPrjzE64OEiE16ZzpguGOWIAVJftAAS9g==
X-Received: by 2002:adf:dfcd:: with SMTP id
 q13mr28779132wrn.487.1642588898614;
        Wed, 19 Jan 2022 02:41:38 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/39] shadow: upgrade 4.10 -> 4.11.1
Date: Wed, 19 Jan 2022 11:40:56 +0100
Message-Id: <20220119104117.2120127-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160709

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: license clarified to BSD-3-Clause only

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch | 30 +++++++++----------
 ...nexpected-open-failure-in-chroot-env.patch |  6 ++--
 meta/recipes-extended/shadow/shadow.inc       |  8 ++---
 .../{shadow_4.10.bb => shadow_4.11.1.bb}      |  0
 4 files changed, 22 insertions(+), 22 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.10.bb => shadow_4.11.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index 95728bcd3f..4d6f6d68ec 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,4 +1,4 @@
-From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
+From 531cd5ca6eadef29b4799459f1bcfc002ecbd424 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Thu, 14 Apr 2016 12:28:57 +0200
 Subject: [PATCH] Disable use of syslog for sysroot
@@ -24,10 +24,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  7 files changed, 22 insertions(+)
 
 diff --git a/src/groupadd.c b/src/groupadd.c
-index d7f68b1..5fe5f43 100644
+index 66ccb53..776ea51 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
-@@ -34,6 +34,9 @@
+@@ -11,6 +11,9 @@
  
  #ident "$Id$"
  
@@ -38,10 +38,10 @@ index d7f68b1..5fe5f43 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/groupdel.c b/src/groupdel.c
-index 5c89312..2aefc5a 100644
+index c84faa7..1076f4b 100644
 --- a/src/groupdel.c
 +++ b/src/groupdel.c
-@@ -34,6 +34,9 @@
+@@ -11,6 +11,9 @@
  
  #ident "$Id$"
  
@@ -52,10 +52,10 @@ index 5c89312..2aefc5a 100644
  #include <fcntl.h>
  #include <grp.h>
 diff --git a/src/groupmems.c b/src/groupmems.c
-index 654a8f3..6b2026b 100644
+index a0e3266..6540cb1 100644
 --- a/src/groupmems.c
 +++ b/src/groupmems.c
-@@ -32,6 +32,9 @@
+@@ -9,6 +9,9 @@
  
  #include <config.h>
  
@@ -66,10 +66,10 @@ index 654a8f3..6b2026b 100644
  #include <getopt.h>
  #include <grp.h>
 diff --git a/src/groupmod.c b/src/groupmod.c
-index acd6f35..a2c5247 100644
+index 006eca1..78b1ad6 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
-@@ -34,6 +34,9 @@
+@@ -11,6 +11,9 @@
  
  #ident "$Id$"
  
@@ -80,10 +80,10 @@ index acd6f35..a2c5247 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/useradd.c b/src/useradd.c
-index 127177e..b80e505 100644
+index 456b9de..2b0d703 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -34,6 +34,9 @@
+@@ -11,6 +11,9 @@
  
  #ident "$Id$"
  
@@ -94,10 +94,10 @@ index 127177e..b80e505 100644
  #include <ctype.h>
  #include <errno.h>
 diff --git a/src/userdel.c b/src/userdel.c
-index 79a7c89..c1e010a 100644
+index 7012b0e..08bb5d1 100644
 --- a/src/userdel.c
 +++ b/src/userdel.c
-@@ -31,6 +31,10 @@
+@@ -8,6 +8,10 @@
   */
  
  #include <config.h>
@@ -109,10 +109,10 @@ index 79a7c89..c1e010a 100644
  #include <dirent.h>
  #include <errno.h>
 diff --git a/src/usermod.c b/src/usermod.c
-index 03bb9b9..e15fdd4 100644
+index 9473a7d..7d4f7b5 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
-@@ -34,6 +34,9 @@
+@@ -11,6 +11,9 @@
  
  #ident "$Id$"
  
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index bd24626a26..173e8a937d 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From 1422c24f7266b553c82100e3d18a10c55cd91063 Mon Sep 17 00:00:00 2001
+From d767f776e631f1493fd7b266f2026d630ecf70fe Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index cef404b..66908fb 100644
+index 9e0fde6..7c3a1da 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -646,10 +646,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -624,10 +624,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 6d4a77caed..f5fdf436f7 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -3,9 +3,9 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
-LICENSE = "BSD-3-Clause | Artistic-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=24f172951acb1904c9273a6a016b0b36 \
-                    file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af \
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
+                    file://src/passwd.c;beginline=2;endline=30;md5=758c26751513b6795395275969dd3be1 \
                     "
 
 DEPENDS = "virtual/crypt"
@@ -31,7 +31,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
-SRC_URI[sha256sum] = "efa9b89b5901644890dbf230b8e9e3dbcdb51ffb6be145afc57f3012861aeddf"
+SRC_URI[sha256sum] = "f262089be6a1011d50ec7849e14571b7b2e788334368f3dccb718513f17935ed"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.10.bb b/meta/recipes-extended/shadow/shadow_4.11.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.10.bb
rename to meta/recipes-extended/shadow/shadow_4.11.1.bb
-- 
2.20.1


