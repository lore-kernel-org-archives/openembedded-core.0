Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B26EE14B7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4172.1694019401784881245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kpkQUPJc;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-402d0eda361so1218395e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019400; x=1694624200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmtP2QO7LQWGAVSKpguUWdAq6Bg5qYiPklh4ByHL5JM=;
        b=kpkQUPJc/6+WnXNg8MAIw8whaGz9C0erhh2T7Xwl67onmbtEen3Snhyjh7U/jhY5/R
         YmiaCd/JgNQJxXyWaiWhdwGl15X+4ln8+KxByyKhH/giVgU9ULggRaFBumOKIq+g3r68
         m55ghzt3BzNq2EGHcxP/Vf+T8p9oi+GT9FGGjOKAdi3VG/UVTIVvDNkeKe0gEn/+fe+/
         sqAA4JsfhaK2BqVmD26nqGJrb4dvhdj9goxcdwThxqYwJ5MFO2EAe3Kt1uUba7WFLkMe
         W26sPwjhigZanRYib3WRA3Bh099if7II5qOxCp5ct7KMgSkFstEzS/1iroAQA/xtGWvY
         J+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019400; x=1694624200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmtP2QO7LQWGAVSKpguUWdAq6Bg5qYiPklh4ByHL5JM=;
        b=dAxV/K1YkfG0ZVxSVtBsik4Kf90hz6YCH+8VHzA5Ly5oVWQiHjhRn/NSx0J1ukQgqf
         yir+tDldFq9H4G5lZnSU9EWr5ZsixtTu8c5Ce4ZvH2vp6Ldd022Y0dZ/9QooM8NdFnzt
         lf2QkKS9eAX0PMbR64IuLbxcg+cLM/ZYOtamWywG3cN3PoXRkc0eZ+7eRFI4j4WmeHek
         22PVF67z+MRWhTtnelZr6cQKUVxfpjswcMwkp2L9w72dbF37kOXytvCO6+a/CVU7WnOE
         2C55NvTiUNdixhSwNCK62neUxBr787XTSPfnU9R2WdsTjSK3ZNECr7n1w+VNHvtjALUI
         TkEQ==
X-Gm-Message-State: AOJu0YwuV2qZW/GKeHDcnf/zRq9ZCgCk8GtOGra9o7LLZXLliyUSrYzo
	izYf2plrivtT0KtExP+5jU58LOPvXAI=
X-Google-Smtp-Source: AGHT+IGJRG83vCEo3lvFuqQ9sw8wfQrkyz40yjs+6NhCsgBVKkWGEdvVjGCjuO9haXiwcIJ3CzYawQ==
X-Received: by 2002:a05:6000:4ca:b0:31a:ddf0:93b with SMTP id h10-20020a05600004ca00b0031addf0093bmr2797913wri.33.1694019399651;
        Wed, 06 Sep 2023 09:56:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/17] gettext: upgrade 0.21.1 -> 0.22
Date: Wed,  6 Sep 2023 18:56:18 +0200
Message-Id: <20230906165633.2382629-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187324

Drop autoconf-2.73.patch as upstream did update the gnulib.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gettext-0.21.1/autoconf-2.73.patch        | 50 -------------------
 ...21.1.bb => gettext-minimal-native_0.22.bb} |  0
 .../COPYING                                   |  0
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
 .../parallel.patch                            |  0
 .../{gettext-0.21.1 => gettext}/run-ptest     |  0
 .../serial-tests-config.patch                 |  0
 .../use-pkgconfig.patch                       |  0
 .../{gettext_0.21.1.bb => gettext_0.22.bb}    |  3 +-
 11 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb => gettext-minimal-native_0.22.bb} (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 => gettext-minimal}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext}/0001-init-env.in-do-not-add-C-CXX-parameters.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext}/run-ptest (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext}/serial-tests-config.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.21.1 => gettext}/use-pkgconfig.patch (100%)
 rename meta/recipes-core/gettext/{gettext_0.21.1.bb => gettext_0.22.bb} (99%)

diff --git a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
deleted file mode 100644
index ae5b2491bb8..00000000000
--- a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-The gnulib largefile macro needs updating to work with autoconf 2.73. Rather
-than the full code:
-
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=f91f633858cf132e50924224c50d6264a92caabb
-
-Just tweak the exiting code to work with 2.73. The next gettext upgrade should
-update to new gnulib
-
-Upstream-Status: Inappropriate
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
-===================================================================
---- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4
-+++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
-Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
-===================================================================
---- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4
-+++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
-Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
-===================================================================
---- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4
-+++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING b/meta/recipes-core/gettext/gettext-minimal/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
rename to meta/recipes-core/gettext/gettext-minimal/COPYING
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index da2860fbc85..b4fb6479161 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee8555c0cf276d646d45"
+SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
rename to meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
rename to meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/parallel.patch b/meta/recipes-core/gettext/gettext/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
rename to meta/recipes-core/gettext/gettext/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/run-ptest b/meta/recipes-core/gettext/gettext/run-ptest
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/run-ptest
rename to meta/recipes-core/gettext/gettext/run-ptest
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.patch
rename to meta/recipes-core/gettext/gettext/serial-tests-config.patch
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
rename to meta/recipes-core/gettext/gettext/use-pkgconfig.patch
diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes-core/gettext/gettext_0.22.bb
similarity index 99%
rename from meta/recipes-core/gettext/gettext_0.21.1.bb
rename to meta/recipes-core/gettext/gettext_0.22.bb
index a3eb3bba541..71e84521b0d 100644
--- a/meta/recipes-core/gettext/gettext_0.21.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.bb
@@ -30,7 +30,6 @@ SRC_URI += " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
-           file://autoconf-2.73.patch \
            "
 
 inherit autotools texinfo pkgconfig ptest
@@ -201,6 +200,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
     glibc-charmap-euc-kr \
     glibc-gconv-euc-jp \
     glibc-charmap-euc-jp \
+    glibc-gconv-gb18030 \
+    glibc-charmap-gb18030 \
     locale-base-de-de \
     locale-base-fr-fr \
 "
-- 
2.30.2


