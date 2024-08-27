Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E68BC54740
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.70880.1724736251956618825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/iBO/RV;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428e0d18666so43071295e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736250; x=1725341050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKQAZ9ot5peHQhrnhmaqNjhRegeEqVtmSExxcSalkl4=;
        b=B/iBO/RV1ZSZ+nGEGSEEXPSYKWX+NqO5776CWv1SaSq8U6/0lJCf5Dn6X301wPfwOc
         YH0ZyJLWQOM7h1ZIGxM9EdxEmpTtkdp4loMjeNhvnAS5MvSu72jTWg6sjgf6ZKjb2gQf
         Ht8qqLBxZKGfb6cr4JU4vg6aC3gP0tX0ayOU0Wo8BIuIwbYetBhRHcMkYiHqgd/BxEPc
         DMrhzaQKXjpQTwRGA810adktvteVRa6iSF41pR8gDNb0/ED5zHQH7Lp38r8iQK3Pwg1T
         h+u5Jl+/T3it8fI33XdmB6hIDMEJuYU4nvJaW5mFdAez2v3o314jvRfGFLw7AW/dqf7F
         yCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736250; x=1725341050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKQAZ9ot5peHQhrnhmaqNjhRegeEqVtmSExxcSalkl4=;
        b=b8ngVySQZkBe/x6dSNZxAfRLsuhzHfVXvz4akDK3M4JHpI41EMTsZzjCLfZ6sfTotG
         jOhcFITT4O4thu0CfYKK0VS3jY+UretYwrejvkkQnUkqtfLzXMg5suo+aNhrP5uKwRDZ
         gcaoyxh5c2BwgJUgR91GTEw6xvqq6j9AyYB5SCcWGKr5gwqhBCbOYJEZv7ZWOPtjea3o
         Rqydbtbj496bp4ZLOGIktz6kPaM6mVbi1KJEVzLmVoz7TwnaOFtogYtemIY44nbO6nr6
         IjRcvk2Q7JpWBcEQnDgR3St3pvlKq8A0VpNOI6X4shkbBNBCTECve87/r0LCA051o/9v
         pAnw==
X-Gm-Message-State: AOJu0Yz8O4dFMSpKvCbBp54XlPT/N9Fr0u9hY1T57vMrfbUZVKUNuXws
	mizbeEuQwhU9dlwVrNwwK1FcfPCloF0O4BvIzYTzL+wtNrCy6xSNmyQvXg==
X-Google-Smtp-Source: AGHT+IHxVj+80dqyoKgqcQYcVNK704HJ1hlFQgFt6XCAf6C3MXGIMmqA7r3I3EoiBQKP/IUjWKxvpg==
X-Received: by 2002:adf:8b51:0:b0:371:a8a3:f97c with SMTP id ffacd0b85a97d-3748c7c7846mr1004619f8f.6.1724736249964;
        Mon, 26 Aug 2024 22:24:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/34] libksba: update 1.6.6 -> 1.6.7
Date: Tue, 27 Aug 2024 07:23:41 +0200
Message-Id: <20240827052354.1319810-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203796

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libksba/ksba-add-pkgconfig-support.patch  | 22 ++++++++++---------
 .../{libksba_1.6.6.bb => libksba_1.6.7.bb}    |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.6.bb => libksba_1.6.7.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index bdb80ff34d0..468fbd76f89 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From ca8174aa81d7bf364b33f7254a9e887735c4996d Mon Sep 17 00:00:00 2001
+From 46c0582d1087220e9404a14a851085b8f29773c4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -10,19 +10,20 @@ This patch is rejected by upstream for the reason below:
 They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
- src/ksba.m4 | 90 +++--------------------------------------------------
- 1 file changed, 4 insertions(+), 86 deletions(-)
+ src/ksba.m4 | 93 +++--------------------------------------------------
+ 1 file changed, 5 insertions(+), 88 deletions(-)
 
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index 452c245..aa96255 100644
+index 80f0d38..8f8761a 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
-@@ -23,37 +23,6 @@ dnl with a changed API.
+@@ -107,39 +107,7 @@ dnl this features allows to prevent build against newer versions of libksba
+ dnl with a changed API.
  dnl
  AC_DEFUN([AM_PATH_KSBA],
- [ AC_REQUIRE([AC_CANONICAL_HOST])
+-[ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-  AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
 -  dnl --with-libksba-prefix=PFX is the preferred name for this option,
 -  dnl since that is consistent with how our three siblings use the directory/
 -  dnl package name in --with-$dir_name-prefix=PFX.
@@ -54,10 +55,11 @@ index 452c245..aa96255 100644
 -  if test -z "$use_gpgrt_config"; then
 -    AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)
 -  fi
++[ AC_REQUIRE([AC_CANONICAL_HOST])
  
    tmp=ifelse([$1], ,1:1.0.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -64,56 +33,13 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -150,56 +118,13 @@ AC_DEFUN([AM_PATH_KSBA],
       min_ksba_version="$tmp"
    fi
  
@@ -117,7 +119,7 @@ index 452c245..aa96255 100644
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([KSBA API version])
             if test "$req_ksba_api" -eq "$tmp" ; then
-@@ -126,14 +52,8 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -212,14 +137,8 @@ AC_DEFUN([AM_PATH_KSBA],
       fi
    fi
    if test $ok = yes; then
@@ -133,7 +135,7 @@ index 452c245..aa96255 100644
      if test x"$libksba_config_host" != xnone ; then
        if test x"$libksba_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -147,8 +67,6 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -233,8 +152,6 @@ AC_DEFUN([AM_PATH_KSBA],
        fi
      fi
    else
diff --git a/meta/recipes-support/libksba/libksba_1.6.6.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.6.bb
rename to meta/recipes-support/libksba/libksba_1.6.7.bb
index 2230a032f6b..b7a9fc40502 100644
--- a/meta/recipes-support/libksba/libksba_1.6.6.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4"
+SRC_URI[sha256sum] = "cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.39.2


