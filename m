Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26048C5472D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.9512.1724319337435697333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GU19Yeq1;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bf068aebe5so942949a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319336; x=1724924136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMLayYWvB68GeOW/WjBb+3tLV5Abv6KZw3XVwwod1IY=;
        b=GU19Yeq1/oOxw3K3xPUyvIa9CNXKuqgojpkYMQS1SjKZcZ3zvCOfgYX0wJZvibnwGp
         JQfVWHQnZzxCBpGI07mfD+D276pgHwpT6R/MkXCwSvWnI3KC2GbtJKzD+jZpDCDZePdK
         ssJVdglgzo06TwUhNPfri3OWcbYIMYn2nJx9/29iiRjJ0ObTEftZbHKp6wHGtaPxGDxq
         URRpAFx9aJjCeS/WT8Rlt0npFZqfdAyjK7WZRO+O4DvZE9HYbeVcb8y2fHmGNVuP+LbO
         ZeAx6ShlrUdjr2JQ4feBTl3MQ+oGOBIsj6BRQfoxHO4X5ZM22K6PsZt/hoJKLmy+jTLM
         MA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319336; x=1724924136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMLayYWvB68GeOW/WjBb+3tLV5Abv6KZw3XVwwod1IY=;
        b=N7j9ZMmhGPOFgSgsdlFbqOEZUzcMJA7VBG5BjKSvIlrLBFoQ9Ob55Fg2kq+EbxTlLS
         luBHe0Lu0OA+tCbI/XB/ssAFI7nUYgbaIR+tVMQzeSLh3COL5nrr34shd6sXfTm6QLPT
         UGmYAgpeKBSuMynl7HlE+rKw9wpn7/KzwT0L+4oC4NokvmK2lg2fpig/9tPNwy6hGhgI
         aE3q6YRxKZPVis7ocMczL5K9Z+MBnws1DMXfWkRCrlnOe+2MqyK2NH393iew7QqydEBm
         v1JwKPvTnPD5WI3kfJ+KEuIGyuilpwb9K2LlThw3g24gRIVbZLFvqG9ZfQUjH+c0zNSv
         8A7A==
X-Gm-Message-State: AOJu0Yy9tAjSOm8HUyjL0NZIYpqLFdbM3oQTTagTdbS9qsuoo2IeJKft
	PnlTVkR6rS6LKjbnCWE8uFvU2DerL92a6ZWLLLF1ITFborYpJqVym/ghQw==
X-Google-Smtp-Source: AGHT+IHxkyXltdf/C3iD7+SW4Wx0ZTT8Hdq1vifdLOUyJr899XO0G0HiNAO6YtSIU0n/EFmD6wlwMg==
X-Received: by 2002:a05:6402:458e:b0:5be:db8a:7f5e with SMTP id 4fb4d7f45d1cf-5bf1f282963mr2429296a12.37.1724319335450;
        Thu, 22 Aug 2024 02:35:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/32] librepo: upgrade 1.17.0 -> 1.18.1
Date: Thu, 22 Aug 2024 11:35:05 +0200
Message-Id: <20240822093521.36790-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203631

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...me.c-fix-build-errors-with-older-gcc.patch | 36 -------------------
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch |  2 +-
 ...les-with-pkg-config-not-with-cmake-m.patch |  6 ++--
 .../{librepo_1.17.0.bb =3D> librepo_1.18.1.bb}  |  3 +-
 4 files changed, 5 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-=
fix-build-errors-with-older-gcc.patch
 rename meta/recipes-devtools/librepo/{librepo_1.17.0.bb =3D> librepo_1.18.=
1.bb} (88%)

diff --git a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-bui=
ld-errors-with-older-gcc.patch b/meta/recipes-devtools/librepo/librepo/0001=
-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
deleted file mode 100644
index 8727b181b35..00000000000
--- a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-erro=
rs-with-older-gcc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b525cdec3051d1c6ff0c3cd38bf3070b18d6fb50 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 6 Mar 2024 10:13:38 +0100
-Subject: [PATCH] gpg_gpgme.c: fix build errors with older gcc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-When selinux is not enabled, older gcc versions error out this way:
-
-| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/=
tmp-mc-tiny/hosttools/gcc -DG_LOG_DOMAIN=3D\"librepo\" -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -Dlibrepo_EXPORTS -I/home/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tin=
y/work/aarch64-linux/librepo-native/1.17.0/git -I/home/pokybuild/yocto-work=
er/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linu=
x/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include/libmount -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build=
/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/include/blkid -I/home/poky=
build/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/w=
ork/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/oe-selfte=
st-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-na=
tive/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/glib-2=
.0/include -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-s=
t-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysro=
ot-native/usr/lib/pkgconfig/../../../usr/include/libxml2 -isystem/home/poky=
build/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/w=
ork/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/include -=
O2 -pipe -std=3Dc99 -Wall -fPIC -MD -MT librepo/CMakeFiles/librepo.dir/gpg_=
gpgme.c.o -MF librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o.d -o librepo/CMa=
keFiles/librepo.dir/gpg_gpgme.c.o -c /home/pokybuild/yocto-worker/oe-selfte=
st-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-na=
tive/1.17.0/git/librepo/gpg_gpgme.c
-| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/=
tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.=
c: In function =E2=80=98lr_gpg_ensure_socket_dir_exists=E2=80=99:
-| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/=
tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.=
c:135:1: error: label at end of compound statement
-|   135 | exit:
-|       | ^~~~
-
-Ensuring the exit: block is not empty fixes the issue.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/lib=
repo/pull/300]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- librepo/gpg_gpgme.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c
-index c4addb2..47c3153 100644
---- a/librepo/gpg_gpgme.c
-+++ b/librepo/gpg_gpgme.c
-@@ -144,6 +144,7 @@ exit:
-     }
-     freecon(old_default_context);
- #endif
-+    return;
- }
-=20
- static gpgme_ctx_t
diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtai=
n-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/lib=
repo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 4a851ad1e28..1425041dad6 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From 76052aa40c61580869472fd3f009a4ab1620b998 Mon Sep 17 00:00:00 2001
+From e86f562d3cc6cea3e19c4bab77ffa2902f634615 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables=
-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/lib=
repo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index fd1df95473d..edee8698d80 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-p=
kg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-p=
kg-config-not-with-cmake-m.patch
@@ -1,4 +1,4 @@
-From b5918f06d790dc346d41de4b3a3ec01f290c1d25 Mon Sep 17 00:00:00 2001
+From 93d3c49dbdf348eec9900d53a152457f6d1cb816 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:23:27 +0200
 Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c00024..a2f57af 100644
+index 68ce953..04f83b9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -37,7 +37,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
+@@ -39,7 +39,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
  FIND_PACKAGE(CURL 7.52.0 REQUIRED)
=20=20
  IF (USE_GPGME)
diff --git a/meta/recipes-devtools/librepo/librepo_1.17.0.bb b/meta/recipes=
-devtools/librepo/librepo_1.18.1.bb
similarity index 88%
rename from meta/recipes-devtools/librepo/librepo_1.17.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.18.1.bb
index 810191459dd..b3bd2812ddb 100644
--- a/meta/recipes-devtools/librepo/librepo_1.17.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.18.1.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255=
951079008b364516c"
 SRC_URI =3D "git://github.com/rpm-software-management/librepo.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-=
p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-=
m.patch \
-           file://0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch \
            "
=20
-SRCREV =3D "ae727d99086f70f39fba5695af5460e1da908c1b"
+SRCREV =3D "9f186ad20936811ba515c5f0345ccc71603459a3"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.2


