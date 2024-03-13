Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB0DC54E6E
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.2049.1710351231983902279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OjYGFTBu;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso153153e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351230; x=1710956030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuJi8shGGAKb3St6/UV+DZCpd91/EifcbNEs2DIq5LM=;
        b=OjYGFTBuWy+8e158YDcLBV/xvRUYcFikMi+bALbcL562fBPMMlkOW8DuRZju1mlfHF
         8t3n2IIppBBAjb2GoVP9xtLtVnxAiBH+XvTtlnMFwiF8AJbMTPGUgmcmlsgAmi5BaWBM
         tFYKg9l7KGLandZBP+Xm5Z6sPCxaFXLLlXUnMrma9QlbR0PNdc0wjtU4PeDiL4GfhV9M
         aNmaX21SOIP8niRdhtjhxOMprrnU1NEG/zz1rAlAIuEXfrp8svxQPhmiuAT600/Mraro
         oqVoueiO6BorvEAZoV7DsIZCQpxPEeJdm3mj0kyF/8tQb3xGBihiWI5iOyGaZN2lvr5J
         XMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351230; x=1710956030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuJi8shGGAKb3St6/UV+DZCpd91/EifcbNEs2DIq5LM=;
        b=K6jxmdnM6/0gMVFTKzFa+GgKDdHGBFwZoqFG8U03lehOqpSNHJuXqa2v0TSnoCjsQl
         XrgOfpnIYQs03IMY5AqhaDqbkkFMJQ5suNCMnGEEutNIFLN9A5qgP9kklc1nOjRRv8qo
         +M/JtiDRwSqVfktNR1C/dzfpgbnfb1yM+pqKMPx25FYrBSb3HF5OXwRzyqXE8jV51FJL
         Oodn4g0wNLOiuDw/0XmD+eITQTugLYe3AU/W5M3AimonQiMA4WeVHPz67V4LxXNvUzi2
         N9rMmF43+o//F/dJzzm3TDfKEwsop7tO51r2q6hL/aYLD8qhA8U4pnzQi47cjZcmGZV4
         5aKg==
X-Gm-Message-State: AOJu0Ywww2MnmQ/Nfb2dgefXixTUsblcvOK30GeJXaJq/apF+uPm3VYF
	rCP9fby8lkA2bkHdvjzufPyaN/7w+K6Qn1tomUK41DJyQjqHAlyDX6EHE6j8
X-Google-Smtp-Source: AGHT+IHim6G8JjQ2sw3l1zNBIY35DtuQEInxs/X12n8ozLvo2UFLg90CimlJjbOLjiy2QY3m+Q5m6A==
X-Received: by 2002:a19:5219:0:b0:513:c813:a9f9 with SMTP id m25-20020a195219000000b00513c813a9f9mr1920927lfb.21.1710351230133;
        Wed, 13 Mar 2024 10:33:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/21] shadow: update 4.14.2 -> 4.15.0
Date: Wed, 13 Mar 2024 18:33:32 +0100
Message-Id: <20240313173336.3900178-17-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197069

libcrack support was dropped.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nexpected-open-failure-in-chroot-env.patch |  9 +--
 .../shadow/files/shadow-update-pam-conf.patch | 79 ++++++++++++-------
 meta/recipes-extended/shadow/shadow.inc       |  4 +-
 .../{shadow_4.14.2.bb => shadow_4.15.0.bb}    |  0
 4 files changed, 57 insertions(+), 35 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.14.2.bb => shadow_4.15.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 4a932d2dbb1..cd99aad135c 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From a773c6b240d27e23d6be41decef0edf24fcee523 Mon Sep 17 00:00:00 2001
