Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.10970.1612881282127820770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U6oIA61Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id b3so22119583wrj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 06:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntjEVR4Xk/JRIPVDTnukg9At6lN9CEY+xYlosINqNn4=;
        b=U6oIA61QT70op/o4geC3M2oxRe3xumwJeUhGOy8TMqpEPWuaTH41HrAHsDF/LD/r3a
         EcOWKYlOkDQgQersCN6VmOn0WnhLS5H0r64JHQR0fCYkb8kDuq2ayT5vKC7QuBKm0eAx
         6siavVOqnrYwvOzj0r0BCR2sJieV/EzQT6/eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntjEVR4Xk/JRIPVDTnukg9At6lN9CEY+xYlosINqNn4=;
        b=Cl+FSYgp08TNk+FnkjnbJvKuIXK9Hixi9eQgbwB/52gCge2EWxu4r5ndgfN7IqUkYE
         jFr42/Hu6mlZg5iVI6SjDmGOrznxyx0J9QWbQkLxNYlFz300E8OIVMluFfBjFjlxwnfb
         EaaL6mnpRpDO++GeEbmmHm8qZ/ofU9rueky0Z3WHxfhT31iEeswmbW6dB02+WlGWPwGa
         V9Fbb86Iji34vdxYUszoSJOuLGRoHP5GDi3cnKXXusg+p6DicREpIZqeYNNU8mj4MuZb
         O3zjIfpD0kqYGutzRO6cTFAGQYSbqqqNs6TUd7XQPR02eQClwlnCzsSEYnhDohOkVytT
         kE2Q==
X-Gm-Message-State: AOAM5309w+BNz9jyffXRDquDQoSEU4aC5S2S/kgJj23OqjSZJ7P733oX
	CqNnd5DICmxMtoXXHn7K+lV2Rdtt+8YIqg==
X-Google-Smtp-Source: ABdhPJwigdxfHm8DUbnA423rPFvxL9e1uUqUKgTp5qdLrq+PzpDMPiGKBBrNOX3t6iJ13FHdlzUW+A==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr26171202wrq.425.1612881280556;
        Tue, 09 Feb 2021 06:34:40 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c])
        by smtp.gmail.com with ESMTPSA id v15sm11138838wra.61.2021.02.09.06.34.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 06:34:40 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] opkg: Fix patch glitches
Date: Tue,  9 Feb 2021 14:34:39 +0000
Message-Id: <20210209143439.1807422-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original patch contained some text which shouldn't have been there
and used brackets in configure which isn't a great idea. Tweak the patch
to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
index 285d258c635..6d0b1486ad3 100644
--- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
@@ -9,13 +9,12 @@ Index: opkg-0.4.4/configure.ac
 ===================================================================
 --- opkg-0.4.4.orig/configure.ac
 +++ opkg-0.4.4/configure.ac
-@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
+@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL
  AC_FUNC_VPRINTF
  AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
  
 -CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-+1607446883
-+if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
++if ! -z "$SOURCE_DATE_EPOCH" ; then
 +    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
 +else
 +    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-- 
2.27.0

