Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F33C87FCF
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:12 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.66592.1753646706650269191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EXxEpeAr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23fe9a5e5e8so6937455ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646706; x=1754251506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyU/w8MnKKxqTTLcv/2OadTyPt1q3vFi3Swo6fjwiEI=;
        b=EXxEpeArTBVZk/yOCnUsQLxqAK2ly3dLzR2SwGmGKtbfzcUDeZfi+caATo4mry2uJU
         KFJqOIVG+3//QKuT9wvkb88yYGyb1wIFG15duE341hwmPEpZ+HB0x/p5AObyYCc9pEEG
         GhsTjy4qDG9cp7ddZaUAMpAD9CdqgBCYwsNadZBzNLVhZI7RLtQRlm3K4/89jqv/MC2r
         IDlNcdXKBgVrt0KgITwInnIWo9wTunvZXk5Nlhx/h1LzOi2v17w7t6VST9vbsH9fIcEZ
         /ZAgnoYRX4FjMrKDCEJSAOXfZD8hQhICzFALvnXguV1Uq4HT6m6Ke7pU4xX1N0sn4eyF
         FxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646706; x=1754251506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyU/w8MnKKxqTTLcv/2OadTyPt1q3vFi3Swo6fjwiEI=;
        b=loiQj4LNIsAWnzYyNoR1FIfEJZQCjGRj0FG9PLZX1nBih0d99ai/X4fcHI8fN7E7wM
         BhRyOPsKoU/nSbacPPF+2Xm+tBEHGZVayHz1gMnpq3Ui+ks4Cm7Esh96PyEbEHSLe04q
         Vvw64/djJtQkpODizFcrma+DRuRsqAUP9Hm0gc+mhTRYcuV4NpH01+oYLrkhvZ5rNtis
         zMCFxL1ruiO0xshmSusd6DMo79drQLieZxHY7DBFU4RMCSE9ysYSC1pSzur5Og44bPHj
         vvNDv/RwQKcfpOTKpiyO+FHHRIl3nZMls/InzSmGTdpgfI6uPEJC02K0CqeE5asuLmV9
         sJmA==
X-Gm-Message-State: AOJu0Yyi4ahe548l/taATPijh9fVqY+hS+3pi0qKHJK/gWbdtvSIwIcl
	SEMy/wayZei4ramN8JNnvFdc17sQAw5maFRa5xPcB0+gfA9R2WkTObMb/Lhjk+/1y8MuIiv2W3o
	xLlo7FVs=
X-Gm-Gg: ASbGncunjvXexhTcUzt/TFthUxAv5uC5B1puRMwC5/YkuPPgPra+8SCrefPPYUcDZk0
	ZHv91e+rn4UfPVx/+1TUelswFWbmnwjOA1lzaHEA5zUkAX2KOIFbp2w3RcAJbKlA2F5LDv1ndTI
	88LAqGu3lkPnD+/8ssXigeOWnJT8IfKmSVmFidblHltvIhxvHEB8/qGNiarYyMNxJdnfHs2MLnb
	Sw112xotlyz7Fo2Kv/2V7V7DEDX9J0QzOgLI9aJqAVeFZwNWT6lUBuziMUxZE6BShfr7KIFtAYQ
	N3LNt8WcX5ame+Vm83PLr0PeI5NuljJB+SqEXuKCkeg+S8koT3GPx4XFnn+rIanhEoaKf643PcP
	mEFoJu5Sakm9H4A==
X-Google-Smtp-Source: AGHT+IHtBLz9CKlFxU53RB83h6i7+In9R2429woQ34TlAUyF1phhazXhFgNK9ruPIDcW4wzWlD0nBg==
X-Received: by 2002:a17:903:18c:b0:23c:8f2d:5e22 with SMTP id d9443c01a7336-23fb3125642mr127581785ad.27.1753646705698;
        Sun, 27 Jul 2025 13:05:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.05.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:05:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] db: ignore implicit-int and implicit-function-declaration issues fatal with gcc-14
Date: Sun, 27 Jul 2025 13:04:42 -0700
Message-ID: <277b5ec3c0212ca8600dd89d0a33f784a060131f.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220981

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

(From OE-Core rev: 4d3ce333c10fadf746b6d8b55a88777c97e11ffa)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6108da955e7c553247ff5356cf1c990b3d334edf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db=
/db_5.3.28.bb
index c5427f54eb..62a91ba7e3 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -117,3 +117,7 @@ INSANE_SKIP:${PN} =3D "dev-so"
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
2.43.0


