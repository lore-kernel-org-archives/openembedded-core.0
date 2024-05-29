Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A267C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 07:44:25 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.8336.1716968659116879986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 00:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EylyYrKH;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ae14e78e5so369427e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716968657; x=1717573457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/GBi9gC498B/8bRN29vCt4UuHfJb8pXZV+aENvqgDw=;
        b=EylyYrKHKjawl924NBZibblJFQbwk17g4yCwRi05wl/4ov5T3Gfdus0eWSHZB/wUZp
         0zdpTd3cS/XvhnOBisI07ppk+fllq3Ago4CE2OrbSxSUB+hVBYx+li+Z5CYHl4Ctupoo
         e4PTIpcmrAYGhRhuJIlyGHv7Gf6TIRa4w2xl+Nv3tSFTkw3bij4AnNC+efbYcaInqpt0
         Muf498WS+MG9IlH5+UrH4wM7SPReV121HC219EvgUgY/M6WyVcQMDzhfZcwqLkuR7Nnz
         AAYzyzTQjMMsUns/jPVuCWLjhav0tKxAmnkhGByV+rdcB7fZZvLphgFkHG+J/ykwAaDe
         HMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968657; x=1717573457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/GBi9gC498B/8bRN29vCt4UuHfJb8pXZV+aENvqgDw=;
        b=CyLRgfjZe3maQb+kgvQiTjy0FSA/lY8bfQGl0xCREcrVIy/5xmCMcmxVb4j1xv0u1E
         iWO/PAqx2caX+aAwVNBSxhHARu0x1Vgc89E+FVWzAIlekrP5B1JdqmkaOxFU46cDGX7v
         iVpTUA9qgsg6akJR5NprYJI477F6xAaXHuQbh98ld7OFa+DlGLodoEHuS4mNUSzr5t+M
         hizlUJ3HwmtVg9g0ZQVWvO3KknuwJuTEEbKi4YGDYNYpWPfckElTAYkUfHUCTmbzmNS5
         s3fRF3Z1yJnUa43LdqpGP6HixYvfLobcHpj7GvhMl5/eA6JYaJWNxIPP0k+RoXoL9w8K
         8B+Q==
X-Gm-Message-State: AOJu0YyoA8fdiNCP77YtP5IPQBPJs9YEkH01NLPdHUqhtCPlwlzVqz2z
	/XHI3CWMnrIlPJ50/myR3EKk1HIvI5T2rWjfWzSPHf6javaYijZlrVdI1A==
X-Google-Smtp-Source: AGHT+IGqJ6sNwxPJaTiO/7EDnV9zrWOPOhkVrttEQn+Mj5EuGuYtDtWYjqaO04jSRhVa/UCc+wyNrQ==
X-Received: by 2002:a05:6512:2813:b0:529:b9ad:52b5 with SMTP id 2adb3069b0e04-529b9ad5311mr3145871e87.41.1716968656796;
        Wed, 29 May 2024 00:44:16 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm198006485e9.24.2024.05.29.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:44:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] db: ignore implicit-int and implicit-function-declaration issues fatal with gcc-14
Date: Wed, 29 May 2024 09:44:01 +0200
Message-ID: <20240529074401.133063-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 07:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199993

* many configure tests (which might not fail before) are failing with gcc-1=
4:
  # grep implicit build/config.log
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:50:17: error: implicit declaration of function 'exit' [-Wimpli=
cit-function-declaration]
  conftest.c:50:17: warning: incompatible implicit declaration of built-in =
function 'exit' [-Wbuiltin-declaration-mismatch]
  conftest.c:53:9: error: implicit declaration of function 'msem_init' [-Wi=
mplicit-function-declaration]
  conftest.c:54:9: error: implicit declaration of function 'msem_lock' [-Wi=
mplicit-function-declaration]
  conftest.c:55:9: error: implicit declaration of function 'msem_unlock' [-=
Wimplicit-function-declaration]
  conftest.c:56:9: error: implicit declaration of function 'exit' [-Wimplic=
it-function-declaration]
  conftest.c:56:9: warning: incompatible implicit declaration of built-in f=
unction 'exit' [-Wbuiltin-declaration-mismatch]
  conftest.c:50:9: error: implicit declaration of function '_spin_lock_try'=
 [-Wimplicit-function-declaration]
  conftest.c:51:9: error: implicit declaration of function '_spin_unlock' [=
-Wimplicit-function-declaration]

* I have noticed this on db-native build on host with gcc-14
  where it caused fatal do_configure error:
  http://errors.yoctoproject.org/Errors/Details/784164/

  checking for mutexes... UNIX/fcntl
  configure: error: Support for FCNTL mutexes was removed in BDB 4.8.

  the config.log confirms it's because implicit-int:

  configure:22798: checking for mutexes
  configure:22925: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/wor=
k/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/include -O2 -pipe=
  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28/re=
cipe-sysroot-native/usr/include -D_GNU_SOURCE -D_REENTRANT -L/OE/build/oe-c=
ore/tmp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/=
lib                         -L/OE/build/oe-core/tmp-glibc/work/x86_64-linux=
/db-native/5.3.28/recipe-sysroot-native/lib                         -Wl,--e=
nable-new-dtags                         -Wl,-rpath-link,/OE/build/oe-core/t=
mp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/lib  =
                       -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/x86=
_64-linux/db-native/5.3.28/recipe-sysroot-native/lib                       =
  -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28=
/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/OE/build=
/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native=
/lib                         -Wl,-O1 conftest.c  -lpthread >&5
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
     47 | main() {
        | ^~~~
  configure:22925: $? =3D 1
  configure: program exited with status 1

* comparing target db with and without this change shows following diff
  in log.do_configure:

  db $ diff 5.3.28*/temp/log.do_configure
  268c268
  < checking for mutexes... POSIX/pthreads/library
  ---
  > checking for mutexes... POSIX/pthreads/library/x86_64/gcc-assembly
  271c271
  < checking for atomic operations... no
  ---
  > checking for atomic operations... x86/gcc-assembly

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db=
/db_5.3.28.bb
index a99d5cea62..a7d061e0da 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -116,3 +116,7 @@ INSANE_SKIP:${PN} =3D "dev-so"
 INSANE_SKIP:${PN}-cxx =3D "dev-so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# many configure tests are failing with gcc-14
+CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-function-decl=
aration"
+BUILD_CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-functio=
n-declaration"
--=20
2.45.1