+From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 73fdb3a..d1231e9 100644
+index 01a26c9..82b2868 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -606,10 +606,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -601,10 +601,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
@@ -46,6 +46,3 @@ index 73fdb3a..d1231e9 100644
  	db->fp = NULL;
  	if (fd >= 0) {
  #ifdef WITH_TCB
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 3b61b75e5bb..1eacb8a53fe 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,3 +1,8 @@
+From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From: Kang Kai <kai.kang@windriver.com>
+Date: Wed, 20 Jul 2011 19:18:14 +0800
+Subject: [PATCH] shadow: update pam related configure files
+
 The system-auth in the configure files is from Fedora which put all the 4 pam type rules
 in one file.
 In yocto it obey the way with Debian/Ubuntu, and the names are common-auth, common-account,
@@ -9,82 +14,102 @@ See meta/recipes-extended/pam/libpam/pam.d/common-password
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
+---
+ etc/pam.d/chage     | 2 +-
+ etc/pam.d/chgpasswd | 2 +-
+ etc/pam.d/groupadd  | 2 +-
+ etc/pam.d/groupdel  | 2 +-
+ etc/pam.d/groupmems | 2 +-
+ etc/pam.d/groupmod  | 2 +-
+ etc/pam.d/useradd   | 2 +-
+ etc/pam.d/userdel   | 2 +-
+ etc/pam.d/usermod   | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
 
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chage shadow-4.1.4.3/etc/pam.d/chage
---- shadow-4.1.4.3/etc/pam.d.orig/chage	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/chage	2011-07-20 19:03:08.964844958 +0800
+diff --git a/etc/pam.d/chage b/etc/pam.d/chage
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/chage
++++ b/etc/pam.d/chage
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chgpasswd shadow-4.1.4.3/etc/pam.d/chgpasswd
---- shadow-4.1.4.3/etc/pam.d.orig/chgpasswd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/chgpasswd	2011-07-20 19:03:26.544844958 +0800
+diff --git a/etc/pam.d/chgpasswd b/etc/pam.d/chgpasswd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/chgpasswd
++++ b/etc/pam.d/chgpasswd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupadd shadow-4.1.4.3/etc/pam.d/groupadd
---- shadow-4.1.4.3/etc/pam.d.orig/groupadd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupadd	2011-07-20 19:04:08.124844958 +0800
+diff --git a/etc/pam.d/groupadd b/etc/pam.d/groupadd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupadd
++++ b/etc/pam.d/groupadd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupdel shadow-4.1.4.3/etc/pam.d/groupdel
---- shadow-4.1.4.3/etc/pam.d.orig/groupdel	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupdel	2011-07-20 19:04:26.114844958 +0800
+diff --git a/etc/pam.d/groupdel b/etc/pam.d/groupdel
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupdel
++++ b/etc/pam.d/groupdel
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmems shadow-4.1.4.3/etc/pam.d/groupmems
---- shadow-4.1.4.3/etc/pam.d.orig/groupmems	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupmems	2011-07-20 19:04:35.074844958 +0800
+diff --git a/etc/pam.d/groupmems b/etc/pam.d/groupmems
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupmems
++++ b/etc/pam.d/groupmems
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmod shadow-4.1.4.3/etc/pam.d/groupmod
---- shadow-4.1.4.3/etc/pam.d.orig/groupmod	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupmod	2011-07-20 19:04:44.864844958 +0800
+diff --git a/etc/pam.d/groupmod b/etc/pam.d/groupmod
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupmod
++++ b/etc/pam.d/groupmod
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/useradd shadow-4.1.4.3/etc/pam.d/useradd
---- shadow-4.1.4.3/etc/pam.d.orig/useradd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/useradd	2011-07-20 19:07:26.244844958 +0800
+diff --git a/etc/pam.d/useradd b/etc/pam.d/useradd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/useradd
++++ b/etc/pam.d/useradd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/userdel shadow-4.1.4.3/etc/pam.d/userdel
---- shadow-4.1.4.3/etc/pam.d.orig/userdel	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/userdel	2011-07-20 19:07:35.734844958 +0800
+diff --git a/etc/pam.d/userdel b/etc/pam.d/userdel
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/userdel
++++ b/etc/pam.d/userdel
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/usermod shadow-4.1.4.3/etc/pam.d/usermod
---- shadow-4.1.4.3/etc/pam.d.orig/usermod	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/usermod	2011-07-20 19:07:42.024844958 +0800
+diff --git a/etc/pam.d/usermod b/etc/pam.d/usermod
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/usermod
++++ b/etc/pam.d/usermod
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 16b99a0b60e..c4769f3f535 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
+SRC_URI[sha256sum] = "377fe0d7c1a0aa5e3514c08fdf5ddc70c9dcbb391678c2134445ed97326bcc26"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
@@ -39,7 +39,7 @@ inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL="/bin/sh"
 
-EXTRA_OECONF += "--without-libcrack \
+EXTRA_OECONF += " \
                  --with-group-name-max-length=24 \
                  --enable-subordinate-ids=yes \
                  --without-sssd \
diff --git a/meta/recipes-extended/shadow/shadow_4.14.2.bb b/meta/recipes-extended/shadow/shadow_4.15.0.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.14.2.bb
rename to meta/recipes-extended/shadow/shadow_4.15.0.bb
-- 
2.39.2


