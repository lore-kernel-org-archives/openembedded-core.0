Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6904DC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:21:57 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.16898.1739370113580949097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NQ5qwDv7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220c8f38febso6595755ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739370113; x=1739974913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+sbI0dexhEgTFFYw/HTdE/liY9C1c6ldEmidt5c2U0=;
        b=NQ5qwDv7lg21VMysTAPulS6YP5VeKr7RFgA2/h5dokBRctJKesMHYd6D91Nt807Ty0
         4e2zwSwSLWZ9jeq7cAY1pe5iWj46+xw0pmGKrEGiEyQEB3iW3EgEyEJrSnt9JcGZEi4D
         FkdgZLr+OvOaGFL90+SGc9SaOYwwUBr73RNu//iT5O0LcsyIRhDVi0+IBioW7BHDPbGR
         bahRnksBOWdSPTJltvj/JJHd39UhJ/rg6u645ZYZpML9WaJKUAGWVrJpyv5+kEzwyyqt
         s76hxSrEhG30Eu/mS9He/QSxsBL3DRNPL2mCiGlDQH87D4rd5EK62igdEi8mtY5mmjMT
         wlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370113; x=1739974913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+sbI0dexhEgTFFYw/HTdE/liY9C1c6ldEmidt5c2U0=;
        b=Ew7swWmeIJK1aRGJQfcRxxH8++LoqtqNSgFoNzUpYjQpKYAppkqwxg0pdnrAzc9AgR
         rYyS5bz3wslnj/6CozanXFk3yU6gVVfhIz9tWXU9sZlkk3Z/ODBtqBinIJNvHFmfpzPu
         sHD0KzwFc4AFxe3BOfItBEAHE9s5J9XFtuR0maVUEijWk5n49rIKYg53bcUOsrW7v9NL
         VP2SNO3+7iFSocB6uluIExHDt+GaLTLex3atHftzVn4QaFRZ/BQn2V0w8HPY7ih5i9nz
         dEQs3Y6py6ctcTZiN1j1q0hkEEf9p+v7/fMKl9BNbbknsX4f0TX/e4/31/jSZDNHeMMn
         +a8Q==
X-Gm-Message-State: AOJu0YwlXi0wvp9CJdVotXkIRBi3KeX0MZP1zToKqYkNgwy3GvzfzI84
	7pv1eGIhEonR6cqR3cVRb0FLyaGUlXWXEWheNXozAgxkDdEgH2Bi1dZfw1l/cCfg19Ik+F93Swb
	j
X-Gm-Gg: ASbGncuuXUbVen2DFwPe3TXQ9jEt1BVSkjjKy4gPg0ojeMwpZO1sCuWxu5SMqfLDYOG
	ZW2tbsd3IIg0ZWueHkxGnawk/ds/WphH35k8d9FAh/Fuo+9n3oOf/4rZz0qGooVBbuBjBqilDwk
	C2og70vpPFKrGLGkWzyJmCOzLmJMqlEshAkVkAU/fWkpcqVr6Ph52/BUr8738M5ETZPG6nYMNK/
	R3NBbu/sSLi3BqbbJyBnLT2Cm2bAXB34J3WxGS2mX6V+TyTtDFFhlLBlLiGQrlpffMxUpTmwZVh
	F0Ux
X-Google-Smtp-Source: AGHT+IF+B+tBBNa9Vjmtsj1kcpTZJaixydRRlz+nnHLmvuDELshm6R2rklPRUnHVhdrBWEbE+M0byA==
X-Received: by 2002:aa7:88c5:0:b0:725:e4b9:a600 with SMTP id d2e1a72fcca58-7322c5febe0mr3533756b3a.16.1739370112822;
        Wed, 12 Feb 2025 06:21:52 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73079facc59sm7445260b3a.123.2025.02.12.06.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] glibc: Suppress GCC -Os warning on user2netname for sunrpc
Date: Wed, 12 Feb 2025 06:21:34 -0800
Message-ID: <78fac0f623e01bd52b2ea3a597d056726deca8a4.1739369945.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739369945.git.steve@sakoman.com>
References: <cover.1739369945.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211238

From: Nikhil R <nikhilr5@kpit.com>

When building with GCC -Os, a warning is triggered indicating that sprintf might overflow.

Error:
  netname.c: In function 'user2netname':
  netname.c:51:28: error: '%s' directive writing up to 255 bytes into a
  region of size between 239 and 249 [-Werror=format-overflow=]
     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
        |                            ^~               ~~~~~~~
  netname.c:51:3: note: 'sprintf' output between 8 and 273 bytes into a
  destination of size 256
     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

However the code does test prior the sprintf call that dfltdom plus
the required extra space for OPSYS, uid, and extra character will not
overflow and return 0 instead.

Upstream-patch: https://github.com/bminor/glibc/commit/6128e82ebe973163d2dd614d31753c88c0c4d645

Reviewed-by: Carlos O'Donell <carlos@redhat.com>
Tested-by: Carlos O'Donell <carlos@redhat.com>
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...press-gcc-os-warning-on-user2netname.patch | 61 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch

diff --git a/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
new file mode 100644
index 0000000000..7068a81518
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
@@ -0,0 +1,61 @@
+From 6128e82ebe973163d2dd614d31753c88c0c4d645 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
+Date: Wed, 21 Sep 2022 10:51:07 -0300
+Subject: [PATCH] sunrpc: Suppress GCC -Os warning on user2netname
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC with -Os warns that sprint might overflow:
+
+  netname.c: In function â€˜user2netnameâ€™:
+  netname.c:51:28: error: â€˜%sâ€™ directive writing up to 255 bytes into a
+  region of size between 239 and 249 [-Werror=format-overflow=]
+     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
+        |                            ^~               ~~~~~~~
+  netname.c:51:3: note: â€˜sprintfâ€™ output between 8 and 273 bytes into a
+  destination of size 256
+     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
+        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  cc1: all warnings being treated as errors
+
+However the code does test prior the sprintf call that dfltdom plus
+the required extra space for OPSYS, uid, and extra character will not
+overflow and return 0 instead.
+
+Checked on x86_64-linux-gnu and i686-linux-gnu.
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Tested-by: Carlos O'Donell <carlos@redhat.com>
+
+Upstream-Status: Backport [https://github.com/bminor/glibc/commit/6128e82ebe973163d2dd614d31753c88c0c4d645]
+Signed-off-by: nikhil <nikhil.r@kpit.com>
+
+---
+ sunrpc/netname.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/sunrpc/netname.c b/sunrpc/netname.c
+index bf7f0b81c43..c1d1c43e502 100644
+--- a/sunrpc/netname.c
++++ b/sunrpc/netname.c
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ #include <rpc/rpc.h>
+ #include <shlib-compat.h>
++#include <libc-diag.h>
+ 
+ #include "nsswitch.h"
+ 
+@@ -48,7 +49,12 @@ user2netname (char netname[MAXNETNAMELEN + 1], const uid_t uid,
+   if ((strlen (dfltdom) + OPSYS_LEN + 3 + MAXIPRINT) > (size_t) MAXNETNAMELEN)
+     return 0;
+ 
++  /* GCC with -Os warns that sprint might overflow while handling dfltdom,
++     however the above test does check if an overflow would happen.  */
++  DIAG_PUSH_NEEDS_COMMENT;
++  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wformat-overflow");
+   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
++  DIAG_POP_NEEDS_COMMENT;
+   i = strlen (netname);
+   if (netname[i - 1] == '.')
+     netname[i - 1] = '\0';
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9400e1e920..d9cae79ac2 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
+           file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


