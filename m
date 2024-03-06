Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC41AC54E55
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.15022.1709739731853637988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aSujljmu;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so183601366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739730; x=1710344530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF/nzC/CtfYwrY6uHSakp3kuUI6EHUN8S740XV84tnc=;
        b=aSujljmuNqKq9+h/mWHH8gcw1QTaVdnUznFTg/f7oMya+MEqSyCvhtEGG4AmJ0zUh3
         bObV99C1L2iSk0UELkRNVNdaUA4WA/7ZcrFQL7MIzMjdRysHK1uBmh9W5jJNt9yul31u
         6xQbeTYEP3RtvfFBeEsLmtW4fpYyj6dijU/kEzDx0xBAdiv7PPXjNS19qi+HRzadolAp
         YHzu2I/P66znuiBRXj1VNTphkFlu85UXS220tuCbfDWUbfktI+DFNqJbo5Ch4FmB7dMn
         n5y+sJIJXElm3ExsPbjGJqwYiNOHLGTNfyRATXkisTW5ajEhqpAZGb+jG09CnXLMuPPs
         Wn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739730; x=1710344530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF/nzC/CtfYwrY6uHSakp3kuUI6EHUN8S740XV84tnc=;
        b=sgju4QoaKMIXGYTYK+Fy7nAyCeRncUhFo2qYZ151TNzvz8phom4cmWiGuRzf2Xdjh+
         N7sz6ts3gmsbXXw5AyDpe/H10CJdGlHXMXmOVx1B9oD8IwBntX7g7dPDmwlif3mu7IR5
         nk6Mq5Od7nCDr/gHsJv/dMbUF4Ub7UyxFNrvxfWX+7vFF+/gkhlJFcxe7IT3YJdDjJu6
         PXdOxXmDc6mePxEriC6PftiergV2NsDuIbirM6EPmWZ62sNR1sityuU82wDJYKoEiK29
         ZsTE/x91ZB1Lt4WqRL33XHdgQou0vHnwEvUOgSqItROYUyBoS7wJQr3ZJWpTYnYTBzE1
         pkPA==
X-Gm-Message-State: AOJu0YxQjsiISuEmAueun6+9emxFXYloBbHJXXQM+CI3E9dR6Ye2WWQV
	HnLuMS1woesMzzK8T4dackQFZq5y45Ew3Kn9KpFxhU19BKvDrZDRGwvLon4V
X-Google-Smtp-Source: AGHT+IELC4T3NSl9FwR8TvWnNhC7L/5TiQpW1k1Z5TMbV4aKvcerMvmLSbNnTi/QmuX+dqvHaXN0ug==
X-Received: by 2002:a17:906:7fd8:b0:a45:297d:52b9 with SMTP id r24-20020a1709067fd800b00a45297d52b9mr5960053ejs.26.1709739730307;
        Wed, 06 Mar 2024 07:42:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/47] librepo: update 1.16.0 -> 1.17.0
Date: Wed,  6 Mar 2024 16:41:23 +0100
Message-Id: <20240306154151.3741709-19-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196702

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...me.c-fix-build-errors-with-older-gcc.patch | 36 +++++++++++++++++++
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch |  5 +--
 ...les-with-pkg-config-not-with-cmake-m.patch | 16 ++++-----
 .../{librepo_1.16.0.bb =3D> librepo_1.17.0.bb}  |  4 ++-
 4 files changed, 46 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-=
fix-build-errors-with-older-gcc.patch
 rename meta/recipes-devtools/librepo/{librepo_1.16.0.bb =3D> librepo_1.17.=
0.bb} (85%)

