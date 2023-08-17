Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539DFEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:10:58 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.183222.1692263454800634726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WlbtjF44;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bed101b70so1008109466b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692263453; x=1692868253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PT66CI3CeYRt1aYwVED7Fyf4zcUo1Fod3agNvWG2/wo=;
        b=WlbtjF44qY05RVcbm61ez7ftWFLzZPGJ5X55J19z+tWGqQtfOAHCo5vkH+Nj7ZLVIa
         qFsN9Ck7REz7g3aDGf5FCWS04uBeG0ag4thpP4newxOzD7uJpLauFtE7R18nG3pN2Q3v
         iIzeIqt5QVWuzJo6eALb/BSAwhYBvLm3nHix3GkSuZnSbfjIeePUwc4rmu25hOuF4CUq
         khimKTXpd8ied4HDVdI4r3Dt2i4D+OCfSfYdqpBO0VGPeG6OnGVLU6ZktTA7tC6jVsOc
         vlKkjUh0BBwVykEjS/jxBnz0XYD/BXEGaxaqltr9T6DrGOp4mOyTGY9mPQZGXeTtctz7
         TYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692263453; x=1692868253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT66CI3CeYRt1aYwVED7Fyf4zcUo1Fod3agNvWG2/wo=;
        b=CXAPNDm1iVcXYC5JmiqMJBIWHPJM/1kVNj3tlsMBYKCog71sGRTkubn9c4YSECscWG
         0jjfycGiT0dubCV9oH4WYqXgV6/foJtxSro9MesscPsHPXaiPahP7Ula9BzY2MP9Ihdu
         Qzd1jNIrmyPbKWchtcO4S5y35rrRdHdzfkpHat8bMej5wj5kcsnzbkyqO7FSttFZzK9t
         PTF02DqTfCvD4d1IftPR2dCFy/IehNsG/gURa1TRmb12VOnDz0So5TEZiWQVv7sgsCPM
         eI1XdA0p25ePnEHXNhplWIQwOvlGr7lpa5KJwXgjiJJ+u/tj0DW4b7jvZqhYIE6R89KO
         k+Wg==
X-Gm-Message-State: AOJu0YyfDfzVrNATm94KYVEp1LDIXMyIP63tUHEJtj7Qy2CNogz+ZqlI
	T6jy7E904mDAe0GHfYtPvWaHYRE99XA=
X-Google-Smtp-Source: AGHT+IF9pVWc9fFHYEAZM2TzyJOgVa7a47YgR68Rn8+wTgQYZZXGMPqVCua8HYzrpYji8t/WWgYOjQ==
X-Received: by 2002:a17:906:104d:b0:99c:47a:8bcd with SMTP id j13-20020a170906104d00b0099c047a8bcdmr3542521ejj.67.1692263452873;
        Thu, 17 Aug 2023 02:10:52 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lh25-20020a170906f8d900b0098dfec235ccsm9794170ejb.47.2023.08.17.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 02:10:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] cross-localedef-native: fix build on hosts with older glibc
Date: Thu, 17 Aug 2023 11:10:40 +0200
Message-ID: <20230817091040.3262596-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 09:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186299

Older glibc on host might be missing __glibc_has_attribute added in glibc-2.34 with:

https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=misc/sys/cdefs.h;h=8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=57ca262bdfb642bf4a945645532f2319ec1ff437;hb=c8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=7dd416491e080456fc7742d884c520526509413e

Fixes:
In file included from ../git/localedef/include/programs/xmalloc.h:21,
                 from glibc/locale/programs/localedef.h:124,
                 from glibc/locale/programs/localedef.c:36:
../git/localedef/include/sys/cdefs.h:85:51: error: missing binary operator before token "("
   85 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__cold__)
      |                                                   ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../glibc/cross-localedef-native_2.38.bb      |  1 +
 ...cdefs.h-define-__glibc_has_attribute.patch | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has_attribute.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.38.bb b/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
index e7261a644b..673008c57a 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
+           file://0003-localedef-cdefs.h-define-__glibc_has_attribute.patch;patchdir=localedef \
            \
            file://0010-eglibc-Cross-building-and-testing-instructions.patch \
            file://0011-eglibc-Help-bootstrap-cross-toolchain.patch \
diff --git a/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has_attribute.patch b/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has_attribute.patch
new file mode 100644
index 0000000000..d34651e275
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has_attribute.patch
@@ -0,0 +1,51 @@
+From a90ba625410f8b49205adbe03652bc2fd0c35cec Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 17 Aug 2023 01:23:59 +0200
+Subject: [PATCH] cdefs.h: define __glibc_has_attribute
+
+Older glibc on host might be missing __glibc_has_attribute added in glibc-2.34 with:
+
+https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=misc/sys/cdefs.h;h=8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=57ca262bdfb642bf4a945645532f2319ec1ff437;hb=c8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=7dd416491e080456fc7742d884c520526509413e
+
+Fixes:
+In file included from ../git/localedef/include/programs/xmalloc.h:21,
+                 from glibc/locale/programs/localedef.h:124,
+                 from glibc/locale/programs/localedef.c:36:
+../git/localedef/include/sys/cdefs.h:85:51: error: missing binary operator before token "("
+   85 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__cold__)
+      |                                                   ^
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/kraj/localedef/pull/4]
+---
+ include/sys/cdefs.h | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/include/sys/cdefs.h b/include/sys/cdefs.h
+index 0f32fdb..8530054 100644
+--- a/include/sys/cdefs.h
++++ b/include/sys/cdefs.h
+@@ -37,6 +37,23 @@
+ #endif
+ #endif
+ 
++#if !defined __glibc_has_attribute
++/* Older glibc on host might be missing __glibc_has_attribute added in glibc-2.34 with:
++   https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=misc/sys/cdefs.h;h=8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=57ca262bdfb642bf4a945645532f2319ec1ff437;hb=c8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=7dd416491e080456fc7742d884c520526509413e
++*/
++/* Compilers that lack __has_attribute may object to
++       #if defined __has_attribute && __has_attribute (...)
++   even though they do not need to evaluate the right-hand side of the &&.
++   Similarly for __has_builtin, etc.  */
++#if (defined __has_attribute \
++     && (!defined __clang_minor__ \
++         || 3 < __clang_major__ + (5 <= __clang_minor__)))
++# define __glibc_has_attribute(attr) __has_attribute (attr)
++#else
++# define __glibc_has_attribute(attr) 0
++#endif
++#endif
++
+ #if !defined(__REDIRECT_NTH) && defined(__GNUC__) && __GNUC__ >= 2
+ # ifdef __cplusplus
+ #  define __REDIRECT_NTH(name, proto, alias) \
-- 
2.41.0


