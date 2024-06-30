Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A69BC3065C
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:59 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.4272.1719778134239931253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BNhXcfmV;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.175, mailfrom: steve@sakoman.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-375daa47685so9318065ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778133; x=1720382933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQxq2Bx6aVz3oGHJLOOwHrGYUoJct/wEXxqf8EyWJV0=;
        b=BNhXcfmVA9mARt5ema/IOkwAMJfzj+kubmxQxrN4SziYy06SdDt7xW0pxjbIhogQ4Z
         QiaoKDd+LGYU8YPp79BiXJWf88/f5MiVnSr8odnob+irwAP4pKqxBCqglVSskPISzeFi
         dGcrRmQmJMjZYGUrMntgpDCWO5zvPvbQ7Nq13mpY2wpNPyU5FvBOOQPjXt2alndxMNqG
         KMsXJ5mHDPgCxtQiJv1GK3yHWVkmefkg/u2lkR/yIRqRqjGTnEm5K9L7B0FVaAQePzuX
         pScUx+n5A/97Xdy/Kz6MH3jNKGWN8cSAiu/+poXiLnNBnEwzmFT2Hw56C1sTmxPbpH7P
         Vvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778133; x=1720382933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQxq2Bx6aVz3oGHJLOOwHrGYUoJct/wEXxqf8EyWJV0=;
        b=B+z10mMigjVG/nkTcGuNphX2+LQIXiAWWbRNrazaUW0TevUIp/EpBsGivO3xydh0B+
         kV+F3th6IWnv9M3bZb4800wf/ynz2ufJqj1G8NxKI2/STYU0ZB5f4NAxo0dXSn/LR6BF
         qEfps7qJmD0/pcxTCaEOkk6pgRNGQUPLdV5Y5tzaF+ZTCUlueHbOyZxkmBrS8HhXv2Bk
         bhlV8nM/1XNi5bgr+SvFLxyfp18Jwi+tC6dZiUbV4E+Gms+GIybp/8ZCmHrHKLTD9a7K
         sjlVAkMAO6Sh/u041w/53rsFjz6iP40Eb8dK0mge6wSSe2PMoPW1rKaMpskbzZ3g1PhQ
         tGcw==
X-Gm-Message-State: AOJu0YykskWjKnifruFcE43e1MtykwC/vMKfOHAW05nsiFkDHQcbCs4H
	7LA4D19jG2dkBOvzbiH9PyYpNHAxoR5R+B/oYi1p4SWn4pQiGFRx9G9KrUvs/967v+XAK+UoVfT
	Eseo=
X-Google-Smtp-Source: AGHT+IFxI0dq+RM60WSfAAX+N1zYoYJDhAvv5TIwsGBw8c9aCk5tgnooaQbhdoH1m7bmjFXfMBJtkw==
X-Received: by 2002:a05:6e02:17c5:b0:375:deb0:4c4f with SMTP id e9e14a558f8ab-37cd31b7cb5mr47808415ab.31.1719778133273;
        Sun, 30 Jun 2024 13:08:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/35] bash: fix configure checks that fail with GCC 14.1
Date: Sun, 30 Jun 2024 13:07:45 -0700
Message-Id: <fbb297b34566b9cf7416b5ffeb296f892b5543a0.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201270

From: Ross Burton <ross.burton@arm.com>

These configure checks cause compiler errors with GCC 14.1, so they always
fail.  Backport fixes from upstream to solve this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 921479032720707f4817e3398e516724bc48b33c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bash/bash/0001-fix-c99.patch              | 41 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.2.21.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-fix-c99.patch

diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
new file mode 100644
index 0000000000..aa810f7d4e
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -0,0 +1,41 @@
+From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 19 Jun 2024 12:57:39 +0000
+Subject: [PATCH] Fix C99 problems
+
+Backport some fixes from upstream to fix configure checks that fail with GCC 14.1.
+
+Upstream-Status: Backport [devel branch]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ aclocal.m4   | 3 +++
+ configure.ac | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index cc97bd4..7423b99 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -238,6 +238,9 @@ AC_CACHE_VAL(bash_cv_dup2_broken,
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <stdlib.h>
++#ifdef HAVE_UNISTD_H
++# include <unistd.h>
++#endif /* HAVE_UNISTD_H */
+ int
+ main()
+ {
+diff --git a/configure.ac b/configure.ac
+index a3b5bd7..2a38c6b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
+ 	[AC_COMPILE_IFELSE(
+ 		[AC_LANG_PROGRAM(
+ 		[[#include <stdlib.h>]],
+-		[[long double r; char *foo, bar; r = strtold(foo, &bar);]]
++		[[long double r; char *foo, *bar; r = strtold(foo, &bar);]]
+ 	)],
+ 	[bash_cv_strtold_broken=no],[bash_cv_strtold_broken=yes])
+         ]
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 532adf4c1a..ccfe5c47a7 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
            file://fix-filesubst-errexit.patch \
+           file://0001-fix-c99.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
-- 
2.34.1


