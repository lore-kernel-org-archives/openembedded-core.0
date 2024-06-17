Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5099EC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:06:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.55035.1718625957044174298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LMTZDzAZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-703ed15b273so3245826b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625956; x=1719230756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXhUlZpr5hTZNJDosNBnqHymqWy9UU7XoU/9r+Agub0=;
        b=LMTZDzAZdlzLgKXVkO3q7o52VeHkqPbNcblXb7fsTzAllCOL5QIbsB0yU92YeRYxPi
         bRKi/Mt+VWE9cWYqTblPC7Dzo4bbb8ca9WxPruVji3iIrDwwLDZDHD6PNIh5ASo4s0WW
         GIsfHxRTR+7/LJsWc2EM+HBCLKj4v5+zYDzaESEPspf8VLhEYq6Jh7AuPqAnLDlw3Nls
         ChBFjm3KEKAnzW45LFxR3k9vQFM0pItqxlGfQrX8jT3Sj5xgZ2XUeIKwdUSsI5jEFfLK
         6zISem6Zrv3kRsQukNQOD0d+WpszTPJvZn5rbmqOxJu8fHBl7ulAv3SK2V0H9nA/4C1y
         hooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625956; x=1719230756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXhUlZpr5hTZNJDosNBnqHymqWy9UU7XoU/9r+Agub0=;
        b=Lxc0AqxbWoD+c5a5su2YrPV2PrlUuqF8QUIRuCumclD6MLLaqA8DgLZlhGtnFaqRPn
         vCoto9wbZQwy8fOeXEjfGN6yIkMYb2fM3j3bLY8DQZISyeABs8q59pu38f1TaEI5Rr60
         Tu5hRXHLvq7+u9zZXN4bARBLeu1x/ekNsZsm+O9xu/rXazEIuDkiGtkmkuRs+kxQsVbu
         V+EG8LiLKrqv132Jj2zQ21hY0psg+Hf9fii14HxPDHA+ud50uB2DOjeS6rt7fWTTb9xY
         z6cMm4bkDdqy0lmLeP0wb8CKwg8tjymdtRu5MnIVY4l5VG/qm2KE2Keg7T/n0H2yqemA
         KwYQ==
X-Gm-Message-State: AOJu0YwTbn4crqV2XkI+NBkHjuTrExwngrqwDt1yL+POQZeBm4oSnG+v
	tI3D7H9BbjMsYYKWfwyJE1MqEFJ3lonk3i4oxzl38Nk2xsSw0jui7F0JZAxJI6PfVIcTUpsu+M5
	R9eg=
X-Google-Smtp-Source: AGHT+IF9bXeGe20eXXREX5LE/G5sojZvD2KpbxdI0eiQgMFVKNa9kWV5e+cwrpIr+armDDEHXV21fw==
X-Received: by 2002:aa7:919a:0:b0:705:9d5d:d819 with SMTP id d2e1a72fcca58-705d722bc38mr9108085b3a.32.1718625956256;
        Mon, 17 Jun 2024 05:05:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/22] db: ignore implicit-int and implicit-function-declaration issues fatal with gcc-14
Date: Mon, 17 Jun 2024 05:04:58 -0700
Message-Id: <4d3ce333c10fadf746b6d8b55a88777c97e11ffa.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200831

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6108da955e7c553247ff5356cf1c990b3d334edf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


