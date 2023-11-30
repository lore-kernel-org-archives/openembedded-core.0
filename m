Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C968C07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:57:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.5256.1701377864778990804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KyoM8lhm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6cdd4aab5f5so1395729b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377864; x=1701982664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GLTDWSgasL/f8u/SI//2iuDDK6xEf9cUEJ1x61o280=;
        b=KyoM8lhmshbGYS6fJ1J2GZF0pk61Kol1UEACrT518pOfE5yXlEbjPnitbbqCA/YUxn
         FjkhJYpmuRpYRv1yX19hoe7xqIBMO4HHJ5sS+jiRD8/mDFEeeHcvCSCFWf6aX59tnF1V
         uYb/L9eaapXQPIxUs8REBKYjq16ibV4qZvqldbKFOCDMDBy/EjUEF+s4eTpGYxUk2tAO
         Uj35N9ZAPRjIPS2DiIYdLnVioNNK7D+88saVnIi8aJIwI+S2AWo1MDmEs82fd/FXvQMp
         9jqCtOpIKhsxZzfxAwepxGogPSgcoQsMhLs4jF/9b+V60SuYMDo+BUyd9h24EDK0OVf1
         Fy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377864; x=1701982664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GLTDWSgasL/f8u/SI//2iuDDK6xEf9cUEJ1x61o280=;
        b=PaBH4y0twpWUf6tggMb5qE4yOvZJcXc7w4wq5Dn4QD2mLAetK2SVw1fhVyfbODeQVh
         X3xhP5MtF/2SvE/sW7K4mTuz+v9TI17w2peDH021GIr3wD0HCDKoGEMS5IgJRhnuWarJ
         rrlVb+5AIK+U5yapsir0XyB+oZs/3DBGJGbjp/WMyiN3yVAzSzXL6sK41CG0YMFoDSFg
         QgKB+IP9daMiLei7hQ5pD015AAS7zuTai/klFgJNwsGsWEBMkoTcbDHksTKhhBSDc+ZQ
         tvzqi2RUeodqvgeeSPI12Mo8HZb7PDUBzGh8Ut/i36zVUV60YWkn5OYuhRsXel3kv1dl
         coVw==
X-Gm-Message-State: AOJu0YxHDEAA7B675nJO7DIItYgnbX+w/9LAxn/WtQwQZkmTjWOb5YDQ
	G5fuP5BCEPnb2cq+aR5JMcHQbCpDArrUyX8JNKfQ7Q==
X-Google-Smtp-Source: AGHT+IHkj0OXezj/2riEvoUxY6dDVft+c3zK2rlLFMmRkh/pbQLg/zaSzrjhX8eqXmFL4NFA+e/fzg==
X-Received: by 2002:a05:6a20:1608:b0:18c:da:ba0b with SMTP id l8-20020a056a20160800b0018c00daba0bmr27720800pzj.44.1701377863871;
        Thu, 30 Nov 2023 12:57:43 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/25] base-passwd: upgrade 3.6.1 -> 3.6.2
Date: Thu, 30 Nov 2023 10:57:10 -1000
Message-Id: <9dc8a4b219cd8763299ca465e82bd4a5b495ea14.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191520

From: Wang Mingyu <wangmy@fujitsu.com>

base-passwd (3.6.2)

  [ Peter Kjellerstedt ]
  * Make it possible to configure whether to use SELinux or not.

  [ Gioele Barabucci ]
  * d/postinst: Remove code for upgrades from outdated version 3.2.2.
  * d/control: Remove unused w3m build dependency (closes: #1051810).
  * Support <nodoc> build profile (closes: #1051809).

  [ Colin Watson ]
  * Debconf translations:
    - Romanian (thanks, Remus-Gabriel Chelu; closes: #1031149).
    - Swedish (thanks, Peter Kvillegård; closes: #1050440).
  * Explicitly build-depend on docbook, since otherwise the build fails if
    docbook-xml happens to be installed before installing build-dependencies
    (closes: #1033422).

  [ Samuel Thibault ]
  * Fix non-Linux builds (closes: #1054098).

0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
removed since it's included in 3.6.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f318a13e8b6ce3ded313fa17ab80b35b936205fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-to-configure-whether-to-use-SELinux.patch | 35 -------------------
 ...e-passwd_3.6.1.bb => base-passwd_3.6.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.1.bb => base-passwd_3.6.2.bb} (96%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
deleted file mode 100644
index 2cc6174e2a..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 25e3bf09bbbb04aa930ea0fd9f28809a24fb7194 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sun, 2 Oct 2022 17:47:29 +0200
-Subject: [PATCH] Make it possible to configure whether to use SELinux or not
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/396c41bb35e03c5dcc727aa9f74218a45874ac1f]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- configure.ac | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 589df88..e46403b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,7 +13,18 @@ AC_SYS_LARGEFILE
- 
- dnl Scan for things we need
- AC_CHECK_FUNCS([putgrent])
--AC_CHECK_LIB([selinux], [is_selinux_enabled])
-+
-+dnl Check for SELinux
-+AC_MSG_CHECKING([whether to enable SELinux support])
-+AC_ARG_ENABLE([selinux],
-+  [AS_HELP_STRING([--disable-selinux], [disable support for SELinux])],
-+  [],
-+  [enable_selinux=yes])
-+AC_MSG_RESULT($enable_selinux)
-+AS_IF([test "x$enable_selinux" != xno],
-+  [AC_CHECK_LIB([selinux], [is_selinux_enabled], [],
-+    [AC_MSG_ERROR(
-+      [SELinux support not available (use --disable-selinux to disable)])])])
- 
- dnl Check for debconf
- AC_MSG_CHECKING([whether to enable debconf support])
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
similarity index 96%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
index 44bcfb0199..bb4b49e6ab 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
@@ -11,12 +11,11 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch \
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
            file://0005-Add-kvm-group.patch \
-           file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
+SRC_URI[sha256sum] = "06dc78352bf38a8df76ff295e15ab5654cdefe41e62368b15bfcbbab8e4ec2a0"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.34.1


