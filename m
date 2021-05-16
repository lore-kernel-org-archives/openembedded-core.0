Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.11563.1621204370666029591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VMUkYX9G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x8so4446974wrq.9
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LITQSAdSN0U0Bd3Nn1JUeclciz7saUAwUU57QXf3zo=;
        b=VMUkYX9GkNSRTMQoCkPvp+vte62okJf1K6HM+v/YcndOd797o8ItYK2xR+1o6SJQ9S
         7f5VY34P7HdCnINz/niz86S/njUkTaIYDJfFJPaWshFx41BCtP6i7fCALREZN1am0oXs
         fuocqxn3HuGt8JeUzjXgfLDnw7ksatPKtCT7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LITQSAdSN0U0Bd3Nn1JUeclciz7saUAwUU57QXf3zo=;
        b=Sg9+hITRX4EDAleN7wAuT9S7OL2Jc9TRhQgx5oQBkwz5tmLlaTSPqiTJbPwBtneeOf
         ckhVaIj2yj+BGtWF0XPhVfwcfJozvFFiLVWvsLHjhkp3iUViDVXH+tubWVCJPDk0sKyn
         BbimYnmhEc/ehNCUEcah5bAOlyJlW4hVh9mqzQ43Qty6T25nwd3gDyXR0hFIpWyLqwQm
         B4ZPQ4S+cO4bAHohCFZAmpGuAt3FzZdCedQ/EttNHu20/s6MK3flZqAvDNX+/j7c+Jkk
         0MhAWOnjrBDHCoSxjNGa/xIj7+3FrfwuIUhojknnuZQahs3RU5ZUOBJBeJqyXL47IK95
         yCjw==
X-Gm-Message-State: AOAM532Lw8cdjkw28EP2klQ2lQ6Bk0Ahd7fa+8i8j0mACo+acxAcOmrf
	zoe0wihUT+6/uWQ5EWCBoFV+q3yVdUejlg==
X-Google-Smtp-Source: ABdhPJxmqn9xe+EMkk4vzdXIKMUs48DQ3h/WNx2umZP2oISxOz64ix12cdIV71qTmPLSlHE6sYzQkQ==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr5515065wrm.194.1621204368767;
        Sun, 16 May 2021 15:32:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/27] libxcrypt-compat: upgrade 4.4.19 -> 4.4.20
Date: Sun, 16 May 2021 23:32:21 +0100
Message-Id: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxcrypt/files/fix_cflags_handling.patch   | 17 +++++++++++++----
 ...pat_4.4.19.bb => libxcrypt-compat_4.4.20.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc       |  2 +-
 3 files changed, 14 insertions(+), 5 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.19.bb => libxcrypt-compat_4.4.20.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 5448fe0fa69..0772998c722 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,3 +1,8 @@
+From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 30 Apr 2021 10:35:02 +0100
+Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
+
 If you pass CFLAGS with a leading space, " " gets passed to popen and convinces
 gcc to try and open a file called " ". This results in a confusing error message
 like:
@@ -9,8 +14,12 @@ Avoid this by stripping empty elements out of CFLAGS.
 Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: a/build-aux/compute-symver-floor
-===================================================================
+---
+ build-aux/compute-symver-floor | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-floor
+index 4ec82e1..8117342 100644
 --- a/build-aux/compute-symver-floor
 +++ b/build-aux/compute-symver-floor
 @@ -36,6 +36,8 @@ sub preprocessor_check {
@@ -20,5 +29,5 @@ Index: a/build-aux/compute-symver-floor
 +        # Remove empty elements, particularly leading ones which cause issues with popen below
 +        @CFLAGS = grep {$_} @CFLAGS;
  
-         # We call ensure_C_locale here, not from the main section,
-         # because this sub might not get called at all, in which
+         # Remove empty elements, particularly leading ones which
+         # cause issues with popen below.
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 694e55546f0..c16068c1614 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "c79119414d7e30017d7b49566e7e4ea35112bdc8"
+SRCREV = "e73ff0137de5152e69e8abb0bd260541804dfe5a"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.30.2