diff --git a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-bui=
ld-errors-with-older-gcc.patch b/meta/recipes-devtools/librepo/librepo/0001=
-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
new file mode 100644
index 00000000000..8727b181b35
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-erro=
rs-with-older-gcc.patch
@@ -0,0 +1,36 @@
+From b525cdec3051d1c6ff0c3cd38bf3070b18d6fb50 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 6 Mar 2024 10:13:38 +0100
+Subject: [PATCH] gpg_gpgme.c: fix build errors with older gcc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When selinux is not enabled, older gcc versions error out this way:
+
+| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/=
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
+| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/=
tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.=
c: In function =E2=80=98lr_gpg_ensure_socket_dir_exists=E2=80=99:
+| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/=
tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.=
c:135:1: error: label at end of compound statement
+|   135 | exit:
+|       | ^~~~
+
+Ensuring the exit: block is not empty fixes the issue.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/lib=
repo/pull/300]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ librepo/gpg_gpgme.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c
+index c4addb2..47c3153 100644
+--- a/librepo/gpg_gpgme.c
++++ b/librepo/gpg_gpgme.c
+@@ -144,6 +144,7 @@ exit:
+     }
+     freecon(old_default_context);
+ #endif
++    return;
+ }
+=20
+ static gpgme_ctx_t
diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtai=
n-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/lib=
repo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 2ea50f00ffd..4a851ad1e28 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From 82bd6d196a0453657cbacaaedd75b2d2fe0bf9ba Mon Sep 17 00:00:00 2001
+From 76052aa40c61580869472fd3f009a4ab1620b998 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
@@ -33,6 +33,3 @@ index 8523ca7..06e5f7b 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
=20=20
  MESSAGE(STATUS "Python3 install dir is ${PYTHON_INSTALL_DIR}")
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables=
-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/lib=
repo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index a0a4d490f1e..fd1df95473d 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-p=
kg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-p=
kg-config-not-with-cmake-m.patch
@@ -1,4 +1,4 @@
-From 25113b34bc1aae377d7bf447e69528783e2c177e Mon Sep 17 00:00:00 2001
+From b5918f06d790dc346d41de4b3a3ec01f290c1d25 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:23:27 +0200
 Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
@@ -6,25 +6,21 @@ Subject: [PATCH] Set gpgme variables with pkg-config, not=
 with cmake module
=20
 Upstream-Status: Inappropriate [gpgme upstream does not have pkg-config su=
pport and is not interested in it]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cd975a8..713cc87 100644
+index 6c00024..a2f57af 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -35,7 +35,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
+@@ -37,7 +37,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
  FIND_PACKAGE(CURL 7.52.0 REQUIRED)
=20=20
  IF (USE_GPGME)
 -    FIND_PACKAGE(Gpgme REQUIRED)
 +    PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
 +    set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
- ELSE (USE_GPGME)
-     PKG_CHECK_MODULES(RPM REQUIRED rpm>=3D4.18.0)
- ENDIF (USE_GPGME)
---=20
-2.34.1
-
+     IF (ENABLE_SELINUX)
+         PKG_CHECK_MODULES(SELINUX REQUIRED libselinux)
+     ENDIF(ENABLE_SELINUX)
diff --git a/meta/recipes-devtools/librepo/librepo_1.16.0.bb b/meta/recipes=
-devtools/librepo/librepo_1.17.0.bb
similarity index 85%
rename from meta/recipes-devtools/librepo/librepo_1.16.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.17.0.bb
index 4710a6b72ae..810191459dd 100644
--- a/meta/recipes-devtools/librepo/librepo_1.16.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.17.0.bb
@@ -8,9 +8,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255=
951079008b364516c"
 SRC_URI =3D "git://github.com/rpm-software-management/librepo.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-=
p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-=
m.patch \
+           file://0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch \
            "
=20
-SRCREV =3D "7c9af219abd49f8961542b7622fc82cfdaa572e3"
+SRCREV =3D "ae727d99086f70f39fba5695af5460e1da908c1b"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -24,6 +25,7 @@ EXTRA_OECMAKE =3D " \
     -DENABLE_TESTS=3DOFF \
     -DENABLE_DOCS=3DOFF \
     -DWITH_ZCHUNK=3DOFF \
+    -DENABLE_SELINUX=3DOFF \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.2


